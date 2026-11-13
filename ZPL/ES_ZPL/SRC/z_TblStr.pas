unit z_TblStr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids,
  Menus, DB, DBTables;

type
  TFormTabsUdrg = class(TForm)
    PageControl1: TPageControl;
    tsPdnDo2004: TTabSheet;
    tsCmb2004: TTabSheet;
    tsShkPPS: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    PanelPdnDo2004: TPanel;
    PanelLeft: TPanel;
    Splitter1: TSplitter;
    dbgrPdnMes: TDBGrid;
    dbgrPdN: TDBGrid;
    PanelShkPps: TPanel;
    Panel2: TPanel;
    Splitter2: TSplitter;
    dbgrPpsMes: TDBGrid;
    dbgrPps: TDBGrid;
    PanelMsgPdnDo2004: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    PanelMsgPps: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    PanelAfterAddTbl: TPanel;
    sBtnBuSdelano: TSpeedButton;
    Memo1: TMemo;
    PanelAfterAddPps: TPanel;
    SpeedButton5: TSpeedButton;
    Memo2: TMemo;
    dbgrTPdn: TDBGrid;
    MemoHlp: TMemo;
    Splitter3: TSplitter;
    dsrcTPdn: TDataSource;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    qryPdnMes: TQuery;
    qryPdnMesDTPROC: TDateTimeField;
    qryPdnMesMesGod: TStringField;
    dsrcPdnMes: TDataSource;
    qryPdN: TQuery;
    qryPdNNR: TIntegerField;
    qryPdNDTPROC: TDateTimeField;
    qryPdNPOROG: TFloatField;
    qryPdNSMM: TFloatField;
    qryPdNPRC: TFloatField;
    dsrcPdN: TDataSource;
    qryPpsMes: TQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    dsrcPpsMes: TDataSource;
    qryPps: TQuery;
    qryPpsNR: TIntegerField;
    qryPpsDTPROC: TDateTimeField;
    qryPpsPOROG: TFloatField;
    qryPpsSMM: TFloatField;
    qryPpsPRC: TFloatField;
    dsrcPps: TDataSource;
    popMnu: TPopupMenu;
    popMnuHead: TMenuItem;
    popAddMes: TMenuItem;
    popDelMes: TMenuItem;
    popMnuEdt: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuDel: TMenuItem;
    qryTmp: TQuery;
    qry2Tmp: TQuery;
    popHead: TMenuItem;
    tsShkNePPS: TTabSheet;
    tsSocStrahBln: TTabSheet;
    tsBZR: TTabSheet;
    LabelActivePage: TLabel;
    PanelShkNePps: TPanel;
    Panel4: TPanel;
    Splitter4: TSplitter;
    dbgrNePpsMes: TDBGrid;
    dbgrNePpsPF: TDBGrid;
    PanelMsgNePps: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    PanelAfterAddNePps: TPanel;
    SpeedButton1: TSpeedButton;
    Memo3: TMemo;
    qryNePpsMes: TQuery;
    qryNePpsMesDTPROC: TDateTimeField;
    qryNePpsMesMesGod: TStringField;
    dsrcNePpsMes: TDataSource;
    qryNePpsPF: TQuery;
    qryNePpsPFNR: TIntegerField;
    qryNePpsPFDTPROC: TDateTimeField;
    qryNePpsPFPOROG: TFloatField;
    qryNePpsPFSMM: TFloatField;
    qryNePpsPFPRC: TFloatField;
    dsrcNePpsPF: TDataSource;
    PanelMsgSS: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    PanelMsgFZ: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label34: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure qryPdnMesCalcFields(DataSet: TDataSet);
    procedure popMnuPopup(Sender: TObject);
    procedure qryPpsMesCalcFields(DataSet: TDataSet);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuAddClick(Sender: TObject);
    procedure popAddMesClick(Sender: TObject);
    procedure sBtnBuSdelanoClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure popDelMesClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure dbgrTPdnDblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qryNePpsMesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    bWasAddUpdPdN, bWasAddUpdPps, bWasAddUpdNePPS : boolean;
    procedure SetLabelActivePageCaption;
  public
    { Public declarations }
  end;

procedure ShowTabsUderg(dDtProc : TDateTime);

const SECTION = 'z_TbUdrg';

var
  FormTabsUdrg: TFormTabsUdrg;

implementation

uses A_Const, A_DM, Z_DM, A_Lib, A_GtGdMs, Z_EPdN, z_ETblPN;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowTabsUderg(dDtProc : TDateTime);
var nGod, nMes, nDay : word;
begin
  FormTabsUdrg := TFormTabsUdrg.Create(Application);
  with FormTabsUdrg do begin
    d_DtProc := dDtProc;
    bWasAddUpdPdN := false;
    bWasAddUpdPPS := false;
    bWasAddUpdNePPS := false;
    DecodeDate(dDtProc, nGod, nMes, nDay);
    Caption := 'Таблицы разных удержаний';
    qryPdnMes.Open;
    qryPdnMes.Last;
    qryPdN.Open;
    if not DmMain.qryTPdn.Active then
      DmMain.qryTPdn.Open;
    DmMain.qryTPdn.Last;
    qryPpsMes.Open;
    qryPpsMes.Last;
    qryPps.Open;
    qryNePpsMes.Open;
    qryNePpsMes.Last;
    qryNePpsPF.Open;
    qryNePpsPF.Last;
    ShowModal;
    if bWasAddUpdPdN then
      DmMain.CreOpenCdsPdN;
    if bWasAddUpdPPS then
      DmMain.CreOpenCdsShkPPS;
//    if bWasAddUpdNePPS then
//      DmMain.CreOpenCdsShkPPS;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.FormCreate(Sender: TObject);
var nSvTab : word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 525);
    Width  := ReadInteger(SECTION, 'wW', 625);
    nSvTab := ReadInteger(SECTION, 'nSvTab', 0);
    dbgrPdn.Height := ReadInteger(SECTION, 'dGrPdnH', 205);
    dbgrPps.Height := ReadInteger(SECTION, 'dGrPpsH', 205);
    MemoHlp.Height := ReadInteger(SECTION, 'MemHlpH', 116);
    Free;
  end;
  if nSvTab = 0 then
    PageControl1.ActivePage := tsCmb2004
  else if nSvTab = 1 then
    PageControl1.ActivePage := tsShkPPS
  else if nSvTab = 2 then
    PageControl1.ActivePage := tsShkNePPS
  else if nSvTab = 3 then
    PageControl1.ActivePage := tsSocStrahBln
  else if nSvTab = 4 then
    PageControl1.ActivePage := tsBZR
  else if nSvTab = 5 then
    PageControl1.ActivePage := tsPdnDo2004;
  SetLabelActivePageCaption;
  if FileExists(cDirVids + 'tbuPdn.vid') then
    dbgrPdn.Columns.LoadFromFile(cDirVids + 'tbuPdn.vid');
  if FileExists(cDirVids + 'tbu_TPdn.vid') then
    dbgrTPdn.Columns.LoadFromFile(cDirVids + 'tbu_TPdn.vid');
  if FileExists(cDirVids + 'tbuPps.vid') then
    dbgrPps.Columns.LoadFromFile(cDirVids + 'tbuPps.vid');
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.PageControl1Change(Sender: TObject);
begin
  SetLabelActivePageCaption;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.SetLabelActivePageCaption;
begin
  if PageControl1.ActivePage = tsCmb2004 then begin
    LabelActivePage.Caption := 'Контрольные цифры (начиная с 2004 г.)';
    if dsrcTPdn.DataSet.Active then
      dsrcTPdn.DataSet.Last; end
  else if PageControl1.ActivePage = tsShkPPS then begin
    LabelActivePage.Caption := 'Шкала удержаний в пенсионный фонд для ППС';
    if qryPpsMes.Active then
      qryPpsMes.Last; end
  else if PageControl1.ActivePage = tsShkNePPS then begin
    LabelActivePage.Caption := 'Шкала удержаний в пенсионный фонд для ' +
                                                         'всех, кроме ППС';
    if qryNePpsMes.Active then
      qryNePpsMes.Last; end
  else if PageControl1.ActivePage = tsSocStrahBln then
    LabelActivePage.Caption := 'Шкала удержаний в соцстрах на утрату ' +
                                                        'трудоспособности'
  else if PageControl1.ActivePage = tsBZR then
    LabelActivePage.Caption := 'Шкала удержаний в соцстрах на потерю работы'
  else begin
    LabelActivePage.Caption := 'Шкалы подоходного налога (до 2004 г.)';
    if qryPdnMes.Active then
      qryPdnMes.Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.FormClose(Sender: TObject; var Action: TCloseAction);
var nSvTab : word;
begin
  dbgrPdn.Columns.SaveToFile(cDirVids + 'tbuPdn.vid');
  dbgrTPdn.Columns.SaveToFile(cDirVids + 'tbu_TPdn.vid');
  dbgrPps.Columns.SaveToFile(cDirVids + 'tbuPps.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if PageControl1.ActivePage = tsCmb2004 then
      nSvTab := 0
    else if PageControl1.ActivePage = tsShkPPS then
      nSvTab := 1
    else if PageControl1.ActivePage = tsShkNePPS then
      nSvTab := 2
    else if PageControl1.ActivePage = tsSocStrahBln then
      nSvTab := 3
    else if PageControl1.ActivePage = tsBZR then
      nSvTab := 4
    else
      nSvTab := 5;
    WriteInteger(SECTION, 'nSvTab', nSvTab);
    WriteInteger(SECTION, 'dGrPdnH', dbgrPdn.Height);
    WriteInteger(SECTION, 'dGrPpsH', dbgrPps.Height);
    WriteInteger(SECTION, 'MemHlpH', MemoHlp.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.FormResize(Sender: TObject);
begin
  PanelPdnDo2004.Left := Round((tsShkPPS.Width - PanelPdnDo2004.Width) / 2);
  PanelPdnDo2004.Top := Round((tsShkPPS.Height - PanelPdnDo2004.Height) / 2);
  PanelShkPps.Left := Round((tsShkPPS.Width - PanelShkPps.Width) / 2);
  PanelShkPps.Top := Round((tsShkPPS.Height - PanelShkPps.Height) / 2);
  PanelShkNePps.Left := Round((tsShkPPS.Width - PanelShkNePps.Width) / 2);
  PanelShkNePps.Top := Round((tsShkPPS.Height - PanelShkNePps.Height) / 2);
  PanelMsgSS.Left := Round((tsShkPPS.Width - PanelMsgSS.Width) / 2);
  PanelMsgSS.Top := Round((tsShkPPS.Height - PanelMsgSS.Height) / 2);
  PanelMsgFZ.Left := Round((tsShkPPS.Width - PanelMsgFZ.Width) / 2);
  PanelMsgFZ.Top := Round((tsShkPPS.Height - PanelMsgFZ.Height) / 2);
  PanelAfterAddPps.Left :=
                       Round((PanelShkPps.Width - PanelAfterAddPps.Width) / 2);
  PanelAfterAddPps.Top :=
                     Round((PanelShkPps.Height - PanelAfterAddPps.Height) / 2);
  PanelAfterAddNePps.Left :=
                     Round((PanelShkNePps.Width - PanelAfterAddPps.Width) / 2);
  PanelAfterAddNePps.Top :=
                   Round((PanelShkNePps.Height - PanelAfterAddPps.Height) / 2);
  PanelAfterAddTbl.Left :=
                       Round((PanelShkPps.Width - PanelAfterAddPps.Width) / 2);
  PanelAfterAddTbl.Top :=
                     Round((PanelShkPps.Height - PanelAfterAddPps.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.qryPdnMesCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  with qryPdnMes do begin
    DecodeDate(FieldByName('DtProc').AsDateTime, nY, nM, nD);
    FieldByName('MesGod').AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.qryPpsMesCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  with qryPpsMes do begin
    DecodeDate(FieldByName('DtProc').AsDateTime, nY, nM, nD);
    FieldByName('MesGod').AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.qryNePpsMesCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  with qryNePpsMes do begin
    DecodeDate(FieldByName('DtProc').AsDateTime, nY, nM, nD);
    FieldByName('MesGod').AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.popMnuPopup(Sender: TObject);
begin
  if popMnu.PopupComponent = dbgrPdnMes then begin
    popMnuHead.Caption := '== Месяцы ==';
    popAddMes.Visible := true;
    popDelMes.Visible := true;
    popMnuEdt.Visible := false;
    popMnuAdd.Visible := false;
    popMnuDel.Visible := false;
    popDelMes.Enabled := qryPdnMes.Active and (qryPdnMes.RecordCount <> 0); end
  else if popMnu.PopupComponent = dbgrPdN then begin
    popMnuHead.Caption := '== ' +
                        qryPdnMes.FieldByName('MesGod').asString + ' ==';
    popAddMes.Visible := false;
    popDelMes.Visible := false;
    popMnuEdt.Visible := true;
    popMnuAdd.Visible := true;
    popMnuDel.Visible := true;
    popMnuEdt.Enabled := dsrcPdn.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled; end
  else if popMnu.PopupComponent = dbgrPpsMes then begin
    popMnuHead.Caption := '== Месяцы ==';
    popAddMes.Visible := true;
    popDelMes.Visible := true;
    popMnuEdt.Visible := false;
    popMnuAdd.Visible := false;
    popMnuDel.Visible := false;
    popDelMes.Enabled := qryPpsMes.Active and (qryPpsMes.RecordCount <> 0); end
  else if popMnu.PopupComponent = dbgrPps then begin
    popMnuHead.Caption := '== ' +
                        qryPpsMes.FieldByName('MesGod').asString + ' ==';
    popAddMes.Visible := false;
    popDelMes.Visible := false;
    popMnuEdt.Visible := true;
    popMnuAdd.Visible := true;
    popMnuDel.Visible := true;
    popMnuEdt.Enabled := dsrcPps.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled; end
  else if popMnu.PopupComponent = dbgrNePpsMes then begin
    popMnuHead.Caption := '== Месяцы ==';
    popAddMes.Visible := true;
    popDelMes.Visible := true;
    popMnuEdt.Visible := false;
    popMnuAdd.Visible := false;
    popMnuDel.Visible := false;
    popDelMes.Enabled := qryNePpsMes.Active and (qryNePpsMes.RecordCount <> 0); end
  else if popMnu.PopupComponent = dbgrNePpsPF then begin
    popMnuHead.Caption := '== ' +
                        qryNePpsMes.FieldByName('MesGod').asString + ' ==';
    popAddMes.Visible := false;
    popDelMes.Visible := false;
    popMnuEdt.Visible := true;
    popMnuAdd.Visible := true;
    popMnuDel.Visible := true;
    popMnuEdt.Enabled := dsrcNePpsPF.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.popMnuEdtClick(Sender: TObject);
var nPorog, nSmm, nPrc : double; nEdtNR : integer;
begin
  if popMnu.PopupComponent = dbgrPdn then begin
    with dsrcPdN.DataSet do begin
      nEdtNR := FieldByName('NR').asInteger;
      nPorog := FieldByName('Porog').asFloat;
      nSmm   := FieldByName('Smm').asFloat;
      nPrc   := FieldByName('Prc').asFloat;
    end;
    if EdtRecPdN(nPorog, nSmm, nPrc, 1) then begin     {Z_EPdN}
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Update Z_TblPdN set porog = :nPorog, ' +
                ' smm = :nSmm, prc = :nPrc where NR = :nEdtNR');
        ParamByName('nPorog').asFloat := nPorog;
        ParamByName('nSmm').asFloat := nSmm;
        ParamByName('nPrc').asFloat := nPrc;
        ParamByName('nEdtNR').asInteger := nEdtNR;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dsrcPdN.DataSet do begin
        Close;
        Open;
        Locate('NR', nEdtNR, []);
      end;
      bWasAddUpdPdN := true;
      Screen.Cursor := crDefault;
    end; end
  else if popMnu.PopupComponent = dbgrPps then begin
    with dsrcPps.DataSet do begin
      nEdtNR := FieldByName('NR').asInteger;
      nPorog := FieldByName('Porog').asFloat;
      nSmm   := FieldByName('Smm').asFloat;
      nPrc   := FieldByName('Prc').asFloat;
    end;
    if EdtRecPdN(nPorog, nSmm, nPrc, 2) then begin     {Z_EPdN}
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Update Z_TblPps set porog = :nPorog, ' +
                ' smm = :nSmm, prc = :nPrc where NR = :nEdtNR');
        ParamByName('nPorog').asFloat := nPorog;
        ParamByName('nSmm').asFloat := nSmm;
        ParamByName('nPrc').asFloat := nPrc;
        ParamByName('nEdtNR').asInteger := nEdtNR;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dsrcPps.DataSet do begin
        Close;
        Open;
        Locate('NR', nEdtNR, []);
      end;
      bWasAddUpdPPS := true;
      Screen.Cursor := crDefault;
    end; end
  else if popMnu.PopupComponent = dbgrNePpsPF then begin
    with dsrcNePpsPF.DataSet do begin
      nEdtNR := FieldByName('NR').asInteger;
      nPorog := FieldByName('Porog').asFloat;
      nSmm   := FieldByName('Smm').asFloat;
      nPrc   := FieldByName('Prc').asFloat;
    end;
    if EdtRecPdN(nPorog, nSmm, nPrc, 3) then begin     {Z_EPdN}
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Update Z_TblPF set porog = :nPorog, ' +
                ' smm = :nSmm, prc = :nPrc where NR = :nEdtNR');
        ParamByName('nPorog').asFloat := nPorog;
        ParamByName('nSmm').asFloat := nSmm;
        ParamByName('nPrc').asFloat := nPrc;
        ParamByName('nEdtNR').asInteger := nEdtNR;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dsrcNePpsPF.DataSet do begin
        Close;
        Open;
        Locate('NR', nEdtNR, []);
      end;
      bWasAddUpdNePPS := true;
      Screen.Cursor := crDefault;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.popMnuAddClick(Sender: TObject);
var nPorog, nSmm, nPrc : double; dDtProc : TDateTime;
begin
  if popMnu.PopupComponent = dbgrPdn then begin
    if AddRecPdN(nPorog, nSmm, nPrc, 1) then begin     {Z_EPdN}
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      dDtProc := qryPdnMes.FieldByName('DtProc').AsDateTime;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Insert into Z_TblPdN ' +
                ' (DtProc, Porog, Smm, Prc) ' +
                ' values (:dDtProc, :nPorog, :nSmm, :nPrc)');
        ParamByName('dDtProc').AsDateTime := dDtProc;
        ParamByName('nPorog').AsFloat := nPorog;
        ParamByName('nSmm').AsFloat := nSmm;
        ParamByName('nPrc').AsFloat := nPrc;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dsrcPdN.DataSet do begin
        Close;
        Open;
        Locate('POROG;SMM;PRC', VarArrayOf([nPorog, nSmm, nPrc]), []);
      end;
      bWasAddUpdPdN := true;
      Screen.Cursor := crDefault;
    end; end
  else if popMnu.PopupComponent = dbgrPps then begin
    if AddRecPdN(nPorog, nSmm, nPrc, 2) then begin     {Z_EPdN}
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      dDtProc := qryPpsMes.FieldByName('DtProc').AsDateTime;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Insert into Z_TblPps ' +
                ' (DtProc, Porog, Smm, Prc) ' +
                ' values (:dDtProc, :nPorog, :nSmm, :nPrc)');
        ParamByName('dDtProc').AsDateTime := dDtProc;
        ParamByName('nPorog').AsFloat := nPorog;
        ParamByName('nSmm').AsFloat := nSmm;
        ParamByName('nPrc').AsFloat := nPrc;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dsrcPps.DataSet do begin
        Close;
        Open;
        Locate('POROG;SMM;PRC', VarArrayOf([nPorog, nSmm, nPrc]), []);
      end;
      bWasAddUpdPPS := true;
      Screen.Cursor := crDefault;
    end; end
  else if popMnu.PopupComponent = dbgrNePpsPF then begin
    if AddRecPdN(nPorog, nSmm, nPrc, 3) then begin     {Z_EPdN}
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      dDtProc := qryNePpsMes.FieldByName('DtProc').AsDateTime;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Insert into Z_TblPF ' +
                ' (DtProc, Porog, Smm, Prc) ' +
                ' values (:dDtProc, :nPorog, :nSmm, :nPrc)');
        ParamByName('dDtProc').AsDateTime := dDtProc;
        ParamByName('nPorog').AsFloat := nPorog;
        ParamByName('nSmm').AsFloat := nSmm;
        ParamByName('nPrc').AsFloat := nPrc;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dsrcNePpsPF.DataSet do begin
        Close;
        Open;
        Locate('POROG;SMM;PRC', VarArrayOf([nPorog, nSmm, nPrc]), []);
      end;
      bWasAddUpdNePPS := true;
      Screen.Cursor := crDefault;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.popAddMesClick(Sender: TObject);
var nGod, nMes, nD : word;  dNeedDtProc, dIsDtProc : TDateTime;
    dSvDtProc : TDateTime;
begin
  if popMnu.PopupComponent = dbgrPdnMes then begin
    dIsDtProc := 0;
    DecodeDate(qryPdnMes.FieldByName('DtProc').AsDateTime, nGod, nMes, nD);
    if VvodGodMes(nGod, nMes) and
        (MessageDlg('Добавить заготовку таблицы за ' +
                     MesRus(nMes) + IntToStr(nGod) + ' г.?:',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      Application.ProcessMessages;
      // Определить из записей какого месяца делать копирование
      dNeedDtProc := EncodeDate(nGod, nMes, 1);
      with qryPdnMes do begin
        dSvDtProc := FieldByName('DtProc').AsDateTime;
        DisableControls;
        First;
        while not Eof do begin
          dIsDtProc := FieldByName('DtProc').AsDateTime;
          Next;
          if FieldByName('DtProc').AsDateTime >= dNeedDtProc then
            Break;
        end;
        Locate('DtProc', dSvDtProc, []);
        EnableControls;
      end;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := qryPdnMes.DataBaseName;
        SQL.Add('Select * from Z_TblPdN where DtProc = :dDtProc');
        ParamByName('dDtProc').AsDateTime := dIsDtProc;
        Open;
        if qry2Tmp.Active then qry2Tmp.Close;
        qry2Tmp.SQL.Clear;
        qry2Tmp.DataBaseName := DataBaseName;
        qry2Tmp.SQL.Add('Insert into Z_TblPdN ' +
                        ' (DtProc, Porog, Smm, Prc) '  +
                        ' values(:dDtProc, :nPorog, :nSmm, :nPrc)');
        qry2Tmp.Prepare;
        First;
        while not Eof do begin
          qry2Tmp.ParamByName('dDtProc').AsDateTime := dNeedDtProc;
          qry2Tmp.ParamByName('nPorog').AsFloat := FieldByName('Porog').asFloat;
          qry2Tmp.ParamByName('nSmm').AsFloat := FieldByName('Smm').asFloat;
          qry2Tmp.ParamByName('nPrc').AsFloat := FieldByName('Prc').asFloat;
          qry2Tmp.ExecSQL;
          Next;
        end;
        PanelAfterAddTbl.Visible := true;
        qry2Tmp.Close;
        qry2Tmp.SQL.Clear;
        qry2Tmp.DataBaseName := '';
        qry2Tmp.UnPrepare;
        Close;
        SQL.Clear;
        DataBaseName := '';
      end;
      with qryPdnMes do begin
        Close;
        Open;
        Locate('DtProc', dNeedDtProc, []);
      end;
      bWasAddUpdPdN := true;
    end; end
  else if popMnu.PopupComponent = dbgrPpsMes then begin
    dIsDtProc := 0;
    DecodeDate(qryPpsMes.FieldByName('DtProc').AsDateTime, nGod, nMes, nD);
    if VvodGodMes(nGod, nMes) and
        (MessageDlg('Добавить заготовку таблицы за ' +
                     MesRus(nMes) + IntToStr(nGod) + ' г.?:',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      Application.ProcessMessages;
      // Определить из записей какого месяца делать копирование
      dNeedDtProc := EncodeDate(nGod, nMes, 1);
      with qryPpsMes do begin
        dSvDtProc := FieldByName('DtProc').AsDateTime;
        DisableControls;
        First;
        while not Eof do begin
          dIsDtProc := FieldByName('DtProc').AsDateTime;
          Next;
          if FieldByName('DtProc').AsDateTime >= dNeedDtProc then
            Break;
        end;
        Locate('DtProc', dSvDtProc, []);
        EnableControls;
      end;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := qryPpsMes.DataBaseName;
        SQL.Add('Select * from Z_TblPps where DtProc = :dDtProc');
        ParamByName('dDtProc').AsDateTime := dIsDtProc;
        Open;
        if qry2Tmp.Active then qry2Tmp.Close;
        qry2Tmp.SQL.Clear;
        qry2Tmp.DataBaseName := DataBaseName;
        qry2Tmp.SQL.Add('Insert into Z_TblPps ' +
                        ' (DtProc, Porog, Smm, Prc) '  +
                        ' values(:dDtProc, :nPorog, :nSmm, :nPrc)');
        qry2Tmp.Prepare;
        First;
        while not Eof do begin
          qry2Tmp.ParamByName('dDtProc').AsDateTime := dNeedDtProc;
          qry2Tmp.ParamByName('nPorog').AsFloat := FieldByName('Porog').asFloat;
          qry2Tmp.ParamByName('nSmm').AsFloat := FieldByName('Smm').asFloat;
          qry2Tmp.ParamByName('nPrc').AsFloat := FieldByName('Prc').asFloat;
          qry2Tmp.ExecSQL;
          Next;
        end;
        PanelAfterAddPps.Visible := true;
        qry2Tmp.Close;
        qry2Tmp.SQL.Clear;
        qry2Tmp.DataBaseName := '';
        qry2Tmp.UnPrepare;
        Close;
        SQL.Clear;
        DataBaseName := '';
      end;
      with qryPpsMes do begin
        Close;
        Open;
        Locate('DtProc', dNeedDtProc, []);
      end;
      bWasAddUpdPPS := true;
    end; end
  else if popMnu.PopupComponent = dbgrNePpsMes then begin
    dIsDtProc := 0;
    DecodeDate(qryNePpsMes.FieldByName('DtProc').AsDateTime, nGod, nMes, nD);
    if VvodGodMes(nGod, nMes) and
        (MessageDlg('Добавить заготовку таблицы за ' +
                     MesRus(nMes) + IntToStr(nGod) + ' г.?:',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      Application.ProcessMessages;
      // Определить из записей какого месяца делать копирование
      dNeedDtProc := EncodeDate(nGod, nMes, 1);
      with qryNePpsMes do begin
        dSvDtProc := FieldByName('DtProc').AsDateTime;
        DisableControls;
        First;
        while not Eof do begin
          dIsDtProc := FieldByName('DtProc').AsDateTime;
          Next;
          if FieldByName('DtProc').AsDateTime >= dNeedDtProc then
            Break;
        end;
        Locate('DtProc', dSvDtProc, []);
        EnableControls;
      end;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := qryNePpsMes.DataBaseName;
        SQL.Add('Select * from Z_TblPF where DtProc = :dDtProc');
        ParamByName('dDtProc').AsDateTime := dIsDtProc;
        Open;
        if qry2Tmp.Active then qry2Tmp.Close;
        qry2Tmp.SQL.Clear;
        qry2Tmp.DataBaseName := DataBaseName;
        qry2Tmp.SQL.Add('Insert into Z_TblPF ' +
                        ' (DtProc, Porog, Smm, Prc) '  +
                        ' values(:dDtProc, :nPorog, :nSmm, :nPrc)');
        qry2Tmp.Prepare;
        First;
        while not Eof do begin
          qry2Tmp.ParamByName('dDtProc').AsDateTime := dNeedDtProc;
          qry2Tmp.ParamByName('nPorog').AsFloat := FieldByName('Porog').asFloat;
          qry2Tmp.ParamByName('nSmm').AsFloat := FieldByName('Smm').asFloat;
          qry2Tmp.ParamByName('nPrc').AsFloat := FieldByName('Prc').asFloat;
          qry2Tmp.ExecSQL;
          Next;
        end;
        PanelAfterAddPps.Visible := true;
        qry2Tmp.Close;
        qry2Tmp.SQL.Clear;
        qry2Tmp.DataBaseName := '';
        qry2Tmp.UnPrepare;
        Close;
        SQL.Clear;
        DataBaseName := '';
      end;
      with qryNePpsMes do begin
        Close;
        Open;
        Locate('DtProc', dNeedDtProc, []);
      end;
      bWasAddUpdNePPS := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.sBtnBuSdelanoClick(Sender: TObject);
begin
  PanelAfterAddTbl.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.SpeedButton5Click(Sender: TObject);
begin
  PanelAfterAddPps.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.SpeedButton1Click(Sender: TObject);
begin
  PanelAfterAddNePps.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.popMnuDelClick(Sender: TObject);
var nDelNR, nSvNR : integer; bEof : boolean;
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                    mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    bEof := false;
    nSvNr := 0;
    if popMnu.PopupComponent = dbgrPdn then begin
      with dsrcPdN.DataSet do begin
        DisableControls;
        nDelNR := FieldByName('NR').AsInteger;
        Next;
        if Eof then
          bEof := true
        else
          nSvNR := FieldByName('NR').AsInteger;
      end;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Delete from Z_TblPdN ' +
                ' where NR = :nDelNR');
        ParamByName('nDelNR').AsInteger := nDelNR;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dsrcPdN.DataSet do begin
        Close;
        Open;
        if bEof then
          Last
        else
          Locate('NR', nSvNR, []);
        EnableControls;
      end;
      bWasAddUpdPdN := true; end
    else if popMnu.PopupComponent = dbgrPps then begin
      with dsrcPps.DataSet do begin
        DisableControls;
        nDelNR := FieldByName('NR').AsInteger;
        Next;
        if Eof then
          bEof := true
        else
          nSvNR := FieldByName('NR').AsInteger;
      end;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Delete from Z_TblPps ' +
                ' where NR = :nDelNR');
        ParamByName('nDelNR').AsInteger := nDelNR;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dsrcPps.DataSet do begin
        Close;
        Open;
        if bEof then
          Last
        else
          Locate('NR', nSvNR, []);
        EnableControls;
      end;
      bWasAddUpdPPS := true; end
    else if popMnu.PopupComponent = dbgrNePpsPF then begin
      with dsrcNePpsPF.DataSet do begin
        DisableControls;
        nDelNR := FieldByName('NR').AsInteger;
        Next;
        if Eof then
          bEof := true
        else
          nSvNR := FieldByName('NR').AsInteger;
      end;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Delete from Z_TblPF ' +
                ' where NR = :nDelNR');
        ParamByName('nDelNR').AsInteger := nDelNR;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dsrcNePpsPF.DataSet do begin
        Close;
        Open;
        if bEof then
          Last
        else
          Locate('NR', nSvNR, []);
        EnableControls;
      end;
      bWasAddUpdNePPS := true;
    end;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.popDelMesClick(Sender: TObject);
var cMsg : string; dSvDtProc : TDateTime; bEof : boolean;
begin
  if popMnu.PopupComponent = dbgrPdnMes then begin
    cMsg := 'Таблица за ' + qryPdnMes.FieldByName('MesGod').AsString +
            ' удаляется безвозвратно. Согласны?:';
    if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      Application.ProcessMessages;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := qryPdnMes.DataBaseName;
        SQL.Add('Delete from Z_TblPdN where DtProc = :dDtProc');
        ParamByName('dDtProc').AsDateTime :=
                          qryPdnMes.FieldByName('DtProc').AsDateTime;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      bEof := false;
      dSvDtProc := 0;
      with qryPdnMes do begin
        Next;
        if Eof then
          bEof := true
        else
          dSvDtProc := FieldByName('DtProc').AsDateTime;
        Close;
        Open;
        if bEof then
          Last
        else
          Locate('DtProc', dSvDtProc, []);
      end;
      bWasAddUpdPdN := true;
    end; end
  else if popMnu.PopupComponent = dbgrPpsMes then begin
    cMsg := 'Таблица за ' + qryPpsMes.FieldByName('MesGod').AsString +
            ' удаляется безвозвратно. Согласны?:';
    if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      Application.ProcessMessages;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := qryPpsMes.DataBaseName;
        SQL.Add('Delete from Z_TblPps where DtProc = :dDtProc');
        ParamByName('dDtProc').AsDateTime :=
                          qryPpsMes.FieldByName('DtProc').AsDateTime;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      bEof := false;
      dSvDtProc := 0;
      with qryPpsMes do begin
        Next;
        if Eof then
          bEof := true
        else
          dSvDtProc := FieldByName('DtProc').AsDateTime;
        Close;
        Open;
        if bEof then
          Last
        else
          Locate('DtProc', dSvDtProc, []);
      end;
      bWasAddUpdPPS := true;
    end; end
  else if popMnu.PopupComponent = dbgrNePpsMes then begin
    cMsg := 'Таблица за ' + qryNePpsMes.FieldByName('MesGod').AsString +
            ' удаляется безвозвратно. Согласны?:';
    if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      Application.ProcessMessages;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := qryPpsMes.DataBaseName;
        SQL.Add('Delete from Z_TblPF where DtProc = :dDtProc');
        ParamByName('dDtProc').AsDateTime :=
                          qryNePpsMes.FieldByName('DtProc').AsDateTime;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      bEof := false;
      dSvDtProc := 0;
      with qryNePpsMes do begin
        Next;
        if Eof then
          bEof := true
        else
          dSvDtProc := FieldByName('DtProc').AsDateTime;
        Close;
        Open;
        if bEof then
          Last
        else
          Locate('DtProc', dSvDtProc, []);
      end;
      bWasAddUpdNePPS := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.popEdtClick(Sender: TObject);
begin
  with dsrcTPdn.DataSet do begin
    Edit;
    if EATPdn {z_ETblPN} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.popAddClick(Sender: TObject);
var dDtBeg : TDateTime;
    nPrcPdn, nMinZp, nMinZp2, nProgMin, nProgMin2, nPorogLg, nProcLg,
                               nSm2660, nSmLg100, nSmLg150, nSmLg200 : double;
    cNotes : string;
    nSvNR : integer;
begin
  with dsrcTPdn.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    Last;
    dDtBeg    := d_DtProc;
    nPrcPdn   := FieldByName('PrcPdn').AsFloat;
    nMinZp    := FieldByName('MinZp').AsFloat;
    nMinZp2   := FieldByName('MinZp2').AsFloat;
    nProgMin  := FieldByName('ProgMin').AsFloat;
    nProgMin2 := FieldByName('ProgMin2').AsFloat;
    nPorogLg  := FieldByName('PorogLg').AsFloat;
    nProcLg   := FieldByName('ProcLg').AsFloat;
    nSm2660   := FieldByName('Sm2660').AsFloat;
    nSmLg100  := FieldByName('SmLg100').AsFloat;
    nSmLg150  := FieldByName('SmLg150').AsFloat;
    nSmLg200  := FieldByName('SmLg200').AsFloat;
    cNotes    := 'Исправьте необходимые цифры!';
    Append;
    FieldByName('DtBeg').AsDateTime := dDtBeg;
    FieldByName('PrcPdn').AsFloat   := nPrcPdn;
    FieldByName('MinZp').AsFloat    := nMinZp;
    FieldByName('MinZp2').AsFloat   := nMinZp2;
    FieldByName('ProgMin').AsFloat  := nProgMin;
    FieldByName('ProgMin2').AsFloat := nProgMin2;
    FieldByName('PorogLg').AsFloat  := nPorogLg;
    FieldByName('ProcLg').AsFloat   := nProcLg;
    FieldByName('Sm2660').AsFloat   := nSm2660;
    FieldByName('SmLg100').AsFloat  := nSmLg100;
    FieldByName('SmLg150').AsFloat  := nSmLg150;
    FieldByName('SmLg200').AsFloat  := nSmLg200;
    FieldByName('Notes').AsString   := cNotes;
    if EATPdn {z_ETblPN} then
      Post
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;    
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.popDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes then
    dsrcTPdn.DataSet.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormTabsUdrg.dbgrTPdnDblClick(Sender: TObject);
begin
  if dsrcTPdn.DataSet.RecordCount > 0 then
    popEdtClick(Self);
end;

end.
