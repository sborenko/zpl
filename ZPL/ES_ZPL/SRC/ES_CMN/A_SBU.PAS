unit A_SBU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IniFiles, Grids, DBGrids, Db, DBTables, StdCtrls,
  Math, Menus, Buttons, ExtCtrls, DBClient, DBCtrls;

type

  String15 = String[15];

  PTreeRec  = ^TTreeRec;
  TTreeRec  = record
    KdSBU  : SmallInt;
    SchBU  : String15;
    KdPSch : SmallInt;
    PSch   : String15;
    Sch_17 : String15;
    PS_17  : String15;
    NmSBU  : ShortString;
  end;

  TFormTSbu = class(TForm)
    qryTmp: TQuery;
    popTree: TPopupMenu;
    popTreeVubor: TMenuItem;
    popTreeFullExpand: TMenuItem;
    popTreeFullCollapse: TMenuItem;
    popTreeSep1: TMenuItem;
    popTreeEdt: TMenuItem;
    popTreeAddInRoot: TMenuItem;
    popTreeAddFirstInCurrent: TMenuItem;
    popTreeAddLastInCurrent: TMenuItem;
    popTreeInsertBeforeCurrent: TMenuItem;
    popTreeAddInNode: TMenuItem;
    popTreeDel: TMenuItem;
    popTreeSep2: TMenuItem;
    popTreeSaveToTable: TMenuItem;
    popTreeLoadFromTable: TMenuItem;
    LabelPopMsg: TLabel;
    LabelNotFound: TLabel;
    LabelIsSborny: TLabel;
    LabelErr3: TLabel;
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Panel2: TPanel;
    TV: TTreeView;
    popTreeLoadFromTvSbu: TMenuItem;
    popTreeMoveInTo: TMenuItem;
    popTreeMoveTo: TMenuItem;
    qrySbu: TQuery;
    dsrcSbu: TDataSource;
    updSbu: TUpdateSQL;
    dbgrSBU: TDBGrid;
    sBtnSelCurrent: TSpeedButton;
    sBtnSelAll: TSpeedButton;
    sBtnUnSelAll: TSpeedButton;
    PanelNabor: TPanel;
    dbgrTmp: TDBGrid;
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    LabelCntSel: TLabel;
    LabelMsg: TLabel;
    SplitterSbu: TSplitter;
    sBtnPSCH: TSpeedButton;
    qryXXX: TQuery;
    sBtnPrt: TSpeedButton;
    popTreeChngNmTemu: TMenuItem;
    popTreeMovInNewNode: TMenuItem;
    ChBoxFullExpand: TCheckBox;
    cdsSvSch: TClientDataSet;
    dsrcSvSch: TDataSource;
    cdsSvSchKdSch: TSmallintField;
    cdsSvSchSchBU: TStringField;
    cdsSvSchPSch: TStringField;
    PanelSvSch: TPanel;
    dbgrSvSch: TDBGrid;
    sBtnPanelSvSch: TSpeedButton;
    popTreePanelSvSch: TMenuItem;
    popTreeEdtWithDate: TMenuItem;
    qrySbuNR: TIntegerField;
    qrySbuKDSCH: TSmallintField;
    qrySbuSCHBU: TStringField;
    qrySbuSCH_17: TStringField;
    qrySbuPSCH: TStringField;
    qrySbuNMSCH: TStringField;
    qrySbuAINDX: TSmallintField;
    qrySbuPINDX: TSmallintField;
    qrySbuLVL: TSmallintField;
    qrySbuINDX: TSmallintField;
    qrySbuHSCH: TStringField;
    qrySbuDOPPRIZN: TSmallintField;
    qrySbuOLDSCHET: TStringField;
    qrySbuNR_GORD: TStringField;
    popTreeSep3: TMenuItem;
    popShwWhat: TMenuItem;
    popShwOld: TMenuItem;
    popShwBoth: TMenuItem;
    popShwNew: TMenuItem;
    Panel3: TPanel;
    popTreeFind: TMenuItem;
    popTreeCreNewParentMovInNewNode: TMenuItem;
    qrySbuPS_17: TStringField;
    popTreeAdd: TMenuItem;
    popTreeMove: TMenuItem;
    popTvRaznoe: TMenuItem;
    Panel4: TPanel;
    sBtnExpandTV: TSpeedButton;
    sBtnCollapseTV: TSpeedButton;
    cdsXXX: TClientDataSet;
    cdsXXXNR: TSmallintField;
    cdsXXXKdSch: TSmallintField;
    cdsXXXSch: TStringField;
    cdsXXXAIndx: TSmallintField;
    cdsXXXLvl: TSmallintField;
    cdsXXXPIndx: TSmallintField;
    cdsXXXNmSch: TStringField;
    cdsXXXIndx: TSmallintField;
    qrySbuKDPSCH: TSmallintField;
    cdsDbg: TClientDataSet;
    cdsDbgNR: TAutoIncField;
    cdsDbgNode: TStringField;
    cdsDbgKdSch: TSmallintField;
    cdsDbgSchBU: TStringField;
    cdsDbgSch_17: TStringField;
    cdsDbgKdPSch: TSmallintField;
    cdsDbgPSch: TStringField;
    cdsDbgPS_17: TStringField;
    cdsDbgNmSch: TStringField;
    cdsDbgNmPSch: TStringField;
    cdsDbgLvl: TSmallintField;
    cdsDbgAIndx: TSmallintField;
    cdsDbgIndx: TSmallintField;
    cdsDbgHsCh: TBooleanField;
    cdsDbgPIndx: TSmallintField;
    qrySbuARC: TStringField;
    popArc: TMenuItem;
    popArcNoShw: TMenuItem;
    popArcShw: TMenuItem;
    dsrctmpf: TDataSource;
    dbcbf: TDBGrid;
    chBoxV: TCheckBox;
    popTreeListObdt: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVDblClick(Sender: TObject);
    procedure TVKeyDown(Sender: TObject; var Key: Word;
                                                 Shift: TShiftState);
    procedure popTreePopup(Sender: TObject);
    procedure popTreeFullExpandClick(Sender: TObject);
    procedure popTreeFullCollapseClick(Sender: TObject);
    procedure popTreeExitClick(Sender: TObject);
    procedure popTreeEdtClick(Sender: TObject);
    procedure popTreeAddInRootClick(Sender: TObject);
    procedure popTreeAddFirstInCurrentClick(Sender: TObject);
    procedure popTreeAddLastInCurrentClick(Sender: TObject);
    procedure popTreeInsertBeforeCurrentClick(Sender: TObject);
    procedure popTreeAddInNodeClick(Sender: TObject);
    procedure popTreeDelClick(Sender: TObject);
    procedure popTreeSaveToTableClick(Sender: TObject);
    procedure popTreeLoadFromTableClick(Sender: TObject);
    procedure popTreeLoadFromTvSbuClick(Sender: TObject);
    procedure popTreeMoveInToClick(Sender: TObject);
    procedure popTreeMoveToClick(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure qrySbuAfterPost(DataSet: TDataSet);
    procedure FormHide(Sender: TObject);
    procedure TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
                            State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure sBtnSelCurrentClick(Sender: TObject);
    procedure sBtnSelAllClick(Sender: TObject);
    procedure dbgrTmpDblClick(Sender: TObject);
    procedure dbgrTmpEnter(Sender: TObject);
    procedure dbgrTmpExit(Sender: TObject);
    procedure sBtnUnSelAllClick(Sender: TObject);
    procedure sBtnPSCHClick(Sender: TObject);
    procedure bBtnOkClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure popTreeChngNmTemuClick(Sender: TObject);
    procedure popTreeMovInNewNodeClick(Sender: TObject);
    procedure ChBoxFullExpandClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure TVEnter(Sender: TObject);
    procedure TVExit(Sender: TObject);
    procedure sBtnPanelSvSchClick(Sender: TObject);
    procedure popTreePanelSvSchClick(Sender: TObject);
    procedure dbgrSBUDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popShwBothClick(Sender: TObject);
    procedure popShwNewClick(Sender: TObject);
    procedure popShwOldClick(Sender: TObject);
    procedure popTreeFindClick(Sender: TObject);
    procedure popTreeCreNewParentMovInNewNodeClick(Sender: TObject);
    procedure AddInXXX(nKdSch, nAIndx, nIndx, nPIndx, nLvl : SmallInt;
                                                    cSch, cNmSch : ShortString);
    procedure popArcNoShwClick(Sender: TObject);
    procedure popArcShwClick(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure dbcbfDblClick(Sender: TObject);
    procedure chBoxVClick(Sender: TObject);
  private
    { Private declarations }
    cLDirExe, cLDirInd, cLDirTemp, cLDirVids,
    cLDirVts, cLDirDocs, cLDirSbu, cLNmIniFile : ShortString;
    bLocalIni : boolean;
    m_LstSbu : TStringList;
    bTvReady, b_WasUpdated, bVuborMode, bNaborMode : boolean;
    n_SvKdSbu, nNaborFormWidth : SmallInt;
    nSvWhatShw : SmallInt;
    nSvKdSchBeforCollapse : SmallInt; //KdSch перед свернуть все
    procedure TvLoadFromTable;
    function MyTVLocateKdSBU(nKdSBu : integer) : boolean;
    function MyTVLocateSchBU(cSchBU : string; var nErrCode : integer) : boolean;
    function MaxTreeId : integer;
    procedure TvLoadFromTvSBU;
    procedure UpdLvlIndx(nStart : SmallInt);
    procedure Synchronize;
    procedure AddNewSbu(nKdSbu, nKdPSch, nLvl, nAIndx, nPIndx, nIndx : integer;
                        cSchBU, cSch_17, cNmSch, cPSch, cPS_17 : ShortString);
    procedure EdtKdSbu(nKdSch : SmallInt; cSchBU, cNmSch, cPSch : ShortString);
    procedure UpdPSchInBD(nAIndx : integer; cPSch : ShortString);
    function Get_PSch(nAIndx, nLvl, nPIndx : SmallInt;
                                 var cPSch, cPS_17 : ShortString ) : SmallInt;
//    function Get_PS_17(nAIndx, nLvl, nPIndx : SmallInt) : ShortString;
    procedure SetTvExpandState;
    procedure AddRecInCdsDbg(cNmNode, cSchBU, cSch_17, cPSch, cPS_17,
                                           cNmSch, cNmPSch, cHsCh: ShortString;
                       nKdSch, nKdPSch, nLvl, nAIndx, nPIndx, nIndx : SmallInt);
  public
    { Public declarations }
  end;

procedure ShowSbu(var bWasUpdated : boolean; cDbg : string);
function NaborSBU(var nKdSBU : integer; mLstSpz : TStringList) : boolean;
function GetSBU(var nKdSBU : integer; var cSchBU, cPSch, cNmSBU : string;
                                                var bHsCh : boolean) : boolean;
function CheckSBU(var nKdSBU : integer; var cSchBU, cPSch : string;
                                                var bHsCh : boolean) : boolean;
function MainKdSch2SchBU(nKdSch : SmallInt) : ShortString;

const SECTION = 'A_Sbu';

var
  FormTSbu: TFormTSbu;
  bFormSbuReady : boolean;

implementation

uses A_Const, A_DM, A_Lib, A_ESbu, A_ESbuCh, a_ESbu2, a_SbuGoT, a_ShwErr,
     a_SbuAdd, a_CmnPrt, a_Sch2Fi, a_EPSch, a_SelectSch;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure ShowSbu(var bWasUpdated : boolean; cDbg : string);
begin
  FormTSbu := TFormTSbu.Create(Application);
  with FormTSbu do begin
    bVuborMode := false;
    bNaborMode := false;
    b_WasUpdated := false;
    popTree.AutoPopup := true;
    LabelMsg.Visible := false;
    sBtnSelCurrent.Visible := false;
    sBtnSelAll.Visible := false;
    sBtnUnSelAll.Visible := false;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Закрыть';
    sBtnPrt.Enabled := true;
    // Раскрыть последние узлы
    if cdsSvSch.Active and (cdsSvSch.RecordCount > 0) then
                                                 with cdsSvSch do begin
      First;
      while not Eof do begin
        MyTVLocateKdSBU(cdsSvSchKdSch.AsInteger);
        Next;
      end;
    end;
    if n_SvKdSBU > 0 then
      MyTVLocateKdSBU(n_SvKdSBU)
    else
      TV.Items[0].Selected := true;
    PanelNabor.Visible := false;
    Constraints.MaxWidth := 800; //550;
    Constraints.MinWidth := 400;
    ShowModal;
    n_SvKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
    bWasUpdated := b_WasUpdated;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function NaborSBU(var nKdSBU : integer; mLstSpz : TStringList) : boolean;
begin
  Result := false;
  FormTSbu := TFormTSbu.Create(Application);
  with FormTSbu do begin
    bVuborMode := false;
    bNaborMode := true;
    b_WasUpdated := false;
    popTree.AutoPopup := false;
    LabelMsg.Visible := true;
    sBtnSelCurrent.Visible := true;
    sBtnSelAll.Visible := true;
    sBtnUnSelAll.Visible := true;
    LabelErr3.Visible := false;
    LabelPopMsg.Visible := false;
    LabelNotFound.Visible := false;
    LabelIsSborny.Visible := false;
    bBtnOk.Visible := true;
    bBtnOk.Caption := 'Ввод';
    sBtnPrt.Enabled := false;
    m_LstSbu := TStringList.Create;
    Width := nNaborFormWidth;
    // Установить TV на переданный nKdSchBU
    if nKdSBU > 0 then
      MyTVLocateKdSBU(nKdSBU)
    else if n_SvKdSBU > 0 then
      MyTVLocateKdSBU(n_SvKdSBU)
    else
      TV.Items[0].Selected := true;
    Constraints.MaxWidth := 850;
    Constraints.MinWidth := 600;
    PanelNabor.Visible := true;
    LabelCntSel.Caption := '';
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
    if ShowModal = mrOk then begin
      if cdsTmp.RecordCount > 0 then begin
        mLstSpz.Clear;
        cdsTmp.First;
        while not cdsTmp.Eof do begin
          mLstSpz.Add(cdsTmp.FieldByName('KdSbu').AsString);
          cdsTmp.Next;
        end;
      end;
      Result := true;
    end;
    n_SvKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
    m_LstSbu.Destroy;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetSBU(var nKdSBU : integer; var cSchBU, cPSch, cNmSBU : string;
                                                 var bHsCh : boolean) : boolean;
//var n_ErrCode : integer;
begin
  Result := false;
  FormTSbu := TFormTSbu.Create(Application);
  with FormTSbu do begin
    bVuborMode := true;
    bNaborMode := false;
    b_WasUpdated := false;
    popTree.AutoPopup := true;
    LabelMsg.Visible := false;
    sBtnSelCurrent.Visible := false;
    sBtnSelAll.Visible := false;
    sBtnUnSelAll.Visible := false;
    bBtnOk.Visible := true;
    sBtnPrt.Enabled := false;
    // Раскрыть последние узлы
    if cdsSvSch.Active and (cdsSvSch.RecordCount > 0) then
                                                      with cdsSvSch do begin
      First;
      while not Eof do begin
        MyTVLocateKdSBU(cdsSvSchKdSch.AsInteger);
        Next;
      end;
      //First;
    end;
//    else begin
      if n_SvKdSBU > 0 then
        MyTVLocateKdSBU(n_SvKdSBU)
      else
        TV.Items[0].Selected := true;
//    end;
    // Установить TV на переданный nKdSchBU
    if nKdSBU > 0 then
      MyTVLocateKdSBU(nKdSBU);
    PanelNabor.Visible := false;
    Constraints.MaxWidth := 550;
    Constraints.MinWidth := 400;
    if ShowModal = mrOk then begin
      nKdSBU  := PTreeRec(TV.Selected.Data)^.KdSBU;
      if dDtProc >= d_0217  then begin
        cPSch   := PTreeRec(TV.Selected.Data)^.PS_17;
        cSchBU  := PTreeRec(TV.Selected.Data)^.Sch_17;
        cNmSBU  := PTreeRec(TV.Selected.Data)^.NmSBU;
      end else begin
//        cPSCh  := PTreeRec(TV.Selected.Data)^.PSch;
        cPSch   := PTreeRec(TV.Selected.Data)^.PS_17;
        cSchBU  := PTreeRec(TV.Selected.Data)^.Sch_17;
        cNmSBU  := PTreeRec(TV.Selected.Data)^.NmSBU;
      end;
      bHsCh   := TV.Selected.HasChildren;
      Result  := true;
      nKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function MainKdSch2SchBU(nKdSch : SmallInt) : ShortString;
begin
  Result := '';
  FormTSbu := TFormTSbu.Create(Application);
  with FormTSbu do begin
    if MyTVLocateKdSBU(nKdSch) then
//      Result := PTreeRec(TV.Selected.Data)^.SchBU;
      Result := PTreeRec(TV.Selected.Data)^.Sch_17;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function CheckSBU(var nKdSBU : integer; var cSchBU, cPSch : string;
                                                var bHsCh : boolean) : boolean;
var nErrCode : integer;
begin
  Result := false;
  FormTSbu := TFormTSbu.Create(Application);
  with FormTSbu do begin
    bVuborMode := true;
    bNaborMode := false;
    b_WasUpdated := false;
    popTree.AutoPopup := true;
    LabelMsg.Visible := false;
    sBtnSelCurrent.Visible := false;
    sBtnSelAll.Visible := false;
    sBtnUnSelAll.Visible := false;
    sBtnPrt.Enabled := false;
    if MyTVLocateSchBU(cSchBu, nErrCode) then begin
      // Выйти, не показывая форму
      Result  := true;
      nKdSBU := PTreeRec(TV.Selected.Data)^.KdSBU;
      if dDtProc >= d_0217  then begin
        cPSch   := PTreeRec(TV.Selected.Data)^.PS_17;
        cSchBU  := PTreeRec(TV.Selected.Data)^.Sch_17; end
      else begin
        cPSCh  := PTreeRec(TV.Selected.Data)^.PSch;
        cSchBU  := PTreeRec(TV.Selected.Data)^.Sch_17;
      end;
      bHsCh  := TV.Selected.HasChildren; end
    else begin
      // Показать форму для выбора "правильного" счёта
      LabelPopMsg.Visible := false;
      if nErrCode = 1 then begin    {Not Found}
        LabelNotFound.Visible := true;
        LabelIsSborny.Visible := false; end
      else if nErrCode = 2 then begin
        LabelNotFound.Visible := false;
        LabelIsSborny.Visible := true;     {Sbornuj}
      end;
      LabelErr3.Visible := true;
      // Раскрыть последние узлы
      if cdsSvSch.Active and (cdsSvSch.RecordCount >0) then
                                                       with cdsSvSch do begin
        First;
        while not Eof do begin
          MyTVLocateKdSBU(cdsSvSchKdSch.AsInteger);
          Next;
        end;
      end;
//      else begin
        if n_SvKdSBU > 0 then
          MyTVLocateKdSBU(n_SvKdSBU)
        else
          TV.Items[0].Selected := true;
//      end;
      PanelNabor.Visible := false;
      Constraints.MaxWidth := 550;
      Constraints.MinWidth := 400;
      if ShowModal = mrOk then begin
        Result  := true;
        nKdSBU := PTreeRec(TV.Selected.Data)^.KdSBU;
        if dDtProc >= d_0217  then begin
          cPSch   := PTreeRec(TV.Selected.Data)^.PS_17;
          cSchBU  := PTreeRec(TV.Selected.Data)^.Sch_17; end
        else begin
          cPSCh  := PTreeRec(TV.Selected.Data)^.PSch;
          cSchBU  := PTreeRec(TV.Selected.Data)^.Sch_17;
        end;
        bHsCh  := TV.Selected.HasChildren;
      end;
      nKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.TvLoadFromTable;
// Создать файл cNmTV1 по записям таблицы Kd_SBU и загрузить его
// в дерево (так проще всего). Заполнить связанные объекты
var F1 : TextFile;
    cNmTv1, cMsg: string;
    i : integer;
    MyTreeRec : PTreeRec;
    cSchBU, cSch_17, cNmSch : ShortString;
begin
  bTvReady       := false;
  cNmTv1         := 'Sbu.tv1';
  AssignFile(F1, cDirTemp + cNmTV1);
  Rewrite(F1);
  with qrySbu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;

    if popArcNoShw.Checked then
      SQL.Add('Select * from ' + tbl_KdSBU +
                           ' where Arc is NULL or Arc < "1"')
    else
      SQL.Add('Select * from ' + tbl_KdSBU); 
    SQL.Add('order by AIndx, Lvl, PIndx');



{
    if popArcNoShw.Checked then begin
     if not chBoxV.Checked then
       SQL.Add('WITH RECURSIVE n as ( SELECT * FROM kd_sbu WHERE kdpsch is null ' +
            'UNION ALL SELECT * FROM kd_sbu, n ' +
            'WHERE kd_sbu.kdpsch = n.kdsch ' +
            'and (kd_sbu.Arc is NULL or kd_sbu.Arc < "1") '+
            'and kd_sbu.nmsch not like "#%" )' +
            'SELECT * FROM n')
     else
       SQL.Add('WITH RECURSIVE n as ( SELECT * FROM kd_sbu WHERE kdpsch is null ' +
            'UNION ALL SELECT * FROM kd_sbu, n ' +
            'WHERE kd_sbu.kdpsch = n.kdsch) '    +
            'SELECT * FROM n'); end
    else begin
      SQL.Add('Select * from ' + tbl_KdSBU);
      SQL.Add('order by AIndx, Lvl, PIndx');
    end;
}
    Open;
    First;
    while not Eof do begin
      cSchBU  := Trim(FieldByName('SchBU').AsString);
      if cSchBU = '' then
        cSchBU := 'pust';
      cSch_17 := Trim(FieldByName('Sch_17').AsString);
      if cSch_17 = '' then
        cSch_17 := 'PUST';
      cNmSch  := Trim(FieldByName('NmSch').AsString);
      cMsg := '';
      for i := 1 to FieldByName('Lvl').AsInteger do begin
        cMsg := cMsg + ' ';
      end;
      if popShwNew.Checked then
        cMsg := cMsg + cSch_17 + '  ' + cNmSch
      else if popShwOld.Checked then
        cMsg := cMsg + cSchBU  + '  ' + cNmSch
      else
        cMsg := cMsg + cSch_17  + ' (' + cSchBU + ')   ' + cNmSch;
      WriteLn(F1, cMsg);
      Next;
    end;
    CloseFile(F1);
    // Загрузить дерево из только что созданного cDirTemp + cNmTV1:
    TV.Items.BeginUpdate;
    TV.Items.Clear;
    TV.LoadFromFile(cDirTemp + cNmTV1);
    TV.Items.EndUpdate;
    if not bFlagDbg and FileExists(cDirTemp + cNmTV1) then
      DeleteFile(cDirTemp + cNmTV1);
    // Заполнить связанные Objects
    First;
    DisableControls;
    i := 0;
    while not Eof do begin
      New(MyTreeRec);
      MyTreeRec.KdSbu  := FieldByName('KdSch').AsInteger;
      MyTreeRec.Sch_17 := Trim(FieldByName('Sch_17').AsString);
      MyTreeRec.SchBU  := Trim(FieldByName('SchBU').AsString);
      MyTreeRec.PSch   := Trim(FieldByName('PSch').AsString);
      MyTreeRec.NmSBU  := Trim(FieldByName('NmSch').AsString);
      TV.Items[i].Data := MyTreeRec;
      Inc(i);
      Next;                    // qrySbu не закрываю - будет нужен при
    end;                       // редактированиях и добавлениях
    EnableControls;
  end;
  bTvReady := true;
  TV.Items[0].Selected := true;
  qrySbu.First;
  SetTvExpandState;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.qrySbuAfterPost(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qrySbu]);
end;
//------------------------------------------------------------------------------
function TFormTSbu.MyTVLocateKdSBU(nKdSBU : integer) : boolean;
var i : integer;
begin
  Result := false;
  with TV do for i := 0 to Items.Count - 1 do
    if PTreeRec(Items[i].Data)^.KdSBU = nKdSBU then begin
      Items[i].Selected := true;
      Result := true;
      Break;
    end;
end;
//------------------------------------------------------------------------------
function TFormTSbu.MyTVLocateSchBU(cSchBU : string;
                                    var nErrCode : integer) : boolean;
var i : integer;  // d_MyDbgDate : TDateTime;
begin
  Result := false;
//  d_MyDbgDate := EncodeDate(2017, 5, 1);
  nErrCode := 1;                    // Not Found
  if dDtProc >= {d_MyDbgDate} d_0217 then begin
    with TV do for i := 0 to Items.Count - 1 do begin
      if PTreeRec(Items[i].Data)^.Sch_17 = cSchBU then begin
        if Items[i].HasChildren then begin
          nErrCode := 2;              // HsCld - IsSborny
          Items[i].Selected := true;  // Чтобы показать именно введенный счёт
          Result := false; end
        else begin
          Items[i].Selected := true;
          nErrCode := 0;
          Result := true;
        end;
        Break;
      end;
    end; end
  else begin
    with TV do for i := 0 to Items.Count - 1 do begin
//      if PTreeRec(Items[i].Data)^.SchBU = cSchBU then begin
      if PTreeRec(Items[i].Data)^.Sch_17 = cSchBU then begin
        if Items[i].HasChildren then begin
          nErrCode := 2;              // IsSborny
          Items[i].Selected := true;  // Чтобы показать именно введенный счёт
          Result := false; end
        else begin
          Items[i].Selected := true;
          nErrCode := 0;
          Result := true;
        end;
        Break;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormTSbu.MaxTreeId : integer;
var i : integer;
begin
  Result := 0;
  with TV do begin
    // определить максимальный KdSchBU в дереве
    for i := 0 to Items.Count-1 do begin
      if PTreeRec(Items[i].Data)^.KdSBU > Result then
        Result := PTreeRec(Items[i].Data)^.KdSBU;
    end;
  end;
  with qryTmp do begin
    // определить максимальный KdSchBU в tbl_KdSBU
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Select Max(KdSch) as nMax from ' + tbl_KdSBU);
    Open;
    if (RecordCount <> 0) and (FieldByName('nMax').AsInteger > 0) then
      // выбрать наибольший
      Result := Max(Result, FieldByName('nMax').AsInteger);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.FormCreate(Sender: TObject);
var cTmpNmIniFile : ShortString;
begin
  nSvKdSchBeforCollapse := 0;
  if cNmIniFile = '' then begin
    bLocalIni := true;
    cLDirExe := ExtractFileDir(ParamStr(0)) + '\';
    if cLDirInd = '' then
      cLDirInd  := cLDirExe + 'IND\';
    if cLDirTemp = '' then
      cLDirTemp := cLDirInd + 'TEMP\';
    if cLDirVids = '' then
      cLDirVids := cLDirInd + 'VIDS\';
    if cLDirVts = '' then
      cLDirVts := cLDirInd + 'VTS\';
    if cLDirDocs = '' then
      cLDirDocs := cLDirInd + 'DOCS\';
    if cLDirSbu = '' then
      cLDirSbu  := cLDirInd + 'SBU\';
    cLNmIniFile := cLDirInd + 'sbu.ini';
    if not DirectoryExists(cLDirVids) then
      ForceDirectories(cLDirVids);
    if not DirectoryExists(cLDirTemp) then
      ForceDirectories(cLDirTemp);
    if not DirectoryExists(cLDirDocs) then
      ForceDirectories(cLDirDocs);
    if not DirectoryExists(cLDirSBU) then
      ForceDirectories(cLDirSBU);
    if not DirectoryExists(cLDirVts) then
      ForceDirectories(cLDirVts);
  end;
  if bLocalIni then
    cTmpNmIniFile := cLNmIniFile
  else
    cTmpNmIniFile := cNmIniFile;
  with cdsSvSch do begin
    if FileExists(cDirVids + 'SvSch.cds') then begin
      LoadFromFile(cDirVids + 'SvSch.cds');
      while (RecordCount > 5) do begin
        Delete;
      end; end
    else begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
  end;
  with TIniFile.Create(cTmpNmIniFile) do begin
    Top    := ReadInteger(SECTION, 'wT', 250);
    Left   := ReadInteger(SECTION, 'wL', 100);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 450);
    nSvWhatShw := ReadInteger(SECTION, 'nCaseShw', 1);
    nNaborFormWidth := ReadInteger(SECTION, 'wNaborWidth', 700);
    if bFlagDbg then
      dbgrSBU.Height := ReadInteger(SECTION, 'GrdSbuH', 120);
    n_SvKdSbu := ReadInteger(SECTION, 'nSvKdSbu', 0);
    if bFlagDbg then
      dbgrSBU.Height := ReadInteger(SECTION, 'GrdSbuH', 120);
    ChBoxFullExpand.Checked := ReadBool(SECTION, 'bFullExpand', false);
    PanelSvSch.Visible := ReadBool(SECTION, 'bPnlSvSch', false);
    popArcNoShw.Checked := ReadBool(SECTION, 'NoShwArc', true);
    popArcShw.Checked := not popArcNoShw.Checked;
    Free;
  end;
  popShwBoth.Checked := nSvWhatShw = 1;
  popShwNew.Checked  := nSvWhatShw = 2;
  popShwOld.Checked  := nSvWhatShw = 3;
  if FileExists(cDirVids + 'T_Sbu05.vid') then
    dbgrSbu.Columns.LoadFromFile(cDirVids + 'T_Sbu05.vid');
  if FileExists(cDirVids + 'SvSch_1.vid') then
    dbgrSvSch.Columns.LoadFromFile(cDirVids + 'SvSch_1.vid');
  popTreeCreNewParentMovInNewNode.Checked := bFlagDbg;
  popTreeListObdt.Visible                 := bFlagDbg;
  SplitterSBU.Visible := bFlagDbg;
  dbgrSbu.Visible := bFlagDbg;
  sBtnPSch.Visible := bFlagDbg;
  bFormSbuReady := false;
  bTvReady := false;
  //=================
  TvLoadFromTable;
  //=================
  Caption := 'План счетов бухгалтерского учёта (СчБУ)';
//  popTreePanelSvSch.Visible := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.FormClose(Sender: TObject; var Action: TCloseAction);
var nKdSbu : SmallInt; cSchBU, cPSch, cTmpNmIniFile : ShortString;
    bHsCh : boolean;
begin
  if bFlagDbg then
    dbgrSbu.Columns.SaveToFile(cDirVids + 'T_Sbu05.vid');
  dbgrSvSch.Columns.SaveToFile(cDirVids + 'SvSch_1.vid');

  if (TV.Selected <> nil) then begin
    nKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
    cSchBU := PTreeRec(TV.Selected.Data)^.SchBU;
    cPsch  := PTreeRec(TV.Selected.Data)^.PSch;
    bHsCh   := TV.Selected.HasChildren;
    if not bHsCh and not cdsSvSch.Locate('PSch', cPSch, []) then
                                                          with cdsSvSch do begin
      Append;
      cdsSvSchKdSch.AsInteger := nKdSbu;
      cdsSvSchSchBU.AsString  := cSchBU;
      cdsSvSchPSch.AsString   := cPSch;
      Post;
    end;
  end;


  if bLocalIni then
    cTmpNmIniFile := cLNmIniFile
  else
    cTmpNmIniFile := cNmIniFile;
  with TIniFile.Create(cTmpNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nCaseShw', nSvWhatShw);
    if popShwNew.Checked then
      WriteInteger(SECTION, 'nCaseShw', 2)
    else if popShwOld.Checked then
      WriteInteger(SECTION, 'nCaseShw', 3)
    else
      WriteInteger(SECTION, 'nCaseShw', 1);
    if bNaborMode then
      WriteInteger(SECTION, 'wNaborWidth', Width);
    WriteInteger(SECTION, 'nSvKdSbu', nKdSbu);
    if bFlagDbg then
      WriteInteger(SECTION, 'GrdSbuH', dbgrSBU.Height);
    WriteBool(SECTION, 'bFullExpand', ChBoxFullExpand.Checked);
    WriteBool(SECTION, 'bPnlSvSch', PanelSvSch.Visible);
    WriteBool(SECTION, 'NoShwArc', popArcNoShw.Checked);
    Free;
  end;
  if cdsSvSch.Active and (cdsSvSch.RecordCount > 0) then
    cdsSvSch.SaveToFile(cDirVids + 'SvSch_1.cds');
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.UpdLvlIndx(nStart : SmallInt);
var i, nChngCnt, nKdSbu, nAIndx, nPIndx, nLvl, nIndx : SmallInt;
    n_AIndx, n_PIndx, n_Lvl, n_Indx : SmallInt;
     cHsCh : ShortString;
begin
  if nStart < 0 then
    nStart := 0;
  // Обновление в таблице Kd_SBU индексов, Level и HasChildren
  // Form_Dm.DbMain.StartTransaction;
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Update ' + tbl_KdSBU + ' Set AIndx = :nAIndx, PIndx = :nPIndx, ' +
            ' Lvl = :nLvl, Indx = :nIndx, HsCh = :cHsCh  ' +
            ' where KdSch = :nKdSbu');
    Prepare;
  end;
  nChngCnt := 0;
  for i := nStart to TV.Items.Count-1 do begin
    nKdSbu  := PTreeRec(TV.Items[i].Data)^.KdSbu;
    // с cPSch и PSch тут ничего не делать !!!
    nLvl    := TV.Items[i].Level;
    nIndx   := TV.Items[i].Index;
    nAIndx  := TV.Items[i].AbsoluteIndex;
    nPIndx  := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    with qrySbu do begin
      if Locate('KdSch', nKdSbu, []) then begin
      n_AIndx := FieldByName('AIndx').AsInteger;
      n_PIndx := FieldByName('PIndx').AsInteger;
      n_Lvl   := FieldByName('Lvl').AsInteger;
      n_Indx  := FieldByName('PIndx').AsInteger;
    end;
    if (n_AIndx <> nAIndx) or (n_PIndx <> nPIndx) or
                 (n_Lvl <> nLvl) or (n_Indx <> nIndx) then begin
        qryTmp.ParamByName('nKdSbu').AsSmallInt  := nKdSbu;
        qryTmp.ParamByName('nAIndx').AsSmallInt  := nAIndx;
        qryTmp.ParamByName('nPIndx').AsSmallInt  := nPIndx;
        qryTmp.ParamByName('nLvl').AsSmallInt    := nLvl;
        qryTmp.ParamByName('nIndx').AsSmallInt   := nIndx;
        qryTmp.ParamByName('cHsCh').AsString     := cHsCh;
        qryTmp.ExecSQL;
        Inc(nChngCnt);
      end;
    end;
  end;
  with qryTmp do begin
    if Prepared then
      UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
//  if bflagDbg then
//    ShowMessage(' При i = ' + IntToStr(i) + ' nCntChng = ' + IntToStr(nChngCnt));
  b_WasUpdated := true;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.Synchronize; var nKdSbu : integer;
begin
  if not bTvReady then
    Exit;
  if (qrySbu.State in [dsEdit, dsInsert]) then
    qrySbu.Post;
  if (TV.Selected <> nil) then begin
    nKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
    if nKdSbu <> 0 then
      qrySbu.Locate('KdSch', nKdSbu, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.TVChange(Sender: TObject; Node: TTreeNode);
begin
  Synchronize;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.AddNewSbu(nKdSbu, nKdPSch,
                                       nLvl, nAIndx, nPIndx, nIndx : integer;
                          cSchBU, cSch_17, cNmSch, cPSch, cPS_17 : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into ' + tbl_KdSbu +
            ' (KdSch, KdPSch, SchBU, Sch_17, NmSch, PSch, PS_17, ' +
            ' Lvl, AIndx, PIndx, Indx) values ' +
            ' (:nKdSbu, :nKdPSch, :cSchBU, :cSch_17, :cNmSbu, ' +
            ' :cPSch, :cPS_17, :nLvl, :nAIndx, :nPIndx, :nIndx)');

    ParamByName('nKdSbu').AsInteger  := nKdSbu;
    ParamByName('nKdPSch').AsInteger := nKdPSch;
    ParamByName('cSchBU').AsString   := Trim(cSchBU);
    ParamByName('cSch_17').AsString  := Trim(cSch_17);
    ParamByName('cNmSbu').AsString   := Trim(cNmSch);
    ParamByName('cPSch').AsString    := Trim(cPSch);
    ParamByName('cPS_17').AsString   := Trim(cPS_17);
    ParamByName('nLvl').AsInteger    := nLvl;
    ParamByName('nAIndx').AsInteger  := nAIndx;
    ParamByName('nPIndx').AsInteger  := nPIndx;
    ParamByName('nIndx').AsInteger   := nIndx;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.EdtKdSbu(nKdSch : SmallInt;
                                          cSchBU, cNmSch, cPSch : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update ' + tbl_KdSbu + ' set SchBU = :cSchBU, NmSch = :cNmSch');
    if cPSch > '' then
      SQL.Add(', PSch = :cPSch');
    SQL.Add('where KdSch = :nKdSch');
    ParamByName('nKdSch').AsInteger := nKdSch;
    ParamByName('cSchBU').AsString  := Trim(cSchBU);
    ParamByName('cNmSch').AsString  := Trim(cNmSch);
    if cPSch > '' then
      ParamByName('cPSch').AsString := cPSch;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.TVDblClick(Sender: TObject);
begin
  if bNaborMode and (TV.Selected <> nil) then
    sBtnSelCurrent.Click
  else if bVuborMode and (TV.Selected <> nil) and
                                         (not TV.Selected.HasChildren) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.TVKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
begin
  if bNaborMode and (Shift = []) and (Key = VK_F8) and (TV.Selected <> nil) then
    sBtnSelCurrent.Click
  else if bVuborMode and (Shift = [ssCtrl]) and (Key = VK_RETURN) and
                (TV.Selected <> nil) and not TV.Selected.HasChildren then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreePopup(Sender: TObject);
var bAllowEdt, bHasChild : boolean;  nLevel : SmallInt; //nKdSch : SmallInt;
begin
  // popTreeEdtWithDate.Visible := bFlagDbg;
//  nKdSch := 0;
  if (TV.Selected = nil) then Exit;
  LabelPopMsg.Visible := false;
//  popTreeLoadFromTvSbu.Visible := bFlagDbg;
//  popTreeSaveToTable.Visible   := bFlagDbg;
//  popTreeLoadFromTable.Visible := bFlagDbg;
//  popTreeSep2.Visible := popTreeLoadFromTvSbu.Visible or
//                            popTreeSaveToTable.Visible or
//                               popTreeLoadFromTable.Visible;
  popTreeAdd.Visible  := bFlagDbg;
  popTreeAdd.Visible  := bFlagDbg;
  popTreeMove.Visible := bFlagDbg;
  popTreeDel.Visible  := bFlagDbg;
  popTvRaznoe.Visible := false; //bFlagDbg;
  bAllowEdt := bAppAllowEdtTVSBU or bFlagDbg or bFlagGMS or (nAppUsrKat <= 0);
  popTreeVubor.Visible := bVuborMode;
  popTreeSep1.Visible := bAllowEdt;
  popTreeEdt.Visible := {bAllowEdt and} (TV.Items.Count > 0);
//  popTreeAddInRoot.Visible := bAllowEdt;
//  popTreeAddFirstInCurrent.Visible := bAllowEdt and
//                                              (TV.Items.Count > 0);
//  popTreeAddLastInCurrent.Visible := bAllowEdt and
//                                              (TV.Items.Count > 0);
  popTreeInsertBeforeCurrent.Visible := bAllowEdt and
                                              (TV.Items.Count > 0);
  //popTreeAddInNode.Visible := bAllowEdt and (TV.Items.Count > 0);
  popTreeMoveInTo.Visible := bAllowEdt and (TV.Items.Count > 1);
//  popTreeDel.Visible := {bAllowEdt and (TV.Items.Count > 0) and
//                    (TV.Items.Count < 2) and} not TV.Selected.HasChildren;
  popTreeAddInNode.Enabled := popTreeAddInNode.Visible and
                                  TV.Selected.HasChildren; // т.е. уже родитель
  popTreeMovInNewNode.Visible := bAllowEdt and (TV.Items.Count > 0);
  nLevel := TV.Selected.Level;
  bHasChild := TV.Selected.HasChildren;
  popTreeMovInNewNode.Enabled := (nLevel >= 0) and
                                         (nLevel < 4) and not bHasChild;
  popTreeMoveInTo.Enabled := (nLevel = 0) and not bHasChild;
  popTreeMoveTo.Visible := bAllowEdt and (TV.Items.Count > 1);
//  if (TV.Selected <> nil) then
//    nKdSch := PTreeRec(TV.Selected.Data)^.KdSbu;
//  popTreeChngNmTemu.Visible := bFlagDbg and
//                     ((nKdSch = 1555) or (nKdSch = 1557) or (nKdSch = 1559));
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeFullExpandClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullExpand;
    Items.EndUpdate;
    if nSvKdSchBeforCollapse > 0 then
       MyTVLocateKdSBU(nSvKdSchBeforCollapse);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeFullCollapseClick(Sender: TObject);
begin
  nSvKdSchBeforCollapse := qrySbuKdSch.AsInteger;
  with TV do begin
    Items.BeginUpdate;
    FullCollapse;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeExitClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeEdtClick(Sender: TObject);
var cMsg, cSchBU, cSch_17,  cNmSch,
          cNewSchBU, cNewSch_17, cNewNmSch, cKdSch, cArc : ShortString;
             nCurNR : integer;
begin
  with qrySbu do begin

    cSchBU     := Trim(FieldByName('SchBU').AsString);
     cSch_17   := Trim(FieldByName('Sch_17').AsString);
    cNmSch     := Trim(FieldByName('NmSch').AsString);
    cKdSch     := FieldByName('KdSch').AsString;
    cArc       := qrySbuArc.AsString;
    cNewSchBU  := cSchBU;
    cNewSch_17 :=  cSch_17;
    cNewNmSch  := cNmSch;
    nCurNR     := qrySbuNR.AsInteger;
    Edit;
    cMsg := 'Редактирование элемента КодСчёта: ' + cKdSch + ' "' + cNmSch + '"';

    if TFormNewItem.EditAccnt(
      cMsg, nCurNR, cNewSchBU, cNewSch_17, cNewNmSch, cArc) then
    begin
      FieldByName('SchBU').AsString  :=  cNewSchBU;
      FieldByName('Sch_17').AsString :=  cNewSch_17;
      FieldByName('NmSch').AsString  :=  cNewNmSch;
      FieldByName('Arc').AsString    :=  cArc;
      Post;
      PTreeRec(TV.Selected.Data)^.SchBU  := cNewSchBU;
      PTreeRec(TV.Selected.Data)^.Sch_17 := cNewSch_17;
      PTreeRec(TV.Selected.Data)^.NmSBU  := cNewNmSch;

      if cNewSchBU = '' then
        cNewSchBU := 'pust';
      if cNewSch_17 = '' then
        cNewSch_17 := 'PUST';
      cMsg := '';
      if popShwNew.Checked then
        cMsg := cMsg + cNewSch_17 + '  ' + cNewNmSch
      else if popShwOld.Checked then
        cMsg := cMsg + cNewSchBU  + '  ' + cNewNmSch
      else

      cMsg := '(' + cNewSch_17  + ']  (' +
                                     cNewSchBU + ')  ' + cNewNmSch;
//      cMsg := {cMsg +} cSch_17  + ' (' + cSchBU + ')   ' + cNmSch;
      TV.Selected.Text := cMsg;
      Form_Dm.cdsSbuLU.Close;
      Form_Dm.cdsSbuLU.Open;
      b_WasUpdated := true;
      if (cNewSchBU <> cSchBU) or (cNewSch_17 <> cSch_17) or
              (cNewNmSch <> cNmSch) then begin // Сделать запись в DbLog
        cMsg := 'Код ' + cKdSch + ': Счёт ' + cSchBU;
        if cNewSchBU <> cSchBU then
          cMsg := cMsg + ' => ' + cNewSchBU;
        if cNewSch_17 <> cSch_17 then
          cMsg := cMsg + '  Sch_17 ' + cSch_17 + ' => ' + cNewSch_17;
        if cNewNmSch <> cNmSch then
          cMsg := cMsg + ', Назв. ' + cNmSch + ' => ' + cNewNmSch;
        Form_Dm.AddLog(0, 0, 'Edt_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg);
      end; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeAddInRootClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    nKdSBU : SmallInt; cMsg : string;
    cPSch : string15;
    NewTreeNode : TTreeNode;
    cSchBU, cSch_17, cNmSch : ShortString;
begin
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeAddFirstInCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    SvNode, NewNode : TTreeNode;
    cSchBU, cSch_17, cNmSch, cMsg : ShortString;
    nSvAIndx, nSvLvl : SmallInt;
    nNewKdSBU, nKdPSch, nNewAIndx, nNewLvl, nNewPIndx : SmallInt;
    cNewPSch, cNewPS_17, cArc : ShortString;
    nCurNR : integer;
begin
  cMsg := 'Элемент добавляется первым на текущий уровень';
  with qrySbu do begin
    nCurNR := 0;

    if TFormNewItem.EditAccnt(
      cMsg, nCurNR, cSchBU, cSch_17, cNmSch, cArc) then
    begin
      // Запомнить текущее положение, хочется вставвиться перед ним
      SvNode := TV.Selected;
      nSvAIndx := SvNode.AbsoluteIndex;
      nSvLvl   := SvNode.Level;
      Append;
      nNewKdSBU := MaxTreeId + 1;
      FieldByName('KdSch').AsInteger := nNewKdSBU;
      FieldByName('SchBU').AsString  := cSchBU;
      FieldByName('SchBU').AsString  := cSch_17;
      FieldByName('NmSch').AsString  := cNmSch;
      bTvReady := false;
//      nTreeViewIndex := TV.Selected.AbsoluteIndex;
      New(MyRecPtr);         /////////////////////////////
      MyRecPtr.KdSBU  := nNewKdSBU;
      MyRecPtr.SchBU  := cSchBU;
      MyRecPtr.Sch_17 := cSch_17;
      MyRecPtr.NmSBU  := cNmSch;
      MyRecPtr.NmSBU  := cNmSch;
      if cSchBU = '' then
        cSchBU := 'pust';
      if cSch_17 = '' then
        cSch_17 := 'PUST';
      cMsg := '';
      if popShwNew.Checked then
        cMsg := cMsg + cSch_17 + '  ' + cNmSch
      else if popShwOld.Checked then
        cMsg := cMsg + cSchBU  + '  ' + cNmSch
      else
//       cMsg := cMsg + '(' + cSch_17  + ']  (' + cSchBU + ')  ' + cNmSch;
        cMsg := cMsg + cSch_17  + ' (' + cSchBU + ')   ' + cNmSch;
       //---------------------------------------------------------
      NewNode := TV.Items.AddObjectFirst(SvNode, cMsg, MyRecPtr);
      //---------------------------------------------------------
      TV.Selected := NewNode;
      nNewAIndx := TV.Selected.AbsoluteIndex;
      nNewLvl   := TV.Selected.Level;
      nNewPIndx := TV.Selected.Parent.Index;
      // сразу до Close/Open вбиваю новый PSch.
      nKdPSch := Get_PSch(nNewAIndx, nNewLvl, nNewPIndx, cNewPSch, cNewPS_17);
      if nKdPSch >= 0 then begin
        PTreeRec(TV.Items[nNewAIndx].Data)^.PSch := cNewPSch;
        PTreeRec(TV.Items[nNewAIndx].Data)^.PS_17 := cNewPS_17;
        FieldByName('KdSch').AsInteger := nNewKdSBU;
        FieldByName('PSch').AsString   := cNewPSch;
        FieldByName('PS_17').AsString  := cNewPS_17;
      end;
      Post;
      bTvReady := true;
      UpdLvlIndx(0);
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      with Form_Dm.cdsSbuLU do begin
        Close;
        Open;
      end;
      // Сделать запись в DbLog
      cMsg := 'Добавл.1-м на текущ.уров.счёт Код ' +
              IntToStr(nNewKdSbu) + ': Счёт ' + cSchBU  + ', Назв. ' + cNmSch;
      Form_Dm.AddLog(0, 0, 'Add_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeAddLastInCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    SvNode, NewNode : TTreeNode;
    cSchBU, cSch_17, cNmSch, cMsg : ShortString;
    nSvAIndx, nSvLvl : SmallInt;
    nNewKdSBU, nKdPSch, nNewAIndx, nNewLvl, nNewPIndx : SmallInt;
    cNewPSch, cNewPS_17, cArc : ShortString;
    nCurNR : integer;
begin
  cMsg := 'Элемент добавляется последним на текущий уровень';
  with qrySbu do begin
    nCurNR := 0;

    if TFormNewItem.EditAccnt(
      cMsg, nCurNR, cSchBU, cSch_17, cNmSch, cArc) then
    begin
      // Запомнить текущее положение, хочется вставвиться перед ним
      SvNode := TV.Selected;
      nSvAIndx := SvNode.AbsoluteIndex;
      nSvLvl   := SvNode.Level;
      Append;
      nNewKdSBU := MaxTreeId + 1;
      FieldByName('KdSch').AsInteger := nNewKdSBU;
      FieldByName('SchBU').AsString  := cSchBU;
      FieldByName('SchBU').AsString  := cSch_17;
      FieldByName('NmSch').AsString  := cNmSch;
      bTvReady := false;
//      nTreeViewIndex := TV.Selected.AbsoluteIndex;
      New(MyRecPtr);               /// *****************
      MyRecPtr.KdSBU  := nNewKdSBU;
      MyRecPtr.SchBU  := cSchBU;
      MyRecPtr.Sch_17 := cSch_17;
      MyRecPtr.NmSBU  := cNmSch;
      MyRecPtr.NmSBU  := cNmSch;
      if cSchBU = '' then
        cSchBU := 'pust';
      if cSch_17 = '' then
        cSch_17 := 'PUST';
      cMsg := '';
      if popShwNew.Checked then
        cMsg := cMsg + cSch_17 + '  ' + cNmSch
      else if popShwOld.Checked then
        cMsg := cMsg + cSchBU  + '  ' + cNmSch
      else
        cMsg := cMsg + cSch_17  + ' (' + cSchBU + ')   ' + cNmSch;
//       cMsg := cMsg + '(' + cSch_17  + ']  (' + cSchBU + ')  ' + cNmSch;
      //---------------------------------------------------
      NewNode := TV.Items.AddObject(SvNode, cMsg, MyRecPtr);
      //---------------------------------------------------
      TV.Selected := NewNode;
      nNewAIndx := TV.Selected.AbsoluteIndex;
      nNewLvl   := TV.Selected.Level;
      nNewPIndx := TV.Selected.Parent.Index;
      // сразу до Close/Open вбиваю новый PSch.
      nKdPSch := Get_PSch(nNewAIndx, nNewLvl, nNewPIndx, cNewPSch, cNewPS_17);
      if nKdPSch >= 0 then begin
        PTreeRec(TV.Items[nNewAIndx].Data)^.PSch := cNewPSch;
        PTreeRec(TV.Items[nNewAIndx].Data)^.PS_17 := cNewPS_17;
        FieldByName('KdSch').AsInteger := nNewKdSBU;
        FieldByName('PSch').AsString   := cNewPSch;
        FieldByName('PS_17').AsString  := cNewPS_17;
      end;
      Post;
      bTvReady := true;
      UpdLvlIndx(0);
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      with Form_Dm.cdsSbuLU do begin
        Close;
        Open;
      end;
      // Сделать запись в DbLog
      cMsg := 'Добавл.посл.на текущ.уров.счёт Код ' +
              IntToStr(nNewKdSbu) + ': Счёт ' + cSchBU  + ', Назв. ' + cNmSch;
      Form_Dm.AddLog(0, 0, 'Add_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeInsertBeforeCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    SvNode, NewNode, AttacNode : TTreeNode;
    cSchBuPred, cSchBu, cSch_17, cNewPS_17, cNmSch, cMsg : ShortString;
    nSvAIndx, nSvLvl{, nTvIndex} : LongInt;
    nNewKdSBU, nNewAIndx, nNewLvl, nNewPIndx, nKdPSch : integer;
    cNewPSch, cArc : ShortString;
    nCurNR : integer;
begin
  cMsg := 'Элемент добавляется впереди текущего: ';
  with qrySbu do begin
    cMsg := cMsg + ' ' + FieldByName('SchBU').AsString + '  ' +
                                      FieldByName('NmSch').AsString;
    nCurNR := 0;
    
    if TFormNewItem.EditAccnt(
      cMsg, nCurNR, cSchBU, cSch_17, cNmSch, cArc) then
    begin
      // Запомнить текущее положение, хочется вставвиться перед ним
      SvNode := TV.Selected;
      nSvAIndx := SvNode.AbsoluteIndex;
      nSvLvl   := SvNode.Level;
      cSchBuPred := PTreeRec(TV.Selected.Data)^.NmSBU;

      Append;
      nNewKdSBU := MaxTreeId + 1;
      FieldByName('KdSch').AsInteger := nNewKdSBU;
      FieldByName('SchBU').AsString  := cSchBU;
      FieldByName('Sch_17').AsString := cSch_17;
      FieldByName('NmSch').AsString  := cNmSch;
      bTvReady := false;
      nSvAIndx  := TV.Selected.AbsoluteIndex;
      New(MyRecPtr);                  /// ++++++++++++++++
      MyRecPtr.KdSBU  := nNewKdSBU;
      MyRecPtr.SchBU  := cSchBU;
      MyRecPtr.Sch_17 := cSch_17;
      MyRecPtr.NmSBU  := cNmSch;
      MyRecPtr.NmSBU  := cNmSch;
      if cSchBU = '' then
        cSchBU := 'pust';
      if cSch_17 = '' then
        cSch_17 := 'PUST';
      cMsg := '';
      if popShwNew.Checked then
        cMsg := cSch_17 + '  ' + cNmSch
      else if popShwOld.Checked then
        cMsg := cSchBU  + '  ' + cNmSch
      else
        cMsg := cMsg + cSch_17  + ' (' + cSchBU + ')   ' + cNmSch;
//       cMsg := '(' + cSchBU  + ')  [' + cSch_17 + ']  ' + cNmSch;
      //-------------------------------------------------0-----
      NewNode := TV.Items.InsertObject(SvNode, cMsg, MyRecPtr);
      //-------SvNode - это перед которым надо вставиться -----
      TV.Selected := NewNode;
      nNewAIndx := TV.Selected.AbsoluteIndex;
      nNewLvl   := TV.Selected.Level;
      nNewPIndx := TV.Selected.Parent.Index;
      // сразу до Close/Open вычисляю и вбиваю новый PSch.
      nKdPSch := Get_PSch(nNewAIndx, nNewLvl, nNewPIndx, cNewPSch, cNewPS_17);
      if nKdPSch >= 0 then begin
        PTreeRec(TV.Items[nNewAIndx].Data)^.PSch  := cNewPSch;
        PTreeRec(TV.Items[nNewAIndx].Data)^.PS_17 := cNewPS_17;
        FieldByName('KdSch').AsInteger  := nNewKdSBU;
        FieldByName('KdPSch').AsInteger := nKdPSch;
        FieldByName('PSch').AsString    := cNewPSch;
        FieldByName('PS_17').AsString   := cNewPS_17;
      end;
      Post;
      bTvReady := true;
      UpdLvlIndx(0);
      Close;
      Open;
      TvLoadFromTable;
      MyTVLocateKdSBU(nNewKdSBU);
      Synchronize;
      b_WasUpdated := true;
      with Form_Dm.cdsSbuLU do begin
        Close;
        Open;
      end;
      // Сделать запись в DbLog
      cMsg := 'Добавл.перед ' + cSchBuPred + ' счёт Код ' +
              IntToStr(nNewKdSbu) + ': Счёт ' + cSchBU  + ', Назв. ' + cNmSch;
      Form_Dm.AddLog(0, 0, 'Add_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.AddRecInCdsDbg(cNmNode, cSchBU, cSch_17,
                            cPSch, cPS_17, cNmSch, cNmPSch, cHsCh: ShortString;
                        nKdSch, nKdPSch, nLvl, nAIndx, nPIndx, nIndx: SmallInt);
begin
  with cdsDbg do begin
    Append;
    FieldByName('Node').AsString    := cNmNode;
    FieldByName('KdSch').AsInteger  := nKdSch;
    FieldByName('SchBU').AsString   := cSchBU;
    FieldByName('Sch_17').AsString  := cSch_17;
    FieldByName('KdPSch').AsInteger := nKdPSch;
    FieldByName('PSch').AsString    := cPSch;
    FieldByName('PS_17').AsString   := cPS_17;
    FieldByName('NmSch').AsString   := cNmSch;
    FieldByName('NmPSch').AsString  := cNmPSch;
    FieldByName('Lvl').AsInteger    := nLvl;
    FieldByName('AIndx').AsInteger  := nAIndx;
    FieldByName('PIndx').AsInteger  := nPIndx;
    FieldByName('Indx').AsInteger   := nIndx;
    FieldByName('PIndx').AsInteger  := nPIndx;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeCreNewParentMovInNewNodeClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    mDestNode, mNewNode : TTreeNode;
    SvNode, PaNode, ChNode : TTreeNode;
    cMsg, cSvSch, cSvSch_17, cSvNmSch, cSvPSch, cSvPS_17, cSvHsCh,
          cPaSch, cPaSch_17, cPaNmSch, cPaPSch, cPaPS_17,
          cChSch, cChSch_17, cChNmSch, cChPSch, cChPS_17 : ShortString;
    nTmpAIndx, nLevel,
    nSvLvl, nSvAIndx, nSvPIndx, nSvIndx,
    nPaLvl, nPaAIndx, nPaPIndx, nPaIndx,
    nChLvl, nChAIndx, nChPIndx, nChIndx,
    nSvKdSch,  nSvKdPSch, nPaKdSch, nPaKdPSch, nChKdSch, nChKdPSch : SmallInt;
begin
  nSvLvl := TV.Selected.Level;
  nSvAIndx := TV.Selected.AbsoluteIndex;
  nSvPIndx := TV.Selected.Index;
  nSvPIndx := TV.Selected.Parent.Index;
  nLevel := TV.Selected.Level;
  if nLevel > 4 then begin
    ShowMessage('  В программе принят ПятиУровневый план счетов' +  #13#10 +
                'Поэтому операция допускается только для корневого, первого' +
                #13#10 + ', второго и третьего  уровня неузлового счёта, если ' +
                #13#10 + 'его нужно сделать сборным');
    Exit;
  end;
  nSvAIndx := TV.Selected.AbsoluteIndex; // на котором сейчас стою и
                                       // впереди которого хочу вставить ПАПУ
  cMsg := 'Первый элемент ПЕРЕД узом "' + TV.Selected.Text + '"';
  MyRecPtr := TV.Selected.Data;    // Это указатель на данные текущей записи
  nSvKdSch  := MyRecPtr.KdSBU;
  nSvKdSch  := MyRecPtr.KdSBU;
  nSvKdPSch := MyRecPtr.KdPSch;
  cSvSch    := MyRecPtr.SchBU;
  cSvNmSch  := MyRecPtr.NmSbu;
  cSvSch_17 := MyRecPtr.Sch_17;
  cSvPSch   := MyRecPtr.PSch;
  cSvPS_17  := MyRecPtr.PS_17;
  cPaSch    := cSvSch;
  cPaNmSch := 'Перед ' + cSvNmSch;
  if AddNewParentNode(cPaSch, cPaSch_17, cPaNmSch,
                      cChSch, cChSch_17, cChNmSch) {a_EPSch} then begin
    with cdsDbg do begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
    //-------------------------------  ДЛЯ ПАПЫ --------------------------------
     nTmpAIndx := nSvAIndx;
//////    bTvReady := false;
    AddRecInCdsDbg('SvNode', cSvSch, cSvSch_17, cSvPSch, cSvPS_17, cSvNmSch,
                     cSvPSch, 'F',
                     nSvKdSch, nSvKdPSch, nSvLvl, nSvAIndx, nSvPIndx, nSvIndx);
    //==============================================================
    PaNode := TV.Items.InsertObject(TV.Items[nTmpAIndx],
                                cPaSch + '  ' + cPaNmSch, MyRecPtr);
    { вставил в качестве Узлового, чтобы в него потом вMov'ить ДИТЯ}
    //==============================================================
    TV.Selected := PaNode;
    nPaKdSch := MaxTreeId + 1;
    New(MyRecPtr);    // Новая запись для ПАПЫ. Помещаю в неё данные о ПАПЕ:
    MyRecPtr.KdSBU  := nPaKdSch;
    MyRecPtr.SchBU  := cPaSch;
    MyRecPtr.NmSBU  := cPaNmSch;
    MyRecPtr.Sch_17 := cPaSch_17;
    nPaLvl := TV.Selected.Level;
    nPaAindx        := TV.Selected.AbsoluteIndex;
//    nPaAindx        := nSvAIndx - 2; // Для себя и для Дитя
    nPaIndx         := TV.Selected.Index;
    // Добавить этот новый TreeNode в таблицу Kd_Sbu  (про Папу)
    // сразу до Close/Open вбиваю новый PSch.
    nPaKdPSch := Get_PSch(nPaAIndx, nPaLvl, nPaPIndx, cPaPSch, cPaPS_17);
    if nPaKdPSch >= 0 then begin
{
      PTreeRec(TV.Items[nNewAIndx].Data)^.PSch := cNewPSch;
      PTreeRec(TV.Items[nNewAIndx].Data)^.PS_17 := cNewPS_17;
      FieldByName('KdSch').AsInteger := nNewKdSBU;
      FieldByName('PSch').AsString   := cNewPSch;
      FieldByName('PS_17').AsString  := cNewPS_17;
}
    end;
    AddRecInCdsDbg('PaNode', cPaSch, cPaSch_17, cPaPSch, cPaPS_17, cPaNmSch,
                     cPaPSch, 'T',
                     nPaKdSch, nPaKdPSch, nPaLvl, nPaAIndx, nPaPIndx, nPaIndx);
    // = = = = = = = = = = = = = = = = = = = = = = = = == = = = = = = =
    AddNewSbu(nPaKdSch, nPaKdPSch, nPaLvl, nPaAIndx, nPaPIndx, nPaIndx,
                             cPaSch, cPaSch_17, cPaNmSch, cPaPSch, cPaPS_17);
    // = = = = = = = = = = = = = = = = = = = = = = = = == = = = = = = =
    UpdLvlIndx(nPaAindx-10); // 1. Правлю Kd_SBU на ПАПУ
    //-------------------------------  ДЛЯ СЫНА --------------------------------
    nChKdSch := nPaKdSch + 1;        // Думаю, что так надёжнее
    New(MyRecPtr);    // Новая запись для ДИТЯ. Помещаю в неё данные о ДИТЕ:
    //===============================================================
    ChNode := TV.Items.InsertObject(TV.Items[nTmpAIndx],
                                cChSch + '  ' + cChNmSch, MyRecPtr);
    // вставил в качестве брата, чтобы тут же пребросить его в PaNode
    ChNode.MoveTo(PaNode, naAddChildFirst);
    //===============================================================
    TV.Selected := ChNode;
    nChAIndx := nPaAIndx + 1; //Просто увеличиваю на 1 // Selected.AbsoluteIndex;
    nChLvl   := nPaLvl + 1;       // т.к. дитя // TV.Selected.Level;
    UpdLvlIndx(nChAindx-10); // 2. Правлю Kd_SBU  на Сына
    nChKdPSch := Get_PSch(nChAIndx, nChLvl, nChPIndx, cChPSch, cChPS_17);
    if nPaKdPSch >= 0 then begin
      MyRecPtr.PSch  := cChPSch;
      MyRecPtr.KdSBU := nChKdSch;
      MyRecPtr.SchBU := cChSch;
      MyRecPtr.KdPSch := nChKdPSch;
      MyRecPtr.PSch   := cChPSch;
      MyRecPtr.Sch_17 := cChPS_17;
      MyRecPtr.NmSBU  := cChNmSch;
    end;
    AddRecInCdsDbg('ChNode', cChSch, cChSch_17, cChPSch, cChPS_17, cChNmSch,
                     cChPSch, 'F',
                     nChKdSch, nChKdPSch, nChLvl, nChAIndx, nChPIndx, nChIndx);
    // Добавить этот новый TreeNode в таблицу Kd_Sbu  (про Дитя)
    // = = = = = = = = = = = = = = = = = = = = = = = = == = = = = = = = =
    AddNewSbu(nChKdSch, nChKdPSch, nChLvl, nChAIndx, nChPIndx, nChIndx,
                               cChSch, cChSch_17, cChNmSch, cChPSch, cChPS_17);
    // = = = = = = = = = = = = = = = = = = = = = = = = == = = = = = = = =
    TV.Selected := ChNode;
    bTvReady := true;
    if bFlagDbg then begin
      cdsDbg.SaveToFile(cDirTemp + 'SbuDbg.cds');
    end;
    qrySbu.Close;
    qrySbu.Open;
    TvLoadFromTable;
    MyTvLocateKdSbu(nChKdSch);
    Synchronize;
    b_WasUpdated := true;
    // Сделать записи в DbLog
    cMsg := 'Добавл.новый родительский счёт Код ' + IntToStr(nPaKdSch) +
            ': Счёт ' + cPaSch  + ', Назв. ' + cPaNmSch;
    Form_Dm.AddLog(0, 0, 'Add_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg);
    cMsg := 'В него дочерним введён счёт Код ' + IntToStr(nPaKdSch) +
            ': Счёт ' + cChSch  + ', Назв. ' + cChNmSch;
    Form_Dm.AddLog(0, 0, 'Edt_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg);
    with Form_Dm.cdsSbuLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeMovInNewNodeClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    mDestNode, mNewNode : TTreeNode;
    cOldSh, cNewSch, cNewSch_17, cOldNm, cNewNmSch, cNewPSch, cNewPS_17,
                                                             cMsg : ShortString;
    nLevel, nSvKdSch, nNewKdSch, nKdPSch : SmallInt;
    nTmpAIndx, nMovAIndx, nNewAIndx, nNewIndx : LongInt;
    nNewLvl, nNewPIndx : SmallInt;
begin
  nLevel := TV.Selected.Level;
  if nLevel > 3 then begin
    ShowMessage('  В программе принят четырёхуровневый план счетов' +  #13#10 +
                'Поэтому операция допускается только для корневого, первого' +
                #13#10 +
                'и второго уровня неузлового счёта, если его нужно сделать сборным');
    Exit;
  end;
  nMovAIndx := TV.Selected.AbsoluteIndex; // на котором стою и
                                               //    который надо пкреместитть
  cMsg := 'Первый элемент ВНУТРЬ узла "' + TV.Selected.Text + '"';
  nSvKdSch  := PTreeRec(TV.Items[nMovAIndx].Data)^.KdSbu;
  cOldSh    := PTreeRec(TV.Items[nMovAIndx].Data)^.SchBU + '/стар';
  cOldNm    := PTreeRec(TV.Items[nMovAIndx].Data)^.NmSbu + ' (стар)';
  cNewSch   := PTreeRec(TV.Items[nMovAIndx].Data)^.SchBU + '/сб';
  cNewNmSch := PTreeRec(TV.Items[nMovAIndx].Data)^.NmSbu + ' (сб)';
  if  AddChildSbuNew(cOldSh, cNewSch, cOldNm,  cNewNmSch) {a_ESbu2} then begin
    // Не изменяя старого, который надо расширить до родительского, ввожу
    // нового родителя с новым автоКодом, но с производным от старого названием
    // Потом в него переношу старый уже существующий счёт первым дитём
    nTmpAIndx := nMovAIndx;
    nNewKdSch := MaxTreeId + 1;
    bTvReady := false;
    New(MyRecPtr);
    MyRecPtr.KdSBU := nNewKdSch;
    MyRecPtr.SchBU := cNewSch;
    MyRecPtr.NmSBU := cNewNmSch;
    //------------------------------------------------------------------------
    mNewNode := TV.Items.InsertObject(TV.Items[nTmpAIndx],
    { вставил в качестве Узлового, чтобы в него потом вMov'ить старый}
                                        cNewSch + '  ' + cNewNmSch, MyRecPtr);
    //------------------------------------------------------------------------
    TV.Selected := mNewNode;
    nNewAIndx := TV.Selected.AbsoluteIndex;
    nNewLvl   := TV.Selected.Level;
    nNewPIndx := TV.Selected.Parent.Index;
    nNewIndx  := TV.Selected.Index;
    // сразу до Close/Open вбиваю новый PSch.
    nKdPSch := Get_PSch(nNewAIndx, nNewLvl, nNewPIndx, cNewPSch, cNewPS_17);
    if nKdPSch >= 0 then begin
{
      PTreeRec(TV.Items[nNewAIndx].Data)^.PSch := cNewPSch;
      PTreeRec(TV.Items[nNewAIndx].Data)^.PS_17 := cNewPS_17;
      FieldByName('KdSch').AsInteger := nNewKdSBU;
      FieldByName('PSch').AsString   := cNewPSch;
      FieldByName('PS_17').AsString  := cNewPS_17;
}
    end;
    PTreeRec(TV.Items[nNewAIndx].Data)^.PSch := cNewPSch;
    // Добавить этот новый TreeNode в таблицу Kd_Sbu
    AddNewSbu(nNewKdSch, nKdPSch, nNewLvl, nNewAIndx, nNewPIndx, nNewIndx,
                           cNewSch, cNewSch_17, cNewNmSch, cNewPSch, cNewPS_17);
    // Сделать 1-ю запись в DbLog
    cMsg := 'Добавл.новый родительский счёт Код ' + IntToStr(nNewKdSch) +
            ': Счёт ' + cNewSch  + ', Назв. ' + cNewNmSch;
    Form_Dm.AddLog(0, 0, 'Add_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg);
    // теперь в него ввести 1-м дочерним старый счёт со СТАРЫМ KdSbu
    mDestNode := mNewNode;
    // у старого изменился АИндкс, т.к. перед ним вставили новый. Поэтому:
    nTmpAIndx := nTmpAIndx + 1;
    mNewNode := TV.Items.Item[nTmpAIndx];
    TV.Selected := mNewNode;
    PTreeRec(TV.Selected.Data)^.KdSbu := nSvKdSch;
    PTreeRec(TV.Selected.Data)^.SchBU := cOldSh;
    PTreeRec(TV.Selected.Data)^.NmSBU := cOldNm;
    TV.Selected.Text := cOldSh + '  ' + cOldNm;
    //--------------------------------------------------------------------------
    mNewNode.MoveTo(mDestNode, naAddChildFirst); // т.к. код перемещённого парня
          // не изменился - ни в каких проводках ничего не gпридётся провить !!!
    //--------------------------------------------------------------------------
    TV.Selected := mNewNode;
    cNewPSch := cNewSch; // т.к. именно в него вводится старый в качестве дочернего
    EdtKdSbu(nSvKdSch, cOldSh, cOldNm, cNewPSch);  // Редактирую запись в Kd_SBU
    bTvReady := true;
//    AddInXXX(nSvKdSch, TV.Selected.AbsoluteIndex, TV.Selected.Index,
//                  TV.Selected.Parent.Index, TV.Selected.Level, cOldSh, cOldNm);

    UpdLvlIndx(0); // Правлю Kd_SBU
    qrySbu.Close;
    qrySbu.Open;
    Synchronize;
    b_WasUpdated := true;
    // Сделать 2-ю запись в DbLog
    cMsg := 'В него дочерним введён счёт Код ' + IntToStr(nSvKdSch) +
            ': Счёт ' + cOldSh  + ', Назв. ' + cOldNm;
//    Form_Dm.AddLog(0, 0, 'Edt_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg);
//    cdsXxx.SaveToFile(cDirTemp + 'Xxx.cds');
    with Form_Dm.cdsSbuLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.AddInXXX(nKdSch, nAIndx, nIndx, nPIndx, nLvl: SmallInt;
                                                     cSch, cNmSch: ShortString);
begin
  with cdsXxx do begin
    Append;
    cdsXxxKdSch.AsInteger := nKdSch;
    cdsXxxKdSch.AsInteger := nKdSch;
    cdsXxxAIndx.AsInteger := nAIndx;
    cdsXxxIndx.AsInteger  := nIndx;
    cdsXxxLvl.AsInteger   := nLvl;
    cdsXxxPIndx.AsInteger := nPIndx;
    cdsXxxSch.AsString := cSch;
    cdsXxxNmSch.AsString := cNmSch;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeAddInNodeClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    cSch, cNmSch, cNewSch, cNewSch_17,  cNewNm,
                     cDestSch,cDestSch_17, cDestNm, cMsg, cArc : ShortString;
    nLevel, nNewKdSch : integer;
    {mDestTreeNode,} mNewTreeNode : TTreeNode;
    nTmpIndx, nTreeViewIndex: LongInt;
    nCurNR : integer;
begin
  nLevel := TV.Selected.Level;
  if nLevel > 3 then begin
    ShowMessage('  В программе принят трехуровневый план счетов' +  #13#10 +
                'Поэтому операция допускается только для корневого и первого' +
                #13#10 +
                'уровня неузлового счёта, если его нужно сделать сборным');
    Exit;
  end;
  nTreeViewIndex := TV.Selected.AbsoluteIndex;
  // Запомнить все реквизиты УЗЛА, в которои создаётся новый счёт (Dest)
//   mDestTreeNode := TV.Items[nTreeViewIndex].Data;  //.KdSbu;
//  nDestKdSch  := PTreeRec(TV.Items[nTreeViewIndex].Data)^.KdSbu;
  cDestSch    := PTreeRec(TV.Items[nTreeViewIndex].Data)^.SchBU;  // + '/стар';
  cDestSch_17 := PTreeRec(TV.Items[nTreeViewIndex].Data)^.Sch_17; // + '/стар';
  cDestNm     := PTreeRec(TV.Items[nTreeViewIndex].Data)^.NmSbu ; //+ ' (стар)';
  cMsg := 'Новый элемент внутрь узла "' + cDestSch + '" ' + cDestNm; // + ')';
   With qrySbu do begin
     Append;
     New(MyRecPtr);
    // Получить необходимые сведения о новом счёте и ввести его в текущий УЗЕЛ
    cNewSch    := PTreeRec(TV.Items[nTreeViewIndex].Data)^.SchBU;  // + '/сб';
    cNewSch_17 := PTreeRec(TV.Items[nTreeViewIndex].Data)^.Sch_17; // + '/сб';
    cNewNm     := PTreeRec(TV.Items[nTreeViewIndex].Data)^.NmSbu;  // + ' (сб)';
    nCurNR := 0;

    if TFormNewItem.EditAccnt(
      cMsg, nCurNR, cNewSch, cNewSch_17, cNewNm, cArc) then
    begin
      nTmpIndx  := nTreeViewIndex;
      nNewKdSch := MaxTreeId + 1;
      bTvReady  := false;
      cSch   := cNewSch;
      cNmSch := cNewNm;
      MyRecPtr.KdSBU := nNewKdSch;
      MyRecPtr.SchBU := cSch;
      MyRecPtr.NmSBU := cNmSch;
      //---------------------------------------------------------------------
      mNewTreeNode := TV.Items.InsertObject(TV.Items[nTmpIndx],
                                          cNewSch + '  ' + cNewNm, MyRecPtr);
      //---------------------------------------------------------------------
      TV.Selected := mNewTreeNode;
      bTvReady := true;
      // Правлю таблицу Kd_SBU
      UpdLvlIndx(0);
      Close;
      Open;
      Synchronize;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeMoveInToClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    mCurTreeNode, mDestTreeNode, mNewTreeNode : TTreeNode;
    cShCurItem, cNmCurItem : string;
    bCurHsCh, bNewHsCh : boolean;
    nCurAindx, nCurPIndx, nNewPIndx, nAIndxNewParent : LongInt;
    nKdSch, nNewKdSch, nSvKdSch : integer;
    cNewSch, {c_Sch_17,} cNewNmSch, cDestShSch,
              cNewPSch, cNewSch_17,  cNewPS_17, cDestNmSch : ShortString;
    nTmpIndx : LongInt;
    cOldSh, cNewSh, cNewChldSh, cOldNm, cNewNm, cNewChldNm : ShortString;
    nKdPSch, nLvl, nAIndx, nPIndx, nIndx : SmallInt;
begin
  mCurTreeNode := TV.Selected;
  nCurAIndx := TV.Selected.AbsoluteIndex;
  nCurPIndx := TV.Selected.Parent.Index;
  bCurHsCh := TV.Selected.HasChildren;
  cShCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.SchBU;
  cNmCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.NmSBU;
  if SbuGoToParent(cShCurItem, cNmCurItem, bCurHsCh,  {a_SbuGoT}
                   nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent) then begin
    mDestTreeNode := TV.Items.Item[nAIndxNewParent];
    bNewHsCh   := mDestTreeNode.HasChildren;
    nSvKdSch   := PTreeRec(TV.Items[nAIndxNewParent].Data)^.KdSBU;
    cDestShSch := PTreeRec(TV.Items[nAIndxNewParent].Data)^.SchBU;
    cDestNmSch := PTreeRec(TV.Items[nAIndxNewParent].Data)^.NmSBU;
    bTvReady := false;
    // Все изменения сначала вношу только в дерево
    // А потом гамузом перестраиваю всю таблицу Kd_SBU (иначе лезут ошибки)
    if not bNewHsCh then begin
      // Запросить реквизиты для нового родителя и старого дитя на новом месте
      cOldSh := cDestShSch + '/нов';
      cOldNm := cDestNmSch + ' (нов.)';
      cNewSh := cDestShSch + '/сб';
      cNewNm := cDestNmSch + ' (сборн.)';
      cNewChldSh := cShCurItem;
      cNewChldNm := cNmCurItem;
      if AddChildSbu(cOldSh, cNewSh, cNewChldSh,    {A_ESbuCh}
                           cOldNm,  cNewNm,  cNewChldNm) then begin
        // 1. Открыть впереди mDestTreeNode новый TreeNode с названием, производ-
        //    ным от названия mDestTreeNode (добавить "Группа", но с новым кодом
        nTmpIndx := nAIndxNewParent;
        nNewKdSch := MaxTreeId + 1;
        New(MyRecPtr);
        cNewSch := cNewSh;
        cNewNmSch   := cNewNm;
        MyRecPtr.KdSBU := nNewKdSch;
        MyRecPtr.SchBU := cNewSch;
        MyRecPtr.NmSBU := cNewNmSch;
        mNewTreeNode := TV.Items.InsertObject(TV.Items[nTmpIndx],
                                      cNewSch + '  ' + cNewNmSch, MyRecPtr);
        TV.Selected := mNewTreeNode;
        // Добавить этот новый mNewTreeNode в таблицу Kd_SBU
{
    procedure AddNewSbu(nKdSbu, nKdPSch, nLvl, nAIndx, nPIndx, nIndx : integer;
                        cSchBU, cSch_17, cNmSch, cPSch, cPS_17 : ShortString);
}
        AddNewSbu(nNewKdSch, nKdPSch, nLvl, nAIndx, nPIndx, nIndx,
                           cNewSch, cNewSch_17, cNewNmSch, cNewPSch, cNewPS_17);
        // 2. Теперь приемником становится новый TreeNode. Сам mDestTreeNode
        //    переименовываю в mNewTreeNode и, не меняя его кода (nSvKdSbu) и
        //    чуть-чуть перекроив название, переношу в новый узел как 1-й дочерний
        mDestTreeNode := mNewTreeNode;
        // {теперь у приемника изменился АИндкс. Поэтому:}
        nTmpIndx := nTmpIndx + 1;
        mNewTreeNode := TV.Items.Item[nTmpIndx];
        TV.Selected := mNewTreeNode;
        nKdSch := nSvKdSch;
        cNewSch := cOldSh;
        cNewNmSch := cOldNm;
        PTreeRec(TV.Selected.Data)^.KdSBU := nKdSch;
        PTreeRec(TV.Selected.Data)^.SchBU := cNewSch;
        PTreeRec(TV.Selected.Data)^.NmSBU := cNewNmSch;
        TV.Selected.Text := cNewSch + '  ' + cNewNmSch;
        //==================================================
        mNewTreeNode.MoveTo(mDestTreeNode, naAddChildFirst);
        TV.Selected := mNewTreeNode;
        //==================================================
        // 3. И наконец переносимый mCurTreeNode перемещаю в mDestTreeNode:
        //==================================================
         mCurTreeNode.MoveTo(mDestTreeNode, naAddChild);
         //==================================================
       TV.Selected := mCurTreeNode;
        // Правлю Kd_SBU
        bTvReady := true;
        UpdLvlIndx(0);
        qrySbu.Close;
        qrySbu.Open;
        Synchronize;
        Form_Dm.cdsSbuLU.Close;
        Form_Dm.cdsSbuLU.Open;
        b_WasUpdated := true; end
      else begin
        Exit;
      end; end
    else begin
      // Без доп. вопросов переносимый mCurTreeNode перемещаю в mDestTreeNode:
      mCurTreeNode.MoveTo(mDestTreeNode, naAddChild);
      TV.Selected := mCurTreeNode;
      bTvReady := true;
      UpdLvlIndx(0);
      qrySbu.Close;
      qrySbu.Open;
      Synchronize;
      Form_Dm.cdsSbuLU.Close;
      Form_Dm.cdsSbuLU.Open;
      b_WasUpdated := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeMoveToClick(Sender: TObject);
var CurNode, DestNode : TTreeNode;
    nCurAIndx, nCurPIndx, nAIndxNewParent : integer;
    nNewAIndx, nNewLvl, nNewPIndx : integer;
    cCurShSch, cCurNmSch, cNewPSch, cPeredSchBU, cMsg : ShortString;
    bCurHsCh : boolean;
    nCurKdSBU, nPeredKdSch : SmallInt;
begin
  CurNode := TV.Selected;
  nCurAIndx := TV.Selected.AbsoluteIndex;
  nCurPIndx := TV.Selected.Parent.Index;
  bCurHsCh  := TV.Selected.HasChildren;
  nCurKdSBU := PTreeRec(TV.Items[nCurAindx].Data)^.KdSBU;
  cCurShSch := PTreeRec(TV.Items[nCurAindx].Data)^.SchBU;
  cCurNmSch := PTreeRec(TV.Items[nCurAindx].Data)^.NmSBU;
  if SbuMoveTo(cCurShSch, cCurNmSch, bCurHsCh,          {a_SbuGoT}
                  nCurAIndx, nCurPIndx, nPeredKdSch, cPeredSchBU,
                                nNewPIndx, nAIndxNewParent) then begin
    DestNode := TV.Items.Item[nAIndxNewParent];
    //---------------------------------
    CurNode.MoveTo(DestNode, naInsert);
    //---------------------------------
    TV.Selected := CurNode;
    // выяснить параметры на новом месте и исправить KdPSch
    nNewAIndx := TV.Selected.AbsoluteIndex;
    nNewLvl   := TV.Selected.Level;
    nNewPIndx := TV.Selected.Parent.Index;
    if nNewPIndx = -1 {не имеет папы} then
      cNewPSch := ''
    else
//      cNewPSch := Get_PSch(nNewAIndx, nNewLvl, nNewPIndx);
    PTreeRec(TV.Items[nCurAindx].Data)^.PSch := cNewPSch;
    UpdPSchInBD(nCurAIndx, cNewPSch);  // qrySbu пока еще стоит на старом месте
                                       // поэтому подставляем старый nCurAIndx
    bTvReady := true;
    UpdLvlIndx(0);
    qrySbu.Close;
    qrySbu.Open;
    Synchronize;
    cMsg := 'Перемещение счёта с кодом ' + IntToStr(nCurKdSBU) +
            ': Счёт ' + cCurShSch + ' расположен перед ' +
            IntToStr(nPeredKdSch) + ' счётом ' + cPeredSchBU;
    Form_Dm.AddLog(0, 0, 'Edt_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg);
    b_WasUpdated := true;
    with Form_Dm.cdsSbuLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.UpdPSchInBD(nAIndx : integer; cPSch : ShortString);
begin
  with qryXXX do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update ' + tbl_KdSBU + ' set PSCH = :cPSch ' +
            ' where AIndx = :nAIndx');
    ParamByName('cPSch').AsString := Trim(cPSch);
    ParamByName('nAIndx').AsInteger := nAIndx;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeDelClick(Sender: TObject);
var nSvKdSch,  nKdSBU : integer; cSchBU, cNmSch, cMsg, cNmTbl : ShortString;
    bCanDelete : boolean;
begin
  if TV.Selected.HasChildren then begin
    MessageDlg('Сначала должны быть по одному удалены все ' +
               'элементы, входящие в узел', mtError, [mbOk], 0);
    Exit;
  end;
  Application.ProcessMessages;
  nKdSBU := PTreeRec(TV.Selected.Data)^.KdSBU;
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Select first 1 * from gk_ObDt ' +
            ' where (KdSchDbt = :nKdSBU) or (KdSchKrt = :nKdSBU)');
    ParamByName('nKdSBU').AsInteger := nKdSBU;
    Open;
    bCanDelete := (RecordCount = 0);
    if not bCanDelete then
      cNmTbl := '"Gk_ObDt"';
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select first 1 * from gk_Ost ' +
              ' where (KdSchDbt = :nKdSBU) or (KdSchKrt = :nKdSBU)');
      ParamByName('nKdSBU').AsInteger := nKdSBU;
      Open;
      bCanDelete := (RecordCount = 0);
      if not bCanDelete then
        cNmTbl := '"Gk_Ost"';
    end;
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select first 1 * from K_Opl ' +
            ' where (KdSchDbt = :nKdSBU) or (KdSchKrt = :nKdSBU)');
      ParamByName('nKdSBU').AsInteger := nKdSBU;
      Open;
      bCanDelete := (RecordCount = 0);
      if not bCanDelete then
        cNmTbl := '"K_Opl"';
    end;
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select first 1 * from ProvBnk ' +
            ' where (KdSBU = :nKdSBU) or (KdKrrSbu = :nKdSBU)');
      ParamByName('nKdSBU').AsInteger := nKdSBU;
      Open;
      bCanDelete := (RecordCount = 0);
      if not bCanDelete then
        cNmTbl := '"ProvBnk"';
    end;
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select first 1 * from Prov106sbu ' +
              ' where (KdSBU = :nKdSBU) or (KdKrrSch = :nKdSBU)');
      ParamByName('nKdSBU').AsInteger := nKdSBU;
      Open;
      bCanDelete := (RecordCount = 0);
      if not bCanDelete then
        cNmTbl := '"Prov106sbu"';
    end;
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select first 1 * from Z_NU where (KdSPZ = :nKdSBU)');
      ParamByName('nKdSBU').AsInteger := nKdSBU;
      Open;
      bCanDelete := (RecordCount = 0);
      if not bCanDelete then
        cNmTbl := '"Z_NU"';
    end;
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select first 1 * from ' + tbl_UBook +
              ' where (KdSchBU = :nKdSBU) or ' +
              ' (KdKrrSch = :nKdSBU) or (KdSchSR = :nKdSBU)');
      ParamByName('nKdSBU').AsInteger := nKdSBU;
      Open;
      bCanDelete := (RecordCount = 0);
      if not bCanDelete then begin
        if bFlagStG then
          cNmTbl := '"U2_BOOK"'
        else
          cNmTbl := '"U_BOOK"';
      end;
    end;
//------------------------------------------------------------------------------
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select first 1 * from ' + tbl_FMov +
              ' where (KdSch = :nKdSBU) or ' +
              ' (KdKrrSch = :nKdSBU)');
      ParamByName('nKdSBU').AsInteger := nKdSBU;
      Open;
      bCanDelete := (RecordCount = 0);
      if not bCanDelete then begin
        if bFlagStG then
          cNmTbl := '"F2_MOV"'
        else
          cNmTbl := '"F_MOV"';
      end;
    end;
//------------------------------------------------------------------------------
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if not bCanDelete then begin
    cMsg := 'Нельзя удалять эту запись - на нее ' +
               'есть ссылки в таблице ' + cNmTbl;
    MessageDlg(cMsg, mtError, [mbOk], 0);
    Exit; end
  else begin
    cSchBU := qrySbu.FieldByName('SchBU').AsString;
    cNmSch := qrySbu.FieldByName('NmSch').AsString;
    cMsg := '"' + TV.Selected.Text + '"' + #13#10 + 'удаляется безвозвратно';
    cMsg := cMsg + #13#10 + 'Вы согласны?:';
    if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      bTvReady := false;
      TV.Items.Delete(TV.Selected);
      qrySbu.Delete;
      nSvKdSch := qrySbuKdSch.AsInteger;
      bTvReady := true;
      UpdLvlIndx(0);
      qrySbu.Close;
      qrySbu.Open;
      MyTvLocateKdSbu(nSvKdSch);
      Synchronize;
      b_WasUpdated := true;
      with Form_Dm.cdsSbuLU do begin
        Close;
        Open;
      end;
      // Сделать запись в DbLog
      cMsg := 'Удален счёт Код ' + IntToStr(nKdSbu) +
              ': Счёт ' + cSchBU  + ', Назв. ' + cNmSch;
      Form_Dm.AddLog(0, 0, 'Del_SBU', gc_AppNmUsr, 'Kd_SBU', cMsg);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeLoadFromTableClick(Sender: TObject);
begin
  TvLoadFromTable;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeLoadFromTvSbuClick(Sender: TObject);
begin
  TvLoadFromTvSBU;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.TvLoadFromTvSBU;
// Заранее создать текстовый файл cNmTV1 = Sbu_r.tv1 (с ним легче работать
// из редактора) и загрузить его в дерево. Заполнить связанные объекты
var cNmTv1 : string;
    i : integer;
    MyTreeRec : PTreeRec;
begin
  cNmTv1 := 'Sbu_r.tv1';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KdSBU + ' order by AIndx, Lvl, PIndx');
    Open;
    TV.Items.BeginUpdate;
    TV.Items.Clear;

    TV.LoadFromFile(cDirSbu + cNmTV1);
    TV.Items.EndUpdate;
    // Заполнить связанные Objects
    First;
    i := 0;
    while not Eof do begin
      New(MyTreeRec);
      MyTreeRec.KdSbu := FieldByName('KdSch').AsInteger;
      MyTreeRec.SchBU := Trim(FieldByName('SchBU').AsString);
      MyTreeRec.NmSBU := Trim(FieldByName('NmSch').AsString);
      TV.Items[i].Data := MyTreeRec;
      Inc(i);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.FormHide(Sender: TObject);
begin
  n_SvKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.TVCustomDrawItem(Sender: TCustomTreeView;
            Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var i : integer;
begin
  if bNaborMode then with TV.Canvas do begin
    i := m_LstSbu.IndexOf(IntToStr(Node.AbsoluteIndex));
    if (cdsSelected in State) then
      Brush.Color := clAqua;
    if i >= 0 then
      Font.Color := clRed
    else
      Font.Color := clWindowText;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.sBtnSelCurrentClick(Sender: TObject);
var nKdSbu, i, iSel, iSvSel, nTvCount, nLvl : integer;
    cSelIndx, cSchBU, cNmSch  : string;
begin
  if not bNaborMode then
    Exit;
  nTvCount := TV.Items.Count;
  if (TV.Selected <> nil) then begin
    iSel := TV.Selected.AbsoluteIndex;
    if Tv.Items[iSel].HasChildren then begin
      iSvSel := iSel;  // сохранить позицию "папаши"
      TV.Items.BeginUpdate;
      // Выбрать всю группу
      nLvl := TV.Items[iSel].Level + 1;
      while TRUE and (iSel < nTvCount-1) do begin
        Inc(iSel);
        if (not Tv.Items[iSel].HasChildren) and
                           (TV.Items[iSel].Level = nLvl) then begin
          nKdSbu := PTreeRec(TV.Items[iSel].Data)^.KdSbu;
          i := m_LstSbu.IndexOf(IntToStr(iSel));
          if i < 0 then begin
            m_LstSbu.Add(IntToStr(iSel));
            cSchBU := PTreeRec(TV.Items[iSel].Data)^.SchBU;
            cNmSch := PTreeRec(TV.Items[iSel].Data)^.NmSBU;
            with cdsTmp do begin
              Append;
              FieldByName('AIndx').AsInteger := iSel;
              FieldByName('KdSbu').AsInteger := nKdSbu;
              FieldByName('SchBU').AsString := cSchBU;
              FieldByName('NmSch').AsString := cNmSch;
              Post;
            end; end
          else begin
            m_LstSbu.Delete(i);
            if cdsTmp.Locate('KdSbu', nKdSbu, []) then
              cdsTmp.Delete;
          end; end
        else begin
//          TV.Items[iSel].Selected := true;
          Break;
        end;
        if iSel < nTvCount-1 then
          TV.Items[iSel+1].Selected := true
        else begin
          TV.Items[iSel-1].Selected := true;
          TV.Items[iSel].Selected := true;
        end;
      end;
//      TV.Items.BeginUpdate;
      if Tv.Items[iSvSel].Expanded then
        Tv.Items[iSvSel].Collapse(true);
      Tv.Items[iSvSel].Expand(true);
      TV.Items.EndUpdate; end
    else begin
      nKdSbu := PTreeRec(Tv.Selected.Data)^.KdSbu;
      cSelIndx := IntToStr(iSel);
      i := m_LstSbu.IndexOf(cSelIndx);
      if i < 0 then begin
        m_LstSbu.Add(cSelIndx);
        cdsTmp.Append;
        cdsTmp.FieldByName('AIndx').AsInteger := iSel;
        cdsTmp.FieldByName('KdSbu').AsInteger := nKdSbu;
        cdsTmp.FieldByName('SchBU').AsString := PTreeRec(Tv.Selected.Data)^.SchBU;
        cdsTmp.FieldByName('NmSch').AsString := PTreeRec(Tv.Selected.Data)^.NmSbu;
        cdsTmp.Post; end
      else begin
        m_LstSbu.Delete(i);
        if cdsTmp.Locate('KdSbu', nKdSbu, []) then
          cdsTmp.Delete;
      end;
      if iSel < nTvCount-1 then
        TV.Items[iSel+1].Selected := true
      else begin
        TV.Items[iSel-1].Selected := true;
        TV.Items[iSel].Selected := true;
      end;
    end;
  end;
  sBtnSelAll.Enabled := m_LstSbu.Count < nTvCount;
  sBtnUnSelAll.Enabled := m_LstSbu.Count > 0;
  if m_LstSbu.Count > 0 then
    LabelCntSel.Caption := 'Помечено счетов: ' + IntToStr(m_LstSbu.Count)
  else
    LabelCntSel.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.sBtnSelAllClick(Sender: TObject);
var i, nKdSbu : integer; cSchBU, cNmSch : string;
begin
  //nTvCount := TV.Items.Count;
  cdsTmp.Close;
  cdsTmp.CreateDataSet;
  cdsTmp.Open;
  m_LstSbu.Clear;
  for i := 0 to TV.Items.Count-1 do begin
    if not Tv.Items[i].HasChildren then begin
      m_LstSbu.Add(IntToStr(i));
      nKdSbu := PTreeRec(TV.Items[i].Data)^.KdSbu;
      cSchBU := PTreeRec(TV.Items[i].Data)^.SchBU;
      cNmSch := PTreeRec(TV.Items[i].Data)^.NmSbu;
      with cdsTmp do begin
        Append;
        FieldByName('AIndx').AsInteger := i;
        FieldByName('KdSbu').AsInteger := nKdSbu;
        FieldByName('SchBU').AsString := cSchBU;
        FieldByName('NmSch').AsString := cNmSch;
        Post;
      end;
    end;
  end;
  sBtnUnSelAll.Enabled := true;
  LabelCntSel.Caption := 'Помечено счетов: ' + IntToStr(m_LstSbu.Count);
  Tv.Repaint;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.dbgrTmpDblClick(Sender: TObject);
var i : integer;
begin
  if cdsTmp.RecordCount > 0 then begin
    i := cdsTmp.FieldByName('AIndx').AsInteger;
    TV.Items[i].Selected := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.dbgrTmpEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.dbgrTmpExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.sBtnUnSelAllClick(Sender: TObject);
begin
  cdsTmp.Close;
  cdsTmp.CreateDataSet;
  cdsTmp.Open;
  m_LstSbu.Clear;
  Tv.Repaint;
  LabelCntSel.Caption := '';
  sBtnUnSelAll.Enabled := false;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.sBtnPSCHClick(Sender: TObject);
var nAIndx, nLvl, nPIndx, nKdSch, nKdPSch : integer;
    cPSch, cPS_17 : ShortString;
begin
  with qryXXX do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update ' + tbl_KdSBU + ' set PSch = :cPSch, PS_17 = :cPS_17, ' +
            ' KdPSch = :nKdPSch where KdSch = :nKdSch');
    Prepare;
  end;
  with qrySbu do begin
    First;
    while not Eof do begin
      nKdSch  := FieldByName('KdSch').AsInteger;
      nKdPSch := FieldByName('KdSch').AsInteger;
      nAIndx  := FieldByName('AIndx').AsInteger;
      nLvl    := FieldByName('Lvl').AsInteger; // + 1;
      nPIndx  := FieldByName('PIndx').AsInteger;
      // это все текущего KdSch. Определяю его PS_17
      nKdPsch := Get_PSch(nAIndx, nLvl, nPIndx, cPSch, cPS_17);
      if nKdPSch > 0 then begin
        qryXXX.ParamByName('nKdSch').AsInteger  := nKdSch;
        qryXXX.ParamByName('nKdPSch').AsInteger := nKdPSch;
        qryXXX.ParamByName('cPSch').AsString    := Trim(cPSch);
        qryXXX.ParamByName('cPS_17').AsString   := Trim(cPS_17);
        qryXXX.ExecSQL;
      end;
      Next;
    end;
  end;
  qrySbu.Close;
  qrySbu.Open;
  Synchronize;
  with qryXXX do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormTSbu.Get_PSch(nAIndx, nLvl, nPIndx : SmallInt;
                                 var cPSch, cPS_17 : ShortString ) : SmallInt;
begin
  Result := -1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 AIndx, KdSch, SchBU, Sch_17 from ' + tbl_KdSbu +
            ' where AIndx < :nAIndx and ' +
            ' Lvl = :nLvl and Indx = :nIndx order by AIndx desc');
    ParamByName('nLvl').AsInteger := nLvl - 1; // Папа на один уровень выше
    ParamByName('nAIndx').AsInteger := nAIndx; // AIndx у папы <, чем у дитя
    ParamByName('nIndx').AsInteger := nPIndx;  // Indx у папы, как у дитя PIndx
    Open;    // т.к. Select First 1 и order by AIndx desc, выхожу точно на папу,
    if RecordCount > 0 then begin      // если он есть. Не подводило ни разу !!!
      Result := FieldByName('KdSch').AsInteger;
      cPSch := Trim(FieldByName('SchBU').AsString);
      cPS_17 := Trim(FieldByName('Sch_17').AsString);
    end;
    Close;
  end;
end;
(*
//------------------------------------------------------------------------------
function TFormTSbu.Get_PS_17(nAIndx, nLvl, nPIndx: SmallInt): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 AIndx, KdSch, SchBU, Sch_17 from ' + tbl_KdSbu +
            ' where AIndx < :nAIndx and ' +
            ' Lvl = :nLvl and Indx = :nIndx order by AIndx desc');
    ParamByName('nLvl').AsInteger := nLvl - 1; // Папа на один уровень выше
    ParamByName('nAIndx').AsInteger := nAIndx; // AIndx у папы <, чем у дитя
    ParamByName('nIndx').AsInteger := nPIndx;  // Indx у папы, как у дитя PIndx
    Open;    // т.к. Select First 1 и order by AIndx desc, выхожу точно на папу,
    if RecordCount > 0 then            // если он есть. Не подводило ни разу !!!
      Result := FieldByName('Sch_17').AsString;
    Close;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormTSbu.bBtnOkClick(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.sBtnPrtClick(Sender: TObject);
begin
  F6PrtTSbu(qrySbu); {a_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeSaveToTableClick(Sender: TObject);
begin
//  TvSaveToTable;   Сохранено ниже на всякий случай !!!!
end;
(*
//------------------------------------------------------------------------------
procedure TFormTSbu.TvSaveToTable;
var cSchBU, cNmSBU, cHsCh : string;
    i, nCntAdd, nKdSBU, nLvl, nIndx, nAIndx, nPIndx : SmallInt;
begin
  // Сохранить дерево в таблицу Kd_SBU
  Form_Dm.DbMain.StartTransaction;
  // Сделать по науке с TRY - EXCEPT
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Delete from Kd_SBU');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Set generator Nr_Kd_SBU to 0');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Insert into ' + tbl_KdSBU +
            ' (KdSch, SchBU, NmSch, AIndx, PIndx, Lvl, Indx, HsCh) ');
    SQL.Add(' values (:nKdSBU, :cSchBU, :cNmSBU, ' +
             ' :nAIndx, :nPIndx, :nLvl, :nIndx, :cHsCh)');
    Prepare;
  end;
  nCntAdd := 0;
  for i := 0 to TV.Items.Count-1 do begin
    nKdSBU := PTreeRec(TV.Items[i].Data)^.KdSBU;
    cSchBU := PTreeRec(TV.Items[i].Data)^.SchBU;
    cNmSBU := PTreeRec(TV.Items[i].Data)^.NmSBU;
    nLvl   := TV.Items[i].Level;
    nIndx  := TV.Items[i].Index;
    nAIndx := TV.Items[i].AbsoluteIndex;
    nPIndx := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('nKdSBU').AsSmallInt := nKdSBU;
    qryTmp.ParamByName('cSchBU').AsString   := cSchBU;
    qryTmp.ParamByName('cNmSBU').AsString   := cNmSBU;
    qryTmp.ParamByName('nAIndx').AsSmallInt := nAIndx;
    qryTmp.ParamByName('nPIndx').AsSmallInt := nPIndx;
    qryTmp.ParamByName('nLvl').AsSmallInt   := nLvl;
    qryTmp.ParamByName('nIndx').AsSmallInt  := nIndx;
    qryTmp.ParamByName('cHsCh').AsString    := cHsCh;
    qryTmp.ExecSQL;
    Inc(nCntAdd);
  end;
  Form_Dm.DbMain.Commit;
  qryTmp.UnPrepare;
  b_WasUpdated := true;
  //if bFlagDbg then
  //  ShowMessage('Добавлено записей: ' + IntToStr(nCntAdd));
  // Переоткрыть наборы
end;
*)
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeChngNmTemuClick(Sender: TObject);
begin
// Тут затевал "массовое" изменение названий тем, но почему-то бросил.
// А теперь забыл, как я хотел это сделать :-(
//  if SbuAdd {a_SbuAdd} then;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.ChBoxFullExpandClick(Sender: TObject);
begin
  SetTvExpandState;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.SetTvExpandState;
var nSvNR : SmallInt;
begin
  nSvNR := 0;
  if (TV.Selected <> nil) then
    nSvNR := PTreeRec(TV.Selected.Data)^.KdSBU;
  if ChBoxFullExpand.Checked then
    popTreeFullExpand.Click
  else
    popTreeFullCollapse.Click;
  ActiveControl := TV; //.SetFocus;
  if nSvNR > 0 then
    MyTVLocateKdSbu(nSvNR);
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.TVEnter(Sender: TObject);
begin
  TV.Color := $00DEF7FE;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.TVExit(Sender: TObject);
begin
  TV.Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.sBtnPanelSvSchClick(Sender: TObject);
begin
  PanelSvSch.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreePanelSvSchClick(Sender: TObject);
begin
  PanelSvSch.Visible := true;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.dbgrSBUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrSbu.Canvas do begin
    if (gdFocused in State) then
      Brush.Color := clWhite
    else if ((cFldNm = 'HSCH') or (cFldNm = 'KDSCH')) and
                                   (qrySbuHsCh.AsString = 'T') then
      Brush.Color := clYellow;
  end;
  dbgrSbu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popShwBothClick(Sender: TObject);
begin
  if not popShwBoth.Checked then begin
    popShwBoth.Checked := true;
    popShwNew.Checked  := false;
    popShwOld.Checked  := false;
    qrySbu.DisableControls;
    TvLoadFromTable;
    qrySbu.EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popShwNewClick(Sender: TObject);
begin
  if not popShwNew.Checked then begin
    popShwBoth.Checked := false;
    popShwNew.Checked  := true;
    popShwOld.Checked  := false;
    qrySbu.DisableControls;
    TvLoadFromTable;
    qrySbu.EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popShwOldClick(Sender: TObject);
begin
  if not popShwOld.Checked then begin
    popShwBoth.Checked := false;
    popShwNew.Checked  := false;
    popShwOld.Checked  := true;
    qrySbu.DisableControls;
    TvLoadFromTable;
    qrySbu.EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popTreeFindClick(Sender: TObject);
var cSch2Find : ShortString; nErrCode : integer;
    bNewSch, bNm : boolean; cMsg : ShortString;
    nKdSch : integer;
begin
  cSch2Find := GetSchToPoisk(bNewSch,bNm); {a_Sch2Fi}
  if cSch2Find > '' then begin
    with qryTmp do begin
      if Active then Close;
      DataBaseName := CESMAIN;
      SQL.Clear;
      if not bNm then begin
        SQL.Add('Select * from kd_Sbu where Sch_17 = :cSch2Find');
        ParamByName('cSch2Find').AsString  := cSch2Find; end
      else begin
        SQL.Add('Select * from kd_Sbu where Upper(NMSCH) containing :cSch2Find');
        ParamByName('cSch2Find').AsString  := AnsiUpperCase(cSch2Find);
      end;
      Open;
      If RecordCount > 0 then begin
      nKdSch    := FieldByName('KdSch').AsInteger;
      cSch2Find := FieldByName('Sch_17').AsString; end;
    end;
    If qryTmp.RecordCount > 1 then begin
      ShowVubSch(nKdSch, qryTmp);

//      dbcbf.Width   := TV.Width;
//      dbcbf.Columns[2].Width := TV.Width - 150;
//      dbcbf.Visible := true;
      end
    else begin
      MyTVLocateKdSBU(nKdSch);
      ActiveControl := TV;
      if nErrCode = 1 then
        cMsg := 'Счёт  "' + cSch2Find + '" не найден в плане счетов среди ';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popArcNoShwClick(Sender: TObject);
begin
  if not popArcNoShw.Checked then begin
    popArcNoShw.Checked := true;
    popArcShw.Checked   := false;
    TvLoadFromTable;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.popArcShwClick(Sender: TObject);
begin
  if not popArcShw.Checked then begin
    popArcNoShw.Checked := false;
    popArcShw.Checked   := true;
    TvLoadFromTable;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTSbu.Panel4Click(Sender: TObject);
begin
  ActiveControl := TV;
end;

procedure TFormTSbu.dbcbfDblClick(Sender: TObject);
var nKdSch   : integer;
    nErrCode : Integer;
    cMsg     : String;
begin
  nKdSch := qryTmp.fieldByName('KdSch').AsInteger;
  MyTVLocateKdSBU(nKdSch);
  dbcbf.Visible := false;
  ActiveControl := TV;
end;

procedure TFormTSbu.chBoxVClick(Sender: TObject);
begin
  TvLoadFromTable;
end;

end.
