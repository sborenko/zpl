unit z_ChkMG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  mATH, Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, DBCtrls, DBClient, ComCtrls, AxCtrls, OleCtrls, TTF160_TLB;

type
  String4 = String[4];
  string1 = string[1];
  TFormChkNuZaMG = class(TForm)
    PanelRight: TPanel;
    qryNu: TQuery;
    dsrcNu: TDataSource;
    cdsZaMG: TClientDataSet;
    cdsZaMGDtZaMG: TDateField;
    dsrcZaMG: TDataSource;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrNu: TDBGrid;
    F6B: TF6Book;
    PanelRB: TPanel;
    sBtnStayOnTop: TSpeedButton;
    sBtnGoBack: TSpeedButton;
    sBtnCtrl: TSpeedButton;
    bBtnClose: TBitBtn;
    PanelRT: TPanel;
    grBoxGroupCase: TGroupBox;
    rBtnGrpByVidN: TRadioButton;
    rBtnGrpByVidNDtProc: TRadioButton;
    chBoxSvDtZaMG: TCheckBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ChBoxPPS: TCheckBox;
    ChBoxPens: TCheckBox;
    ChBoxProfs: TCheckBox;
    GroupBox2: TGroupBox;
    rBtnUdergAll: TRadioButton;
    rBtnUdergSotr: TRadioButton;
    rBtnUdergPrp: TRadioButton;
    ChBoxIsUvoln: TCheckBox;
    LabelOklTrf: TLabel;
    LabelPrcWrkTime: TLabel;
    LabelProcLg: TLabel;
    LabelInv: TLabel;
    qryTmp: TQuery;
    Label1: TLabel;
    DBComboZaMG: TDBComboBox;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    qryNuNR: TIntegerField;
    qryNuVIDN: TStringField;
    qryNuSHVIDN: TStringField;
    qryNuDTPROC: TDateTimeField;
    qryNuSPDN: TStringField;
    qryNuSPRF: TStringField;
    qryNuSP_PF: TStringField;
    qryNuSALIM: TStringField;
    qryNuSP_FSTVP: TStringField;
    qryNuSP_FSNV: TStringField;
    qryNuSP_FZ: TStringField;
    qryNuPRR: TSmallintField;
    qryNuSUMMA: TBCDField;
    Label2: TLabel;
    procedure rBtnGrpByVidNClick(Sender: TObject);
    procedure dbgrNuDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboZaMGEnter(Sender: TObject);
    procedure DBComboZaMGExit(Sender: TObject);
    procedure DBComboZaMGKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure cdsZaMGDtZaMGSetText(Sender: TField; const Text: String);
    procedure DBComboZaMGChange(Sender: TObject);
    procedure ChBoxPPSClick(Sender: TObject);
    procedure ChBoxPensClick(Sender: TObject);
    procedure ChBoxProfsClick(Sender: TObject);
    procedure rBtnFilterClick(Sender: TObject);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure bBtnCloseClick(Sender: TObject);
    procedure sBtnCtrlClick(Sender: TObject);
    procedure sBtnGoBackClick(Sender: TObject);
    procedure ChBoxIsUvolnClick(Sender: TObject);
    procedure qryNuSPFldGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
    n_TabN : integer;
    c_FamIO : ShortString;
    d_DtZaMG, d_DtCtrl : TDateTime;
    nSvDtZaMG : integer;
    nInv : SmallInt;
    bIsPPS, bIsPens, bIsSovm, bIsProfs, bIsUvoln : boolean;
    nOklTrf, nAvans, nPrcWrkTime, nPereProcLg : double;
    nPrcPdn, nPrcPdn2, nProcLg, nMinZpNG, nMinZpCM, nProgMinNG, nProgMinCM,
            nPorogLg, nSm2660, nSmLg100, nSmLg150, nSmLg200 : double;
    nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr : integer;
    cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    procedure CreOpenQryNU(nTabN : integer; d_ZaMG : TDateTime);
    function GetIsUvoln(nTabN : integer; dDate : TDateTime) : boolean;
    function SumPF(nTabN : integer; var cVidN : String4;
                              var bIsPPS, bIsPens, bIsInv, bIsSovm : boolean;
                                    dZaMG, dRMes : TDateTime; nSmForXX : double;
                                              var nSmSvPorog : double) : double;
    function SumPF_Prp(nTabN : integer; var cVidN : ShortString;
                                    dZaMG, dRMes : TDateTime; nSmForXX : double;
                         var nSmPorog, nSmSvPorog, nPrcPfFakt : double) : double;
    function SumSS(nTabN : integer; var cVidN : string4;
                                   dZaMG, dRMes : TDateTime; nSmForXX : double;
                                              var nSmSvPorog : double) : double;
    function SumSS_TvpPrp(nTabN : integer; var cVidN : string4;
                                   dZaMG, dRMes : TDateTime; nSmForXX : double;
                        var nSmPorog, nSmSvPorog, nPrcSsTvp : double) : double;
    function SumSS_NvPrp(nTabN : integer; var cVidN : string4;
                                  dZaMG, dRMes : TDateTime; nSmForXX : double;
                       var nSmPorog, nSmSvPorog, nPrcSsNv : double) : double;
    function SumFZ(nTabN : integer; var cVidN : string4;
                           dZaMG, dRMes : TDateTime;
                           nSmForXX : double; var nSmSvPorog : double) : double;
    function SumFZ_Prp(nTabN : integer; var cVidN : string4;
                                dZaMG, dRMes : TDateTime; nSmForXX : double;
                            var nSmPorog, nSmSvPorog, nPrcFz : double) : double;
    function SumPdN(nTabN : integer; dZaMG : TDateTime;
                      nSmForPN, nSmNUdPF, nSmNUdSS, nSmNUdFZ : double) : double;
    function SumPrfs(nTabN : integer; var cVidN : string4;
                                 dZaMG : TDateTime; nSmForXX : double) : double;

    procedure SetQryNuFilter;
    procedure SetFormStyle;
    procedure F6B_Head;
    procedure DoControl;
    procedure SetDbgrNuColumns;
  public
    { Public declarations }
  end;

procedure CheckNuZaMG(nTabN : integer; cFamIO : ShortString;
                                                dDtZaMG, dDtCtrl : TDateTime);

const SECTION = 'z_ChkMG';

var
  FormChkNuZaMG: TFormChkNuZaMG;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib, z_ChkRes;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure CheckNuZaMG(nTabN : integer; cFamIO : ShortString;
                                                dDtZaMG, dDtCtrl : TDateTime);
var cZaMG : ShortString; n : SmallInt;
begin
  if not bIsFormChkNuZaMG then begin
    FormChkNuZaMG := TFormChkNuZaMG.Create(Application);
    with FormChkNuZaMG do begin
      n_TabN := nTabN;
      c_FamIO := cFamIO;
      d_DtZaMG := dDtZaMG;
      d_DtCtrl := dDtCtrl;
      with cdsZaMG do begin
        if Active then Close;
        CreateDataSet;
        Open;
        Append;
        if (nSvDtZaMG = 0) or not chBoxSvDtZaMG.Checked then
          nSvDtZaMG := Round(dDtZaMG);
        FieldByName('DtZaMG').AsDateTime := nSvDtZaMG;
      end;
      cZaMG := cdsZaMG.FieldByName('DtZaMG').AsString;
      if not MyEmptyDate(cZaMG) then begin
        cZaMG := Copy(cZaMG, 4, 7);
        n := DBComboZaMG.Items.IndexOf(cZaMG);
        if n >= 0 then
          DBComboZaMG.ItemIndex := n;
      end;
      CreOpenQryNU(nTabN, cdsZaMGDtZaMG.AsDateTime);
      bIsFormChkNuZaMG := true;
      Show;
    end; end
  else begin
    if FormChkNuZaMG.WindowState = wsMinimized then
      FormChkNuZaMG.WindowState := wsNormal;
    FormChkNuZaMG.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.FormCreate(Sender: TObject);
var nFilter : word;
begin
  if FileExists(cDirVids + 'CmboZaMG.lbx') then
    dbComboZaMG.Items.LoadFromFile(cDirVids + 'CmboZaMG.lbx');
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 455);
    Width  := ReadInteger(SECTION, 'wW', 675);
    chBoxSvDtZaMG.Checked := ReadBool(SECTION, 'bSvDtZaMG', true);
    rBtnGrpByVidNDtProc.Checked := ReadBool(SECTION, 'GrpByVP', false);
    rBtnGrpByVidN.Checked := not rBtnGrpByVidNDtProc.Checked;
    nSvDtZaMG := ReadInteger(SECTION, 'nSvDtZaMG', 0);
    nFilter :=  ReadInteger(SECTION, 'nUdrgFilter', 0);
    sBtnStayOnTop.Down := ReadBool(SECTION, 'bStOnTop', true);
    Free;
  end;
  sBtnGoBack.Top := sBtnCtrl.Top;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  PageControl1.ActivePage := ts1;
  if nFilter = 1 then
    rBtnUdergSotr.Checked := true
  else if nFilter = 2 then
    rBtnUdergPrp.Checked := true
  else
    rBtnUdergAll.Checked := true;
  if FileExists(cDirVids + 'ChkMG_02.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'ChkMG_02.vid');
  SetFormStyle;
  SetDbgrNuColumns;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'GrpByVP', rBtnGrpByVidNDtProc.Checked);
    WriteInteger(SECTION, 'nSvDtZaMG',
                            Round(cdsZaMG.FieldByName('DtZaMG').AsDateTime));
    WriteBool(SECTION, 'bSvDtZaMG', chBoxSvDtZaMG.Checked);
    if rBtnUdergSotr.Checked then
      WriteInteger(SECTION, 'nUdrgFilter', 1)
    else if rBtnUdergPrp.Checked then
      WriteInteger(SECTION, 'nUdrgFilter', 2)
    else
      WriteInteger(SECTION, 'nUdrgFilter', 0);
    WriteBool(SECTION, 'bStOnTop', sBtnStayOnTop.Down);
    Free;
  end;
  if qryNU.Active then
    dbgrNu.Columns.SaveToFile(cDirVids   + 'ChkMG_02.vid');
  bIsFormChkNuZaMG := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.CreOpenQryNU(nTabN: integer; d_ZaMG: TDateTime);
var nY, nM, nD : word; dDtEndZaMG : TDateTime;
begin
  dDtEndZaMG := MyLastDOM(d_ZaMG);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Set generator My_Gen_ID to 0');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Clear;
    if rBtnGrpByVidNDtProc.Checked then
      SQL.Add('Select Gen_Id(My_Gen_ID, 1) as NR, VidN, ShVidN, DtProc, ' +
              ' SPdN, SP_PF, SP_FsTvp, SP_FsNv, SP_FZ, PRR, SPrf, SAlim, ' +
              ' Sum(cast(Summa as Numeric(18,2))) as SUMMA ' +
              ' from ViNuMain where TabN = :nTabN and ' +
              ' ZaMesGod = :d_ZaMG and DtProc <= :d_DtCtrl ' +
              ' group by VidN, ShVidN, DtProc, SPdN, ' +
              ' SP_PF, SP_FsTvp, SP_FsNv, SP_FZ, PRR, SPrf, SAlim ' +
              ' having ((Sum(cast(Summa as Numeric(18,2))) > 0.001) or ' +
                  '    (Sum(cast(Summa as Numeric(18,2))) < -0.001))')
    else
      SQL.Add('Select Gen_Id(My_Gen_ID, 1) as NR, VidN, ShVidN, ' +
              ' Cast(Null as TimeStamp) as DtProc, ' +
              ' SPdN, SP_PF, SP_FsTvp, SP_FsNv, SP_FZ, PRR, SPrf, SAlim, ' +
              ' Sum(cast(Summa as Numeric(18,2))) as SUMMA ' +
              ' from ViNuMain where TabN = :nTabN and ' +
              ' ZaMesGod = :d_ZaMG and DtProc <= :d_DtCtrl ' +
              ' group by VidN, ShVidN, SPdN, ' +
              ' SP_PF, SP_FsTvp, SP_FsNv, SP_FZ, PRR, SPrf, SAlim ' +
              ' having ((Sum(cast(Summa as Numeric(18,2))) > 0.001) or ' +
                  '    (Sum(cast(Summa as Numeric(18,2))) < -0.001))');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('d_ZaMG').AsDateTime := d_ZaMG;
    ParamByName('d_DtCtrl').AsDateTime := d_DtCtrl;
    // d_DtCtrl - попытка защиты от манипулирования системной датой
    Open;
  end;
  SetQryNuFilter;
  DecodeDate(d_ZaMG, nY, nM, nD);
  Caption := c_FamIO + ' (Начисления / Удержания за ' + MesRus(nM) + ' ' +
                      IntToStr(nY) + ' г.)';
  // И тут же показать индивидуальные "параметры" на конец вызванного ZaMG
  DmMain.GetPereInf(nTabN, dDtEndZaMG, nKdObj, nKdKatP, nSO, nPdNlg,
                                  nKolMin, nKdSpz, nRang, nRazr,
                              nOklTrf, nAvans, nPereProcLG, cSpAv,
                                           cDolgnost, cNrPrikaza, dDtPrikaza,
                                            bIsPens, bIsSovm, bIsProfs, nInv);
  bIsUvoln := GetIsUvoln(nTabN, dDtEndZaMG);
  LabelOklTrf.Caption := FloatToStrF(nOklTrf, ffFixed, 18, 2);
  LabelPrcWrkTime.Caption := FloatToStr(nPrcWrkTime);
  LabelProcLg.Caption := FloatToStr(nPereProcLg);
  if nInv > 0 then
    LabelInv.Caption := IntToStr(nInv)
  else
    LabelInv.Caption := '';
  chBoxPPS.Checked := bIsPPS;
  chBoxPens.Checked := bIsPens;
  chBoxProfs.Checked := bIsProfs;
  ChBoxIsUvoln.Checked := bIsUvoln;
  F6B.ClearRange(1, 1, 200, 6, F1ClearAll);   // Очистить F6B
  DoControl;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.SetDbgrNuColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrNu.Columns.Count-1 do begin
    with dbgrNu.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'PRR') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.GetIsUvoln(nTabN : integer;
                                           dDate : TDateTime) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_PrmUv where TabN = :nTabN ' +
                                           ' order by Dt_Priem desc');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    while not Eof do begin
      if (FieldByName('Dt_Priem').AsDateTime < dDate) then begin
        if (not FieldByName('Dt_Uvoln').IsNull) and
              (FieldByName('Dt_Uvoln').AsDateTime <= dDate) then
          Result := true;
        Break;
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.SetQryNuFilter;
begin
  with qryNu do begin
    if rBtnUdergAll.Checked then
      Filtered := false
    else begin
      if rBtnUdergSotr.Checked then
        Filter := 'VidN < ''8600'''
      else
        Filter := '(VidN < ''6000'') or (VidN >= ''8600'')';
      Filtered := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.rBtnFilterClick(Sender: TObject);
begin
  SetQryNuFilter;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.ChBoxPPSClick(Sender: TObject);
begin
  chBoxPPS.Checked := bIsPPS;     // чтобы нельзя было изменить значение
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.ChBoxPensClick(Sender: TObject);
begin
  chBoxPens.Checked := bIsPens;   // чтобы нельзя было изменить значение
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.ChBoxProfsClick(Sender: TObject);
begin
  chBoxProfs.Checked := bIsProfs; // чтобы нельзя было изменить значение
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.ChBoxIsUvolnClick(Sender: TObject);
begin
  ChBoxIsUvoln.Checked := bIsUvoln; // чтобы нельзя было изменить значение
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.rBtnGrpByVidNClick(Sender: TObject);
begin
  CreOpenQryNU(n_TabN, cdsZaMGDtZaMG.AsDateTime);
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.dbgrNuDrawColumnCell(Sender: TObject;
                                        const Rect: TRect; DataCol: Integer;
                                        Column: TColumn; State: TGridDrawState);
var cVidN : ShortString;
begin
  cVidn := qryNuVidN.AsString;
  with dbgrNu.Canvas do begin
    if not (gdFocused in State) then begin
      if (cVidN < '6000')  then
        Font.Color  := clMaroon
      else if (cVidN < '7500') then
        Font.Color  := clNavy
      else if (cVidN < '8600') then
        Font.Color  := clBlue
      else
        Font.Color  := clTeal;
      if (UpperCase(Column.FieldName) = 'SUMMA') then begin
        Font.Style := [fsBold];
        if (Column.Field.Value >= 0) then
          Font.Color := clWindowText
        else
          Font.Color := clRed;
      end;
    end;
  end;
  dbgrNu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.DBComboZaMGEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.DBComboZaMGExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.DBComboZaMGKeyDown(Sender: TObject;
                                             var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    DBComboZaMG.Show;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.cdsZaMGDtZaMGSetText(Sender: TField;
                                                          const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyMesGod(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := '01-' + Text;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.DBComboZaMGChange(Sender: TObject);
var cText : ShortString;
begin
  cText := '01-' + DBComboZaMG.Items[DBComboZaMG.ItemIndex];
  cdsZaMGDtZaMG.AsString := cText;
  CreOpenQryNU(n_TabN, cdsZaMGDtZaMG.AsDateTime);
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.sBtnStayOnTopClick(Sender: TObject);
begin
  SetFormStyle;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.SetFormStyle;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = ts1 then begin
    sBtnGoBack.Visible := false;
    sBtnCtrl.Visible := true;
    PanelRight.Enabled := true;
    ActiveControl := dbgrNU; end
  else begin
    sBtnCtrl.Visible := false;
    sBtnGoBack.Visible := true;
    PanelRight.Enabled := false;
    ActiveControl := F6B;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.bBtnCloseClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.DoControl;
var nSvNR : integer;
    bSvFiltered : boolean;
    cSvFilter : ShortString;
    cVidN, cVidXX : string4;
    nSmForPF, nSmUdPF, nSmNUdPF : double;
    nSmForSS, nSmUdSS, nSmNUdSS : double;
    nSmForFZ, nSmUdFZ, nSmNUdFZ : double;
    nSmForPN, nSmUdPN, nSmNUdPN : double;
    nSmForPrfs, nSmUdPrfs, nSmNUdPrfs : double;
    nSmForPfPrp, nSmUdPfPrp, nSmNUdPfPrp,
           nSmPorogPfPrp, nSmSvPorogPfPrpIs, nSmSvPorogPfPrpDB, nPrcPf : double;
    nSmForPfInv, nSmUdPfInv, nSmNUdPfInv : double;
    nSmForSsTvp, nSmUdSsTvp, nSmNUdSsTvp,
       nSmPorogSsTvp, nSmSvPorogSsTvpIs, nSmSvPorogSsTvpDB, nPrcSsTvp : double;
    nSmForSsNv, nSmUdSsNv, nSmNUdSsNv,
       nSmPorogSsNv, nSmSvPorogSsNvIs, nSmSvPorogSsNvDB, nPrcSsNv : double;
    nSmForFzPrp, nSmUdFzPrp, nSmNUdFzPrp,
       nSmPorogFzPrp, nSmSvPorogFzPrpIs, nSmSvPorogFzPrpDB, nPrcFzPrp : double;
    dZaMG : TDateTime;
    nSmPorog, nSmSvPorog, nPrcPfCmn : double;
    iRow : SmallInt;
    bIsInv, bIsSovm : boolean;
    nRazn : double;
    mCellFormat : IF1CellFormat;
begin
  if qryNu.RecordCount <= 0 then Exit;
  dZaMG := cdsZaMgDtZaMG.AsDateTime;
  with qryNu do begin
    nSvNR := qryNuNR.AsInteger;
    bSvFiltered := Filtered;
    DisableControls;
    Filtered := false;
    First;
    nSmForPF := 0;
    nSmUdPF  := 0;
    nSmForSS := 0;
    nSmUdSS  := 0;
    nSmForFZ := 0;
    nSmUdFZ  := 0;
    nSmForPN := 0;
    nSmUdPN  := 0;
    nSmForPrfs := 0;
    nSmUdPrfs  := 0;

    nSmForPfPrp := 0;
    nSmUdPfPrp  := 0;
    nSmForPfInv := 0;
    nSmUdPfInv  := 0;
    nSmSvPorogPfPrpIs := 0;
    nSmForSsTvp := 0;
    nSmUdSsTvp  := 0;
    nSmSvPorogSsTvpIs := 0;
    nSmForSsNv := 0;
    nSmUdSsNv  := 0;
    nSmSvPorogSsNvIs := 0;
    nSmForFzPrp := 0;
    nSmUdFzPrp  := 0;
    nSmSvPorogFzPrpIs := 0;

    while not Eof do begin
      cVidN := qryNuVidN.AsString;
      if (cVidN < '6000') then begin
        if (not qryNuSP_PF.IsNull) and (qryNuSP_PF.AsInteger = 1) then begin
          nSmForPF := nSmForPF + qryNuSumma.AsFloat;
          nSmForPfPrp := nSmForPfPrp + qryNuSumma.AsFloat;
        end;
        if (not qryNuSP_FsTvp.IsNull) and
                                 (qryNuSP_FsTvp.AsInteger = 1) then begin
          nSmForSS := nSmForSS + qryNuSumma.AsFloat;
          nSmForSsTvp := nSmForSsTvp + qryNuSumma.AsFloat;
          nSmForSsNv := nSmForSsNv + qryNuSumma.AsFloat;
        end;
        if (not qryNuSP_FZ.IsNull) and (qryNuSP_FZ.AsInteger = 1) then begin
          nSmForFZ := nSmForFZ + qryNuSumma.AsFloat;
          nSmForFzPrp := nSmForFzPrp + qryNuSumma.AsFloat;
        end;
        if (not qryNuSPDN.IsNull) and (qryNuSPDN.AsInteger = 1) then
          nSmForPN := nSmForPN + qryNuSumma.AsFloat;
        if (not qryNuSPrf.IsNull) and (qryNuSPrf.AsInteger = 1) then
          nSmForPrfs := nSmForPrfs + qryNuSumma.AsFloat;
        end
      else if (cVidN > '6400') and (cVidN < '6500') then
        nSmUdPF := nSmUdPF - qryNuSumma.AsFloat
      else if (cVidN > '6300') and (cVidN < '6400') then
        nSmUdSS := nSmUdSS - qryNuSumma.AsFloat
      else if (cVidN > '6500') and (cVidN < '6600') then
        nSmUdFZ := nSmUdFZ - qryNuSumma.AsFloat
      else if (cVidN = '6001') or (cVidN = '6002') then
        nSmUdPN := nSmUdPN - qryNuSumma.AsFloat
      else if (cVidN = '6021') then
        nSmUdPrfs := nSmUdPrfs - qryNuSumma.AsFloat
      else if (cVidN = '8611') then
        nSmUdPfPrp := nSmUdPfPrp - qryNuSumma.AsFloat
      else if (cVidN = '8612') then
        nSmUdPfInv := nSmUdPfInv - qryNuSumma.AsFloat
      else if (cVidN = '8621') then
        nSmUdSsTvp := nSmUdSsTvp - qryNuSumma.AsFloat
      else if (cVidN = '8631') then
        nSmUdSsNv := nSmUdSsNv - qryNuSumma.AsFloat
      else if (cVidN = '8641') then
        nSmUdFzPrp := nSmUdFzPrp - qryNuSumma.AsFloat
      else if (cVidN = '8671') then
        nSmSvPorogPfPrpIs := nSmSvPorogPfPrpIs + qryNuSumma.AsFloat
      else if (cVidN = '8674') then
        nSmSvPorogFzPrpIs := nSmSvPorogFzPrpIs + qryNuSumma.AsFloat
      else if (cVidN = '8672') then begin
        nSmSvPorogSsTvpIs := nSmSvPorogSsTvpIs + qryNuSumma.AsFloat;
        nSmSvPorogSsNvIs := nSmSvPorogSsNvIs + qryNuSumma.AsFloat;
      end;
      Next;
    end;
    Filtered := bSvFiltered;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  nSmUdPF := RoundTo(nSmUdPF, -2);
  nSmUdSS := RoundTo(nSmUdSS, -2);
  nSmUdFZ := RoundTo(nSmUdFZ, -2);
  nSmUdPN := RoundTo(nSmUdPN, -2);
  nSmUdPrfs  := RoundTo(nSmUdPrfs, -2);
  nSmUdPfPrp := RoundTo(nSmUdPfPrp, -2);
  nSmUdPfInv := RoundTo(nSmUdPfInv, -2);
  nSmUdSsTvp := RoundTo(nSmUdSsTvp, -2);
  nSmUdSsNv  := RoundTo(nSmUdSsNv, -2);

  bIsInv := nInv > 0;
  cVidXX := '';
  nSmNUdPF := SumPF(n_TabN, cVidXX, bIsPPS, bIsPens, bIsInv, bIsSovm,
                                     dZaMG, dZaMG, nSmForPF, nSmSvPorog);
  nSmNUdSS := SumSS(n_TabN, cVidXX, dZaMG, dZaMG, nSmForSS, nSmSvPorog);
  nSmNUdFZ := SumFZ(n_TabN, cVidXX, dZaMG, dZaMG, nSmForFZ, nSmSvPorog);
  nSmNUdPN := SumPdN(n_TabN, dZaMG, nSmForPN, nSmNUdPF, nSmNUdSS, nSmNUdFZ);
  nSmNUdPrfs := SumPrfs(n_TabN, cVidXX, dZaMG, nSmForPrfs);
  nSmNUdPfPrp := SumPF_Prp(n_TabN, cVidXX, dZaMG, dZaMG, nSmForPF,
                                      nSmPorogPfPrp, nSmSvPorogPfPrpDB, nPrcPf);
  nSmNUdSsTvp := SumSS_TvpPrp(n_TabN, cVidXX, dZaMG, dZaMG, nSmForSsTvp,
                                   nSmPorogSsTvp, nSmSvPorogSsTvpDB, nPrcSsTvp);
  nSmNUdSsNv := SumSS_NvPrp(n_TabN, cVidXX, dZaMG, dZaMG, nSmForSsNv,
                                      nSmPorogSsNv, nSmSvPorogSsNvDB, nPrcSsNv);
  nSmNUdFzPrp := SumFZ_Prp(n_TabN, cVidXX, dZaMG, dZaMG, nSmForFzPrp,
                                   nSmPorogFzPrp, nSmSvPorogFzPrpDB, nPrcFzPrp);


  F6B_Head;
  with F6B do begin
    iRow := 1;
    Inc(iRow);
    TextRC[iRow, 1] := 'Удержания с сотрудника';
    SetSelection(iRow, 1, iRow, 5);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    FontBold := true;
    Inc(iRow);
    TextRC[iRow, 1] := 'В пенс.фонд';
    NumberRC[iRow, 2] := nSmForPF;
    NumberRC[iRow, 3] := nSmUdPF;
    NumberRC[iRow, 4] := nSmNUdPF;
    nRazn := nSmUdPF - nSmNUdPF;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    Inc(iRow);
    TextRC[iRow, 1] := 'В фонд СС';
    NumberRC[iRow, 2] := nSmForSS;
    NumberRC[iRow, 3] := nSmUdSS;
    NumberRC[iRow, 4] := nSmNUdSS;
    nRazn := nSmUdSS - nSmNUdSS;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    Inc(iRow);
    TextRC[iRow, 1] := 'В ФЗ';
    NumberRC[iRow, 2] := nSmForFZ;
    NumberRC[iRow, 3] := nSmUdFZ;
    NumberRC[iRow, 4] := nSmNUdFZ;
    nRazn := nSmUdFZ - nSmNUdFZ;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    Inc(iRow);
    TextRC[iRow, 1] := 'Подоходный налог';
    NumberRC[iRow, 2] := nSmForPN;
    NumberRC[iRow, 3] := nSmUdPN;
    NumberRC[iRow, 4] := nSmNUdPN;
    nRazn := nSmUdPN - nSmNUdPN;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    Inc(iRow);
    TextRC[iRow, 1] := 'Профс. взносы';
    NumberRC[iRow, 2] := nSmForPrfs;
    NumberRC[iRow, 3] := nSmUdPrfs;
    NumberRC[iRow, 4] := nSmNUdPrfs;
    nRazn := nSmUdPrfs - nSmNUdPrfs;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    Inc(iRow);
    TextRC[iRow, 1] := 'Взносы предприятия';
    SetSelection(iRow, 1, iRow, 5);
    FontColor := clTeal;
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    if not bIsInv then begin
      Inc(iRow);
      TextRC[iRow, 1] := 'В ПФ (' +
                            FloatToStrF(nPrcPf, ffFixed, 16, 2) + '%)';
      NumberRC[iRow, 2] := nSmForPfPrp;
      NumberRC[iRow, 3] := nSmUdPfPrp;
      NumberRC[iRow, 4] := nSmNUdPfPrp;
      nRazn := nSmUdPfPrp - nSmNUdPfPrp;
      NumberRC[iRow, 5] := RoundTo(nRazn, -2);
      SetSelection(iRow, 1, iRow, 5);
      FontColor := clTeal;
      SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
      SetSelection(iRow, 2, iRow, 5);
      FormatFixed2;
      SetSelection(iRow, 5, iRow, 5);
      FontBold := true;
      if nRazn < 0 then
        FontColor := clRed;
      Inc(iRow);
      TextRC[iRow, 1] := 'порог: ' +
                                    FloatToStrF(nSmPorogPfPrp, ffFixed, 16, 2);
      SetSelection(iRow, 1, iRow, 1);
      SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);
      NumberRC[iRow, 2] := nSmForPfPrp;
      NumberRC[iRow, 3] := nSmSvPorogPfPrpIs;
      NumberRC[iRow, 4] := nSmSvPorogPfPrpDB;
      nRazn := nSmSvPorogPfPrpIs - nSmSvPorogPfPrpDB;
      NumberRC[iRow, 5] := RoundTo(nRazn, -2);
      SetSelection(iRow, 1, iRow, 5);
      FontColor := clTeal;
      SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
      SetSelection(iRow, 2, iRow, 5);
      FormatFixed2;
      SetSelection(iRow, 5, iRow, 5);
      FontBold := true;
      if nRazn < 0 then
        FontColor := clRed;
      SetSelection(iRow-1, 1, iRow, 1);
      SetBorder(1, 0, 0, 0, 0, 0, clBlack,clBlack,clBlack,clBlack,clBlack); end
    else begin
      Inc(iRow);
      TextRC[iRow, 1] := 'В ПФ (инв. ' +
                          FloatToStrF(nPrcPf, ffFixed, 16, 2) + '%)';
      NumberRC[iRow, 2] := nSmForPfPrp;
      NumberRC[iRow, 3] := nSmUdPfInv;
      NumberRC[iRow, 4] := nSmNUdPfPrp;
      nRazn := nSmUdPfInv - nSmNUdPfPrp;
      NumberRC[iRow, 5] := RoundTo(nRazn, -2);
      SetSelection(iRow, 1, iRow, 5);
      FontColor := clTeal;
      SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
      SetSelection(iRow, 2, iRow, 5);
      FormatFixed2;
      SetSelection(iRow, 5, iRow, 5);
      FontBold := true;
      if nRazn < 0 then
        FontColor := clRed;
    end;
    Inc(iRow);
    TextRC[iRow, 1] := 'В ФсТВП (' +
                        FloatToStrF(nPrcSsTvp, ffFixed, 16, 2) + '%)';
    NumberRC[iRow, 2] := nSmForSsTvp;
    NumberRC[iRow, 3] := nSmUdSsTvp;
    NumberRC[iRow, 4] := nSmNUdSsTvp;
    nRazn := nSmUdssTvp - nSmNUdSsTvp;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    FontColor := clTeal;
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    Inc(iRow);
    TextRC[iRow, 1] := 'порог: ' +
                        FloatToStrF(nSmPorogSsTvp, ffFixed, 16, 2);
    SetSelection(iRow, 1, iRow, 1);
    SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);
    NumberRC[iRow, 2] := nSmForSsTvp;
    NumberRC[iRow, 3] := nSmSvPorogSsTvpIs;
    NumberRC[iRow, 4] := nSmSvPorogSsTvpDB;
    nRazn := nSmSvPorogSsTvpIs - nSmSvPorogSsTvpDB;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    FontColor := clTeal;
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    SetSelection(iRow-1, 1, iRow, 1);
    SetBorder(1, 0, 0, 0, 0, 0, clBlack,clBlack,clBlack,clBlack,clBlack);
    Inc(iRow);
    TextRC[iRow, 1] := 'В ФсНВ (' + FloatToStrF(nPrcSsNv, ffFixed, 16, 2) + ')';
    NumberRC[iRow, 2] := nSmForSsNv;
    NumberRC[iRow, 3] := nSmUdSsNv;
    NumberRC[iRow, 4] := nSmNUdSsNv;
    nRazn := nSmUdSsNv - nSmNUdSsNv;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    FontColor := clTeal;
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    Inc(iRow);
    TextRC[iRow, 1] := 'порог: ' + FloatToStrF(nSmPorogSsNv, ffFixed, 16, 2);
    SetSelection(iRow, 1, iRow, 1);
    SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);
    NumberRC[iRow, 2] := nSmForSsNv;
    NumberRC[iRow, 3] := nSmSvPorogSsNvIs;
    NumberRC[iRow, 4] := nSmSvPorogSsNvDB;
    nRazn := nSmSvPorogSsNvIs - nSmSvPorogSsNvDB;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    FontColor := clTeal;
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    SetSelection(iRow-1, 1, iRow, 1);
    SetBorder(1, 0, 0, 0, 0, 0, clBlack,clBlack,clBlack,clBlack,clBlack);
    Inc(iRow);
    TextRC[iRow, 1] := 'В ФЗ (' + FloatToStrF(nPrcFzPrp, ffFixed, 16, 2) + '%)';
    NumberRC[iRow, 2] := nSmForFzPrp;
    NumberRC[iRow, 3] := nSmUdFzPrp;
    NumberRC[iRow, 4] := nSmNUdFzPrp;
    nRazn := nSmUdFzPrp - nSmNUdFzPrp;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    FontColor := clTeal;
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    Inc(iRow);
    TextRC[iRow, 1] := 'порог: ' + FloatToStrF(nSmPorogFzPrp, ffFixed, 16, 2);
    SetSelection(iRow, 1, iRow, 1);
    SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);
    NumberRC[iRow, 2] := nSmForFzPrp;
    NumberRC[iRow, 3] := nSmSvPorogFzPrpIs;
    NumberRC[iRow, 4] := nSmSvPorogFzPrpDB;
    nRazn := nSmSvPorogFzPrpIs - nSmSvPorogFzPrpDB;
    NumberRC[iRow, 5] := RoundTo(nRazn, -2);
    SetSelection(iRow, 1, iRow, 5);
    FontColor := clTeal;
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
    SetSelection(iRow, 2, iRow, 5);
    FormatFixed2;
    SetSelection(iRow, 5, iRow, 5);
    FontBold := true;
    if nRazn < 0 then
      FontColor := clRed;
    SetSelection(iRow-1, 1, iRow, 1);
    SetBorder(1, 0, 0, 0, 0, 0, clBlack,clBlack,clBlack,clBlack,clBlack);
    SetSelection(iRow+1, 1, iRow+1, 1);
  end;
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.SumPF(nTabN : integer; var cVidN : string4;
                              var bIsPPS, bIsPens, bIsInv, bIsSovm : boolean;
                                    dZaMG, dRMes : TDateTime; nSmForXX : double;
                                              var nSmSvPorog : double) : double;
var nSmConst, nPrc, nSmPorog, nMaxPorog : double;
    dDt2007_01_01 : TDateTime;
begin
  bIsPPS  := nKdKatP = 1;
  bIsInv  := nInv >= 1;
  if bIsPPS then begin   // ППС (по шкале)
    DmMain.GetShkPps(dZaMG, nSmForXX, nSmConst, nPrc, nSmPorog, nMaxPorog,
                                                                        cVidN);
    nSmSvPorog := nSmForXX - nMaxPorog;
    Result := RoundTo(nSmConst + nPrc * (nSmForXX - nSmPorog) / 100, -2); end
  else begin
    dDt2007_01_01 := EncodeDate(2007, 1, 1);
    DmMain.GetShkNePps(dZaMG, nSmForXX, nSmConst, nPrc, nSmPorog, nMaxPorog,
                                                                        cVidN);
    nSmSvPorog := nSmForXX - nMaxPorog;
    if dZaMG < dDt2007_01_01 then
      Result := RoundTo(nSmConst + nPrc * nSmForXX / 100, -2)
    else
      Result := RoundTo(nSmConst + nPrc * (nSmForXX - nSmPorog) / 100, -2);
  end;
  if nSmSvPorog < 0 then
    nSmSvPorog := 0;
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.SumPF_Prp(nTabN : integer; var cVidN : ShortString;
                                    dZaMG, dRMes : TDateTime; nSmForXX : double;
                         var nSmPorog, nSmSvPorog, nPrcPfFakt : double) : double;
var bIsInv : boolean;
    nPrcPfCmn, nPrcPfInv, nPrcSsBln, nPrcSsNsl, nPrcFz, nPrcFz1006 : double;
begin
  nSmSvPorog := 0;
  DmMain.GetPrpInfo(dRMes, nPrcPfCmn, nPrcPfInv, nPrcSsBln, nPrcSsNsl,
                                                           nPrcFz, nPrcFz1006);
  DmMain.GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
          nProgMinCM, nPorogLg, nProcLg, nSm2660, nSmLg100, nSmLg150, nSmLg200);
  nSmPorog := nSm2660;
  bIsInv := nInv >= 1;
  if not bIsInv then begin   // не инвалид
    cVidN := '8611';
    if nSmForXX > nSm2660 then begin
      nSmSvPorog := nSmForXX - nSm2660;
      nSmForXX := nSm2660;
      nSmPorog := nSm2660;
    end;
    Result := RoundTo(nSmForXX * nPrcPfCmn / 100, -2);
    nPrcPfFakt := nPrcPfCmn; end
  else begin                 // инвалид
    cVidN := '8612';
    Result := RoundTo(nSmForXX * nPrcPfInv / 100, -2);
    nPrcPfFakt := nPrcPfInv;
  end;
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.SumSS(nTabN : integer; var cVidN : string4;
                                   dZaMG, dRMes : TDateTime; nSmForXX : double;
                                              var nSmSvPorog : double) : double;
begin
  // Определить nProgMinNG (прож.минимум на начало года) и
  // nSm2660 (сумма порога "СмПфМах" в таблице z_TPdn) на dRMes
  nSmSvPorog := 0;
  DmMain.GetPdnInfo(dRMes, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
          nProgMinCM, nPorogLg, nProcLg, nSm2660, nSmLg100, nSmLg150, nSmLg200);
  if nSmForXX <= nProgMinCM then begin
    Result := RoundTo(0.005 * nSmForXX, -2);
    cVidN := '6303'; end
  else begin
    if (nSm2660 <> 0) and (nSmForXX > nSm2660) then begin
      nSmSvPorog := nSmForXX - nSm2660;
      nSmForXX := nSm2660;
    end;
    Result := RoundTo(0.01 * nSmForXX, -2);
    cVidN := '6304';
  end;
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.SumSS_TvpPrp(nTabN : integer; var cVidN : string4;
                                   dZaMG, dRMes : TDateTime; nSmForXX : double;
                        var nSmPorog, nSmSvPorog, nPrcSsTvp : double) : double;
var nPrcPfCmn, nPrcPfInv, nPrcSsNv, nPrcFz, nPrcFz1006 : double;
begin
  nSmSvPorog := 0;
  DmMain.GetPrpInfo(dZaMG, nPrcPfCmn, nPrcPfInv, nPrcSsTvp,
                                                  nPrcSsNv, nPrcFz, nPrcFz1006);
  DmMain.GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
          nProgMinCM, nPorogLg, nProcLg, nSm2660, nSmLg100, nSmLg150, nSmLg200);
  cVidN := '8621';
  nSmPorog := nSm2660;
  if nSmForXX > nSm2660 then begin
    nSmSvPorog := nSmForXX - nSm2660;
    nSmForXX := nSmPorog;
  end;
  Result := RoundTo(nSmForXX * nPrcSsTvp / 100, -2);
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.SumSS_NvPrp(nTabN : integer; var cVidN : string4;
                                  dZaMG, dRMes : TDateTime; nSmForXX : double;
                       var nSmPorog, nSmSvPorog, nPrcSsNv : double) : double;
var nPrcPfCmn, nPrcPfInv, nPrcSsTvp, nPrcFz, nPrcFz1006 : double;
begin
  nSmSvPorog := 0;
  nPrcSsNv := 0;
  DmMain.GetPrpInfo(dZaMG, nPrcPfCmn, nPrcPfInv, nPrcSsTvp,
                                                  nPrcSsNv, nPrcFz, nPrcFz1006);
  DmMain.GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
          nProgMinCM, nPorogLg, nProcLg, nSm2660, nSmLg100, nSmLg150, nSmLg200);
  cVidN := '8631';
  nSmPorog := nSm2660;
  if nSmForXX > nSm2660 then begin
    nSmSvPorog := nSmForXX - nSm2660;
    nSmForXX := nSmPorog;
  end;
  Result := RoundTo(nSmForXX * nPrcSsNv / 100, -2);
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.SumFZ(nTabN : integer; var cVidN : string4;
                           dZaMG, dRMes : TDateTime;
                           nSmForXX : double; var nSmSvPorog : double) : double;
var bInvalid, bPensioner : boolean; dDt07_01_01 : TDateTime;
begin
  dDt07_01_01 := EncodeDate(2007, 1, 1);
  // Сменился порядок удержания:
  // до 01-01-2007 было if (not bInvalid and not bPensioner)
  // с 01-01-2007 стало if not bPensioner (т.е. с инв. не пенсю удерживать
  Result := 0;
  nSmSvPorog := 0;
  bInvalid := nInv >= 1;
  bPensioner := bIsPens;
  if ((dZaMG >= dDt07_01_01) and not bPensioner) or
        ((dZaMG < dDt07_01_01) and not bInvalid and not bPensioner) then begin
    // Определить nSm2660 (сумма порога "СмПфМах" в таблице z_TPdn) на dZaMG
    DmMain.GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
           nProgMinCM, nPorogLg, nProcLg, nSm2660, nSmLg100,nSmLg150, nSmLg200);
    if (nSm2660 <> 0) and (nSmForXX > nSm2660) then begin
      nSmSvPorog := nSmForXX - nSm2660;
      nSmForXX := nSm2660;
    end;
    cVidN := '6501';  // Удержание ф Фонд занятости
    Result := RoundTo(0.005 * nSmForXX, -2);
  end;
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.SumFZ_Prp(nTabN : integer; var cVidN : string4;
                                dZaMG, dRMes : TDateTime; nSmForXX : double;
                        var nSmPorog, nSmSvPorog, nPrcFz : double) : double;
var nPrcPfCmn, nPrcPfInv, nPrcSsTvp, nPrcSsNv, nPrcFz1006 : double;
begin
  nSmSvPorog := 0;
  // инвалидность и пенсионер'ность тут не проходят - начисляется на всех
  // Определить nSm2660 (сумма порога "СмПфМах" в таблице z_TPdn) на dRMes
  DmMain.GetPrpInfo(dZaMG, nPrcPfCmn, nPrcPfInv, nPrcSsTvp, nPrcSsNv,
                                                            nPrcFz, nPrcFz1006);
  DmMain.GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
          nProgMinCM, nPorogLg, nProcLg, nSm2660, nSmLg100, nSmLg150, nSmLg200);
  cVidN := '8641';
  nSmPorog := nSm2660;
  if nSmForXX > nSm2660 then begin
    nSmSvPorog := nSmForXX - nSm2660;
    nSmForXX := nSmPorog;
  end;
  Result := RoundTo(nSmForXX * nPrcFz / 100, -2);
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.SumPdN(nTabN : integer; dZaMG : TDateTime;
                      nSmForPN, nSmNUdPF, nSmNUdSS, nSmNUdFZ : double) : double;
var
    {nSmForXX,} nSmLg : double;
    {dDtEndZaMG : TDateTime;}
//    cZaMG : ShortString;
    //nKdSps, nKdObj, nKdKatP, nKdSpZ, nPRR : integer;
begin
  Result := 0;
  if nSmForPN > 0 then begin
    // Определить необходимые параметры в таблице z_TPdn) на dRMes
    DmMain.GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
                                    nProgMinCM, nPorogLg, nProcLg, nSm2660,
                                    nSmLg100,nSmLg150, nSmLg200);
    // Если уволен или уволился в расчетном месяце - льгота не применяется
    if not bIsUvoln and {not bIsSovm and}
                { Теперь льготу давать и совместителям Е.Д. 15-11-2006}
                                 (nSmForPN < nPorogLg) then begin
      //nPereProcLg := nProcLgCM;
      nSmLg := nSmLg100 * nPereProcLg / 100;
      nSmForPN := nSmForPN - nSmLg;
    end;
    if nSmForPN < 0 then
      nSmForPN := 0;
    // Уменьшаем сумму для расчета ПДН на сумму удержаний в ПФ, БЗР и СС
    nSmForPN := nSmForPN - (nSmNUdPF + nSmNUdFZ + nSmNUdSS);
    if nSmForPN < 0 then
      nSmForPN := 0;
    if nSmForPN > 0 then
      Result := RoundTo((nPrcPdn/100 {0.15} * nSmForPN), -2);
  end;
end;
//------------------------------------------------------------------------------
function TFormChkNuZaMG.SumPrfs(nTabN : integer; var cVidN : string4;
                                 dZaMG : TDateTime; nSmForXX : double) : double;
begin
  Result := 0;
  if bIsProfs then begin
    cVidN := '6021';
    Result := RoundTo(0.01 * nSmForXX, -2);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.F6B_Head;
var iRow, {iCol,} nMyConst : SmallInt;
begin
  with F6B do begin
    ShowGridLines    := false;
    ShowColHeading   := true;
    ShowRowHeading   := true;
    nMyConst := RowHeight[2];
    ColWidth[1] := Round(18 * nMyConst);
    ColWidth[2] := Round(12 * nMyConst);
    ColWidth[3] := Round(12 * nMyConst);
    ColWidth[4] := Round(12 * nMyConst);
    ColWidth[5] := Round(12 * nMyConst);;
    iRow := 1;
    TextRC[iRow, 1] := 'Наименование удержания';
    TextRC[iRow, 2] := 'Сумма для расчета';
    TextRC[iRow, 3] := 'Сумма в базе данных';
    TextRC[iRow, 4] := 'Должно быть';
    TextRC[iRow, 5] := 'Перебор(+) Недобор(-)';
    RowHeight[iRow] := Round(2.5 * nMyConst);;
    SetSelection(iRow, 1, iRow, 5);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.sBtnCtrlClick(Sender: TObject);
begin
//  DoControl;
  PanelRT.Enabled := false;
  sBtnCtrl.Visible := false;
  sBtnGoBack.Visible := true;
  PageControl1.ActivePage := ts2;
  ActiveControl := F6B;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.sBtnGoBackClick(Sender: TObject);
begin
  PanelRT.Enabled := true;
  sBtnGoBack.Visible := false;
  sBtnCtrl.Visible := true;
  PageControl1.ActivePage := ts1;
  ActiveControl := dbgrNu;
end;
//------------------------------------------------------------------------------
procedure TFormChkNuZaMG.qryNuSPFldGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsInteger = 0)) then
    Text := ''
  else
    Text := (Sender as TField).AsString;
end;

end.
