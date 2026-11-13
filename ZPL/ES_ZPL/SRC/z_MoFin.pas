unit z_MoFin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBTables, Grids,
  DBGrids, Menus, Provider, DBClient, DBCtrls;

type
  string4 = string[4];
  string15 = string[15];

  TTreeItem = class
    KdSch: SmallInt;
    SchBU, PSch: String15;
    ChildCnt: Integer;
  end;
  
  TFormMoFin = class(TForm)
    qryTmp: TQuery;
    cdsSPZ: TClientDataSet;
    dspTmp: TDataSetProvider;
    dsrcSPZ: TDataSource;
    QryTvNu: TQuery;
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
    LbxSelSchBU: TListBox;
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
    qryTmp2: TQuery;
    cdsSPZKDKATP: TSmallintField;
    cdsSPZSMM: TFloatField;
    cdsPrpGrp: TSmallintField;
    cdsSPZZaMesGod: TDateTimeField;
    cdsPdnFin: TClientDataSet;
    cdsPdnFinVNU: TSmallintField;
    cdsPdnFinKDOBJ: TSmallintField;
    cdsPdnFinPSCH: TStringField;
    cdsPdnFinZAMESGOD: TDateTimeField;
    cdsPdnFinKDSPZ: TSmallintField;
    cdsPdnFinKDKATP: TSmallintField;
    cdsPdnFinPRR: TSmallintField;
    cdsPdnFinSCHBU: TStringField;
    cdsPdnFinVIDN: TStringField;
    cdsPdnFinSHVIDN: TStringField;
    cdsPdnFinVID_KDSPZ: TSmallintField;
    cdsPdnFinVID_KEKV: TStringField;
    cdsPdnFinSP_PF: TStringField;
    cdsPdnFinSP_FSTVP: TStringField;
    cdsPdnFinSP_FSNV: TStringField;
    cdsPdnFinSP_FZ: TStringField;
    cdsPdnFinSMM: TFloatField;
    cdsPdnFinCNT: TIntegerField;
    cdsPdnFinKRSCH: TStringField;
    cdsSPZMY_NR: TIntegerField;
    sBtnExpand: TSpeedButton;
    sBtnCollapse: TSpeedButton;
    PageControl2: TPageControl;
    ts_21: TTabSheet;
    ts_22: TTabSheet;
    PanelTs2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LabelCntSchRec: TLabel;
    dbgrPrp: TDBGrid;
    PanelTts2: TPanel;
    Label6: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label1CntRec2: TLabel;
    cdsPrp2: TClientDataSet;
    dsrcPrp2: TDataSource;
    Label13: TLabel;
    dbgrPrp2: TDBGrid;
    cdsPrp2NR: TAutoIncField;
    cdsPrp2Grp: TSmallintField;
    cdsPrp2PSch: TStringField;
    cdsPrp2SchBU: TStringField;
    cdsPrp2HasChild: TBooleanField;
    cdsPrp2VidN: TStringField;
    cdsPrp2SmFor: TFloatField;
    cdsPrp2SmSvPrg: TFloatField;
    cdsPrp2SmTo: TFloatField;
    cdsPrp2SchDt: TStringField;
    cdsPrp2KEKV: TStringField;
    cdsPrp2SchKt: TStringField;
    cdsPrp2VidNotes: TStringField;
    cdsPrp2ShVidN: TStringField;
    cdsPrp2NmVidN: TStringField;
    cdsDbg2: TClientDataSet;
    cdsPrp2DtEndP: TDateField;
    cdsPrp2PrcEsvP: TFloatField;
    qryPrds: TQuery;
    cdsPrp2SmForP: TFloatField;
    cdsPrp2SmToP: TFloatField;
    cdsPrp2Prd: TStringField;
    qryTmp3: TQuery;
    cdsDbg: TClientDataSet;
    cdsDbgNR: TAutoIncField;
    cdsDbgPSch: TStringField;
    cdsDbgSchBU: TStringField;
    cdsDbgForVid: TStringField;
    cdsDbgVidNotes: TStringField;
    cdsDbgZaMesGod: TDateField;
    cdsDbgSmFor: TFloatField;
    cdsDbgSmSvPrg: TFloatField;
    cdsDbgPrcVzn: TFloatField;
    cdsDbgSmVznF: TFloatField;
    dsrcDbg: TDataSource;
    dbgrDbg: TDBGrid;
    cdsDbgSmVznR: TFloatField;
    cdsDbg2NR: TAutoIncField;
    cdsDbg2ForVid: TStringField;
    cdsDbg2VidNotes: TStringField;
    cdsDbg2DtEndP: TDateField;
    cdsDbg2SmFor: TFloatField;
    cdsDbg2SmSvPrg: TFloatField;
    cdsDbg2PrcVzn: TFloatField;
    cdsDbg2SmVznR: TFloatField;
    cdsDbg2SmVznF: TFloatField;
    cdsDbg2SmRazn: TFloatField;
    ts_23: TTabSheet;
    dsrcDbg2: TDataSource;
    dbgrDbg2: TDBGrid;
    cdsDbg2PSch: TStringField;
    cdsDbg2SchBU: TStringField;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    LabelCntRecSpZ: TLabel;
    LabelCntRecDbg2: TLabel;
    DBNavigator1: TDBNavigator;
    LabelCntRecDbg2_1: TLabel;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBNavigator4: TDBNavigator;
    NAccMapping: TMenuItem;
    btnPrintTable: TSpeedButton;
    qryNU: TQuery;
    qryVidN: TQuery;
    cdsEmployeeDeductions: TClientDataSet;
    cdsDeductionTotals: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
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
    procedure sBtnExpandClick(Sender: TObject);
    procedure sBtnCollapseClick(Sender: TObject);
    procedure dbgrDbg2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure NAccMappingClick(Sender: TObject);
    procedure btnPrintTableClick(Sender: TObject);
    procedure pop2Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DtProc,
    D20111201,            // появился вид 8686 - ЕсвПрпБлнИнв
    D20130701,            // Изменился подход к декретным в ЕСВ
    D20131001: TDateTime; // Появился вид 6212 - ЕСВ с декретных

    Final, SintBold, AnalitBold, TvReady: Boolean;

    ReportCase: Integer;

    NmCurViNu: ShortString;

    ForceSynthFlag: Boolean;

    procedure LoadTree;
    procedure CreOpenCdsSpZ(cSql1, cSql2 : string; d_DtPrc : TDateTime;
                                                       bMoBySint : boolean);
    procedure DaleeDo2016;
    procedure CreOpenCdsPrp(bMoBySint : boolean);
    procedure AddToCdsESV(bMoBySint : boolean);
    procedure AddToCdsPrpESV(bMoBySint : boolean);

    function GetNmPSch(cPSCH : ShortString) : ShortString;
    function GetSmSaldo(dDtPrc : TDateTime; cPSch : ShortString) : double;

    procedure MapAccounts;
    procedure OpenQryVidN(cPSch, cSchBU: string; dDtPrc: TDateTime);
    procedure OpenQryNU(cPSch, cSchBU: string; dDtPrc: TDateTime);

    procedure OfferForceSynth(Offer: Boolean);
    procedure ForceSynthProc(Sender: TObject);

    procedure DeleteParent(ShSch: ShortString);

    function AnalytAsSynth: Boolean;
  public
    class procedure Run(DtProc: TDateTime; Final: Boolean);
  end;

const SECTION = 'z_MoFin';

var
  FormMoFin: TFormMoFin;

implementation

uses
  a_Const, a_DM, a_Lib, z_CmnPrt, z_Dm, z_FrmAccMap, z_Main, z_ShMoDt,
  z_SvdPrv, DateLib, QryLib, MemOrdSynth;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFormMoFin.Run(
  DtProc: TDateTime;
  Final: Boolean
);
begin
  FormMoFin := TFormMoFin.Create(Application);
  FormMoFin.Final := Final;
  FormMoFin.DtProc := DtProc;

  with FormMoFin do begin
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.FormCreate(Sender: TObject);
var i : SmallInt; cHint : ShortString;
begin
  D20111201 := EncodeDate(2011,12, 1);
  D20130701 := EncodeDate(2013, 7, 1);
  D20131001 := EncodeDate(2013,10, 1);

  TvReady  := false;
  SintBold := true;
  AnalitBold := true;

  ts1.TabVisible := false; // bFlagDbg;
  ts2.TabVisible := false;
  ts_21.TabVisible := false;
  ts_22.TabVisible := false;
  ts_23.TabVisible := false;

  PageControl1.ActivePage := ts1;
  PageControl2.ActivePage := ts_21;

  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 750);
    rBtnTtsAllAndCmn.Checked := false; // ReadBool(SECTION, 'bTtsAll', false);
    rbtnTtsOnlyCmn.Checked := true;    // not rBtnTtsAllAndCmn.Checked;
    //PanelTs2.Height := ReadInteger(SECTION, 'nPnlTs2H', 200);
    //PageControl2.Height := ReadInteger(SECTION, 'PgCtrl2H', 350);
    dbgrSpZ.Height := ReadInteger(SECTION, 'grSpzH', 250);
    Free;
  end;
  if FileExists(cDirVids + 'mo52_24.vid') then
    dbgrSpZ.Columns.LoadFromFile(cDirVids + 'mo52_24.vid');
  if FileExists(cDirVids + 'moPrp_1.vid') then
    dbgrPrp.Columns.LoadFromFile(cDirVids + 'moPrp_1.vid');
  if FileExists(cDirVids + 'moPrp2_1.vid') then
    dbgrPrp2.Columns.LoadFromFile(cDirVids + 'moPrp2_1.vid');
  if FileExists(cDirVids + 'moDbg2_1.vid') then
    dbgrDbg2.Columns.LoadFromFile(cDirVids + 'moDbg2_1.vid');
  LabelCntSelSch.Caption := '';
  LabelMsgTs2.Caption := '';
  LabelCntSchRec.Caption := '';

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TControl then
      with TControl(Components[i]) do begin
        cHint := Hint;                    // Сие я нагородил, чтобы длинные
        while Pos('@', cHint) <> 0 do     // Hint'ы выводились в две строки,
          cHint[Pos('@', cHint)] := #13;  // для чего в месте переноса нужно
        Hint := cHint;                    // заранее вставить значок @, а он
      end;                                // потом преобразуется в #13 - "возвр."

  NmCurViNu := 'ViNuMain';
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.FormShow(Sender: TObject);
begin
  with DateUtils.Decode(DtProc) do begin
    Caption := 'Формирование задания для журнала-ордера за ' +
      MesRus(Mnth) + ' ' + IntToStr(Year) + ' г.';

    LoadTree;

    Label1.Caption := 'Слева счета (источники финансирования), ' +
      'встретившиеся в таблице начислений-удержаний за ' +
      MesRus(Mnth) + ' ' + IntToStr(Year) + ' г.';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSpZ.Columns.SaveToFile(cDirVids + 'mo52_24.vid');
  if cdsPrp.Active then
    dbgrPrp.Columns.SaveToFile(cDirVids + 'moPrp_1.vid');
  if cdsPrp2.Active then
    dbgrPrp2.Columns.SaveToFile(cDirVids + 'moPrp2_1.vid');
  if cdsDbg2.Active then
    dbgrDbg2.Columns.SaveToFile(cDirVids + 'moDbg2_1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bTtsAll', rBtnTtsAllAndCmn.Checked);
    //WriteInteger(SECTION, 'nPnlTs2H', PanelTs2.Height);
    //WriteInteger(SECTION, 'PgCtrl2H', PageControl2.Height);
    WriteInteger(SECTION, 'grSpzH', dbgrSpZ.Height);

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.LoadTree;
var
  F1: TextFile;
  FileNm: String;
  PSch, NmPSch, Sch, Msg: ShortString;
  I: Integer;
  ParentItem, ChildItem: TTreeItem;
begin
  FileNm := cDirTemp + 'SpZ.tv1';
  AssignFile(F1, FileNm);
  Rewrite(F1);

  QryUtils.InitQuery(QryTvNU);

  with QryTvNu do begin
    // вроде хорошо округляет  Sum(Cast(Summa as numeric (18,2)))
    SQL.Text :=
      'select PSch, SchBU, KdSpZ, NmSch, ' +
        'Sum(Cast(Summa as Numeric(16, 2))) Summa ' +
      'from ' + NmCurViNu +  ' ' +
      'where DtProc = :DtProc ' +
        'and Summa <> 0 ' +
      'group by PSch, SchBU, KdSpZ, NmSch ' +
      'having not PSch is null and PSch > ""';

    ParamByName('DtProc').AsDateTime := DtProc;
    Open;

    while not Eof do begin
      PSch := FieldByName('PSch').AsString;
      NmPSch := GetNmPSch(PSch);

      WriteLn(F1, PSch + ' ' + NmPSch);

      while (FieldByName('PSch').AsString = PSch) and not Eof do begin
        Sch := FieldByName('SchBU').AsString;

        // SB 7.5.2026
        // Поднимаем на уровень выше за счёт отсутсвия префикснго ' '
        if (Sch = '8011/02-2') or (Sch = '8011/02-4') then
          Msg := Sch + ' ' + FieldByName('NmSch').AsString
        else
          Msg := ' ' + Sch + ' ' + FieldByName('NmSch').AsString;

        WriteLn(F1, Msg);
        Next;
      end;
    end;

    CloseFile(F1);

    // Загрузить дерево из только что созданного
    TV.Items.BeginUpdate;
    TV.Items.Clear;
    TV.LoadFromFile(FileNm);
    TV.Items.EndUpdate;

    // Заполнить связанные Objects
    First;
    I := 0;

    while not Eof do begin
      // Записываем корневой счет
      ParentItem := TTreeItem.Create;
      with ParentItem do begin
        KdSch := FieldByName('KdSPZ').AsInteger;
        SchBU := Trim(FieldByName('PSch').AsString);
        PSch := SchBU;

        ChildCnt := 0;
      end;

      TV.Items[I].Data := ParentItem;

      while (FieldByName('PSch').AsString = ParentItem.SchBU)
        and not Eof do
      begin
        // Дочерний счет
        ChildItem := TTreeItem.Create;

        with ChildItem do begin
          KdSch := FieldByName('KdSpZ').AsInteger;
          SchBU := Trim(FieldByName('SchBU').AsString);
          PSch := ParentItem.SchBU;

          ChildCnt := 0;
        end;

        // SB 7.5.2026
        with ChildItem do begin
          Inc(ParentItem.ChildCnt);

          if (SchBU = '8011/02-2') or (SchBU = '8011/02-4') then
            Dec(ParentItem.ChildCnt);
        end;

        Inc(I);
        TV.Items[I].Data := ChildItem;

        Next;
      end;

      // SB 7.5.2026
      // Удаляем родителя вырожденного за счёт "поднятия" детей
      if ParentItem.ChildCnt = 0 then
        DeleteParent(ParentItem.SchBU)
      else
        Inc(I);
    end;

    if FileExists(FileNm) and not bFlagDbg then
      DeleteFile(FileNm);

    TV.FullExpand;
    TV.Items[0].Selected := true;
    TvReady := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.DeleteParent(ShSch: ShortString);
var
  I: Integer;
begin
  with TV do
    for I := 0 to Items.Count - 1 do
      if TTreeItem(Items[I].Data).SchBU = ShSch then begin
        Items[I].Delete;
        break;
      end;
end;

//------------------------------------------------------------------------------
function TFormMoFin.GetNmPSch(cPSCH : ShortString) : ShortString;
begin
  Result := '';
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if DtProc < d_0117 then
      SQL.Add('Select First 1 NmSch from Kd_Sbu where SchBU = :cPSCH')
    else
      SQL.Add('Select First 1 NmSch from Kd_Sbu where Sch_17 = :cPSCH');
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
procedure TFormMoFin.TVCustomDrawItem(
  Sender: TCustomTreeView;
  Node: TTreeNode;
  State: TCustomDrawState;
  var DefaultDraw: Boolean
);
var
  i, nAIndx: Integer;
begin
  if TvReady then with TV.Canvas do begin
    nAIndx := Node.AbsoluteIndex;

    if Node.HasChildren then begin
      if SintBold then
        Font.Style := [fsBold]
      else
        Font.Style := []; end
    else begin
      if AnalitBold then
        Font.Style := [fsBold]
      else
        Font.Style := [];
    end;
    i := LbxSelSchBU.Items.IndexOf(IntToStr(nAIndx));
    if (cdsSelected in State) then
      Brush.Color := clAqua;
    if i >= 0 then
      Font.Color := clRed
    else
      Font.Color := clWindowText;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.FormResize(Sender: TObject);
begin
  PanelRight2.Top := Round((Height - PanelRight2.Height)/2) - 20;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.sBtnGoClick(Sender: TObject);
begin
  DaleeDo2016;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.DaleeDo2016;
var
  i, nAdd, nTvCount: Integer;
  cPSch, cSchBU, cSql1, cSql2: String;
  bMoBySint: Boolean;
begin
  LabelCntRecSpZ.Caption := '';
  LabelCntRecDbg2.Caption := '';
  LabelCntRecDbg2_1.Caption := '';
  bMoBySint := true;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Set generator My_Gen_ID to 0');
    ExecSQL;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;

  nTvCount := TV.Items.Count;
  if SintBold and AnalitBold then begin // Нет помеченных
    if (TV.Selected <> nil) then begin
      i := TV.Selected.AbsoluteIndex;
      with TTreeItem(TV.Items[i].Data) do begin
        cPSch  := PSch;
        cSchBU := SchBU;
      end;

      if TV.Items[i].HasChildren then begin {выбран (но не помечен) синт. (групповой) счет}
        cSql1 := 'Select Gen_Id(My_Gen_ID, 1) My_NR, ' +
                 ' Cast(1 as SmallInt) as VNU, ' +
                 ' Cast(32765 as SmallInt) as KdObj, PSch, ZaMesGod, ' +
                 ' KdSpZ, KdKatP, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
                 ' Vid_SPZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
                 ' Round(Sum(Summa), 2) as SMM, ' +
                 ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch '; // +
        cSql1 := cSql1 +' from ' + NmCurViNu;
        cSql2 := 'where DtProc = :dDtPrc and ' +
                 ' PSch = "' + cPSch + '" and (not KdObj in (1056)) ' +
                 ' group by PSch, ZaMesGod, KdSpZ, SchBU, KdKatP, PRR, VidN, ' +
                 ' ShVidn, Vid_KdSpZ, Vid_SPZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, ' +
                 ' SP_FZ having Round(Sum(Summa), 2) <> 0';
        bMoBySint := true;
        ReportCase := 1; end
      else begin {выбран (но не помечен) аналитический счёт  (СубСчёт) }
        cSql1 := 'Select Gen_Id(My_Gen_ID, 1) My_NR, ' +
                 ' Cast(1 as SmallInt) as VNU, ' +
                 ' Cast(32765 as SmallInt) as KdObj, PSch, ZaMesGod, ' +
                 ' KdSpZ, KdKatP, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
                 ' Vid_SPZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
                 ' Round(Sum(Summa), 2) as SMM, ' +
                 ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch '; // +
        cSql1 := cSql1 + ' from ' + NmCurViNu;
        cSql2 := 'where DtProc = :dDtPrc and ' +
                ' SChBU = "' + cSchBU + '" and (not KdObj in (1056)) ' +
                ' group by PSch, ZaMesGod, KdSpZ, SchBU, KdKatP, PRR, VidN, ' +
                ' ShVidn, Vid_KdSpZ, Vid_SPZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ ' +
                ' having Round(Sum(Summa), 2) <> 0';
        bMoBySint := false;
        ReportCase := 2;
      end;
    end;
  end
  else if SintBold then begin // Помечен один или несколько синтет. (групповых)
    cSql1 := 'Select Gen_Id(My_Gen_ID, 1) My_NR, Cast(1 as SmallInt) as VNU, ' +
             ' Cast(32765 as SmallInt) as KdObj, PSch, ZaMesGod, ' +
             ' KdSpZ, KdKatP, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
             ' Vid_SPZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
             ' Round(Sum(Summa), 2) as SMM, ' +
             ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch '; // +
    cSql1 := cSql1 + ' from ' + NmCurViNu;
    cSql2 := 'where DtProc = :dDtPrc and ' +
            ' PSCH in (';
    nAdd := 0;
    for i := 0 to nTvCount-1 do begin
      if LbxSelSchBU.Items.IndexOf(IntToStr(i)) >= 0 then begin
        Inc(nAdd);
        cPSch  := TTreeItem(TV.Items[i].Data).PSch;
        cSql2 := cSql2 + '"' + cPSch + '"';
        if nAdd < LbxSelSchBU.Count then
          cSql2 := cSql2 + ',';
      end;
    end;
    cSql2 := cSql2 + ') and (not KdObj in (1056)) ' +
                   ' group by PSch, ZaMesGod, KdSpZ, SchBU, KdKatP, PRR, ' +
                   ' VidN, ShVidn, Vid_KdSpZ, Vid_SPZ, Vid_KEKV, SP_PF, ' +
                   ' SP_FSTVP,  SP_FSNV, SP_FZ ' +
                   ' having Round(Sum(Summa), 2) <> 0 ';
    bMoBySint := true;
    ReportCase := 11;
  end
  else if AnalitBold  then begin  // Помечен один или неск. аналит. {СубСчетов}
    cSql1 := 'Select Gen_Id(My_Gen_ID, 1) My_NR, Cast(1 as SmallInt) as VNU, ' +
             ' Cast(32765 as SmallInt) as KdObj, PSch, ZaMesGod, ' +
             ' KdSpZ, KdKatP, PRR, SchBU, VidN, ShVidn, Vid_KdSpZ, ' +
             ' Vid_SPZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ, ' +
             ' Round(Sum(Summa), 2) as SMM, ' +
             ' Count(NR) as CNT, Cast(null as Char(10)) as KrSch '; //  +
    cSql1 := cSql1 + ' from ' + NmCurViNu;
    cSql2 := 'where DtProc = :dDtPrc and ' +
            ' SChBU in (';
    nAdd := 0;
    for i := 0 to nTvCount-1 do begin
      if LbxSelSchBU.Items.IndexOf(IntToStr(i)) >= 0 then begin
        Inc(nAdd);
        cSchBU  := TTreeItem(TV.Items[i].Data).SchBU;
        cSql2 := cSql2 + '"' + cSchBU + '"';
        if nAdd < LbxSelSchBU.Count then
          cSql2 := cSql2 + ',';
      end;
    end;
    cSql2 := cSql2 + ') and (not KdObj in (1056)) ' +
                     ' group by PSch, ZaMesGod, KdSpZ, SchBU, KdKatP, PRR, ' +
                     ' VidN, ShVidn, Vid_KdSpZ, Vid_SPZ, Vid_KEKV, SP_PF, ' +
                     ' SP_FSTVP, SP_FSNV, SP_FZ ' +
                   ' having Round(Sum(Summa), 2) <> 0';
    bMoBySint := false;
    ReportCase := 22;
  end
  else;  // такого не может случиться
  CreOpenCdsSpZ(cSql1, cSql2, DtProc, bMoBySint);
  CreOpenCdsPrp(bMoBySint);
  PageControl1.ActivePage := ts2;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.CreOpenCdsSpZ(cSql1, cSql2 : string; d_DtPrc : TDateTime;
                                                           bMoBySint : boolean);
var cPSch, cKrSch, cVidN : ShortString;
    nVNU : integer;  nSmSaldo : double;
    bIsInfBy6001 : boolean;
    cVnu_PN, cKekv_PN, cPSch_PN, cZaMG_PN, cKdSpZ_PN, cSchBU_PN, cVidN_PN,
               cShVidN_PN, cVid_KdSpZ_PN, cVid_Kekv_PN, cKrSch_PN : ShortString;
begin
  with cdsPdnFin do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  cPSch := 'xxx';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add(cSql1);
    SQL.Add(cSql2);
    ParamByName('dDtPrc').AsDateTime := d_DtPrc;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'NewSql.sql');
    //Open;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsSpZ do begin
    if Active then Close;
    Filtered := false;
    Filter := '';
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    if (ReportCase = 1) or (ReportCase = 11) then  {по СинтСчетам}
      AddIndex('CdsIndx', 'PSch;VNU;VidN;SchBU', [])
    else                                            // по АналитСчетам
      AddIndex('CdsIndx', 'PSch;SchBU;VNU;VidN', []);
    LabelCntSchRec.Caption := 'Записей в cdsSch: ' + IntToStr(RecordCount);
    First;
    // Расставить VNU (разделы) - сортировка для Ж/Ордера
    while not Eof do begin
      cPSch := FieldByName('PSch').AsString;
      bIsInfBy6001 := false;
      while (FieldByName('PSch').AsString = cPSch) and not Eof do begin
        cVidN := FieldByName('VidN').AsString;
        nVNU := 1;
        if (cVidN = '6001') and not bIsInfBy6001 then begin
                    // подоходный налог
          cVNU_PN       := '2'; //FieldByName('VNU').AsString;
          cKekv_PN      := FieldByName('Vid_Kekv').AsString;
          cPSch_PN      := FieldByName('PSCH').AsString;
          cZaMG_PN      := DateToStr(d_DtPrc); //FieldByName('ZaMesGod').AsString;
          cKdSpZ_PN     := FieldByName('KdSpZ').AsString;
          cSchBU_PN     := FieldByName('SchBU').AsString;
          cVidN_PN      := FieldByName('VidN').AsString;
          cShVidN_PN    := FieldByName('ShVidN').AsString;
          cVid_KdSpZ_PN := FieldByName('Vid_KdSpZ').AsString;
          cVid_Kekv_PN  := FieldByName('Vid_Kekv').AsString;
          cKrSch_PN     := '641/01';  // FieldByName('KrSch').AsString;
          bIsInfBy6001 := true;
        end;

        // больничные в т.ч.декр, кроме 1-х 5-ти дней
        // SB 23.3.2026 По аналогии, наверное, и 2606
        if (cVidN <> '2603') and (cVidN <> '2606') and
                ((cVidN >= '2600') and (cVidN < '2700')) or
              (cVidN = '1901') or (cVidN = '1909') then begin
              // 1901 - пособие ЧОО, 1909 - пособие при рожд ребенка
          nVNU := -1;  ////////// 0;
          cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger); end

        else if (cVidN = '1210') {СреднЗП по мобилизации. Выставить
                                              впереди всех видов} then begin
          if (ReportCase = 1) or (ReportCase = 11) then
            cKrSch := cdsSpzPSch.AsString
          else
            cKrSch := cdsSpzSchBU.AsString;
          nVNU := 0;
          cPSch := FieldByName('PSch').AsString; end

        else if (cVidN = '2705') {приход в кассу}  or
                       (cVidN = '2707') {возврат ч/з банк} then begin
          cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
          nVNU := 1;  end
        else if (cVidN > '2700') and
                          (cVidN < '2750') {прочие начисления} then begin
          if (ReportCase = 1) or (ReportCase = 11) then
            cKrSch := cdsSpzPSch.AsString
          else
            cKrSch := cdsSpzSchBU.AsString;
          // cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
          nVNU := 1;  end
        else if (cVidN < '6000') then begin
          if (ReportCase = 1) or (ReportCase = 11) then
            cKrSch := cdsSpzPSch.AsString
          else
            cKrSch := cdsSpzSchBU.AsString;
          nVNU := 1;
          cPSch := FieldByName('PSch').AsString; end
        else if ((cVidN >= '6000') and (cVidN < '7000')) then begin // удержания
          cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
          nVNU := 2; end
        else if ((cVidN >= '7000') and (cVidN < '7500')) then begin // прочие
          cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger); //(удалил все)
          nVNU := 3; end                            // теперь таких видов не стало
        else if ((cVidN >= '7500') and (cVidN < '7600')) then begin  // выплаты
          cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
          nVNU := 4; end
        else if ((cVidN >= '8611') and (cVidN <= '8643') or
                 (cVidN >= '8681') and (cVidN <= '8691') or
                 (cVidN >= '8711') and (cVidN <= '8717')) then begin // взн.предпр.
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
      if Final and bMoBySint then begin
        nSmSaldo := GetSmSaldo(d_DtPrc, cPSch);
        cdsPdnFin.Append;
        cdsPdnFinVNU.AsString        := cVNU_PN;
        cdsPdnFinVid_Kekv.AsString   := cKekv_PN;
        cdsPdnFinPSch.AsString       := cPSch_PN;
        cdsPdnFinZaMesGod.AsString   := cZaMG_PN;
        cdsPdnFinKdSpZ.AsString      := cKdSpZ_PN;
        cdsPdnFinSchBU.AsString      := cSchBU_PN;
        cdsPdnFinViDN.AsString       := cVidN_PN;
        cdsPdnFinShViDN.AsString     := cShVidN_PN;
        cdsPdnFinVid_KdSpZ.AsString  := cVid_KdSpZ_PN;
        cdsPdnFinVid_Kekv.AsString   := cVid_Kekv_PN;
        cdsPdnFinKrSch.AsString      := cKrSch_PN;
        cdsPdnFinSMM.AsFloat         := -nSmSaldo;
        cdsPdnFin.Post;
      end;
    end;
    IndexName := 'CdsIndx';

    if Final and bMoBySint then begin
      cdsPdnFin.First;
      while not cdsPdnFin.Eof do begin
        Append;
        cdsSpZMy_NR.AsInteger    := -111;
        cdsSpZVnu.AsString       := cdsPdnFinVnu.AsString;
        cdsSpZKdObj.AsString     := cdsPdnFinKdObj.AsString;
        cdsSpZKdObj.AsString     := cdsPdnFinKdObj.AsString;
        cdsSpZPSch.AsString      := cdsPdnFinPSch.AsString;
        cdsSpZZaMesGod.AsString  := cdsPdnFinZaMesGod.AsString;
        cdsSpZKdSpZ.AsString     := cdsPdnFinKdSpZ.AsString;
        cdsSpZPRR.AsString       := cdsPdnFinPRR.AsString;
        cdsSpZSchBU.AsString     := cdsPdnFinSchBU.AsString;
        cdsSpZVidN.AsString      := cdsPdnFinVidN.AsString;
        cdsSpZShVidN.AsString    := cdsPdnFinShVidN.AsString;
        cdsSpZVid_KdSpZ.AsString := cdsPdnFinVid_KdSpZ.AsString;
        cdsSpZVid_Kekv.AsString  := cdsPdnFinVid_Kekv.AsString;
        cdsSpZSp_PF.AsString     := cdsPdnFinSp_PF.AsString;
        cdsSpZSp_FsTVP.AsString  := cdsPdnFinSp_FsTVP.AsString;
        cdsSpZSp_FsNV.AsString   := cdsPdnFinSp_FsNV.AsString;
        cdsSpZSp_FZ.AsString     := cdsPdnFinSp_FZ.AsString;
        cdsSpZSmm.AsString       := cdsPdnFinSmm.AsString;
        cdsSpZCnt.AsString       := cdsPdnFinCnt.AsString;
        cdsSpZKrSch.AsString     := cdsPdnFinKrSch.AsString;
        Post;
        cdsPdnFin.Next;
      end;
    end;
    if bFlagDbg then
      cdsPdnFin.SaveToFile(cDirTemp + 'PdnFin.cds');
    First;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'cdsMoSpZ.cds');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.AddToCdsESV(bMoBySint: boolean);
var cSpzVidN, cVidN, cVidNotes, cPSch, cSchBU : ShortString;
    nVNU, nGrp, nKdKatP : SmallInt;      // для удержаний с сотрудников
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
    else if ((DtProc < D20130701) and (cSpzVidN > '2600') and
                         (cSpzVidN < '2700') and (cSpzVidN <> '2602'))
                                           {больничные, кроме декретных} or
            ((DtProc >= D20130701) and (cSpzVidN > '2600') and
                  (cSpzVidN < '2700')) {больничные, в т.ч декретные} then begin
      if (DtProc >= D20131001) and (cSpzVidN = '2602') then begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '6212'; {для Esv с декретных}
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
      cVidNotes := ' 1.Для Есвбщ';
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
    cdsPrpSmFor.AsFloat   := cdsPrpSmFor.AsFloat + nSmFor;
    cdsPrpSmSvPrg.AsFloat := cdsPrpSmSvPrg.AsFloat + nSmSvPrg;
    cdsPrpSmTo.AsFloat    := cdsPrpSmTo.AsFloat + nSmTo;
    cdsPrp.Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.CreOpenCdsPrp(bMoBySint : boolean);
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
      AddToCdsPrpESV(bMoBySint);   // до 2016 года
      Next;
    end;
    First;
  end;
  cdsPrp.IndexName := 'OnPSchSchBUVidNVidNotes';
  LabelCntRecDbg2_1.Caption := 'Записей ' + IntToStr(cdsPrp.RecordCount);;

  if bFlagDbg then
    cdsPrp.SaveToFile(cDirTemp + 'cdsMoPrp.cds');
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.AddToCdsPrpESV(bMoBySint: boolean);
var cSpzVidN, cVidN, cVidNotes, cPSch, cSchBU : ShortString;
    nVNU, nGrp, nKdKatP, nPRR : SmallInt;
    nSmFor, nSmSvPrg, nSmTo : double;// для взносов предприятия до 2016 г.
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
      cVidNotes := '12.В ЕсвПрп ГПД'; end
    else if ((DtProc < D20130701) and (cSpzVidN > '2600') and
             (cSpzVidN < '2700') and (cSpzVidN <> '2602')) {больничные,
                                                 кроме декретных} or
            ((DtProc >= D20130701) and (cSpzVidN > '2600') and
                      (cSpzVidN < '2700')) {больничные с декретными} then begin
      if DtProc < (D20111201-35) then begin // до появл. вида 8686 - ЕсвПрпБлнИнв
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;  {-35 чтобы начать с ноября 2011}
        cVidN := '8685'; {для EsvПрп с Блн}
        nGrp := 7;
        cVidNotes := '10.В ЕсвПрп БлнДкр'; end
      else begin {появился вид 8686 - ЕсвПрпБлнИнв}
        if ((nPRR = 3) or (nPRR = 4)) and (dStzZaMG >= (D20111201-35)) then begin
          nSmFor := nSmFor + cdsSpzSmm.AsFloat; {-35 чтобы начать с ноября 2011}
          cVidN := '8686'; {для EsvПрп с Блн}
          nGrp := 7;
          cVidNotes := '11.В ЕсвПрп БлнДкрИнв'; end
        else begin
          nSmFor := nSmFor + cdsSpzSmm.AsFloat;
          cVidN := '8685'; {для EsvПрп с Блн}
          nGrp := 7;
          cVidNotes := '10.В ЕсвПрп БлнДкр';
        end;
      end; end
    else if (nKdKatP = 1) {ППС'овские} then begin
      if nPRR = 7 then begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '8684'; {для EsvПрп с ПпсИнв}
        nGrp := 6;
        cVidNotes := ' 9.В ЕсвПрп ППС инв.'; end
      else begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '8682'; {для Esv с ПрпПпс}
        nGrp := 5;
        cVidNotes := ' 7.В ЕсвПрп ППС';
      end; end
    else {общие} begin
      if nPRR = 7 then begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '8683'; {для Esv с ПрпОбщИнв}
        nGrp := 6;
        cVidNotes := ' 8.В ЕсвПрп Общ.инв'; end
      else begin
        nSmFor := nSmFor + cdsSpzSmm.AsFloat;
        cVidN := '8681'; {для Esv с ПрпОбщ}
        nGrp := 5;
        cVidNotes := ' 6.В ЕсвПрп Общ';
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
procedure TFormMoFin.sBtnBack2Click(Sender: TObject);
begin
  LabelMsgTs2.Caption := '';
  PageControl1.ActivePage := ts1;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.sBtnPrtClick(Sender: TObject);
var
  PrtCaption: ShortString;
begin
  PrtCaption := '';

  if (ReportCase = 1) or (ReportCase = 11) then begin
    if bFlagDbg then
      PrtCaption := 'F6SintMo2011';   // по синтетическим счетам (сводным)
    F6SintMo2011(true, CdsSPZ, CdsPrp, dDtProc, PrtCaption);
  end else begin
    if bFlagDbg then
      PrtCaption := 'F6AnalitMo2011'; // по аналитическим счетам (СубСчетам)
    if ForceSynthFlag or AnalytAsSynth then
      TMemOrdSynth.Run(true, cdsSPZ, cdsPrp, dDtProc, PrtCaption)
//      F6SintMo2011(true, CdsSPZ, CdsPrp, dDtProc, PrtCaption)
    else
      F6AnalitMo2011(cdsSPZ, cdsPrp, dDtProc, PrtCaption);  {z_CmnPrt}
  end;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.btnPrintTableClick(Sender: TObject);
var
  i: integer;
  cPSch, cSchBU: string;
begin
  i := TV.Selected.AbsoluteIndex;
  with TTreeItem(TV.Items[i].Data) do begin
    cPSch  := PSch;
    cSchBU := SchBU;
  end;

  OpenQryVidN(cPSch, cSchBU, dDtProc);
  OpenQryNU(cPSch, cSchBU, dDtProc);

  cdsEmployeeDeductions.CreateDataSet;
  cdsDeductionTotals.CreateDataSet;

  F6PrintMoTable(qryVidN, qryNU, cSchBU, dDtProc, cdsEmployeeDeductions, cdsDeductionTotals);  {z_CmnPrt}

  cdsEmployeeDeductions.Close;
  cdsDeductionTotals.Close;

  ReleaseQuery(qryVidN);
  ReleaseQuery(qryNU);
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.OpenQryVidN(cPSch, cSchBU: string; dDtPrc: TDateTime);
var
  i: integer;
begin
  InitQuery(qryVidN);
  with qryVidN do begin
    if (TV.Selected <> nil) then begin
      i := TV.Selected.AbsoluteIndex;
      if TV.Items[i].HasChildren then begin // выбран синт. (групповой) счет
        SQL.Add(
          'select distinct VidN, ShVidn ' +
          'from ' + NmCurViNu + ' ' +
          'where DtProc = :DtPrc and ' +
            'PSch = :PSch and not KdObj in (1056) ' +
          'order by VidN');
        ParamByName('PSch').AsString := cPSch;
      end else begin // выбран аналитический счёт (СубСчёт)
        SQL.Add(
          'select distinct VidN, ShVidn ' +
          'from ' + NmCurViNu + ' ' +
          'where DtProc = :DtPrc and ' +
            'SChBU = :SchBU and not KdObj in (1056) ' +
          'order by VidN');
        ParamByName('SchBU').AsString := cSchBU;
      end;
      ParamByName('DtPrc').AsDateTime := dDtPrc;
      Open;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.OpenQryNU(cPSch, cSchBU: string; dDtPrc: TDateTime);
var
  i: integer;
begin
  InitQuery(qryNU);
  with qryNU do begin
    if (TV.Selected <> nil) then begin
      i := TV.Selected.AbsoluteIndex;
      if TV.Items[i].HasChildren then begin // выбран синт. (групповой) счет
        SQL.Add(
          'select n.TabN, n.VidN, n.ShVidn, n.PSch, n.KdSpZ, n.SchBU, n.Summa, n.KdBnk, ' +
            'u.Fam, u.Ima, u.Otch, b.ShBnk ' +
          'from ' + NmCurViNu + ' n ' +
            'left join z_upi u on u.TabN = n.TabN ' +
            'left join z_banki b on b.KdBnk = n.KdBnk ' +
          'where n.DtProc = :DtPrc and ' +
            'n.PSch = :PSch and not n.KdObj in (1056) ' +
          'order by u.Fam, u.Ima, u.Otch, n.VidN');
        ParamByName('PSch').AsString := cPSch;
      end else begin // выбран аналитический счёт (СубСчёт)
        SQL.Add(
          'select n.TabN, n.VidN, n.ShVidn, n.PSch, n.KdSpZ, n.SchBU, n.Summa, n.KdBnk, ' +
            'u.Fam, u.Ima, u.Otch, b.ShBnk ' +
          'from ' + NmCurViNu + ' n ' +
            'left join z_upi u on u.TabN = n.TabN ' +
            'left join z_banki b on b.KdBnk = n.KdBnk ' +
          'where n.DtProc = :DtPrc and ' +
            'n.SChBU = :SchBU and not n.KdObj in (1056) ' +
          'order by u.Fam, u.Ima, u.Otch, n.VidN');
        ParamByName('SchBU').AsString := cSchBU;
      end;
      ParamByName('DtPrc').AsDateTime := dDtPrc;
      Open;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.sBtnProverkiClick(Sender: TObject);
begin
  ShwSvdPrv(cdsSPZ, dDtProc);  {z_SvdPrv}
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.cdsSPZCalcFields(DataSet: TDataSet);
var cNmVidN, cDummy : string;
begin
//  cdsSpzVid_SpZ.AsString := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
  cDummy := DmMain.VidN2ShVidN(cdsSpzVidN.AsString, cNmVidN);
  cdsSpzNmVidN.AsString := cNmVidN;
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.sBtnSelClick(Sender: TObject);
var
  i, iSel, nTvCount, nSelCount: Integer;
  HasChild : boolean;
begin
  nTvCount := TV.Items.Count;
  if (TV.Selected <> nil) then begin
    iSel := TV.Selected.AbsoluteIndex;

    HasChild := TV.Selected.HasChildren;

    i := LbxSelSchBU.Items.IndexOf(IntToStr(iSel));
    if (i < 0)
      and ((HasChild and SintBold) or (not HasChild and AnalitBold))
    then
      LbxSelSchBU.Items.Add(IntToStr(iSel))
    else if (i >= 0) then
      LbxSelSchBU.Items.Delete(i);
    nSelCount := LbxSelSchBU.Items.Count;
    if nSelCount > 0 then
      LabelCntSelSch.Caption :=
                 'Помечено счетов: ' + IntToStr(nSelCount)
    else
      LabelCntSelSch.Caption := '';
    if (nSelCount = 1) and SintBold and AnalitBold then begin
      if TV.Selected.HasChildren then begin
        // выключить все дочерние, включить синтетические
        SintBold := true;
        AnalitBold := false; end
      else begin
        // включить дочерние, выключить синтетические
        SintBold   := false;
        AnalitBold := true;
      end;
      TV.Refresh; end
    else if nSelCount = 0 then begin
      // включить дочерние, включить синтетические
      SintBold := true;
      AnalitBold := true;
      TV.Refresh;
    end;
    if iSel < nTvCount-1 then
      TV.Items[iSel+1].Selected := true
    else begin
      TV.Items[iSel-1].Selected := true;
      TV.Items[iSel].Selected := true;
    end;
    sBtnSelAll.Enabled := LbxSelSchBU.Items.Count < nTvCount;
    sBtnUnSelAll.Enabled := LbxSelSchBU.Items.Count > 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.sBtnSelAllClick(Sender: TObject);
var i, nTvCount : integer;
begin                          // У этой кнопки Visible = false.
  nTvCount := TV.Items.Count;  // Поэтому процедура сия не используется
  LbxSelSchBU.Clear;
  for i := 0 to nTvCount - 1 do begin
    LbxSelSchBU.Items.Add(IntToStr(i));
  end;
  TV.Refresh;
  sBtnSelAll.Enabled := false;
  sBtnUnSelAll.Enabled := LbxSelSchBU.Items.Count > 0;
  LabelCntSelSch.Caption :=
                 'Помечено счетов: ' + IntToStr(LbxSelSchBU.Items.Count);
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.sBtnUnSelAllClick(Sender: TObject);
begin
  LbxSelSchBU.Clear;
  SintBold := true;
  AnalitBold := true;
  TV.Refresh;
  sBtnSelAll.Enabled := LbxSelSchBU.Items.Count < TV.Items.Count;
  sBtnUnSelAll.Enabled := LbxSelSchBU.Items.Count > 0;
  if LbxSelSchBU.Items.Count > 0 then
    LabelCntSelSch.Caption :=
                 'Помечено счетов: ' + IntToStr(LbxSelSchBU.Items.Count)
  else
    LabelCntSelSch.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.TVKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnSel.Click;
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.pop2detailsClick(Sender: TObject);
var cVidN, cShVidN, cPSch, cSchBU : ShortString;
    nKdKatP, nPRR : SmallInt;
    dZaMG : TDateTime;
begin
  cVidN   := cdsSpzVidN.AsString;
  cShVidN := cdsSpzShVidN.AsString;
  cPSch   := cdsSpzPSch.AsString;
  cSchBU  := cdsSpzSchBU.AsString;
  nKdKatP := cdsSpZKdKatP.AsInteger;
  nPRR    := cdsSpZPRR.AsInteger;
  dZaMG   := cdsSpZZaMesGod.AsDateTime;
  ShowMoDetails(DtProc, dZaMG, cVidN, cShVidN, cPSch, cSchBU,
                                                    nKdKatP, nPRR); {z_ShMoDt}
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.dbgrSPZDrawColumnCell(Sender: TObject; const Rect: TRect;
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
procedure TFormMoFin.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
function TFormMoFin.GetSmSaldo(dDtPrc: TDateTime; cPSch: ShortString): double;
begin
  Result := 0;
  with qryTmp do begin    {qryTmp уже освободился}
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Round(Sum(Summa), 2) SMM from ' + NmCurViNu  +
            ' where DtProc = :dDtPrc and VidN < "8600" and ' +
            ' not VidN in ("2724","6624") and PSch = :cPSch');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('cPSch').AsString    := cPSch;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('SMM').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.sBtnExpandClick(Sender: TObject);
begin              // Развернуть все
  Tv.FullExpand;
end;
//------------------------------------------------------------------------------
procedure TFormMoFin.sBtnCollapseClick(Sender: TObject);
begin              // Свернуть все
  Tv.FullCollapse;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.dbgrDbg2DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrDbg2.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if (cFldNm = 'SMRAZN') and (Column.Field.Value < 0) then
        Font.Color := clRed;
    end;
    if (cFldNm = 'SMRAZN') and (not Column.Field.IsNull) and
               ((Column.Field.Value < -3) or (Column.Field.Value > 3)) then
      Brush.Color := clSilver;
  end;
  dbgrDbg2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.NAccMappingClick(Sender: TObject);
begin
  MapAccounts;
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.MapAccounts;
var
  FrmAccMap: TFrmAccountMap;
  i: integer;
  cSchBU: string;
begin
  if (TV.Selected <> nil) then begin
    i := TV.Selected.AbsoluteIndex;
    cSchBU := TTreeItem(TV.Items[i].Data).SchBU;
  end;

  TFrmAccountMap.Run(cSchBU);
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.pop2Popup(Sender: TObject);
begin
  OfferForceSynth(not TV.Selected.HasChildren);
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.OfferForceSynth(Offer: Boolean);
const
  ItemCapt = 'Печатать субсч. с удержаниями';
var
  Indx: Integer;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function FindForceSynth: Integer;
  var
    Item: TMenuItem;
  begin
    Item := pop2.Items.Find(ItemCapt);
    Result := pop2.Items.IndexOf(Item);
  end;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure AddForceSynth(Indx: Integer);
  var
    Item: TMenuItem;
  begin
    if Indx = -1 then begin
      Item := TMenuItem.Create(pop2);

      with Item do begin
        Caption := ItemCapt;
        OnClick := ForceSynthProc;
      end;

      pop2.Items.Add(Item);
    end else
      Item := pop2.Items[Indx];

    Item.Checked := ForceSynthFlag;
  end;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure DelForceSynth(Indx: Integer);
  begin
    pop2.Items.Delete(Indx);
  end;
begin
  Indx := FindForceSynth;

  if Offer then
    AddForceSynth(Indx)
  else
    if Indx > -1 then
      DelForceSynth(Indx);
end;

//------------------------------------------------------------------------------
procedure TFormMoFin.ForceSynthProc(Sender: TObject);
begin
  ForceSynthFlag := not (Sender as TMenuItem).Checked;
end;

//------------------------------------------------------------------------------
function TFormMoFin.AnalytAsSynth: Boolean;
begin
  Result := (TTreeItem(TV.Selected.Data).SchBU = '8011/02-2')
    or (TTreeItem(TV.Selected.Data).SchBU = '8011/02-4');
end;

end.
