unit z_Mo5nw;

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
  TFormMo5nw = class(TForm)
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
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    chBoxDetails: TCheckBox;
    sBtnProverki: TSpeedButton;
    pop2: TPopupMenu;
    pop2details: TMenuItem;
    cdsSPZVNU: TSmallintField;
    cdsSPZPSCH: TStringField;
    cdsSPZSCHBU: TStringField;
    cdsSPZVID_SCHDT: TStringField;
    cdsSPZVID_SCHKT: TStringField;
    cdsSPZVID_KEKV: TStringField;
    cdsSPZVIDN: TStringField;
    cdsSPZSHVIDN: TStringField;
    cdsSPZPRR: TSmallintField;
    cdsSPZSMM: TBCDField;
    cdsSPZCNT: TIntegerField;
    cdsSPZDTSCH: TStringField;
    cdsSPZKTSCH: TStringField;
    tblSpZ: TTable;
    tblSpZNR: TAutoIncField;
    tblSpZVNU: TSmallintField;
    tblSpZPSCH: TStringField;
    tblSpZSchBU: TStringField;
    tblSpZVid_SchDt: TStringField;
    tblSpZVid_SchKt: TStringField;
    tblSpZVid_Kekv: TStringField;
    tblSpZVidN: TStringField;
    tblSpZShVidN: TStringField;
    tblSpZPRR: TSmallintField;
    tblSpZSMM: TFloatField;
    tblSpZCNT: TIntegerField;
    tblSpZDtSch: TStringField;
    tblSpZKtSch: TStringField;
    ts3: TTabSheet;
    tblPrp: TTable;
    qryPrp: TQuery;
    dbgrPrp: TDBGrid;
    dsrcPrp: TDataSource;
    dsrcPrp2: TDataSource;
    Splitter1: TSplitter;
    dbgrPrp2: TDBGrid;
    tblPrpNR: TAutoIncField;
    tblPrpZaMesGod: TDateField;
    tblPrpSmForPF: TFloatField;
    tblPrpSmToPFCmn: TFloatField;
    tblPrpSmToPFInv: TFloatField;
    tblPrpSmSvPrgPf: TFloatField;
    tblPrpSmForSsTvp: TFloatField;
    tblPrpSmToSsTvp: TFloatField;
    tblPrpSmSvPrgTvp: TFloatField;
    tblPrpSmForSsNv: TFloatField;
    tblPrpSmToSsNv: TFloatField;
    tblPrpSmSvPrgNv: TFloatField;
    tblPrpSmForFz: TFloatField;
    tblPrpSmToFz: TFloatField;
    tblPrpSmSvPrgFz: TFloatField;
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
    procedure CreOpenCdsSpZ(cSQL : string; c_PSch : ShortString;
                                                    d_MesDate : TDateTime);
    procedure AddInfTotblPrp(dZaMG : TDateTime;
                                nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                                nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                                nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                                nSmForFz, nSmToFz, nSmSvPrgFz : double);
  public
    { Public declarations }
  end;

procedure Mo5nw(dMesDate : TDateTime);

const SECTION = 'z_Mo5nw';

var
  FormMo5nw: TFormMo5nw;

implementation

uses a_Const, A_DM, a_Lib, Z_Dm, z_Main, z_CmnPrt, z_SvdPrv, z_ShMoDt;

{$R *.dfm}

procedure Mo5nw(dMesDate : TDateTime);
var nY, nM, nD : word;
begin
  FormMo5nw := TFormMo5nw.Create(Application);
  with FormMo5nw do begin
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
procedure TFormMo5nw.CreTvSpZ(dMesDate : TDateTime);
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
    DataBaseName := CESZPL;
    //                вроде хорошо округляет  Sum(Cast(Summa as numeric (18,2)))
    SQL.Add('Select PSch, KdSpZ, SchBU, NmSch, Sum(summa) as Summa ' +
            ' from ViNu4 where dtProc = :dMesDate ' +
            ' group by PSch, SchBU, KdSpZ, NmSch');
    ParamByName('dMesDate').AsDateTime := dMesDate;
    Open;
    while not Eof do begin
      if FieldByName('PSCH').IsNull then begin
        Next;
        Continue;
      end;
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
procedure TFormMo5nw.TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
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
procedure TFormMo5nw.FormResize(Sender: TObject);
begin
  PanelRight2.Top := Round((Height - PanelRight2.Height)/2) - 20;
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.FormCreate(Sender: TObject);
begin
//  ts1.TabVisible := false;
//  ts2.TabVisible := false;
//  ts3.TabVisible := false;
  PageControl1.ActivePage := ts1;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 750);
    rBtnTtsAllAndCmn.Checked := false; // ReadBool(SECTION, 'bTtsAll', false);
    rbtnTtsOnlyCmn.Checked := true;    // not rBtnTtsAllAndCmn.Checked;
    chBoxDetails.Checked := false;     // ReadBool(SECTION, 'bWithDet', true);
    Free;
  end;
  if FileExists(cDirVids + 'moNw01.vid') then
    dbgrSpZ.Columns.LoadFromFile(cDirVids + 'moNw01.vid');
  LabelCntSelSch.Caption := '';
  LabelMsgTs2.Caption := '';
//  dbgrTmp.Visible := false;      // bFlagDbg;
//  sBtnDbgrTmp.Visible := false;  // bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.FormClose(Sender: TObject; var Action: TCloseAction);
begin

end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.sBtnGoClick(Sender: TObject);
var i, nAdd, nTvCount : integer;  cPSch, cSchBU : string10; bHasChild : boolean;
    cSQL : string;
    nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
    nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
    nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
    nSmForFz, nSmToFz, nSmSvPrgFz : double;
    nTabN : integer; dZaMG : TDateTime;  cVidN : ShortString;
begin
(*
  nTvCount := TV.Items.Count;
  if bSintBold and bAnalitBold then begin // Нет помеченных
    if (TV.Selected <> nil) then begin
      i := TV.Selected.AbsoluteIndex;
      cPSch  := PTreeRec(TV.Items[i].Data)^.PSch;
      cSchBU := PTreeRec(TV.Items[i].Data)^.SchBU;
      bHasChild := TV.Items[i].HasChildren;
      if bHasChild then begin {выбран (но не помечен) синт.счет}
        cSQL := 'Select Cast(1 as SmallInt) as VNU, PSCH, SchBU, ' +
                ' Vid_SchDt, Vid_SchKt, Vid_Kekv, VidN, ShVidN, PRR, ' +
                ' Sum(Cast(Summa as numeric(18,2))) as SMM, Count( * ) as CNT, ' +
                ' Cast(null as Char(10)) as DtSch, ' +
                ' Cast(null as Char(10)) as KtSch  ' +
                ' from VINU_ForMo5 where dtProc = :dMesDate and PSch = "';
        cSQL := cSQL + cPSch + '" and VidN < "8600" ' +
                ' group by PSCH, SchBU, Vid_SchDt, Vid_SchKt, Vid_Kekv, ' +
                ' VidN, ShVidN, PRR ';
        nCaseReport := 1; end
      else begin {выбран (но не помечен) аналитический счет}
        ShowMessage('Работа с СубСчетами пока не откатана');
        Exit;
      end;
    end;
  end;
  CreOpenCdsSpZ(cSQL, cPSch, d_MesDate);
  PageControl1.ActivePage := ts2;
*)
  PageControl1.ActivePage := ts3;

  with tblPrp do begin
    if Active then Close;
    if Exists then DeleteTable;
    CreateTable;
    Open;
  end;
  with qryPrp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from VinuMain where DtProc = "11/01/2006" and ' +
            ' (VidN < "6000" or VidN > "8000") and PSCH = "801" ' +
            ' order by TabN, ZaMesGod, VidN ');
    Open;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      // по ходу буду определять "параметры" Инв, Пенс ... для ТабН
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        dZaMG := FieldByName('ZaMesGod').AsDateTime;
        nSmForPF    := 0;
        nSmToPfCmn  := 0;
        nSmToPfInv  := 0;
        nSmSvPrgPf  := 0;
        nSmForSsTvp := 0;
        nSmToSsTvp  := 0;
        nSmSvPrgTvp := 0;
        nSmForSsNv  := 0;
        nSmToSsNv   := 0;
        nSmSvPrgNv  := 0;
        nSmForFz    := 0;
        nSmToFz     := 0;
        nSmSvPrgFz  := 0;
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and
                 (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
          // пока опускаю проверки "параметров" ТабН
          cVidN := FieldByName('VidN').AsString;
          if cVidN < '6000' then begin
            if FieldByName('SP_PF').AsString = '1' then
              nSmForPF := nSmForPF + FieldByName('Summa').AsFloat;
            if FieldByName('SP_FSTVP').AsString = '1' then
              nSmForSsTvp := nSmForSsTvp + FieldByName('Summa').AsFloat;
            if FieldByName('SP_FSNV').AsString = '1' then
              nSmForSsNv := nSmForSsNv + FieldByName('Summa').AsFloat;
            if FieldByName('SP_FZ').AsString = '1' then
              nSmForFz := nSmForFz + FieldByName('Summa').AsFloat; end
          else if cVidN = '8611' then
            nSmToPfCmn := nSmToPfCmn + FieldByName('Summa').AsFloat
          else if cVidN = '8612' then
            nSmToPfInv := nSmToPfInv + FieldByName('Summa').AsFloat
          else if cVidN = '8621' then
            nSmToSsTvp := nSmToSsTvp + FieldByName('Summa').AsFloat
          else if cVidN = '8631' then
            nSmToSsNv := nSmToSsNv + FieldByName('Summa').AsFloat
          else if cVidN = '8641' then
            nSmToFz := nSmToFz + FieldByName('Summa').AsFloat
          else if cVidN = '8671' then
            nSmSvPrgPf := nSmSvPrgPf + FieldByName('Summa').AsFloat
          else if cVidN = '8672' then begin
            nSmSvPrgTvp := nSmSvPrgTvp + FieldByName('Summa').AsFloat;
            nSmSvPrgNv := nSmSvPrgNv + FieldByName('Summa').AsFloat; end
          else if cVidN = '8674' then
            nSmSvPrgFz := nSmSvPrgFz + FieldByName('Summa').AsFloat;
          Next;
        end;
        AddInfTotblPrp(dZaMG, nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                                nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                                nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                                nSmForFz, nSmToFz, nSmSvPrgFz);
      end;
    end;
  end;

  nSmForPF    := 0;
  nSmToPfCmn  := 0;
  nSmToPfInv  := 0;
  nSmSvPrgPf  := 0;
  nSmForSsTvp := 0;
  nSmToSsTvp  := 0;
  nSmSvPrgTvp := 0;
  nSmForSsNv  := 0;
  nSmToSsNv   := 0;
  nSmSvPrgNv  := 0;
  nSmForFz    := 0;
  nSmToFz     := 0;
  nSmSvPrgFz  := 0;
  with tblPrp do begin
    First;
    while not Eof do begin
      nSmForPF    := nSmForPF    + FieldByName('SmForPF').AsFloat;
      nSmToPfCmn  := nSmToPfCmn  + FieldByName('SmToPfCmn').AsFloat;
      nSmToPfInv  := nSmToPfInv  + FieldByName('SmToPfInv').AsFloat;
      nSmSvPrgPf  := nSmSvPrgPf  + FieldByName('SmSvPrgPf').AsFloat;
      nSmForSsTvp := nSmForSsTvp + FieldByName('SmForSsTvp').AsFloat;
      nSmToSsTvp  := nSmToSsTvp  + FieldByName('SmToSsTvp').AsFloat;
      nSmSvPrgTvp := nSmSvPrgTvp + FieldByName('SmSvPrgTvp').AsFloat;
      nSmForSsNv  := nSmForSsNv  + FieldByName('SmForSsNv').AsFloat;
      nSmToSsNv   := nSmToSsNv   + FieldByName('SmToSsNv').AsFloat;
      nSmSvPrgNv  := nSmSvPrgNv  + FieldByName('SmSvPrgNv').AsFloat;
      nSmForFz    := nSmForFz    + FieldByName('SmForFz').AsFloat;
      nSmToFz     := nSmToFz     + FieldByName('SmToFz').AsFloat;
      nSmSvPrgFz  := nSmSvPrgFz  + FieldByName('SmSvPrgFz').AsFloat;
      Next;
    end;
  end;
  dZaMG := EncodeDate(2007, 12, 31);
  AddInfTotblPrp(dZaMG, nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                        nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                        nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                        nSmForFz, nSmToFz, nSmSvPrgFz);
//  PageControl1.ActivePage := ts3;
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.AddInfTotblPrp(dZaMG : TDateTime;
                                nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                                nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                                nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                                nSmForFz, nSmToFz, nSmSvPrgFz : double);
begin
  with tblPrp do begin
    if not Locate('ZaMesGod', dZaMG, []) then begin
      Append;
      FieldByName('ZaMesGod').AsDateTime := dZaMG; end
    else
      Edit;
    FieldByName('SmForPF').AsFloat := FieldByName('SmForPF').AsFloat + nSmForPF;
    FieldByName('SmToPfCmn').AsFloat  := FieldByName('SmToPfCmn').AsFloat  +  nSmToPfCmn;
    FieldByName('SmToPfInv').AsFloat  := FieldByName('SmToPfInv').AsFloat  +  nSmToPfInv;
    FieldByName('SmSvPrgPf').AsFloat  := FieldByName('SmSvPrgPf').AsFloat  +  nSmSvPrgPf;
    FieldByName('SmForSsTvp').AsFloat := FieldByName('SmForSsTvp').AsFloat +  nSmForSsTvp;
    FieldByName('SmToSsTvp').AsFloat  := FieldByName('SmToSsTvp').AsFloat  +  nSmToSsTvp;
    FieldByName('SmSvPrgTvp').AsFloat := FieldByName('SmSvPrgTvp').AsFloat +  nSmSvPrgTvp;
    FieldByName('SmForSsNv').AsFloat  := FieldByName('SmForSsNv').AsFloat  +  nSmForSsNv;
    FieldByName('SmToSsNv').AsFloat   := FieldByName('SmToSsNv').AsFloat   +  nSmToSsNv;
    FieldByName('SmSvPrgNv').AsFloat  := FieldByName('SmSvPrgNv').AsFloat  +  nSmSvPrgNv;
    FieldByName('SmForFz').AsFloat    := FieldByName('SmForFz').AsFloat    +  nSmForFz;
    FieldByName('SmToFz').AsFloat     := FieldByName('SmToFz').AsFloat     +  nSmToFz;
    FieldByName('SmSvPrgFz').AsFloat  := FieldByName('SmSvPrgFz').AsFloat  +  nSmSvPrgFz;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.CreOpenCdsSpZ(cSQL : string; c_PSch : ShortString;
                                                         d_MesDate : TDateTime);
var cPSch, cSchBU, cKrSch, cDtSch, cKtSch : string10;
    cVidN : string4;
    c_SQL, cWhereMsg, cPartPSCH : string;
    bIsFirstPSCH, bIsPartSbu, bIsFirstIN : boolean;
    nVNU : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
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
      if (cVidN <> '2603') and  // больничные, кроме 1-х 5-ти дней
              ((cVidN >= '2600') and (cVidN < '2700')) or
            (cVidN = '1901') or (cVidN = '1909') then begin
            // 1901 - пособие ЧОО, 1909 - пособие при рожд ребенка
        nVNU := 0;
        cDtSch := cdsSpzVid_SchDt.AsString;
        cKtSch := cdsSpzVid_SchDt.AsString; end
      else if (cVidN > '2700') and (cVidN < '2750') then begin
        // прочие начисления
        nVNU := 1;
        cDtSch := cdsSpzVid_SchDt.AsString;
        cKtSch := cdsSpzVid_SchKt.AsString; end
      else if (cVidN < '6000') then begin
        // начисления в т.ч. '2603' - 1-е 5 дней за счет предпр.
        if (nCaseReport = 1) or (nCaseReport = 11) then begin
          // cKrSch := cdsSpzPSch.AsString;
          cDtSch := cdsSpzVid_SchDt.AsString;
          cKtSch := cdsSpzVid_SchKt.AsString; end
        else begin
          cDtSch := cdsSpzVid_SchDt.AsString;
          cKtSch := cdsSpzVid_SchKt.AsString;
          // cKrSch := cdsSpzSchBU.AsString;
        end;
        nVNU := 1; end
      else if ((cVidN >= '6000') and (cVidN < '7000')) then begin  // удержания
        cDtSch := cdsSpzVid_SchDt.AsString;
        cKtSch := cdsSpzVid_SchKt.AsString;
        //cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 2; end
      else if ((cVidN >= '7000') and (cVidN < '7500')) then begin // прочие
        cDtSch := cdsSpzVid_SchDt.AsString;
        cKtSch := cdsSpzVid_SchKt.AsString;
//        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger); //(удалил все)
        nVNU := 3; end                            // теперь таких видов не стало
      else if ((cVidN >= '7500') and (cVidN < '7600')) then begin  // выплаты
        cDtSch := cdsSpzVid_SchDt.AsString;
        cKtSch := cdsSpzVid_SchKt.AsString;
//        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 4; end
      else if ((cVidN >= '8600') and (cVidN < '8670')) then begin // взн.предпр.
        cDtSch := cdsSpzVid_SchDt.AsString;
        cKtSch := cdsSpzVid_SchKt.AsString;
//        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 5; end
      else if ((cVidN >= '8670') and (cVidN < '8680')) then begin // СвПороги
        cDtSch := cdsSpzVid_SchDt.AsString;
        cKtSch := cdsSpzVid_SchKt.AsString;
//        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := -1;
      end;
      Edit;
      FieldByName('VNU').AsInteger := nVNU;
      FieldByName('DtSch').AsString := cDtSch;
      FieldByName('KtSch').AsString := cKtSch;
//      FieldByName('KrSch').AsString := cKrSch;
      Post;
      Next;
    end;
    IndexName := 'CdsIndx';
    if bFlagDbg then
      SaveToFile(cDirTemp + 'mo5_' + c_PSch + '.cds');
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.sBtnBack2Click(Sender: TObject);
begin
  LabelMsgTs2.Caption := '';
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.sBtnPrtClick(Sender: TObject);
var nCasePrt : word; cPrtCaption : string; bWithDet : boolean;
begin
  bWithDet := chBoxDetails.Checked;
  if rBtnTtsOnlyCmn.Checked then
    nCasePrt := 1
  else
    nCasePrt := 2;
  if (nCaseReport = 1) or (nCaseReport = 11) then  // по СинтСчету(счетам)
//    F6PrtMo_BySint(cdsSPZ, dDtProc, cPrtCaption, bWithDet) {z_CmnPrt}
  else ;
//    F6PrtMoByAnalitSPZ(cdsSPZ, dDtProc, cPrtCaption, bWithDet); {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.sBtnProverkiClick(Sender: TObject);
begin
  ShwSvdPrv(cdsSPZ, dDtProc);  {z_SvdPrv}
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.cdsSPZCalcFields(DataSet: TDataSet);
begin
//  cdsSpzVid_SpZ.AsString := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.sBtnSelClick(Sender: TObject);
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
procedure TFormMo5nw.sBtnSelAllClick(Sender: TObject);
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
procedure TFormMo5nw.sBtnUnSelAllClick(Sender: TObject);
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
procedure TFormMo5nw.TVKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnSel.Click;
end;
//------------------------------------------------------------------------------
procedure TFormMo5nw.pop2detailsClick(Sender: TObject);
var cVidN : string4; cPSch, cSchBU : string10;
begin
  cVidN  := cdsSpzVidN.AsString;
  cPSch  := cdsSpzPSch.AsString;
  cSchBU := cdsSpzSchBU.AsString;
  ShowMoDetails(d_MesDate, cVidN, cPSch, cSchBU);     {z_ShMoDt}
end;

end.
