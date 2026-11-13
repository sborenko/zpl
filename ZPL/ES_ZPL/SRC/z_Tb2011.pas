unit z_Tb2011;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids,
  Menus, DB, DBTables;

type
  TFormTb2011 = class(TForm)
    PageControl: TPageControl;
    tsCmb2004: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    dbgrTPdn: TDBGrid;
    MemoHlp: TMemo;
    Splitter3: TSplitter;
    dsrcTPdn: TDataSource;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    popHead: TMenuItem;
    tsEsvPrp: TTabSheet;
    dbgrEsvP: TDBGrid;
    sBtnTabsSotr: TSpeedButton;
    sBtnTabsPrp: TSpeedButton;
    Label23: TLabel;
    tsEsvSotr: TTabSheet;
    sBtnCmb2004: TSpeedButton;
    dbgrEsv: TDBGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure dbgrTPdnDblClick(Sender: TObject);
    procedure sBtnTabsSotrClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure dbgrEsvPDblClick(Sender: TObject);
    procedure dbgrTPdnDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure sBtnCmb2004Click(Sender: TObject);
    procedure dbgrEsvDblClick(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    nSvTab, nCaseTabs : word;
    bWasAddUpdPdN, bWasAddUpdPps, bWasAddUpdNePPS : boolean;
    procedure SetScreenVid;
  public
    { Public declarations }
  end;

procedure ShowTabsUd2011(dDtProc : TDateTime);

const SECTION = 'z_Tb2011';

var
  FormTb2011: TFormTb2011;

implementation

uses A_Const, A_DM, Z_DM, A_Lib, A_GtGdMs, Z_EPdN, z_EPrpOU, z_ETblPN,
     z_EAEsv, z_EAEsvP;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowTabsUd2011(dDtProc : TDateTime);
var nGod, nMes, nDay : word;
begin
  FormTb2011 := TFormTb2011.Create(Application);
  with FormTb2011 do begin
    d_DtProc := dDtProc;
    bWasAddUpdPdN := false;
    bWasAddUpdPPS := false;
    bWasAddUpdNePPS := false;
    DecodeDate(dDtProc, nGod, nMes, nDay);
    Caption := 'Таблицы разных удержаний';
    with DmMain.qryTPrp do begin
      if not Active then
        Open;
      Last;
    end;
    with DmMain.qryTPdn do begin
      if not Active then
        Open;
       Last;
    end;
    with DmMain.qryEsv do begin
      if not Active then begin
        DataBaseName := CESMAIN;
        Open;
      end;
      Last;
    end;
    with DmMain.qryEsvP do begin
      if not Active then begin
        DataBaseName := CESMAIN;
        Open;
      end;
      Last;
    end;
    ShowModal;
    if bWasAddUpdPdN then
      DmMain.CreOpenCdsPdN;
    if bWasAddUpdPPS then
      DmMain.CreOpenCdsShkPPS;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 525);
    Width  := ReadInteger(SECTION, 'wW', 625);
    nCaseTabs := ReadInteger(SECTION, 'nCaseTabs', 0);
    nSvTab := ReadInteger(SECTION, 'nSvTab', 1);
    MemoHlp.Height := ReadInteger(SECTION, 'MemHlpH', 116);
    Free;
  end;
  tsEsvSotr.TabVisible := false;
  tsEsvPrp.TabVisible := false;
  tsCmb2004.TabVisible := false;
  if nCaseTabs = 1 then
    sBtnTabsSotr.Down := true
  else if nCaseTabs = 2 then
    sBtnTabsPrp.Down := true
  else
    sBtnCmb2004.Down := true;
  SetScreenVid;
  if FileExists(cDirVids + '11Esv03.vid') then
    dbgrEsv.Columns.LoadFromFile(cDirVids + '11Esv03.vid');
  if FileExists(cDirVids + '11EsvP03.vid') then
    dbgrEsvP.Columns.LoadFromFile(cDirVids + '11EsvP03.vid');
  if FileExists(cDirVids + '11Pdn12.vid') then
    dbgrTPdn.Columns.LoadFromFile(cDirVids + '11Pdn12.vid');
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.FormClose(Sender: TObject; var Action: TCloseAction);
var nSvTab : word;
begin
  dbgrEsv.Columns.SaveToFile(cDirVids + '11Esv03.vid');
  dbgrEsvP.Columns.SaveToFile(cDirVids + '11EsvP03.vid');
  dbgrTPdn.Columns.SaveToFile(cDirVids + '11Pdn12.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if sBtnTabsSotr.Down then begin
      nSvTab := PageControl.ActivePageIndex;
      WriteInteger(SECTION, 'nSvTab', nSvTab);
    end;
    if sBtnTabsSotr.Down then
      WriteInteger(SECTION, 'nCaseTabs', 1)
    else if sBtnTabsPrp.Down then
      WriteInteger(SECTION, 'nCaseTabs', 2)
    else
      WriteInteger(SECTION, 'nCaseTabs', 3);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.SetScreenVid;
begin
  if sBtnTabsSotr.Down then
    PageControl.ActivePage := tsEsvSotr
  else if sBtnTabsPrp.Down then
    PageControl.ActivePage := tsEsvPrp
  else
    PageControl.ActivePage := tsCmb2004;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.popPopup(Sender: TObject);
begin
  if pop.PopupComponent = dbgrEsvP then begin
    popHead.Caption := '== Удержания с предприятия ==';
    popEdt.Enabled := DmMain.qryTPrp.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled; end
  else if pop.PopupComponent = dbgrTPdn then begin
    popHead.Caption := '== Комбинироваанная таблица ==';
    popEdt.Enabled := DmMain.qryTPdn.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled; end
  else if pop.PopupComponent = dbgrEsv then begin
    popHead.Caption := '== Единый социальный взнос ==';
    popEdt.Enabled := DmMain.qryEsv.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.popEdtClick(Sender: TObject);
begin
  if pop.PopupComponent = dbgrEsvP then with DmMain.dsrcEsvP.DataSet do begin
    Edit;
    if EAEsvP {z_EAEsvP} then
      Post
    else
      Cancel; end
  else if pop.PopupComponent = dbgrTPdn then with dsrcTPdn.DataSet do begin
    Edit;
    if EATPdn {z_ETblPN} then
      Post
    else
      Cancel; end
  else if pop.PopupComponent = dbgrEsv then
                                         with DmMain.dsrcEsv.DataSet do begin
    Edit;
    if EAEsv {z_EAEsv} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.popAddClick(Sender: TObject);
var dDtBeg : TDateTime; cNotes : string; nSvNR : integer;
    nPrcPdn, nPrcPdn2, nPrcWSb, nMinZp, nMinZp2, nProgMin, nProgMin2,
              nPorogLg, nProcLg, nSm2660, nSmLg100, nSmLg150, nSmLg200 : double;
    nPrcCmn, nSmCmn, nPrcPPS, nSmPPS, nPrcBln, nSmBln, nPrcGPD, nSmGPD : double;
begin
  if pop.PopupComponent = dbgrEsvP then with DmMain.dsrcEsvP.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    Last;
    dDtBeg    := d_DtProc;
    nPrcCmn   := FieldByName('PrcCmn').AsFloat;
    nSmCmn    := FieldByName('SmCmn').AsFloat;
    nPrcPPS   := FieldByName('PrcInv').AsFloat;
    nSmPPS    := FieldByName('SmInv').AsFloat;
    nPrcBln   := FieldByName('PrcBln').AsFloat;
    nSmBln    := FieldByName('SmBln').AsFloat;
    nPrcGPD   := FieldByName('PrcGPD').AsFloat;
    nSmGPD    := FieldByName('SmGPD').AsFloat;
    cNotes    := 'Исправьте необходимые цифры!';
    Append;
    FieldByName('DtBeg').AsDateTime := dDtBeg;
    FieldByName('PrcCmn').AsFloat   := nPrcCmn;
    FieldByName('SmCmn').AsFloat    := nSmCmn;
    FieldByName('PrcInv').AsFloat   := nPrcPPS;
    FieldByName('SmInv').AsFloat    := nSmPPS;
    FieldByName('PrcBln').AsFloat   := nPrcBln;
    FieldByName('SmBln').AsFloat    := nSmBln;
    FieldByName('PrcGPD').AsFloat   := nPrcGPD;
    FieldByName('SmGPD').AsFloat    := nSmGPD;
    FieldByName('Notes').AsString   := cNotes;
    EnableControls;
    if EAEsvP {z_EAEsvP} then
      Post
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end; end
  else if pop.PopupComponent = dbgrTPdn then with dsrcTPdn.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    Last;
    dDtBeg    := d_DtProc;
    nPrcPdn   := FieldByName('PrcPdn').AsFloat;
    nPrcPdn2  := FieldByName('PrcPdn2').AsFloat;
    nPrcWSb   := FieldByName('PrcWSb').AsFloat;
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
    FieldByName('PrcPdn2').AsFloat  := nPrcPdn2;
    FieldByName('PrcWSb').AsFloat   := nPrcWSb;
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
    EnableControls;
    if EATPdn {z_ETblPN} then
      Post
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end; end
  else if pop.PopupComponent = dbgrEsv then
                                         with DmMain.dsrcEsv.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    Last;
    dDtBeg    := d_DtProc;
    nPrcCmn   := FieldByName('PrcCmn').AsFloat;
    nSmCmn    := FieldByName('SmCmn').AsFloat;
    nPrcPPS   := FieldByName('PrcPPS').AsFloat;
    nSmPPS    := FieldByName('SmPPS').AsFloat;
    nPrcBln   := FieldByName('PrcBln').AsFloat;
    nSmBln    := FieldByName('SmBln').AsFloat;
    nPrcGPD   := FieldByName('PrcGPD').AsFloat;
    nSmGPD    := FieldByName('SmGPD').AsFloat;
    cNotes    := 'Исправьте необходимые цифры!';
    Append;
    FieldByName('DtBeg').AsDateTime := dDtBeg;
    FieldByName('PrcCmn').AsFloat   := nPrcCmn;
    FieldByName('SmCmn').AsFloat    := nSmCmn;
    FieldByName('PrcPPS').AsFloat   := nPrcPPS;
    FieldByName('SmPPS').AsFloat    := nSmPPS;
    FieldByName('PrcBln').AsFloat   := nPrcBln;
    FieldByName('SmBln').AsFloat    := nSmBln;
    FieldByName('PrcGPD').AsFloat   := nPrcGPD;
    FieldByName('SmGPD').AsFloat    := nSmGPD;
    FieldByName('Notes').AsString   := cNotes;
    EnableControls;
    if EAEsv {z_EAEsv} then
      Post
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.popDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    if pop.PopupComponent = dbgrEsvP then
      DmMain.dsrcEsvP.DataSet.Delete
    else if pop.PopupComponent = dbgrTPdn then
      dsrcTPdn.DataSet.Delete
    else if pop.PopupComponent = dbgrEsv then
      DmMain.dsrcEsv.DataSet.Delete;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.dbgrTPdnDblClick(Sender: TObject);
begin
  if dsrcTPdn.DataSet.RecordCount > 0 then begin
    pop.PopupComponent := dbgrTPdn;
    popEdt.Click;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.dbgrEsvPDblClick(Sender: TObject);
begin
  if DmMain.dsrcEsvP.DataSet.RecordCount > 0 then begin
    pop.PopupComponent := dbgrEsvP;
    popEdt.Click;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.sBtnTabsSotrClick(Sender: TObject);
begin
  SetScreenVid;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.sBtnCmb2004Click(Sender: TObject);
begin
  SetScreenVid;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.dbgrTPdnDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrTPdn.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if (cFldNm = 'POROGLG') then
      Font.Style := [fsBold];
  end;
  dbgrTPdn.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormTb2011.dbgrEsvDblClick(Sender: TObject);
begin
  if DmMain.dsrcEsv.DataSet.RecordCount > 0 then begin
    pop.PopupComponent := dbgrEsv;
    popEdt.Click;
  end;
end;

end.
