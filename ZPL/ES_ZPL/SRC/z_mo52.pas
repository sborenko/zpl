unit z_mo52;

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
  TFormMo52 = class(TForm)
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
    cdsSPZSMM: TBCDField;
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
    ts3: TTabSheet;
    dsrcMo3: TDataSource;
    dbgrMo3: TDBGrid;
    tbl06: TTable;
    cdsMo3: TTable;
    cdsMo3NR: TAutoIncField;
    cdsMo3VNU: TSmallintField;
    cdsMo3KDOBJ: TSmallintField;
    cdsMo3PSCH: TStringField;
    cdsMo3KDSPZ: TSmallintField;
    cdsMo3PRR: TSmallintField;
    cdsMo3SCHBU: TStringField;
    cdsMo3VIDN: TStringField;
    cdsMo3SHVIDN: TStringField;
    cdsMo3VID_KDSPZ: TSmallintField;
    cdsMo3VID_KEKV: TStringField;
    cdsMo3SP_PF: TStringField;
    cdsMo3SP_FSTVP: TStringField;
    cdsMo3SP_FSNV: TStringField;
    cdsMo3SP_FZ: TStringField;
    cdsMo3SMM: TFloatField;
    cdsMo3CNT: TIntegerField;
    cdsMo3KRSCH: TStringField;
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
    procedure dbgrSpZDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    d_MesDate : TDateTime;
    n_Case : SmallInt;
    bTvReady : boolean;
    bSintBold, bAnalitBold : boolean;
    nCaseReport : word;
    procedure CreTvSpZ(dMesDate : TDateTime);
    procedure CreOpenCdsSpZ(cSQL : string; d_MesDate : TDateTime;
                                                       bMoBySint : boolean);
    procedure CreOpenCdsMo3(cSQL : string; d_MesDate : TDateTime;
                                                           bMoBySint : boolean);
    procedure AddInfToCdsMo3(cVidN, cShVidN, cPSCH, cSchBU, cVid_Kekv,
                             cSp_Pf, cSp_FsTvp, cSp_FsNv, cSp_Fz : ShortString;
                                  nKdSpZ, nVid_KdSpZ, nPrr, nKdKatP : SmallInt;
                                                              nSmVida : double);
    procedure CreOpenCdsPrp(bMoBySint : boolean);
    procedure AddToCdsPrpPF(bMoBySint : boolean);
    procedure AddToCdsPrpTVP(bMoBySint : boolean);
    procedure AddToCdsPrpNV(bMoBySint : boolean);
    procedure AddToCdsPrpFZ(bMoBySint : boolean);
    function GetNmPSch(cPSCH : ShortString) : ShortString;
  public
    { Public declarations }
  end;

procedure Mo_52(nCase : SmallInt; dMesDate : TDateTime);

const SECTION = 'z_mo52';

var
  FormMo52: TFormMo52;

implementation

uses a_Const, A_DM, a_Lib, Z_Dm, z_Main, z_CmnPrt, z_SvdPrv, z_ShMoDt;

{$R *.dfm}

procedure Mo_52(nCase : SmallInt; dMesDate : TDateTime);
var nY, nM, nD : word;
begin
  FormMo52 := TFormMo52.Create(Application);
  with FormMo52 do begin
    if bFlagDbg then
      LabelDbg.Caption := 'Ќова€ (с 01-01-2007) схема'
    else
      LabelDbg.Caption := '';
    d_MesDate := dMesDate;
    n_Case := nCase;
    bTvReady  := false;
    bSintBold := true;
    bAnalitBold := true;
    DecodeDate(dMesDate, nY, nM, nD);
    Caption := '‘ормирование задани€ дл€ журнала-ордера за ' +
                                    MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    CreTvSpZ(dMesDate);
    Label1.Caption := '—лева счета (источники финансировани€), встретившиес€ ' +
                      'в таблице начислений-удержаний за ' +
                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.CreTvSpZ(dMesDate : TDateTime);
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
    // вроде хорошо округл€ет  Sum(Cast(Summa as numeric (18,2)))
    SQL.Add('Select PSch, KdSpZ, SchBU, NmSch, ' +
            ' Sum(Cast(Summa as Numeric(16,2))) as Summa ' +
            ' from ViNu4 where dtProc = :dMesDate ' +
            ' group by PSch, KdSpZ, SchBU, NmSch ' +
            ' having (not PSCH is null and PSCH > "")');
    ParamByName('dMesDate').AsDateTime := dMesDate;
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
    // «агрузить дерево из только что созданного
    // текстового файла (cDirTemp + cNmTV1):
    TV.Items.BeginUpdate;
    TV.Items.Clear;
    // «аполнить св€занные Objects
    TV.LoadFromFile(cDirTemp + cNmTV);
    TV.Items.EndUpdate;
    First;
    i := 0;
    while not Eof do begin
      if (FieldByName('PSCH').IsNull) or
                              (FieldByName('PSCH').AsString = '') then begin
        {
        cPSCH := 'Root';
        New(MyTreeRec);     // «аписываю корневой счет
        MyTreeRec.KdSbu  := 0;
        MyTreeRec.SchBU  := 'Root';
        MyTreeRec.PSCH   := 'Root';
        TV.Items[i].Data := MyTreeRec;
        Inc(i);
        New(MyTreeRec);     // ƒочерний счет
        MyTreeRec.KdSbu  := FieldByName('KdSpZ').AsInteger;
        MyTreeRec.SchBU  := Trim(FieldByName('SchBU').AsString);
        MyTreeRec.PSCH   := Trim(FieldByName('PSch').AsString);
        TV.Items[i].Data := MyTreeRec;
        Inc(i);
        }
        Next; end
      else begin
        cPSCH := FieldByName('PSch').AsString;
        New(MyTreeRec);     // «аписываю корневой счет
        MyTreeRec.KdSbu  := DmMain.KdSbu2KdPSch(FieldByName('KdSpZ').AsInteger);
        MyTreeRec.SchBU  := Trim(FieldByName('PSch').AsString);
        MyTreeRec.PSCH   := Trim(FieldByName('PSch').AsString);
        TV.Items[i].Data := MyTreeRec;
        Inc(i);
        while (FieldByName('PSCH').AsString = cPSCH) and not Eof do begin
          New(MyTreeRec);   // ƒочерний счет
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
function TFormMo52.GetNmPSch(cPSCH : ShortString) : ShortString;
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
procedure TFormMo52.TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
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
procedure TFormMo52.FormResize(Sender: TObject);
begin
  PanelRight2.Top := Round((Height - PanelRight2.Height)/2) - 20;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.FormCreate(Sender: TObject);
begin
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  ts3.TabVisible := false;
  PageControl1.ActivePage := ts1;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 750);
    rBtnTtsAllAndCmn.Checked := false; // ReadBool(SECTION, 'bTtsAll', false);
    rbtnTtsOnlyCmn.Checked := true;    // not rBtnTtsAllAndCmn.Checked;
    //dbgrPrp.Height := ReadInteger(SECTION, 'nDbgrPrpH', 185);
    Free;
  end;
  if FileExists(cDirVids + 'mo52_02.vid') then
    dbgrSpZ.Columns.LoadFromFile(cDirVids + 'mo52_02.vid');
  if FileExists(cDirVids + 'mo52_03.vid') then
    dbgrPrp.Columns.LoadFromFile(cDirVids + 'mo52_03.vid');
  LabelCntSelSch.Caption := '';
  LabelMsgTs2.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormMo52.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSpZ.Columns.SaveToFile(cDirVids + 'mo52_02.vid');
  if cdsPrp.Active then
    dbgrPrp.Columns.SaveToFile(cDirVids + 'mo52_03.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bTtsAll', rBtnTtsAllAndCmn.Checked);
    if cdsPrp.Active then
      WriteInteger(SECTION, 'nDbgrPrpH', dbgrPrp.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.sBtnGoClick(Sender: TObject);
var i, nAdd, nTvCount : integer; bHasChild : boolean;
    cPSch, cSchBU, cSQL : string; bMoBySint : boolean;
begin
  if n_Case = 1 then begin
    bMoBySint := true;
    nTvCount := TV.Items.Count;
    if bSintBold and bAnalitBold then begin // Ќет помеченных
      if (TV.Selected <> nil) then begin
        i := TV.Selected.AbsoluteIndex;
        cPSch  := PTreeRec(TV.Items[i].Data)^.PSch;
        cSchBU := PTreeRec(TV.Items[i].Data)^.SchBU;
        bHasChild := TV.Items[i].HasChildren;
        if bHasChild then begin {выбран (но не помечен) синтетический счет}
          cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
                  ' Cast(32765 as SmallInt) as KdObj, PSch, ' +
                  ' KdSpZ, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
                  ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
                  ' Sum(Cast(Summa as numeric(18,2))) as SMM, ' +
                  ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch ' +
                  ' from ViNuMain where DtProc = :dMesDate and ' +
                  ' PSCH = "' + cPSch + '" and (not KdObj in (1056)) ' +
                  ' group by PSch, KdSpZ, SchBU, PRR, VidN, ShVidn, ' +
                  ' Vid_KdSpZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ ' +
                  ' having Sum(Cast(Summa as numeric(18,2))) <> 0';
          bMoBySint := true;
          nCaseReport := 1; end
          {not KdObj in (1056,3901) - это потому, что 1056 - –ога и  опыта
           а 3901 - рестуктуризаци€ дл€ уволенных, с которых ничего не беретс€}
        else begin {выбран (но не помечен) аналитический счет}
          cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
                  ' Cast(32765 as SmallInt) as KdObj, PSch, ' +
                  ' KdSpZ, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
                  ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
                  ' Sum(Cast(Summa as numeric(18,2))) as SMM, ' +
                  ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch ' +
                  ' from ViNuMain where DtProc = :dMesDate and ' +
                  ' SChBU = "' + cSchBU + '" and (not KdObj in (1056)) ' +
                  ' group by PSch, KdSpZ, SchBU, PRR, VidN, ShVidn, ' +
                  ' Vid_KdSpZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ ' +
                  ' having Sum(Cast(Summa as numeric(18,2))) <> 0';
          bMoBySint := false;
          nCaseReport := 2;
        end;
      end; end
    else if bSintBold then begin // ѕомечен один или несколько синтетических
      cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
              ' Cast(32765 as SmallInt) as KdObj, PSch, ' +
              ' KdSpZ, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
              ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
              ' Sum(Cast(Summa as numeric(18,2))) as SMM, ' +
              ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch ' +
              ' from ViNuMain where DtProc = :dMesDate and ' +
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
                     ' group by PSch, KdSpZ, SchBU, PRR, VidN, ShVidn, ' +
                     ' Vid_KdSpZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ ' +
                     ' having Sum(Cast(Summa as numeric(18,2))) <> 0 ';
      bMoBySint := true;
      nCaseReport := 11; end
    else if bAnalitBold  then begin  // ѕомечен один или несколько аналитических
      cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
              ' Cast(32765 as SmallInt) as KdObj, PSch, ' +
              ' KdSpZ, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
              ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
              ' Sum(Cast(Summa as numeric(18,2))) as SMM, ' +
              ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch ' +
              ' from ViNuMain where DtProc = :dMesDate and ' +
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
                     ' group by PSch, KdSpZ, SchBU, PRR, VidN, ShVidn, ' +
                     ' Vid_KdSpZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ ' +
                     ' having Sum(Cast(Summa as numeric(18,2))) <> 0';
      bMoBySint := false;
      nCaseReport := 22; end
    else
      // такого не может случитьс€
      ;
    CreOpenCdsSpZ(cSQL, d_MesDate, bMoBySint);
    PanelTs2.Visible := bFlagDbg;
    SplitterTs2.Visible := bFlagDbg;
    if not bFlagDbg then begin
      cdsSpZ.Filter := 'VNU < 5';
      cdsSpZ.Filtered := true;
    end;
    PageControl1.ActivePage := ts2; end
  else begin
    bMoBySint := true;
    nTvCount := TV.Items.Count;
    if bSintBold and bAnalitBold then begin // Ќет помеченных
      if (TV.Selected <> nil) then begin
        i := TV.Selected.AbsoluteIndex;
        cPSch  := PTreeRec(TV.Items[i].Data)^.PSch;
        cSchBU := PTreeRec(TV.Items[i].Data)^.SchBU;
        bHasChild := TV.Items[i].HasChildren;
        if bHasChild then begin {выбран (но не помечен) синтетический счет}
          cSQL := 'Select ' +
                  ' Cast(1 as SmallInt) as VNU, ZaMesGod, KdObj, PSch, KdSpZ, ' +
                  ' PRR, KdKatP, SchBU, TabN, VidN, ShVidn, Vid_KdSpZ, Vid_KEKV, ' +
                  ' SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, Summa, ' +
                  ' Cast(null as Char(10)) as KrSch ' +
                  ' from ViNuMain where DtProc = :dMesDate and ' +
                  ' PSCH = "' + cPSch + '" and (KdObj <> 1056) ' +
                  ' and (Summa <> 0) order by TabN, ZaMesGod, KdKatP, PRR, ' +
                  ' VidN, PSCH';
          bMoBySint := true;
          nCaseReport := 1; end
          {KdObj = 1056 - –ога и  опыта}
        else begin {выбран (но не помечен) аналитический счет}
          cSQL := 'Select Cast(1 as SmallInt) as VNU, ZaMesGod, KdObj, PSch, KdSpZ, ' +
                  ' PRR, KdKatP, SchBU, TabN, VidN, ShVidn, Vid_KdSpZ, Vid_KEKV, ' +
                  ' SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, Summa, ' +
                  ' Cast(null as Char(10)) as KrSch ' +
                  ' from ViNuMain where DtProc = :dMesDate and ' +
                  ' PSCH = "' + cSchBU + '" and (KdObj <> 1056) ' +
                  ' and (Summa <> 0) order by TabN, ZaMesGod, KdKatP, PRR, ' +
                  ' VidN, KdSpZ';
          bMoBySint := false;
          nCaseReport := 2;
        end;
      end; end
    else if bSintBold then begin // ѕомечен один или несколько синтетических
      cSQL := 'Select Cast(1 as SmallInt) as VNU, ZaMesGod, KdObj, PSch, KdSpZ, ' +
              ' PRR, KdKatP, SchBU, TabN, VidN, ShVidn, Vid_KdSpZ, ' +
              ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, Summa, ' +
              ' Cast(null as Char(10)) as KrSch ' +
              ' from ViNuMain where DtProc = :dMesDate and ' +
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
      cSQL := cSQL + ') and (KdObj <> 1056) ' +
                  ' and (Summa <> 0) order by TabN, ZaMesGod, KdKatP, PRR, ' +
                  ' VidN, PSCH';
      bMoBySint := true;
      nCaseReport := 11; end
    else if bAnalitBold  then begin  // ѕомечен один или несколько аналитических
      cSQL := 'Select Cast(1 as SmallInt) as VNU, ZaMesGod, KdObj, PSch, KdSpZ, ' +
              ' PRR, KdKatP, SchBU, TabN, VidN, ShVidn, Vid_KdSpZ, ' +
              ' Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, Summa, ' +
              ' Cast(null as Char(10)) as KrSch ' +
              ' from ViNuMain where DtProc = :dMesDate and ' +
              ' SchBU in (';
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
      cSQL := cSQL + ') and (KdObj <> 1056) ' +
                  ' and Summa <> 0 order by TabN, ZaMesGod, KdKatP, PRR, ' +
                  ' VidN, KdSpZ';
      bMoBySint := false;
      nCaseReport := 22; end
    else
      // такого не может случитьс€
      ;
    CreOpenCdsMo3(cSQL, d_MesDate, bMoBySint);
    //PanelTs3.Visible := bFlagDbg;
    //SplitterTs2.Visible := bFlagDbg;
    if not bFlagDbg then begin
      cdsSpZ.Filter := 'VNU < 5';
      cdsSpZ.Filtered := true;
    end;
    PageControl1.ActivePage := ts3;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.CreOpenCdsMo3(cSQL : string; d_MesDate : TDateTime;
                                                           bMoBySint : boolean);
var cKrSch : string10;
    cVidN : string4;
    nVNU, nTabN : integer;
    nKdKatP, nPRR, nKdSpZ, nVid_KdSpZ : SmallInt;
    dZaMG : TDateTime;
    cTableNm, cPSCH, cSchBU, cVid_Kekv, cSp_PF, cSp_FsTvp, cSp_FsNv, cSp_Fz,
              cShVidN : ShortString;
    nSmVida : double;
begin
  cTableNm := RandomFileName + '.db';
  with cdsMo3 do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    TableName := cTableNm;
    if Exists then
      DeleteTable;
    CreateTable;
    Open;
    IndexName := 'VidSchPRR';
  end;
(*
  with tbl06 do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    TableName := cTableNm;
    if Exists then
      DeleteTable;
    CreateTable;
    Open;
  end;
*)
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add(cSQL);
    ParamByName('dMesDate').AsDateTime := d_MesDate;
    //if bFlagDbg then
    //  SQL.SaveToFile(cDirTemp + 'NewSql.sql');
    Open;
    // order by TabN, ZaMesGod, KdKatP, PRR, VidN, PSCH
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        dZaMG := FieldByName('ZaMesGod').AsDateTime;
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and
              (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
          nKdKatP := FieldByName('KdKatP').AsInteger;
          while (FieldByName('KdKatP').AsInteger = nKdKatP) and
                (FieldByName('ZaMesGod').AsDateTime = dZaMG) and
                (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
            nPRR := FieldByName('PRR').AsInteger;
            while (FieldByName('PRR').AsInteger = nPRR) and
                  (FieldByName('KdKatP').AsInteger = nKdKatP) and
                  (FieldByName('ZaMesGod').AsDateTime = dZaMG) and
                  (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
              cVidN      := FieldByName('VidN').AsString;
              cShVidN    := FieldByName('ShVidN').AsString;
              cPSCH      := FieldByName('PSCH').AsString;
              nKdSpZ     := FieldByName('KdSpZ').AsInteger;
              cSchBU     := FieldByName('ShVidN').AsString;
              nVid_KdSpZ := FieldByName('Vid_KdSpZ').AsInteger;
              cVid_Kekv  := FieldByName('Vid_Kekv').AsString;
              cSp_PF     := FieldByName('Sp_Pf').AsString;
              cSp_FsTvp  := FieldByName('Sp_FsTvp').AsString;
              cSp_FsNv   := FieldByName('Sp_FsNv').AsString;
              cSp_Fz     :=  FieldByName('Sp_Fz').AsString;
              nSmVida := 0;
              while (FieldByName('VidN').AsString = cVidN) and
                    (FieldByName('PRR').AsInteger = nPRR) and
                    (FieldByName('KdKatP').AsInteger = nKdKatP) and
                    (FieldByName('ZaMesGod').AsDateTime = dZaMG) and
                    (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
                nSmVida := nSmVida + FieldByName('Summa').AsFloat;
                Next;
              end;
              AddInfToCdsMo3(cVidN, cShVidN, cPSCH, cSchBU, cVid_Kekv, cSp_Pf,
                                       cSp_FsTvp, cSp_FsNv, cSp_Fz,
                                    nKdSpZ, nVid_KdSpZ, nPrr, nKdKatP, nSmVida);
            end;
          end;
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.AddInfToCdsMo3(cVidN, cShVidN, cPSCH, cSchBU, cVid_Kekv,
                             cSp_Pf, cSp_FsTvp, cSp_FsNv, cSp_Fz : ShortString;
                                  nKdSpZ, nVid_KdSpZ, nPrr, nKdKatP : SmallInt;
                                                              nSmVida : double);
begin
  with cdsMo3 do begin
    if not Locate('VidN;SchBU;PRR',
                           VarArrayOf([cVidN, cSchBU, nPRR]), []) then begin
      Append;
      cdsMo3VidN.AsString := cVidN;
      cdsMo3ShVidN.AsString := cShVidN;
      cdsMo3PSCH.AsString := cPSCH;
      cdsMo3KdSpZ.AsInteger := nKdSpZ;
      cdsMo3SchBU.AsString := cSchBU;
      cdsMo3PRR.AsInteger := nPRR;
      cdsMo3Vid_KdSpZ.AsInteger := nVid_KdSpZ;
      cdsMo3Vid_Kekv.AsString := cVid_Kekv;
      cdsMo3Sp_Pf.AsString := cSp_Pf;
      cdsMo3Sp_FsTvp.AsString := cSp_FsTvp;
      cdsMo3Sp_FsNv.AsString := cSp_FsNv;
      cdsMo3Sp_Fz.AsString := cSp_Fz; end
    else
      Edit;
    cdsMo3Smm.AsFloat := cdsMo3Smm.AsFloat + nSmVida;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.CreOpenCdsSpZ(cSQL : string; d_MesDate : TDateTime;
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
    ParamByName('dMesDate').AsDateTime := d_MesDate;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'NewSql.sql');
    Open;
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
    if (nCaseReport = 1) or (nCaseReport = 11) then // по —инт—четам
      AddIndex('CdsIndx', 'PSch;VNU;VidN;SchBU', [])
    else                                            // по јналит—четам
      AddIndex('CdsIndx', 'PSch;SchBU;VNU;VidN', []);
    First;
    // –асставить VNU - сортировка дл€ ∆/ќрдера
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      nVNU := 1;
      // больничные, кроме 1-х 5-ти дней
      // SB 23.3.2026 ѕо аналогии, наверное, и 2606
      if (cVidN <> '2603') and (cVidN <> '2606') and
              ((cVidN >= '2600') and (cVidN < '2700')) or
            (cVidN = '1901') or (cVidN = '1909') then begin
            // 1901 - пособие „ќќ, 1909 - пособие при рожд ребенка
        nVNU := 0;
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger); end
      else if (cVidN = '2705') {приход в кассу}  or
                     (cVidN = '2707') {возврат ч/з банк} then begin
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 1;  end
      else if (cVidN > '2700') and
                        (cVidN < '2750') {прочие начислени€} then begin
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
      else if ((cVidN >= '6000') and (cVidN < '7000')) then begin  // удержани€
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
      else if ((cVidN >= '8670') and (cVidN < '8680')) then begin // —вѕороги
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
procedure TFormMo52.CreOpenCdsPrp(bMoBySint : boolean);
begin
  with cdsPrp do begin
    if Active then Close;
    IndexName := '';
    IndexDefs.Clear;
    CreateDataSet;
    Open;
    AddIndex('OnPSchSchBUVidNVidNotes', 'PSch;SchBU;VidN;VidNotes', []);
    IndexName := 'OnPSchSchBUVidNVidNotes';
  end;
  with cdsSpZ do begin
    First;
    while not Eof do begin
      AddToCdsPrpPF(bMoBySint);
      AddToCdsPrpTVP(bMoBySint);
      AddToCdsPrpNV(bMoBySint);
      AddToCdsPrpFZ(bMoBySint);
      Next;
    end;
    First;
  end;
  cdsPrp.IndexName := 'OnPSchSchBUVidNVidNotes';
  if bFlagDbg then
    cdsPrp.SaveToFile(cDirTemp + 'cdsMoPrp.cds');
end;
//------------------------------------------------------------------------------
procedure TFormMo52.AddToCdsPrpTVP(bMoBySint : boolean);
var cVidN, cVidNotes, cPSch, cSchBU : ShortString; nVNU : SmallInt;
    nSmFor, nSmSvPrg, nSmTo : double;
begin
  nSmFor   := 0;
  nSmSvPrg := 0;
  nSmTo    := 0;
  nVnu := cdsSpZVnu.AsInteger;
  if ((nVnu <= 1) and (cdsSpzSP_FSTVP.AsString = '1')) {nSmFor} or
                   (cdsSpzVidN.AsString = '8621') {nSmTo} or
                       (cdsSpzVidN.AsString = '8672') {nSmSvPrg} then begin
    if bMoBySint then
      cSchBU := 'xxx'
    else
      cSchBU := cdsSpzSchBU.AsString;
    if ((nVnu <= 1) and (cdsSpzSP_FSTVP.AsString = '1')) then
      nSmFor := cdsSpzSMM.AsFloat
    else if (cdsSpzVidN.AsString = '8621') then
      nSmTo := cdsSpzSMM.AsFloat
    else if (cdsSpzVidN.AsString = '8672') then
      nSmSvPrg := cdsSpzSMM.AsFloat;
    cPSch := cdsSpzPSch.AsString;
    cVidN := '8621';
    cVidNotes := '11.‘с“вп';
    if not cdsPrp.Locate('PSch;SchBU;VidN;VidNotes', VarArrayOf([cPSch, cSchBU,
                                             cVidN, cVidNotes]), []) then begin
      cdsPrp.Append;
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
procedure TFormMo52.AddToCdsPrpNV(bMoBySint : boolean);
var cVidN, cVidNotes, cPSch, cSchBU : ShortString; nVNU : SmallInt;
    nSmFor, nSmSvPrg, nSmTo : double;
begin
  nSmFor   := 0;
  nSmSvPrg := 0;
  nSmTo    := 0;
  nVnu := cdsSpZVnu.AsInteger;
  //SP_FSTVP, SP_FSNV, SP_FZ
  if ((nVnu <= 1) and (cdsSpzSP_FSNV.AsString = '1')) {nSmFor} or
                   (cdsSpzVidN.AsString = '8631') {nSmTo} or
                       (cdsSpzVidN.AsString = '8672') {nSmSvPrg} then begin
    if bMoBySint then
      cSchBU := 'xxx'
    else
      cSchBU := cdsSpzSchBU.AsString;
    if ((nVnu <= 1) and (cdsSpzSP_FSNV.AsString = '1')) then
      nSmFor := cdsSpzSMM.AsFloat
    else if (cdsSpzVidN.AsString = '8631') then
      nSmTo := cdsSpzSMM.AsFloat
    else if (cdsSpzVidN.AsString = '8672') then
      nSmSvPrg := cdsSpzSMM.AsFloat;
    cPSch := cdsSpzPSch.AsString;
    cVidN := '8631';
    cVidNotes := '12.‘сЌ¬';
    if not cdsPrp.Locate('PSch;SchBU;VidN;VidNotes', VarArrayOf([cPSch, cSchBU,
                                             cVidN, cVidNotes]), []) then begin
      cdsPrp.Append;
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
procedure TFormMo52.AddToCdsPrpFZ(bMoBySint : boolean);
var cVidN, cVidNotes, cPSch, cSchBU : ShortString; nVNU : SmallInt;
    nSmFor, nSmSvPrg, nSmTo : double;
begin
  nSmFor   := 0;
  nSmSvPrg := 0;
  nSmTo    := 0;
  nVnu := cdsSpZVnu.AsInteger;
  if ((nVnu <= 1) and (cdsSpzSP_FZ.AsString = '1')) {nSmFor} or
                   (cdsSpzVidN.AsString = '8641') {nSmTo} or
                       (cdsSpzVidN.AsString = '8674') {nSmSvPrg} then begin
    if bMoBySint then
      cSchBU := 'xxx'
    else
      cSchBU := cdsSpzSchBU.AsString;
    if ((nVnu <= 1) and (cdsSpzSP_FZ.AsString = '1')) then
      nSmFor := cdsSpzSMM.AsFloat
    else if (cdsSpzVidN.AsString = '8641') then
      nSmTo := cdsSpzSMM.AsFloat
    else if (cdsSpzVidN.AsString = '8674') then
      nSmSvPrg := cdsSpzSMM.AsFloat;
    cPSch := cdsSpzPSch.AsString;
    cVidN := '8641';
    cVidNotes := '13.‘с‘«';
    if not cdsPrp.Locate('PSch;SchBU;VidN;VidNotes', VarArrayOf([cPSch, cSchBU,
                                             cVidN, cVidNotes]), []) then begin
      cdsPrp.Append;
      cdsPrpPSch.AsString  := cPSch;
      cdsPrpSchBU.AsString := cSchBU;
      cdsPrpVidN.AsString  := cVidN;
      cdsPrpVidNotes.AsString := cVidNotes; end
    else
      cdsPrp.Edit;
    cdsPrpSmFor.AsFloat := cdsPrpSmFor.AsFloat + nSmFor;
    cdsPrpSmSvPrg.AsFloat := cdsPrpSmSvPrg.AsFloat + nSmSvPrg;
    cdsPrpSmTo.AsFloat := cdsPrpSmTo.AsFloat + nSmTo;
    cdsPrp.Post; end
  else if ((nVnu <= 1) and ((cdsSpzVidN.AsString = '1005') or
                            (cdsSpzVidN.AsString = '1008'))) {nSmFor} or
                   (cdsSpzVidN.AsString = '8643') then begin
    if bMoBySint then
      cSchBU := 'xxx'
    else
      cSchBU := cdsSpzSchBU.AsString;
    if ((nVnu <= 1) and ((cdsSpzVidN.AsString = '1005') or
                                        (cdsSpzVidN.AsString = '1008'))) then
      nSmFor := cdsSpzSMM.AsFloat
    else if (cdsSpzVidN.AsString = '8643') then
      nSmTo := cdsSpzSMM.AsFloat;
    //else if (cdsSpzVidN.AsString = '8674') then
    //  nSmSvPrg := cdsSpzSMM.AsFloat;
    cPSch := cdsSpzPSch.AsString;
    cVidN := '8643';
    cVidNotes := '13.‘з1дгв';
    if not cdsPrp.Locate('PSch;SchBU;VidN;VidNotes', VarArrayOf([cPSch, cSchBU,
                                             cVidN, cVidNotes]), []) then begin
      cdsPrp.Append;
      cdsPrpPSch.AsString  := cPSch;
      cdsPrpSchBU.AsString := cSchBU;
      cdsPrpVidN.AsString  := cVidN;
      cdsPrpVidNotes.AsString := cVidNotes; end
    else
      cdsPrp.Edit;
    cdsPrpSmFor.AsFloat := cdsPrpSmFor.AsFloat + nSmFor;
    cdsPrpSmSvPrg.AsFloat := cdsPrpSmSvPrg.AsFloat + nSmSvPrg;
    cdsPrpSmTo.AsFloat := cdsPrpSmTo.AsFloat + nSmTo;
    cdsPrp.Post; end
  else if ((nVnu <= 1) and (cdsSpzVidN.AsString = '1006')) {nSmFor} or
                   (cdsSpzVidN.AsString = '8642') then begin
    if bMoBySint then
      cSchBU := 'xxx'
    else
      cSchBU := cdsSpzSchBU.AsString;
    if ((nVnu <= 1) and (cdsSpzVidN.AsString = '1006')) then
      nSmFor := cdsSpzSMM.AsFloat
    else if (cdsSpzVidN.AsString = '8642') then
      nSmTo := cdsSpzSMM.AsFloat;
    //else if (cdsSpzVidN.AsString = '8674') then
    //  nSmSvPrg := cdsSpzSMM.AsFloat;
    cPSch := cdsSpzPSch.AsString;
    cVidN := '8642';
    cVidNotes := '13.‘з2дгв';
    if not cdsPrp.Locate('PSch;SchBU;VidN;VidNotes', VarArrayOf([cPSch, cSchBU,
                                             cVidN, cVidNotes]), []) then begin
      cdsPrp.Append;
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
procedure TFormMo52.AddToCdsPrpPF(bMoBySint : boolean);
var cVidN, cVidNotes, cPSch, cSchBU : ShortString; nVNU : SmallInt;
    nSmFor, nSmSvPrg, nSmTo : double;
begin
  nVnu := cdsSpZVnu.AsInteger;
  if ((nVnu <= 1) and (cdsSpzSP_PF.AsString <> '1')) or
                                    (nVnu = 2) or (nVnu = 4) or
                   ((nVnu = 5) and (cdsSpzVidN.AsString >= '8621')) or
                       (cdsSpzVidN.AsString > '8671') {пока не смотрю} then
    Exit; // нужны только Prp
  nSmFor   := 0;
  nSmSvPrg := 0;
  nSmTo    := 0;
  if (nVnu = 0) and (cdsSpzSp_PF.AsString = '1') then begin
    if bMoBySint then
      cSchBU := 'xxx'
    else
      cSchBU := cdsSpzSchBU.AsString;
    if cdsSpzPRR.AsInteger = 1 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8611';
      cVidNotes := '2.Ѕлн—с 1';
      nSmFor := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 3 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8612';
      cVidNotes := '5.Ѕлн—с» 3';
      nSmFor := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 2 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8611';
      cVidNotes := '1.Ѕлн5дн 2';
      nSmFor := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 4 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8612';
      cVidNotes := '4.Ѕлн5дн» 4';
      nSmFor := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 7 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8612';
      cVidNotes := '3.ѕфќбщ» 7';
      nSmFor := cdsSpzSmm.AsFloat; end
    else begin
      cPSch := cdsSpZPSch.AsString;
      cVidN := '8611';
      cVidNotes := '0.ѕфќбщ _';
      nSmFor := cdsSpzSmm.AsFloat;
    end; end
  else if (nVnu = 1) and (cdsSpzSp_PF.AsString = '1') then begin
    if bMoBySint then
      cSchBU := 'xxx'
    else
      cSchBU := cdsSpzSchBU.AsString;
    if cdsSpzPRR.AsInteger = 1 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8611';
      cVidNotes := '2.Ѕлн—с 1';
      nSmFor := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 3 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8612';
      cVidNotes := '5.Ѕлн—с» 3';
      nSmFor := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 2 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8611';
      cVidNotes := '1.Ѕлн5дн 2';
      nSmFor := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 4 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8612';
      cVidNotes := '4.Ѕлн5дн» 4';
      nSmFor := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 7 then begin
      cPSch := cdsSpzPSch.AsString;
      cVidN := '8612';
      cVidNotes := '3.ѕфќбщ» 7';
      nSmFor := cdsSpzSmm.AsFloat; end
    else begin
      cPSch := cdsSpZPSch.AsString;
      cVidN := '8611';
      cVidNotes := '0.ѕфќбщ _';
      nSmFor := cdsSpzSmm.AsFloat;
    end; end
  else if (nVnu = 5) then begin
    if bMoBySint then
      cSchBU := 'xxx'
    else
      cSchBU := cdsSpZSchBU.AsString;
    cVidN := cdsSpZVidN.AsString;
    if (cVidN = '8611') then begin
      if cdsSpzPRR.AsInteger = 1 then begin
        cPSch := cdsSpZPSch.AsString;
        cVidNotes := '2.Ѕлн—с 1';
        nSmTo := cdsSpzSmm.AsFloat; end
      else if cdsSpzPRR.AsInteger = 2 then begin
        cPSch := cdsSpZPSch.AsString;
        cVidNotes := '1.Ѕлн5дн 2';
        nSmTo := cdsSpzSmm.AsFloat; end
      else begin
        cPSch := cdsSpZPSch.AsString;
        cVidNotes := '0.ѕфќбщ _';
        nSmTo := cdsSpzSmm.AsFloat;
      end; end
    else if (cVidN = '8612') then begin
      if bMoBySint then
        cSchBU := 'xxx'
      else
        cSchBU := cdsSpZSchBU.AsString;
      if (cdsSpZPrr.AsInteger = 1) then begin  // случилось такое в дек.2006
        cPSch := cdsSpZPSch.AsString;          // “абЌ=20909 Ѕезнос “.ѕ.
        cVidNotes := '2.Ѕлн—с 1';              // надо проверить наличие чудес
        nSmTo := cdsSpzSmm.AsFloat; end        //  в др.комбинаци€х
      else if (cdsSpZPrr.AsInteger = 3) then begin
        cPSch := cdsSpZPSch.AsString;
        cVidNotes := '5.Ѕлн—с» 3';
        nSmTo := cdsSpzSmm.AsFloat; end
      else if cdsSpZPrr.AsInteger = 4 then begin
        cPSch := cdsSpZPSch.AsString;
        cVidNotes := '4.Ѕлн5дн» 4';
        nSmTo := cdsSpzSmm.AsFloat; end
      else if cdsSpZPrr.AsInteger = 7 then begin
        cPSch := cdsSpZPSch.AsString;
        cVidNotes := '3.ѕфќбщ» 7';
        nSmTo := cdsSpzSmm.AsFloat;
      end;
    end; end
  else if (nVnu = 6) and (cdsSpzVidN.AsString = '8671') then begin
    cVidN := '8611';
    if bMoBySint then
      cSchBU := 'xxx'
    else
      cSchBU := cdsSpZSchBU.AsString;
    if cdsSpzPRR.AsInteger = 1 then begin
      cPSch := cdsSpZPSch.AsString;
      cVidNotes := '2.Ѕлн—с 1';
      nSmSvPrg := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 2 then begin
      cPSch := cdsSpZPSch.AsString;
      cVidNotes := '1.Ѕлн5дн 2';
      nSmSvPrg := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 3 then begin
      cPSch := cdsSpZPSch.AsString;
      cVidNotes := '5.Ѕлн—с» 3';
      nSmSvPrg := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 4 then begin
      cPSch := cdsSpZPSch.AsString;
      cVidNotes := '4.Ѕлн5дн» 4';
      nSmSvPrg := cdsSpzSmm.AsFloat; end
    else if cdsSpzPRR.AsInteger = 7 then begin
      cPSch := cdsSpZPSch.AsString;
      cVidNotes := '3.ѕфќбщ» 7';
      nSmSvPrg := cdsSpzSmm.AsFloat; end
    else begin
      cPSch := cdsSpzPSch.AsString;
      cVidNotes := '0.ѕфќбщ _';
      nSmSvPrg := cdsSpzSmm.AsFloat;
    end;
  end;
  if not cdsPrp.Locate('PSch;SchBU;VidN;VidNotes', VarArrayOf([cPSch, cSchBU,
                                             cVidN, cVidNotes]), []) then begin
    cdsPrp.Append;
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
//------------------------------------------------------------------------------
procedure TFormMo52.sBtnBack2Click(Sender: TObject);
begin
  LabelMsgTs2.Caption := '';
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.sBtnPrtClick(Sender: TObject);
var cPrtCaption : string;
begin
  cPrtCaption := '';
  if (nCaseReport = 1) or (nCaseReport = 11) then begin
    if bFlagDbg then
      cPrtCaption := 'F6PrtSintMo';   // по синтетическим счетам (сборным)
    F6PrtSintMo(cdsSPZ, cdsPrp, dDtProc, cPrtCaption); {z_CmnPrt} end
  else begin
    if bFlagDbg then
      cPrtCaption := 'F6PrtAnalitMo'; // по аналитическим счетам (—уб—четам)
    F6PrtAnalitMo(cdsSPZ, cdsPrp, dDtProc, cPrtCaption);  {z_CmnPrt}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.sBtnProverkiClick(Sender: TObject);
begin
  ShwSvdPrv(cdsSPZ, dDtProc);  {z_SvdPrv}
end;
//------------------------------------------------------------------------------
procedure TFormMo52.cdsSPZCalcFields(DataSet: TDataSet);
var cNmVidN, cDummy : string;
begin
  cdsSpzVid_SpZ.AsString := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
  cDummy := DmMain.VidN2ShVidN(cdsSpzVidN.AsString, cNmVidN);
  cdsSpzNmVidN.AsString := cNmVidN;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.sBtnSelClick(Sender: TObject);
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
                 'ѕомечено счетов: ' + IntToStr(nSelCount)
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
procedure TFormMo52.sBtnSelAllClick(Sender: TObject);
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
                 'ѕомечено счетов: ' + IntToStr(LbxSchBU.Items.Count);
end;
//------------------------------------------------------------------------------
procedure TFormMo52.sBtnUnSelAllClick(Sender: TObject);
begin
  LbxSchBU.Clear;
  bSintBold := true;
  bAnalitBold := true;
  TV.Refresh;
  sBtnSelAll.Enabled := LbxSchBU.Items.Count < TV.Items.Count;
  sBtnUnSelAll.Enabled := LbxSchBU.Items.Count > 0;
  if LbxSchBU.Items.Count > 0 then
    LabelCntSelSch.Caption :=
                 'ѕомечено счетов: ' + IntToStr(LbxSchBU.Items.Count)
  else
    LabelCntSelSch.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormMo52.TVKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnSel.Click;
end;
//------------------------------------------------------------------------------
procedure TFormMo52.pop2detailsClick(Sender: TObject);
var cVidN : string4; cPSch, cSchBU : string10; nKdKatP, nPRR : SmallInt;
begin
  cVidN  := cdsSpzVidN.AsString;
  cPSch  := cdsSpzPSch.AsString;
  cSchBU := cdsSpzSchBU.AsString;
  nPRR   := cdsSpZPRR.AsInteger;
//  nKdKatP := cdsSpZKdKatP.AsInteger;
//  ShowMoDetails(d_MesDate, cVidN, cPSch, cSchBU, nPRR);     {z_ShMoDt}
end;
//------------------------------------------------------------------------------
procedure TFormMo52.dbgrSpZDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var nVnu : SmallInt;
begin
  with dbgrSpZ.Canvas do begin
    if not (gdFocused in State) then begin
      nVnu := cdsSpZVnu.AsInteger;
      if (nVnu = 0) then     {соцстраховские}
        Font.Color := clGreen
      else if nVnu = 1 then  {начислени€}
        Font.Color := clWindowText
      else if nVnu = 2 then  {удержани€}
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

end.
