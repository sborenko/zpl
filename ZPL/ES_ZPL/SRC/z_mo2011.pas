unit z_mo2011;

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
  TFormMo2011 = class(TForm)
    qryTmp: TQuery;
    cdsSPZ: TClientDataSet;
    dspTmp: TDataSetProvider;
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
    dbgrSPZ: TDBGrid;
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
    cdsPrp: TClientDataSet;
    dsrcPrp: TDataSource;
    sBtnProverki: TSpeedButton;
    pop2: TPopupMenu;
    pop2details: TMenuItem;
    cdsSPZVNU: TSmallintField;
    cdsSPZKDOBJ: TSmallintField;
    cdsSPZPSCH: TStringField;
    cdsSPZKDSPZ: TSmallintField;
    cdsSPZPRR: TSmallintField;
    cdsSPZSCHBU: TStringField;
    cdsSPZVIDN: TStringField;
    cdsSPZSHVIDN: TStringField;
    cdsSPZVID_KDSPZ: TSmallintField;
    cdsSPZVID_KEKV: TStringField;
    cdsSPZSP_PF: TStringField;
    cdsSPZSP_FSTVP: TStringField;
    cdsSPZSP_FSNV: TStringField;
    cdsSPZSP_FZ: TStringField;
    cdsSPZCNT: TIntegerField;
    cdsSPZKRSCH: TStringField;
    cdsSPZVid_SpZ: TStringField;
    cdsSPZNmVidN: TStringField;
    cdsPrpNR: TAutoIncField;
    cdsPrpPSch: TStringField;
    cdsPrpSchBU: TStringField;
    cdsPrpHasChild: TBooleanField;
    cdsPrpVidN: TStringField;
    cdsPrpSmFor: TFloatField;
    cdsPrpSmSvPrg: TFloatField;
    cdsPrpSmTo: TFloatField;
    cdsPrpSchDt: TStringField;
    cdsPrpKEKV: TStringField;
    cdsPrpSchKt: TStringField;
    cdsPrpVidNotes: TStringField;
    cdsPrpShVidN: TStringField;
    cdsPrpNmVidN: TStringField;
    SplitterTs2: TSplitter;
    LabelDbg: TLabel;
    PanelTs2: TPanel;
    dbgrPrp: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    qryTmp2: TQuery;
    tbl06: TTable;
    cdsSPZKDKATP: TSmallintField;
    LabelCntSchRec: TLabel;
    cdsSPZSMM: TFloatField;
    cdsPrpGrp: TSmallintField;
    cdsSPZZaMesGod: TDateTimeField;
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
    procedure dbgrSPZDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    d_20111201 : TDateTime; // появился вид 8686 - ЕсвПрпБлнИнв
                            // (ЕСВ предприятия с Блн инвалидов)
    d_20130701 : TDateTime; // Изменился подход к декретным в ЕСВ
    d_20131001 : TDateTime; // Появился вид 6212 - ЕСВ с декретных
    n_Case : SmallInt;
    bTvReady : boolean;
    bSintBold, bAnalitBold : boolean;
    nCaseReport : word;
    procedure CreTvSpZ(dDtPrc : TDateTime);
    procedure CreOpenCdsSpZ(cSQL : string; d_DtPrc : TDateTime;
                                                       bMoBySint : boolean);
    procedure CreOpenCdsPrp(bMoBySint : boolean);
    procedure AddToCdsESV(bMoBySint : boolean);
    procedure AddToCdsPrpESV(bMoBySint : boolean);
    function GetNmPSch(cPSCH : ShortString) : ShortString;
  public
    { Public declarations }
  end;

procedure Mo_2011(nCase : SmallInt; dDtPrc : TDateTime);

const SECTION = 'z_mo2011';

var
  FormMo2011: TFormMo2011;

implementation

uses a_Const, A_DM, a_Lib, Z_Dm, z_Main, z_CmnPrt, z_SvdPrv, z_ShMoDt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure Mo_2011(nCase : SmallInt; dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormMo2011 := TFormMo2011.Create(Application);
  with FormMo2011 do begin
    if bFlagDbg then
      LabelDbg.Caption := 'Новая (с 01-01-2011) схема'
    else
      LabelDbg.Caption := '';
    d_DtPrc := dDtPrc;
    d_20111201 := EncodeDate(2011,12, 1);
    d_20130701 := EncodeDate(2013, 7, 1);
    d_20131001 := EncodeDate(2013,10, 1);
    n_Case := nCase;
    bTvReady  := false;
    bSintBold := true;
    bAnalitBold := true;
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Формирование задания для журнала-ордера за ' +
                                    MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    CreTvSpZ(dDtPrc);
    Label1.Caption := 'Слева счета (источники финансирования), встретившиеся ' +
                      'в таблице начислений-удержаний за ' +
                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.CreTvSpZ(dDtPrc : TDateTime);
var F1 : TextFile;
    cNmTv, cMsg, cPSCH, cNmPSch : string;
    i : integer;
    MyTreeRec : PTreeRec;
begin
  cNmTv := 'SpZ.tv1';
  AssignFile(F1, cDirTemp + cNmTV);
  Rewrite(F1);
  with qryTvNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    // вроде хорошо округляет  Sum(Cast(Summa as numeric (18,2)))
    SQL.Add('Select PSch, KdSpZ, SchBU, NmSch, ' +
            ' Sum(Cast(Summa as Numeric(16,2))) as Summa ' +
            ' from ViNu4 where dtProc = :dDtPrc ' +
            ' group by PSch, KdSpZ, SchBU, NmSch ' +
            ' having (not PSCH is null and PSCH > "")');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if (FieldByName('PSCH').IsNull) or // такого, правда, не д.б. и не бывает
                              (FieldByName('PSCH').AsString = '') then begin
        {
        cPSCH := 'Root';
        nKdPSch := DmMain.KdSbu2KdPSch(FieldByName('KdSpZ').AsInteger);
        cNmPSch := DmMain.KdSbu2NmSbu(nKdPSch);
        WriteLn(F1, 'Root' + ' ' + 'Root');
        cMsg := ' ' + FieldByName('SchBU').AsString + '  ' +
                                   FieldByName('NmSch').AsString;
        WriteLn(F1, cMsg);
        }
        Next; end
      else begin
        cPSCH := FieldByName('PSCH').AsString;
        cNmPSch := GetNmPSch(cPSCH);
        WriteLn(F1, cPSCH + ' ' + cNmPSch);
        while (FieldByName('PSCH').AsString = cPSCH) and not Eof do begin
          cMsg := ' ' + FieldByName('SchBU').AsString + '  ' +
                                   FieldByName('NmSch').AsString;
          WriteLn(F1, cMsg);
          Next;
        end;
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
      if (FieldByName('PSCH').IsNull) or
                              (FieldByName('PSCH').AsString = '') then begin
        {
        cPSCH := 'Root';
        New(MyTreeRec);     // Записываю корневой счет
        MyTreeRec.KdSbu  := 0;
        MyTreeRec.SchBU  := 'Root';
        MyTreeRec.PSCH   := 'Root';
        TV.Items[i].Data := MyTreeRec;
        Inc(i);
        New(MyTreeRec);     // Дочерний счет
        MyTreeRec.KdSbu  := FieldByName('KdSpZ').AsInteger;
        MyTreeRec.SchBU  := Trim(FieldByName('SchBU').AsString);
        MyTreeRec.PSCH   := Trim(FieldByName('PSch').AsString);
        TV.Items[i].Data := MyTreeRec;
        Inc(i);
        }
        Next; end
      else begin
        cPSCH := FieldByName('PSch').AsString;
        New(MyTreeRec);     // Записываю корневой счет
        MyTreeRec.KdSbu  := DmMain.KdSbu2KdPSch(FieldByName('KdSpZ').AsInteger);
        MyTreeRec.SchBU  := Trim(FieldByName('PSch').AsString);
        MyTreeRec.PSCH   := Trim(FieldByName('PSch').AsString);
        TV.Items[i].Data := MyTreeRec;
        Inc(i);
        while (FieldByName('PSCH').AsString = cPSCH) and not Eof do begin
          New(MyTreeRec);   // Дочерний счет
          MyTreeRec.KdSbu  := FieldByName('KdSpZ').AsInteger;
          MyTreeRec.SchBU  := Trim(FieldByName('SchBU').AsString);
          MyTreeRec.PSCH   := Trim(FieldByName('PSch').AsString);
          TV.Items[i].Data := MyTreeRec;
          Inc(i);
          Next;
        end;
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
function TFormMo2011.GetNmPSch(cPSCH : ShortString) : ShortString;
begin
  Result := '';
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select NmSch from Kd_Sbu where SchBU = :cPSCH');
    ParamByName('cPSCH').AsString := cPSCH;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NmSch').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
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
procedure TFormMo2011.FormResize(Sender: TObject);
begin
  PanelRight2.Top := Round((Height - PanelRight2.Height)/2) - 20;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.FormCreate(Sender: TObject);
var i : SmallInt; cHint : ShortString;
begin
  ts1.TabVisible := bFlagDbg; //false;
  ts2.TabVisible := bFlagDbg; //false;
  //ts3.TabVisible := bFlagDbg; //false;
  PageControl1.ActivePage := ts1;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 300);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 750);
    rBtnTtsAllAndCmn.Checked := false; // ReadBool(SECTION, 'bTtsAll', false);
    rbtnTtsOnlyCmn.Checked := true;    // not rBtnTtsAllAndCmn.Checked;
    PanelTs2.Height := ReadInteger(SECTION, 'nPnlTs2H', 200);
    Free;
  end;
  if FileExists(cDirVids + 'mo52_23.vid') then
    dbgrSpZ.Columns.LoadFromFile(cDirVids + 'mo52_23.vid');
  if FileExists(cDirVids + 'mo52_13.vid') then
    dbgrPrp.Columns.LoadFromFile(cDirVids + 'mo52_13.vid');
  LabelCntSelSch.Caption := '';
  LabelMsgTs2.Caption := '';
  LabelCntSchRec.Caption := '';
  for i := 0 to ComponentCount-1 do
    if Components[i] is TControl then with TControl(Components[i]) do begin
      cHint := Hint;                    // Сие я нагородил, чтобы длинные
      while Pos('@', cHint) <> 0 do     // Hint'ы выводились в две строки,
        cHint[Pos('@', cHint)] := #13;  // для чего в месте переноса нужно
      Hint := cHint;                    // заранее вставить значок @, а он
    end;                                // потом преобразуется в #13 - "возвр."

end;
//------------------------------------------------------------------------------
procedure TFormMo2011.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSpZ.Columns.SaveToFile(cDirVids + 'mo52_23.vid');
  if cdsPrp.Active then
    dbgrPrp.Columns.SaveToFile(cDirVids + 'mo52_13.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bTtsAll', rBtnTtsAllAndCmn.Checked);
    WriteInteger(SECTION, 'nPnlTs2H', PanelTs2.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.sBtnGoClick(Sender: TObject);
var i, nAdd, nTvCount : integer; bHasChild : boolean;
    cPSch, cSchBU, cSQL : string; bMoBySint : boolean;
begin
  bMoBySint := true;
  nTvCount := TV.Items.Count;
  if bSintBold and bAnalitBold then begin // Нет помеченных
    if (TV.Selected <> nil) then begin
      i := TV.Selected.AbsoluteIndex;
      cPSch  := PTreeRec(TV.Items[i].Data)^.PSch;
      cSchBU := PTreeRec(TV.Items[i].Data)^.SchBU;
      bHasChild := TV.Items[i].HasChildren;
      if bHasChild then begin {выбран (но не помечен) синт. (групповой) счет}
        cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
                ' Cast(32765 as SmallInt) as KdObj, PSch, ZaMesGod, ' +
                ' KdSpZ, KdKatP, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
                ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
                ' Round(Sum(Summa), 2) as SMM, ' +
                ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch ' +
                ' from ViNuMain where DtProc = :dDtPrc and ' +
                ' PSCH = "' + cPSch + '" and (not KdObj in (1056)) ' +
                ' group by PSch, ZaMesGod, KdSpZ, SchBU, KdKatP, PRR, VidN, ShVidn, ' +
                ' Vid_KdSpZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ ' +
                ' having Round(Sum(Summa), 2) <> 0';
        bMoBySint := true;
        nCaseReport := 1; end
        {not KdObj in (1056,3901) - это потому, что 1056 - Рога и Копыта
         а 3901 - рестуктуризация для уволенных, с которых ничего не берется}
      else begin {выбран (но не помечен) аналитический счет (СубСчёт)}
        cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
                ' Cast(32765 as SmallInt) as KdObj, PSch, ZaMesGod, ' +
                ' KdSpZ, KdKatP, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
                ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
                ' Round(Sum(Summa), 2) as SMM, ' +
                ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch ' +
                ' from ViNuMain where DtProc = :dDtPrc and ' +
                ' SChBU = "' + cSchBU + '" and (not KdObj in (1056)) ' +
                ' group by PSch, ZaMesGod, KdSpZ, SchBU, KdKatP, PRR, VidN, ShVidn, ' +
                ' Vid_KdSpZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ ' +
                ' having Round(Sum(Summa), 2) <> 0';
        bMoBySint := false;
        nCaseReport := 2;
      end;
    end; end
  else if bSintBold then begin // Помечен один или несколько синтет. (СубСчетов)
    cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
            ' Cast(32765 as SmallInt) as KdObj, PSch, ZaMesGod, ' +
            ' KdSpZ, KdKatP, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
            ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
            ' Round(Sum(Summa), 2) as SMM, ' +
            ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch ' +
            ' from ViNuMain where DtProc = :dDtPrc and ' +
            ' PSCH in (';
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
    cSQL := cSQL + ') and (not KdObj in (1056)) ' +
                   ' group by PSch, ZaMesGod, KdSpZ, SchBU, KdKatP, PRR, VidN, ' +
                   ' ShVidn, Vid_KdSpZ, Vid_KEKV, SP_PF, SP_FSTVP, ' +
                   ' SP_FSNV, SP_FZ ' +
                   ' having Round(Sum(Summa), 2) <> 0 ';
    bMoBySint := true;
    nCaseReport := 11; end
  else if bAnalitBold  then begin  // Помечен один или несколько аналитических
    cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +          {групповых}
            ' Cast(32765 as SmallInt) as KdObj, PSch, ZaMesGod, ' +
            ' KdSpZ, KdKatP, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
            ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
            ' Round(Sum(Summa), 2) as SMM, ' +
            ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch ' +
            ' from ViNuMain where DtProc = :dDtPrc and ' +
            ' SChBU in (';
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
    cSQL := cSQL + ') and (not KdObj in (1056)) ' +
                   ' group by PSch, ZaMesGod, KdSpZ, SchBU, KdKatP, PRR, VidN, ' +
                   ' ShVidn, Vid_KdSpZ, Vid_KEKV, SP_PF, SP_FSTVP, ' +
                   ' SP_FSNV, SP_FZ ' +
                   ' having Round(Sum(Summa), 2) <> 0';
    bMoBySint := false;
    nCaseReport := 22; end
  else  // такого не может случиться
    ;
  CreOpenCdsSpZ(cSQL, d_DtPrc, bMoBySint);
  PanelTs2.Visible := bFlagDbg;
  SplitterTs2.Visible := bFlagDbg;
  if not bFlagDbg then begin
    cdsSpZ.Filter := 'VNU < 5';
    cdsSpZ.Filtered := true;
  end;
  PageControl1.ActivePage := ts2;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.CreOpenCdsSpZ(cSQL : string; d_DtPrc : TDateTime;
                                                           bMoBySint : boolean);
var {cPSch, cSchBU,} cKrSch : string10;
    cVidN : string4;
    {c_SQL, cWhereMsg, cPartPSCH : string;}
    //bIsFirstPSCH, bIsPartSbu, bIsFirstIN : boolean;
    nVNU : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add(cSQL);
    ParamByName('dDtPrc').AsDateTime := d_DtPrc;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'NewSql.sql');
    //Open;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsSpz do begin
    if Active then Close;
    Filtered := false;
    Filter := '';
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    if (nCaseReport = 1) or (nCaseReport = 11) then // по СинтСчетам
      AddIndex('CdsIndx', 'PSch;VNU;VidN;SchBU', [])
    else                                            // по АналитСчетам
      AddIndex('CdsIndx', 'PSch;SchBU;VNU;VidN', []);
    LabelCntSchRec.Caption := 'Записей в cdsSch: ' + IntToStr(RecordCount);
    First;
    // Расставить VNU - сортировка для Ж/Ордера
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      nVNU := 1;
      // больничные в т.ч.декр, кроме 1-х 5-ти дней
      // SB 23.3.2026 По аналогии, наверное, и 2606
      if (cVidN <> '2603') and (cVidN <> '2606')
        and ((cVidN >= '2600') and (cVidN < '2700')) or
            (cVidN = '1901') or (cVidN = '1909') then begin
            // 1901 - пособие ЧОО, 1909 - пособие при рожд ребенка
        nVNU := 0;
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger); end
      else if (cVidN = '2705') {приход в кассу}  or
                     (cVidN = '2707') {возврат ч/з банк} then begin
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
      else if ((cVidN >= '8611') and (cVidN <= '8643') or
              (cVidN >= '8681') and (cVidN <= '8691')) then begin // взн.предпр.
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 5; end
      else if ((cVidN >= '8601') and (cVidN <= '8610') or
               (cVidN >= '8671') and (cVidN <= '8674')) then begin // СвПороги
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 6;
      end;
      Edit;
      FieldByName('VNU').AsInteger := nVNU;
      FieldByName('KrSch').AsString := cKrSch;
      Post;
      Next;
    end;
    IndexName := 'CdsIndx';
    First;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'cdsMoSpZ.cds');
    CreOpenCdsPrp(bMoBySint);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.CreOpenCdsPrp(bMoBySint : boolean);
begin
  with cdsPrp do begin
    if Active then Close;
    IndexName := '';
    IndexDefs.Clear;
    CreateDataSet;
    Open;
    AddIndex('OnPSchSchBUVidNVidNotes', 'PSch;SchBU;VidNotes;VidN', []);
    IndexName := 'OnPSchSchBUVidNVidNotes';
  end;
  with cdsSpZ do begin
    First;
    while not Eof do begin
      AddToCdsESV(bMoBySint);
      Next;
    end;
    First;
    while not Eof do begin
      AddToCdsPrpESV(bMoBySint);
      Next;
    end;
    First;
  end;
  cdsPrp.IndexName := 'OnPSchSchBUVidNVidNotes';
  if bFlagDbg then
    cdsPrp.SaveToFile(cDirTemp + 'cdsMoPrp.cds');
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.AddToCdsESV(bMoBySint: boolean);
var cSpzVidN, cVidN, cVidNotes, cPSch, cSchBU : ShortString;
    nVNU, nGrp, nKdKatP : SmallInt;
    nSmFor, nSmSvPrg, nSmTo : double;
begin  // Проходя по cdsSpz, собрать выплаты и СверхПороги по кучкам для:
  nVnu := cdsSpZVnu.AsInteger;          // ЕсвОбщ, ЕсвППС, ЕсвБлн, ЕсвДгв
  nKdKatP := cdsSpzKdKatP.AsInteger;    // (все с сотрудника (не с предпр.))
  cSpzVidN := cdsSpzVidN.AsString;
  nSmFor   := 0;
  nSmSvPrg := 0;
  nSmTo    := 0;
  if bMoBySint then
    cSchBU := 'xxx'
  else
    cSchBU := cdsSpzSchBU.AsString;
  nGrp := 1;
  cPSch := cdsSpzPSch.AsString;
  if (nVnu <= 1) and (cdsSpzSp_PF.AsString = '1') {начисления} then begin
    if (cSpzVidN = '1005') or (cSpzVidN = '1006') or
                                       (cSpzVidN = '1008'){договоры} then begin
      nSmFor := nSmFor + cdsSpzSmm.AsFloat;
      cVidN := '6216'; {для Esv с ГПД}
      cVidNotes := ' 4.Для ЕсвГпд'; end
    else if ((d_DtPrc < d_20130701) and (cSpzVidN > '2600') and
                         (cSpzVidN < '2700') and (cSpzVidN <> '2602'))
                                           {больничные, кроме декретных} or
            ((d_DtPrc >= d_20130701) and (cSpzVidN > '2600') and
                  (cSpzVidN < '2700')) {больничные, в т.ч декретные} then begin
      if (d_DtPrc >= d_20131001) and (cSpzVidN = '2602') then begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '6212'; {для Esv с Блн}
        cVidNotes := ' 3.Для ЕсвДкр'; end
      else begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '6211'; {для Esv с Блн}
        cVidNotes := ' 3.Для ЕсвБлн';
      end; end
    else if (nKdKatP = 1) {ППС'овские} then begin
      nSmFor := nSmFor + cdsSpzSmm.AsFloat;
      cVidN := '6206'; {для Esv с ППС}
      cVidNotes := ' 2.Для ЕсвППС'; end
    else {общие} begin
      nSmFor := nSmFor + cdsSpzSmm.AsFloat;
      cVidN := '6201'; {для Esv с Общ}
      cVidNotes := ' 1.Для ЕсвОбщ';
    end; end
  else if (nVnu = 2) {удержания с сотр.} then begin
    cVidN := cSpzVidN;
    if (cVidN = '6216') then {Esv с ГПД} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := ' 4.для ЕсвГпд'; end
    else if (cVidN = '6211') {or (cVidN = '6212')} {Esv с Блн и Дкр} then begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := ' 3.для ЕсвБлнДкр'; end
    else if {(cVidN = '6211') or} (cVidN = '6212') {Esv с Блн и Дкр} then begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := ' 3.для ЕсвБлнДкр'; end
    else if (cVidN = '6206') then {Esv с ППС} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := ' 2.для ЕсвППС'; end
    else if (cVidN = '6201') then {Esv с Общ} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := ' 1.для ЕсвОбщ';
    end; end
  else if (nVnu = 6) {свПороги} then begin
    if (cSpzVidN = '8610') then {СвПрг с ГПД} begin
      nSmSvPrg := cdsSpzSmm.AsFloat;
      cVidN := '6216';
      cVidNotes := ' 4.для ЕсвГпд'; end
    else if (cSpzVidN = '8608') or (cSpzVidN = '8609')
                                               then {СвПрг с Блн и Дкр} begin
      nSmSvPrg := cdsSpzSmm.AsFloat;
      cVidN := '6211';
      cVidNotes := ' 3.для ЕсвБлнДкр'; end
    else if (cSpzVidN = '8607') then {СвПрг с ППС} begin
      nSmSvPrg := cdsSpzSmm.AsFloat;
      cVidN := '6206';
      cVidNotes := ' 2.для ЕсвППС'; end
    else if (cSpzVidN = '8606') then {СвПрг с Общ} begin
      nSmSvPrg := cdsSpzSmm.AsFloat;
      cVidN := '6201';
      cVidNotes := ' 1.для ЕсвОбщ';
    end;
  end;
  if (nSmFor <> 0) or (nSmTo <> 0) or (nSmSvPrg <> 0) then begin
    if not cdsPrp.Locate('PSch;SchBU;VidN',
                           VarArrayOf([cPSch, cSchBU, cVidN]), []) then begin
      cdsPrp.Append;
      cdsPrpGrp.AsInteger  := nGrp;
      cdsPrpPSch.AsString  := cPSch;
      cdsPrpSchBU.AsString := cSchBU;
      cdsPrpVidN.AsString  := cVidN;
      cdsPrpVidNotes.AsString := cVidNotes; end
    else
      cdsPrp.Edit;
    cdsPrpSmFor.AsFloat := cdsPrpSmFor.AsFloat + nSmFor;
    cdsPrpSmSvPrg.AsFloat := cdsPrpSmSvPrg.AsFloat + nSmSvPrg;
    cdsPrpSmTo.AsFloat := cdsPrpSmTo.AsFloat + nSmTo;
    cdsPrp.Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.AddToCdsPrpESV(bMoBySint: boolean);
var cSpzVidN, cVidN, cVidNotes, cPSch, cSchBU : ShortString;
    nVNU, nGrp, nKdKatP, nPRR : SmallInt;
    nSmFor, nSmSvPrg, nSmTo : double;
    dStzZaMG : TDateTime;  {дата ZaMesGod в записи cdsSpZ}
begin  // Проходя по cdsSpz, собрать выплаты и СверхПороги по кучкам для:
  nVnu     := cdsSpZVnu.AsInteger;      // ЕсвПрпОбщ, ЕсвПрпППС, ЕсвПрпИнвОбщ,
  nKdKatP  := cdsSpzKdKatP.AsInteger;   // ЕсвПрпИнвППС, ЕсвПрпБлн, ЕсвПрпДгв
  cSpzVidN := cdsSpzVidN.AsString;      // (все с предпр. (не с сотрудника)
  nPRR     := cdsSpzPRR.AsInteger;
  dStzZaMG := cdsSPZZaMesGod.AsDateTime;
  nSmFor   := 0;
  nSmSvPrg := 0;
  nSmTo    := 0;
  if bMoBySint then
    cSchBU := 'xxx'
  else
    cSchBU := cdsSpzSchBU.AsString;
  cPSch := cdsSpzPSch.AsString;
  nGrp := 0;
  if (nVnu <= 1) and (cdsSpzSp_PF.AsString = '1') {начисления} then begin
    if (cSpzVidN = '1005') or (cSpzVidN = '1006') or
                                      (cSpzVidN = '1008') {договоры} then begin
      nSmFor := nSmFor + cdsSpzSmm.AsFloat;
      cVidN := '8691'; {для EsvПрп с ГПД}
      nGrp := 8;
      cVidNotes := '12.В ЕСВ ГПД'; end
    else if ((d_DtPrc < d_20130701) and (cSpzVidN > '2600') and
             (cSpzVidN < '2700') and (cSpzVidN <> '2602')) {больничные,
                                                 кроме декретных} or
            ((d_DtPrc >= d_20130701) and (cSpzVidN > '2600') and
                      (cSpzVidN < '2700')) {больничные с декретными} then begin
      if d_DtPrc < (d_20111201-35) then begin // до появл. вида 8686 - ЕсвПрпБлнИнв
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;  {-35 чтобы начать с ноября 2011}
        cVidN := '8685'; {для EsvПрп с Блн}
        nGrp := 7;
        cVidNotes := '10.В ЕСВ БлнДкр'; end
      else begin {появился вид 8686 - ЕсвПрпБлнИнв}
        if ((nPRR = 3) or (nPRR = 4)) and (dStzZaMG >= (d_20111201-35)) then begin
          nSmFor := nSmFor + cdsSpzSmm.AsFloat; {-35 чтобы начать с ноября 2011}
          cVidN := '8686'; {для EsvПрп с Блн}
          nGrp := 7;
          cVidNotes := '11.В ЕСВ БлнДкрИнв'; end
        else begin
          nSmFor := nSmFor + cdsSpzSmm.AsFloat;
          cVidN := '8685'; {для EsvПрп с Блн}
          nGrp := 7;
          cVidNotes := '10.В ЕСВ БлнДкр';
        end;
      end; end
    else if (nKdKatP = 1) {ППС'овские} then begin
      if nPRR = 7 then begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '8684'; {для EsvПрп с ПпсИнв}
        nGrp := 6;
        cVidNotes := ' 9.В ЕСВ ППС инв.'; end
      else begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '8682'; {для Esv с ПрпПпс}
        nGrp := 5;
        cVidNotes := ' 7.В ЕСВ ППС';
      end; end
    else {общие} begin
      if nPRR = 7 then begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '8683'; {для Esv с ПрпОбщИнв}
        nGrp := 6;
        cVidNotes := ' 8.В ЕСВ общ.инв'; end
      else begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '8681'; {для Esv с ПрпОбщ}
        nGrp := 5;
        cVidNotes := ' 6.В ЕСВ общ.';
      end;
    end; end
  else if (nVnu = 5) {взносы в ЕСВ с предпр.} then begin
    cVidN := cSpzVidN;
    if (cVidN = '8691') then {Esv с ГПД} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := '12.для ЕсвПрпГпд'; end
    else if (cVidN = '8686') then {Esv с БлнИнв} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := '11.для ЕсвПрпБлнДкр'; end
    else if (cVidN = '8685') then {Esv с Блн} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := '10.для ЕсвПрпБлнДкрИнв'; end
    else if (cVidN = '8685') then {Esv с Блн} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := '10.для ЕсвПрпБлнДкр'; end
    else if (cVidN = '8684') then {Esv с ПпсИнв} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := ' 9.для ЕсвПрпИнвПпс'; end
    else if (cVidN = '8682') then {Esv с ППС} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := ' 7.для ЕсвПрпПпс'; end
    else if (cVidN = '8683') then {Esv с ПрпИнвОбщ} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := ' 8.для ЕсвПрпИнвОбщ'; end
    else if (cVidN = '8681') then {Esv с ПрпОбщ} begin
      nSmTo := cdsSpzSmm.AsFloat;
      cVidNotes := ' 6.для ЕсвПрпОбщ';
    end; end
  else if (nVnu = 6) {СверхПороги} then begin
    if (cSpzVidN = '8610') then {СвПрг с ГПД} begin
      nSmSvPrg := cdsSpzSmm.AsFloat;
      cVidN := '8691';
      cVidNotes := '11.для ЕсвПрпГпд'; end
    else if (cSpzVidN = '8608') then {СвПрг с Блн} begin
      nSmSvPrg := cdsSpzSmm.AsFloat;
      cVidN := '8685';
      cVidNotes := '10.для ЕсвПрпБлнДкр'; end
    else if (cSpzVidN = '8607') then {СвПрг с ППС} begin
      if nPRR = 7 then begin
        nSmSvPrg := cdsSpzSmm.AsFloat;
        cVidN := '8684';
        cVidNotes := ' 9.для ЕсвПрпИнвПпс'; end
      else begin
        nSmSvPrg := cdsSpzSmm.AsFloat;
        cVidN := '8682';
        cVidNotes := ' 7.для ЕсвПрпПпс';
      end; end
    else if (cSpzVidN = '8606') then {СвПрг с Общ} begin
      if nPRR = 7 then begin
        nSmSvPrg := cdsSpzSmm.AsFloat;
        cVidN := '8683';
        cVidNotes := ' 8.для ЕсвПрпИнвОбщ'; end
      else begin
        nSmSvPrg := cdsSpzSmm.AsFloat;
        cVidN := '8681';
        cVidNotes := ' 6.для ЕсвПрпОбщ';
      end;
    end;
  end;
  if (nSmFor <> 0) or (nSmTo <> 0) or (nSmSvPrg <> 0) then begin
    if not cdsPrp.Locate('PSch;SchBU;VidN',
                           VarArrayOf([cPSch, cSchBU, cVidN]), []) then begin
      cdsPrp.Append;
      cdsPrpGrp.AsInteger  := nGrp;
      cdsPrpPSch.AsString  := cPSch;
      cdsPrpSchBU.AsString := cSchBU;
      cdsPrpVidN.AsString  := cVidN;
      cdsPrpVidNotes.AsString := cVidNotes; end
    else
      cdsPrp.Edit;
    cdsPrpSmFor.AsFloat := cdsPrpSmFor.AsFloat + nSmFor;
    cdsPrpSmSvPrg.AsFloat := cdsPrpSmSvPrg.AsFloat + nSmSvPrg;
    cdsPrpSmTo.AsFloat := cdsPrpSmTo.AsFloat + nSmTo;
    cdsPrp.Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.sBtnBack2Click(Sender: TObject);
begin
  LabelMsgTs2.Caption := '';
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.sBtnPrtClick(Sender: TObject);
var cPrtCaption : string; bFinal : boolean;
begin
  cPrtCaption := '';
  bFinal := false;
  if (nCaseReport = 1) or (nCaseReport = 11) then begin
    if bFlagDbg then
      cPrtCaption := 'F6SintMo2011';   // по синтетическим счетам (сборным)
    F6SintMo2011(bFinal, cdsSPZ, cdsPrp, dDtProc, cPrtCaption); {z_CmnPrt} end
  else begin
    if bFlagDbg then
      cPrtCaption := 'F6AnalitMo2011'; // по аналитическим счетам (СубСчетам)
    F6AnalitMo2011(cdsSPZ, cdsPrp, dDtProc, cPrtCaption);  {z_CmnPrt}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.sBtnProverkiClick(Sender: TObject);
begin
  ShwSvdPrv(cdsSPZ, dDtProc);  {z_SvdPrv}
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.cdsSPZCalcFields(DataSet: TDataSet);
var cNmVidN, cDummy : string;
begin
  cdsSpzVid_SpZ.AsString := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
  cDummy := DmMain.VidN2ShVidN(cdsSpzVidN.AsString, cNmVidN);
  cdsSpzNmVidN.AsString := cNmVidN;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.sBtnSelClick(Sender: TObject);
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
        bSintBold   := false;
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
procedure TFormMo2011.sBtnSelAllClick(Sender: TObject);
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
procedure TFormMo2011.sBtnUnSelAllClick(Sender: TObject);
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
procedure TFormMo2011.TVKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnSel.Click;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.pop2detailsClick(Sender: TObject);
var cVidN, cShVidN, cPSch, cSchBU : ShortString;
    nKdKatP, nPRR : SmallInt; dZaMG : TDateTime;
begin
  cVidN   := cdsSpzVidN.AsString;
  cShVidN := cdsSpzShVidN.AsString;
  cPSch   := cdsSpzPSch.AsString;
  cSchBU  := cdsSpzSchBU.AsString;
  nKdKatP := cdsSpZKdKatP.AsInteger;
  nPRR    := cdsSpZPRR.AsInteger;
  dZaMG   := cdsSpZZaMesGod.AsDateTime;
  ShowMoDetails(d_DtPrc, dZaMG, cVidN, cShVidN, cPSch, cSchBU,
                                                    nKdKatP, nPRR); {z_ShMoDt}
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.dbgrSPZDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var nVnu : SmallInt;
begin
  with dbgrSpZ.Canvas do begin
    if not (gdFocused in State) then begin
      nVnu := cdsSpZVnu.AsInteger;
      if (nVnu = 0) then     {соцстраховские}
        Font.Color := clGreen
      else if nVnu = 1 then  {начисления}
        Font.Color := clWindowText
      else if nVnu = 2 then  {удержания}
        Font.Color := clNavy
      else if (nVnu = 3) {таких нет} or (nVnu = 4) {выплаты} then
        Font.Color := clBlue
      else if (nVnu > 4) {спецвиды} then
        Font.Color := clMaroon;
      if Column.FieldName = 'SMM' then
        Font.Style := [fsBold];
    end;
  end;
  dbgrSpZ.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormMo2011.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
