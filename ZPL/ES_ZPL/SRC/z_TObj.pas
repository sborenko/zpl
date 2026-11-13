unit z_TObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, StdCtrls, Buttons, ExtCtrls, ComCtrls, IniFiles,
  Math, Menus, Grids, DBGrids, DBClient;

type
  String15 = string[15];
  PTreeRec = ^TTreeRec;
  TTreeRec = record
    KdObj : SmallInt;
    ShObj : String15;
    NmObj : string;
    KdSPZ : SmallInt;
    FioUpoln : string;
  end;
  TFormTObj = class(TForm)
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    popTvObj: TPopupMenu;
    popTvObjVubor: TMenuItem;
    popTvObjFullExpand: TMenuItem;
    popTvObjFullCollapse: TMenuItem;
    popTvObjExit: TMenuItem;
    popTvObjSep1: TMenuItem;
    popTvObjEdt: TMenuItem;
    popTvObjAddInRoot: TMenuItem;
    popTvObjAddFirstInCurrent: TMenuItem;
    popTvObjAddLastInCurrent: TMenuItem;
    popTvObjInsertBeforeCurrent: TMenuItem;
    popTvObjAddInNode: TMenuItem;
    popTvObjDel: TMenuItem;
    popTvObjSep2: TMenuItem;
    popTvObjSaveToFile: TMenuItem;
    popTvObjLoadFromFile: TMenuItem;
    popTvObjSaveToTable: TMenuItem;
    popTvObjLoadFromTable: TMenuItem;
    qryTmp: TQuery;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    popTvRebuildObjTable: TMenuItem;
    popTvObjMoveToBefore: TMenuItem;
    qryObj: TQuery;
    qryObjNR: TIntegerField;
    qryObjKDOBJ: TSmallintField;
    qryObjSHOBJ: TStringField;
    qryObjNMOBJ: TStringField;
    qryObjAINDX: TSmallintField;
    qryObjPINDX: TSmallintField;
    qryObjLVL: TSmallintField;
    qryObjINDX: TSmallintField;
    qryObjHSCH: TStringField;
    qryObjKDSPZ: TSmallintField;
    qryObjKDUPOS: TSmallintField;
    qryObjKASSA: TSmallintField;
    qryObjFIOUPOLN: TStringField;
    dsrcObj: TDataSource;
    updObj: TUpdateSQL;
    popTvObjMoveInTo: TMenuItem;
    Panel2: TPanel;
    TV: TTreeView;
    dbgrObj: TDBGrid;
    qryObjSPZ: TStringField;
    qryObjSZATR: TStringField;
    qryObjSBU: TStringField;
    popTvDelMeFirst: TMenuItem;
    qryObjKDSPS: TSmallintField;
    Splitter1: TSplitter;
    PanelNabor: TPanel;
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    dbgrTmp: TDBGrid;
    PanelMsg: TPanel;
    sBtnSelCurrent: TSpeedButton;
    sBtnSelAll: TSpeedButton;
    sBtnUnSelAll: TSpeedButton;
    LabelMsg: TLabel;
    sBtnDelMe: TSpeedButton;
    LabelCntSel: TLabel;
    sBtnPrt: TSpeedButton;
    PanelDelMsg: TPanel;
    Label1: TLabel;
    qryObjNR_GORD: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVDblClick(Sender: TObject);
    procedure popTvObjEdtClick(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure qryObjAfterPost(DataSet: TDataSet);
    procedure popTvObjAddInRootClick(Sender: TObject);
    procedure popTvObjAddFirstInCurrentClick(Sender: TObject);
    procedure popTvObjAddLastInCurrentClick(Sender: TObject);
    procedure popTvObjInsertBeforeCurrentClick(Sender: TObject);
    procedure popTvObjAddInNodeClick(Sender: TObject);
    procedure popTvObjDelClick(Sender: TObject);
    procedure popTvObjSaveToFileClick(Sender: TObject);
    procedure popTvObjLoadFromFileClick(Sender: TObject);
    procedure popTvObjPopup(Sender: TObject);
    procedure popTvRebuildObjTableClick(Sender: TObject);
    procedure popTvObjMoveToBeforeClick(Sender: TObject);
    procedure popTvObjSaveToTableClick(Sender: TObject);
    procedure popTvObjMoveInToClick(Sender: TObject);
    procedure popTvObjFullExpandClick(Sender: TObject);
    procedure popTvObjFullCollapseClick(Sender: TObject);
    procedure popTvObjExitClick(Sender: TObject);
    procedure popTvObjVuborClick(Sender: TObject);
    procedure TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
                           State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sBtnSelCurrentClick(Sender: TObject);
    procedure sBtnSelAllClick(Sender: TObject);
    procedure sBtnUnSelAllClick(Sender: TObject);
    procedure dbgrTmpDblClick(Sender: TObject);
    procedure dbgrTmpEnter(Sender: TObject);
    procedure dbgrTmpExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sBtnDelMeClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    n_SvKdObj : integer;
    bTvReady : boolean;
    bVuborMode, bNaborMode, bVubor2Mode : boolean;
    b_WasUpdated : boolean;
    m_LstObj : TStringList;
    procedure TvLoadFromTable;
    procedure TvSaveToTable;
    function MyTVLocateKdObj(nKdObj : integer) : boolean;
    function NewKdObj : integer;
    function MaxTreeId : integer;
    procedure SaveTvToFiles(cTvFile1, cTvFile2 : string);
    procedure UpdLvlIndx;
    procedure Synchronize;
    procedure AddNewObj(nKdObj : integer; cShObj, cNmObj : string);
  public
    { Public declarations }
  end;

procedure ShowTvObj(nKdObj : integer; var bWasUpdated : boolean);
function GetKdObj(var nKdObj, nKdSpZ : integer;
                                      var cShObj, cNmObj : string;
                                        var bWasUpdated : boolean) : boolean;
//function NaborObj(nKdSps : integer; nKdObj : integer; mLstObj : TStringList;
//                                        var bWasUpdated : boolean) : boolean;
function VuborObj(nKdObj : integer; cdsObj : TClientDataSet;
                                        var bWasUpdated : boolean) : boolean;

const SECTION = 'z_TObj';

var
  FormTObj: TFormTObj;

implementation

uses A_Const, A_Dm, a_Lib, Z_Main, Z_DM, z_EObj, z_ObjGoT, z_EObjCh, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
function VuborObj(nKdObj : integer; cdsObj : TClientDataSet;
                                        var bWasUpdated : boolean) : boolean;
var nSvTmpNR : integer;
begin
  // Разрешается пометить один или несколько объектов для занесения в mLstObj
  Result := false;
  FormTObj := TFormTObj.Create(Application);
  with FormTObj do begin
    bVuborMode := false;
    bVubor2Mode := true;
    bNaborMode := false;
    with TIniFile.Create(cNmIniFile) do begin
      Top  := ReadInteger(SECTION, 'wVb2T', 400);
      Left := ReadInteger(SECTION, 'wVb2L', 200);
      Height := ReadInteger(SECTION, 'wVb2H', 450);
      Width  := ReadInteger(SECTION, 'wVb2W', 720);
      n_SvKdObj := ReadInteger(SECTION, 'nVb2SvKdObj', 0);
      Free;
    end;
    sBtnPrt.Visible := false;
    Constraints.MaxWidth := 500;
    Constraints.MinWidth := 400;
    popTvObj.AutoPopup := false;
    b_WasUpdated := false;
    bBtnOk.Visible := true;
    bBtnOk.Caption := 'Ввод';
    bBtnCancel.Caption := 'Отказ';
    if n_SvKdObj > 0 then
      MyTVLocateKdObj(n_SvKdObj);
    m_LstObj := TStringList.Create;
    cdsTmp := cdsObj;
    with cdsTmp do begin
      if RecordCount > 0 then begin
        nSvTmpNR := FieldByName('NR').AsInteger;
        DisableControls;
        First;
        while not Eof do begin
          m_LstObj.Add(FieldByName('AIndx').AsString);
          Next;
        end;
        Locate('NR', nSvTmpNR, []);
        EnableControls;
      end;
    end;
    PanelMsg.Visible := true;
    LabelCntSel.Visible := true;
    if m_LstObj.Count > 0 then
      LabelCntSel.Caption := 'Выделено ' + IntToStr(m_LstObj.Count)
    else
      LabelCntSel.Caption := '';
    PanelNabor.Visible := false;
    if ShowModal = mrOk then begin
      if cdsTmp.RecordCount > 0 then begin
      end;
      nKdObj := PTreeRec(Tv.Selected.Data)^.KdObj;
      dbgrTmp.Columns.SaveToFile(cDirVids + 'TvObjTmp.vid');
      with TIniFile.Create(cNmIniFile) do begin
        WriteInteger(SECTION, 'wVb2T', Top);
        WriteInteger(SECTION, 'wVb2L', Left);
        WriteInteger(SECTION, 'wVb2H', Height);
        WriteInteger(SECTION, 'wVb2W', Width);
        WriteInteger(SECTION, 'nVb2SvKdObj', nKdObj);
        Free;
      end;
      bWasUpdated := b_WasUpdated;
      Result := true; end
    else begin
      if cdsTmp.RecordCount > 0 then begin
        cdsTmp.First;
        while not cdsTmp.Eof do begin
          cdsTmp.Delete;
        end;
      end;
    end;
    sBtnPrt.Visible := true;
    m_LstObj.Destroy;
    Free;
  end;
end;
(*
//------------------------------------------------------------------------------
function NaborObj(nKdSps : integer; nKdObj : integer; mLstObj : TStringList;
                                        var bWasUpdated : boolean) : boolean;
begin
  // Разрешается пометить один или несколько объектов для занесения в mLstObj
  Result := false;
  FormTObj := TFormTObj.Create(Application);
  with FormTObj do begin
    bVuborMode := false;
    bVubor2Mode := false;
    bNaborMode := true;
    with TIniFile.Create(cNmIniFile) do begin
      Top  := ReadInteger(SECTION, 'wNbT', 400);
      Left := ReadInteger(SECTION, 'wNbL', 100);
      Height := ReadInteger(SECTION, 'wNbH', 450);
      Width  := ReadInteger(SECTION, 'wNbW', 720);
      n_SvKdObj := ReadInteger(SECTION, 'nNbSvKdObj', 0);
      Free;
    end;
    Constraints.MaxWidth := 765;
    Constraints.MinWidth := 665;
    if FileExists(cDirVids + 'TvObjTmp.vid') then
      dbgrTmp.Columns.LoadFromFile(cDirVids + 'TvObjTmp.vid');
    popTvObj.AutoPopup := false;
    b_WasUpdated := false;
    bBtnOk.Visible := true;
    bBtnOk.Caption := 'Ввод';
    bBtnCancel.Caption := 'Отказ';
    if n_SvKdObj > 0 then
      MyTVLocateKdObj(n_SvKdObj);
    m_LstObj := TStringList.Create;
    LabelMsg.Visible := true;
    sBtnSelCurrent.Visible := true;
    sBtnSelAll.Visible := true;
    sBtnUnSelAll.Visible := true;
    LabelCntSel.Caption := '';
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
    PanelNabor.Visible := true;
    if ShowModal = mrOk then begin
      if cdsTmp.RecordCount > 0 then begin
        mLstObj.Clear;
        cdsTmp.First;
        while not cdsTmp.Eof do begin
          mLstObj.Add(cdsTmp.FieldByName('KdObj').AsString);
          cdsTmp.Next;
        end;
      end;
      nKdObj := PTreeRec(Tv.Selected.Data)^.KdObj;
      dbgrTmp.Columns.SaveToFile(cDirVids + 'TvObjTmp.vid');
      with TIniFile.Create(cNmIniFile) do begin
        WriteInteger(SECTION, 'wNbT', Top);
        WriteInteger(SECTION, 'wNbL', Left);
        WriteInteger(SECTION, 'wNbH', Height);
        WriteInteger(SECTION, 'wNbW', Width);
        WriteInteger(SECTION, 'nNbSvKdObj', nKdObj);
        Free;
      end;
      bWasUpdated := b_WasUpdated;
      Result := true;
    end;
    m_LstObj.Destroy;
    Free;
  end;
end;
*)
//------------------------------------------------------------------------------
function GetKdObj(
  var nKdObj, nKdSpZ : integer;
  var cShObj, cNmObj : string;
  var bWasUpdated : boolean
) : boolean;
var
  nNewKdObj: integer;
begin
  Result := false;
  FormTObj := TFormTObj.Create(Application);
  with FormTObj do begin
    bVuborMode := true;
    bVubor2Mode := false;
    bNaborMode := false;
    bWasUpdated := false;
    with TIniFile.Create(cNmIniFile) do begin
      Top  := ReadInteger(SECTION, 'wT', 250);
      Left := ReadInteger(SECTION, 'wL', 100);
      Height := ReadInteger(SECTION, 'wH', 450);
      Width  := ReadInteger(SECTION, 'wW', 450);
      n_SvKdObj := ReadInteger(SECTION, 'nSvKdObj', 0);
      Free;
    end;
    Constraints.MaxWidth := 500;
    Constraints.MinWidth := 400;
    if nKdObj > 0 then
      MyTVLocateKdObj(nKdObj)
    else if n_SvKdObj > 0 then
      MyTVLocateKdObj(n_SvKdObj);
    PanelNabor.Visible := false;
    PanelMsg.Visible := false;
    LabelCntSel.Visible := false;
    popTvObj.AutoPopup := true;
    sBtnPrt.Visible := false;
    if ShowModal = mrOk then begin
      nNewKdObj := PTreeRec(Tv.Selected.Data)^.KdObj;
      nKdSpZ := qryObjKdSpZ.AsInteger;
      cShObj := PTreeRec(Tv.Selected.Data)^.ShObj;
      cNmObj := PTreeRec(Tv.Selected.Data)^.NmObj;
      with TIniFile.Create(cNmIniFile) do begin
        WriteInteger(SECTION, 'wT', Top);
        WriteInteger(SECTION, 'wL', Left);
        WriteInteger(SECTION, 'wH', Height);
        WriteInteger(SECTION, 'wW', Width);
        WriteInteger(SECTION, 'nSvKdObj', nNewKdObj);
        Free;
      end;
      bWasUpdated := nNewKdObj <> nKdObj;
      nKdObj := nNewKdObj;
      Result := true;
    end;
    sBtnPrt.Visible := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShowTvObj(nKdObj : integer; var bWasUpdated : boolean);
begin
  FormTObj := TFormTObj.Create(Application);
  with FormTObj do begin
    bVuborMode := false;
    bVubor2Mode := false;
    bNaborMode := false;
    b_WasUpdated := false;
    with TIniFile.Create(cNmIniFile) do begin
      Top  := ReadInteger(SECTION, 'wT', 250);
      Left := ReadInteger(SECTION, 'wL', 100);
      Height := ReadInteger(SECTION, 'wH', 450);
      Width  := ReadInteger(SECTION, 'wW', 450);
      n_SvKdObj := ReadInteger(SECTION, 'nSvKdObj', 0);
      Free;
    end;
    Constraints.MaxWidth := 500;
    Constraints.MinWidth := 400;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    sBtnPrt.Visible := true;
    if n_SvKdObj > 0 then
      MyTVLocateKdObj(n_SvKdObj);
    PanelNabor.Visible := false;
    PanelMsg.Visible := false;
    LabelCntSel.Visible := false;
    popTvObj.AutoPopup := true;
    ShowModal;
    if TV.Items.Count > 0 then
      nKdObj := PTreeRec(Tv.Selected.Data)^.KdObj;
    with TIniFile.Create(cNmIniFile) do begin
      WriteInteger(SECTION, 'wT', Top);
      WriteInteger(SECTION, 'wL', Left);
      WriteInteger(SECTION, 'wH', Height);
      WriteInteger(SECTION, 'wW', Width);
      WriteInteger(SECTION, 'nSvKdObj', nKdObj);
      Free;
    end;
    bWasUpdated := b_WasUpdated;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.FormCreate(Sender: TObject);
begin
  bTvReady := false;
  dbgrObj.Visible := bFlagDbg;
  Splitter1.Visible := dbgrObj.Visible;
//  if FileExists(cDirVids + 'TvObj.vid') then
//    dbgrObj.Columns.LoadFromFile(cDirVids + 'TvObj.vid');
  TvLoadFromTable;
  Caption := 'Зарплата [дерево подразделений]';
end;
//------------------------------------------------------------------------------
procedure TFormTObj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrObj.Columns.SaveToFile(cDirVids + 'TvObj.vid');
end;
//------------------------------------------------------------------------------
function TFormTObj.MyTVLocateKdObj(nKdObj : integer) : boolean;
var i : integer;
begin
  Result := false;
  with Tv do for i := 0 to Items.Count - 1 do
    if PTreeRec(Items[i].Data)^.KdObj = nKdObj then begin
      Items[i].Selected := true; // оставляем указатель на найденном nKdObj
      Result := true;
      Break;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.UpdLvlIndx;
var i, nKdObj, nAIndx, nPIndx, nLvl, nIndx : SmallInt; cHsCh : string;
begin
  // Обновление в таблице z_KdObj индексов, Level и HasChildren
  Form_Dm.DbMain.StartTransaction;
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Update z_KdObj Set AIndx = :nAIndx, PIndx = :nPIndx, ' +
            ' Lvl = :nLvl, Indx = :nIndx, HsCh = :cHsCh ' +
            ' where KdObj = :nKdObj');
    Prepare;
  end;
  for i := 0 to TV.Items.Count-1 do begin
    nKdObj := PTreeRec(TV.Items[i].Data)^.KdObj;
    nLvl   := TV.Items[i].Level;
    nIndx  := TV.Items[i].Index;
    nAIndx := TV.Items[i].AbsoluteIndex;
    nPIndx := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('nKdObj').AsSmallInt := nKdObj;
    qryTmp.ParamByName('nAIndx').AsSmallInt := nAIndx;
    qryTmp.ParamByName('nPIndx').asSmallInt := nPIndx;
    qryTmp.ParamByName('nLvl').asSmallInt   := nLvl;
    qryTmp.ParamByName('nIndx').asSmallInt  := nIndx;
    qryTmp.ParamByName('cHsCh').AsString    := cHsCh;
    qryTmp.ExecSQL;
  end;
  Form_Dm.DbMain.Commit;
  qryTmp.UnPrepare;
  b_WasUpdated := true;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.Synchronize;
var nKdObj : integer;
begin
  if not bTvReady then
    Exit;
  if (qryObj.State in [dsEdit, dsInsert]) then
    qryObj.Post;
  if (TV.Selected <> nil) then begin
    nKdObj := PTreeRec(TV.Selected.Data)^.KdObj;
    if nKdObj <> 0 then
      qryObj.Locate('KdObj', nKdObj, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.TVChange(Sender: TObject; Node: TTreeNode);
begin
  Synchronize;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.TvLoadFromTable;
// Создать файл cNmTV1 по записям таблицы z_KdObj и загрузить его
// в дерево (так проще всего). Заполнить связанные объекты
var F1 : TextFile;
    cNmTv1, cMsg : string;
    i : integer;
    MyTreeRec : PTreeRec;
begin
  bTvReady := false;
  cNmTv1 := 'Obj.tv1';
  AssignFile(F1, cDirTemp + cNmTV1);
  Rewrite(F1);
  with qryObj do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    if nAppUsrKat = 0  then
      SQL.Add('Select * from z_KdObj ' +
            ' order by KdSps, AIndx, Lvl, PIndx')
    else begin
//      SQL.Add('Select * from z_KdObj where (KdSps = :nKdSps) ' +
      SQL.Add('Select * from z_KdObj ' +
            ' order by KdSps, AIndx, Lvl, PIndx');
//      ParamByName('nKdSps').AsInteger := nKdSps;
    end;
    Open;
    First;
    while not Eof do begin
      cMsg := '';
      for i := 1 to FieldByName('Lvl').AsInteger do begin
        cMsg := cMsg + ' ';
      end;
      cMsg := cMsg + FieldByName('KdObj').AsString + ' ' +
                      FieldByName('ShObj').AsString + '  ' +
                       Trim(FieldByName('NmObj').AsString);
      WriteLn(F1, cMsg);   // Вообще-то при такой схеме поля PIndx, Indx и HsCh
      Next;                // не нужны - достаточно только сортировки по
    end;                   // AIndx и смещать вправо в соответствии с Lvl
    CloseFile(F1);
    // Загрузить дерево из только что созданного
    // текстового файла (cDirTemp + cNmTV1):
    TV.Items.BeginUpdate;
    TV.Items.Clear;
    TV.LoadFromFile(cDirTemp + cNmTV1);
    TV.Items.EndUpdate;
    if FileExists(cDirTemp + cNmTV1) then
      DeleteFile(cDirTemp + cNmTV1);
    // Заполнить связанные Objects
    First;
    i := 0;
    while not Eof do begin
      New(MyTreeRec);
      MyTreeRec.KdObj := FieldByName('KdObj').AsInteger;
      MyTreeRec.ShObj := Trim(FieldByName('ShObj').AsString);
      MyTreeRec.NmObj := Trim(FieldByName('NmObj').AsString);
      MyTreeRec.KdSPZ := FieldByName('KdSPZ').AsInteger;
      MyTreeRec.FioUpoln := Trim(FieldByName('FioUpoln').AsString);
      TV.Items[i].Data := MyTreeRec;
      Inc(i);
      Next;                    // qryObj не закрываю - будет нужен при
    end;                       // редактированиях и добавлениях
  end;
  bTvReady := true;
  if TV.Items.Count > 0 then
    TV.Items[0].Selected := true;
  qryObj.First;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.TvSaveToTable;
var cShObj, cNmObj, cFioUpoln, cHsCh : string;
    i, nCntAdd, nKdObj, nKdUPos, nKdSpz, nLvl, nIndx, nAIndx, nPIndx : SmallInt;
begin
  // Сохранить дерево в таблицу z_KdObj
  Form_Dm.DbMain.StartTransaction;
  // Сделать по науке с TRY - EXCEPT
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Delete from z_KdObj');
    ExecSQL;
    SQL.Clear;
    SQL.Add('SET GENERATOR Z_KDOBJ_NR TO 0');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Insert into z_KdObj ' +
            ' (KdObj, KdUPos, KdSpz, ShObj, NmObj, FioUpoln, ' +
            ' AIndx, PIndx, Lvl, Indx, HsCh) ');
    SQL.Add(' values (:nKdObj, :nKdUPos, :nKdSpz, :cShObj, :cNmObj, ' +
            ' :cFioUpoln, :nAIndx, :nPIndx, :nLvl, :nIndx, :cHsCh)');
    Prepare;
  end;
  nCntAdd := 0;
  for i := 0 to TV.Items.Count-1 do begin
    nKdObj  := PTreeRec(TV.Items[i].Data)^.KdObj;
    nKdSpz  := PTreeRec(TV.Items[i].Data)^.KdSPZ;
    nKdUPos := 0;
    cShObj  := PTreeRec(TV.Items[i].Data)^.ShObj;
    cNmObj  := PTreeRec(TV.Items[i].Data)^.NmObj;
    cFioUpoln := PTreeRec(TV.Items[i].Data)^.FioUpoln;
    nLvl   := TV.Items[i].Level;
    nIndx  := TV.Items[i].Index;
    nAIndx := TV.Items[i].AbsoluteIndex;
    nPIndx := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('nKdObj').AsSmallInt  := nKdObj;
    qryTmp.ParamByName('nKdSpz').AsSmallInt  := nKdSpz;
    qryTmp.ParamByName('nKdUPos').AsSmallInt := nKdUPos;
    qryTmp.ParamByName('cShObj').AsString    := cShObj;
    qryTmp.ParamByName('cNmObj').AsString    := cNmObj;
    qryTmp.ParamByName('cFioUpoln').AsString := cFioUpoln;
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
  if bFlagDbg then
    ShowMessage('Добавлено записей: ' + IntToStr(nCntAdd));
  // Переоткрыть наборы
end;
//------------------------------------------------------------------------------
procedure TFormTObj.TVDblClick(Sender: TObject);
begin
  if (bNaborMode or bVubor2Mode) and (TV.Selected <> nil) {and
                          (not TV.Selected.HasChildren)} then
    sBtnSelCurrent.Click
  else if bVuborMode and (TV.Selected <> nil) and
                          (not TV.Selected.HasChildren) then
    ModalResult := mrOk
  else if not bNaborMode and not bVubor2Mode and
                             not bVuborMode and (TV.Selected <> nil) then
    popTvObjEdt.Click;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjPopup(Sender: TObject);
var bNotEmptyTv, bAllowEdt : boolean;
begin
  bNotEmptyTv := TV.Items.Count > 0;
  bAllowEdt := bFlagDbg or (nAppUsrLvl = 0);  // bFlagGMS;
  popTvObjVubor.Enabled               := bNotEmptyTv and bVuborMode;
  popTvObjFullExpand.Enabled          := bNotEmptyTv;
  popTvObjFullCollapse.Enabled        := bNotEmptyTv;

  popTvObjEdt.Visible                 := bAllowEdt;
  popTvObjAddInRoot.Visible           := bAllowEdt;
  popTvObjAddFirstInCurrent.Visible   := bAllowEdt;
  popTvObjAddLastInCurrent.Visible    := bAllowEdt;
  popTvObjInsertBeforeCurrent.Visible := bAllowEdt;
  popTvObjMoveInTo.Visible            := bAllowEdt;
  popTvObjMoveToBefore.Visible        := bAllowEdt;
  popTvObjDel.Visible                 := bAllowEdt;
  popTvObjAddInNode.Visible           := bAllowEdt;
  popTvObjSep1.Visible                := bAllowEdt;

  popTvObjSep2.Visible                := bFlagDbg;
  popTvDelMeFirst.Visible             := bFlagDbg;
  popTvObjSaveToFile.Visible          := bFlagDbg;
  popTvObjLoadFromFile.Visible        := bFlagDbg;
  popTvObjLoadFromTable.Visible       := bFlagDbg;
  popTvObjSaveToTable.Visible         := bFlagDbg;
  popTvRebuildObjTable.Visible        := bFlagDbg;

  popTvObjEdt.Enabled                 := bNotEmptyTv;
  popTvObjAddFirstInCurrent.Enabled   := bNotEmptyTv;
  popTvObjAddLastInCurrent.Enabled    := bNotEmptyTv;
  popTvObjInsertBeforeCurrent.Enabled := bNotEmptyTv;
  popTvObjMoveInTo.Enabled            := bNotEmptyTv;
  popTvObjMoveToBefore.Enabled        := bNotEmptyTv;
  popTvObjDel.Enabled                 := bNotEmptyTv;
  popTvObjAddInNode.Enabled           := bNotEmptyTv and
                                             not TV.Selected.HasChildren;
end;
//------------------------------------------------------------------------------
function TFormTObj.MaxTreeId : integer;
var i : integer;
begin
  Result := 0;
  with TV do begin
    // определить максимальный KdObj в дереве
    for i := 0 to Items.Count-1 do begin
      if PTreeRec(Items[i].Data)^.KdObj > Result then
        Result := PTreeRec(Items[i].Data)^.KdObj;
    end;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdObj) as MaxKd from z_KdObj');
    Open;
    if (RecordCount > 0) and (FieldByName('MaxKd').AsInteger > 0) then
      Result := Max(Result, FieldByName('MaxKd').AsInteger + 1)
    else
      Result := 1001;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormTObj.NewKdObj : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdObj) as MaxKd from z_KdObj');
    Open;
    if (RecordCount > 0) and (FieldByName('MaxKd').AsInteger > 0) then
      Result := FieldByName('MaxKd').AsInteger + 1
    else
      Result := 1001;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.qryObjAfterPost(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryObj]);
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjEdtClick(Sender: TObject);
var  cMsg : string; bEditMode : boolean;
begin
  bEditMode := true;
  cMsg := 'Редактирование узла "' + TV.Selected.Text + '"';
  with qryObj do begin
    Edit;
    if AddEdtTObj(bEditMode, cMsg) {z_EObj} then begin
      Post;
      PTreeRec(TV.Selected.Data)^.ShObj := FieldByName('ShObj').AsString;
      PTreeRec(TV.Selected.Data)^.NmObj := FieldByName('NmObj').AsString;
      PTreeRec(TV.Selected.Data)^.KdSPZ := FieldByName('KdSpZ').AsInteger;
      PTreeRec(TV.Selected.Data)^.FioUpoln := FieldByName('FioUpoln').AsString;
      TV.Selected.Text := FieldByName('KdObj').AsString + ' ' +
                                 FieldByName('ShObj').AsString + '  ' +
                                            FieldByName('NmObj').AsString;
      DmMain.qryObjLU.Close;
      DmMain.qryObjLU.Open;
      b_WasUpdated := true; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjAddInRootClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    bEditMode : boolean; cMsg : string; nKdObj : integer;
    NewTreeNode : TTreeNode;
begin
  bEditMode := false;
  if TV.Items.Count = 0 then
    cMsg := 'Первый элемент в корень'
  else
    cMsg := 'Элемент добавляется последним в корень';
  with qryObj do begin
    Append;
    FieldByName('KdSpS').AsInteger := 1; //nKdSps;
    FieldByName('KdSpZ').AsInteger := 0;
    if AddEdtTObj(bEditMode, cMsg) {z_eObj} then begin
      if FieldByName('KdObj').IsNull then begin
        nKdObj := NewKdObj;
        FieldByName('KdObj').AsInteger := nKdObj;
      end;  
      Post;
      bTvReady := false;
      New(MyRecPtr);
      MyRecPtr.KdObj := FieldByName('KdObj').AsInteger;
      MyRecPtr.KdSPZ := FieldByName('KdSpZ').AsInteger;
      MyRecPtr.ShObj := FieldByName('ShObj').AsString;
      MyRecPtr.NmObj := FieldByName('NmObj').AsString;
      MyRecPtr.FioUpoln := FieldByName('FioUpoln').AsString;
      NewTreeNode := TV.Items.AddObject(nil,
                                FieldByName('KdObj').AsString + ' ' +
                                   FieldByName('ShObj').AsString + '  ' +
                                      FieldByName('NmObj').AsString, MyRecPtr);
      TV.Selected := NewTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      with DmMain.qryObjLU do begin
        Close;
        Open;
      end; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjAddFirstInCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    bEditMode : boolean;
    cMsg : string; nKdObj, TreeIndex : integer;
    NewTreeNode : TTreeNode;
begin
  bEditMode := false;
  cMsg := 'Элемент добавляется первым на текущий уровень';
  with qryObj do begin
    Insert;
    FieldByName('KdSps').AsInteger := 1; // nKdSps;
    FieldByName('KdSpZ').AsInteger := 0;
    if AddEdtTObj(bEditMode, cMsg) {z_eObj} then begin
      if FieldByName('KdObj').IsNull then begin
        nKdObj := NewKdObj;
        FieldByName('KdObj').AsInteger := nKdObj;
      end;
      Post;
      TreeIndex := TV.Selected.AbsoluteIndex;
      bTvReady := false;
      New(MyRecPtr);
      MyRecPtr.KdObj := FieldByName('KdObj').AsInteger;
      MyRecPtr.KdSpZ := FieldByName('KdSpZ').AsInteger;
      MyRecPtr.ShObj := FieldByName('ShObj').AsString;
      MyRecPtr.NmObj := FieldByName('NmObj').AsString;
      MyRecPtr.FioUpoln := FieldByName('FioUpoln').AsString;
      NewTreeNode := TV.Items.AddObjectFirst(TV.Items[TreeIndex],
                                         FieldByName('KdObj').AsString + ' ' +
                                        FieldByName('ShObj').AsString + '  ' +
                                       FieldByName('NmObj').AsString, MyRecPtr);
      TV.Selected := NewTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      b_WasUpdated := true;
      DmMain.qryObjLU.Close;
      DmMain.qryObjLU.Open; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjAddLastInCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    bEditMode : boolean;
    cMsg : string;
    nKdObj, TreeIndex : integer;
    NewTreeNode : TTreeNode;
begin
  bEditMode := false;
  cMsg := 'Элемент добавляется последним на текущий уровень';
  with qryObj do begin
    Append;
    FieldByName('KdSps').AsInteger := 1; // nKdSps;
    FieldByName('KdSpZ').AsInteger := 0;
    if AddEdtTObj(bEditMode, cMsg) {z_eObj} then begin
      if FieldByName('KdObj').IsNull then begin
        nKdObj := NewKdObj;
        FieldByName('KdObj').AsInteger := nKdObj;
      end;
      Post;
      bTvReady := false;
      TreeIndex := TV.Selected.AbsoluteIndex;
      New(MyRecPtr);
      MyRecPtr.KdObj := FieldByName('KdObj').AsInteger;
      MyRecPtr.KdSpZ := FieldByName('KdSpZ').AsInteger;
      MyRecPtr.ShObj := FieldByName('ShObj').AsString;
      MyRecPtr.NmObj := FieldByName('NmObj').AsString;
      MyRecPtr.FioUpoln := FieldByName('FioUpoln').AsString;
      NewTreeNode := TV.Items.AddObject(TV.Items[TreeIndex],
                                    FieldByName('KdObj').AsString + ' ' +
                                    FieldByName('ShObj').AsString + '  ' +
                                    FieldByName('NmObj').AsString, MyRecPtr);
      TV.Selected := NewTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      DmMain.qryObjLU.Close;
      DmMain.qryObjLU.Open; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjInsertBeforeCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    bEditMode : boolean;
    cMsg : string; nKdObj, TreeIndex : integer;
    NewTreeNode : TTreeNode;
begin
  bEditMode := false;
  cMsg := 'Элемент вставляется впереди "' + TV.Selected.Text + '"';
  with qryObj do begin
    Insert;
    FieldByName('KdSps').AsInteger := 1; // nKdSps;
    FieldByName('KdSpZ').AsInteger := 0;
    if AddEdtTObj(bEditMode, cMsg) {z_eObj} then begin
      if FieldByName('KdObj').IsNull then begin
        nKdObj := NewKdObj;
        FieldByName('KdObj').AsInteger := nKdObj;
      end;
      Post;
      bTvReady := false;
      TreeIndex := TV.Selected.AbsoluteIndex;
      New(MyRecPtr);
      MyRecPtr.KdObj := FieldByName('KdObj').AsInteger;
      MyRecPtr.KdSpZ := FieldByName('KdSpZ').AsInteger;
      MyRecPtr.ShObj := FieldByName('ShObj').AsString;
      MyRecPtr.NmObj := FieldByName('NmObj').AsString;
      MyRecPtr.FioUpoln := FieldByName('FioUpoln').AsString;
      NewTreeNode := TV.Items.InsertObject(TV.Items[TreeIndex],
                               FieldByName('KdObj').AsString + ' ' +
                                 FieldByName('ShObj').AsString + '  ' +
                                    FieldByName('NmObj').AsString, MyRecPtr);
      TV.Selected := NewTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      DmMain.qryObjLU.Close;
      DmMain.qryObjLU.Open; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjAddInNodeClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    cShObj, cNmObj, cOldSh, cNewSh, cNewChldSh,
                   cOldNm, cNewNm, cNewChldNm, cMsg : string;
    nSvKdObj, nKdObj : integer;
    mDestTreeNode, mNewTreeNode : TTreeNode;
    nTmpIndx, nTreeViewIndex: LongInt;
begin
  nTreeViewIndex := TV.Selected.AbsoluteIndex;
  cMsg := 'Первый элемент ВНУТРЬ узла "' + TV.Selected.Text + '"';
  nSvKdObj := PTreeRec(TV.Items[nTreeViewIndex].Data)^.KdObj;
  cOldSh := PTreeRec(TV.Items[nTreeViewIndex].Data)^.ShObj + '/стар';
  cOldNm := PTreeRec(TV.Items[nTreeViewIndex].Data)^.NmObj + ' (стар)';
  cNewSh := PTreeRec(TV.Items[nTreeViewIndex].Data)^.ShObj + '/сб';
  cNewNm := PTreeRec(TV.Items[nTreeViewIndex].Data)^.NmObj + ' (сб)';
  if AddChildObj(cOldSh, cNewSh, cNewChldSh,    {A_EObjCh}
                           cOldNm,  cNewNm,  cNewChldNm) then begin
    // Не изменяя старого, который хотим расширить до родительского, ввожу
    // нового родителя с новым автоКодом, но с производным от старого названием
    // Потом в этот новый перевожу старый уже существующий первым дитем
    // Потом добавляю заказанный ITEM вторым дитем
    if bFlagDbg then
      ShowMessage('Новые шифр и назв. отца ' + cNewSh + ' ' + cNewNm +
          #13#10 + 'Новые шифр и назв. дочки ' + cNewChldSh + ' ' + cNewChldNm);
    nTmpIndx := nTreeViewIndex;
    nKdObj := MaxTreeId + 1;
    bTvReady := false;
    New(MyRecPtr);
    cShObj := cNewSh;
    cNmObj := cNewNm;
    MyRecPtr.KdObj := nKdObj;
    MyRecPtr.ShObj := cShObj;
    MyRecPtr.NmObj := cNmObj;
    mNewTreeNode := TV.Items.InsertObject(TV.Items[nTmpIndx],
                     IntToStr(nKdObj) + ' ' + cShObj + '  ' + cNmObj, MyRecPtr);
    TV.Selected := mNewTreeNode;
    // Добавить этот новый TreeNode в таблицу z_KdObj
    AddNewObj(nKdObj, cShObj, cNmObj);
    // теперь в него ввести 1-м дитем старый item со СТАРЫМ KdSbu
    mDestTreeNode := mNewTreeNode;                // ======
    // у старого изменился АИндкс, т.к. перед ним вставили новый. Поэтому:
    nTmpIndx := nTmpIndx + 1;
    mNewTreeNode := TV.Items.Item[nTmpIndx];
    TV.Selected := mNewTreeNode;
    nKdObj := nSvKdObj;
    cShObj := cOldSh;
    cNmObj := cOldNm;
    PTreeRec(TV.Selected.Data)^.KdObj := nKdObj;
    PTreeRec(TV.Selected.Data)^.ShObj := cShObj;
    PTreeRec(TV.Selected.Data)^.NmObj := cNmObj;
    TV.Selected.Text := IntToStr(nKdObj) + ' ' + cShObj + '  ' + cNmObj;
    mNewTreeNode.MoveTo(mDestTreeNode, naAddChildFirst);
    // т.к. код Obj'a не изменился - ни в каких проводках ничего не исправляю!!!
    TV.Selected := mNewTreeNode;
    // Ввести новый эл-т, как второе дитя с новым автоКодом
    nTreeViewIndex := TV.Selected.AbsoluteIndex;
    nKdObj := MaxTreeId + 1;
    New(MyRecPtr);
    MyRecPtr.KdObj := nKdObj;
    MyRecPtr.ShObj := cNewChldSh;
    MyRecPtr.NmObj := cNewChldNm;
    mNewTreeNode := TV.Items.AddObject(TV.Items[nTreeViewIndex],
           IntToStr(nKdObj) + ' ' + cNewChldSh + '  ' + cNewChldNm, MyRecPtr);
    TV.Selected := mNewTreeNode;
    // И этот новый TreeNode добавить в таблицу z_KdObj
    AddNewObj(nKdObj, cNewChldSh, cNewChldNm);
    bTvReady := true;
    // Правлю z_KdObj
    UpdLvlIndx;
    qryObj.Close;
    qryObj.Open;
    Synchronize;
    b_WasUpdated := true;
    with DmMain.qryObjLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.AddNewObj(nKdObj : integer; cShObj, cNmObj : string);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_KdObj ' +
            ' (KdSps, KdObj, ShObj, NmObj) values ' +
            ' (:nKdSps, :nKdObj, :cShObj, :cNmObj)');
    ParamByName('nKdSps').AsInteger := 1; // nKdSps;
    ParamByName('nKdObj').AsInteger := nKdObj;
    ParamByName('cShObj').AsString := cShObj;
    ParamByName('cNmObj').AsString := cNmObj;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjMoveInToClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    mCurTreeNode, mDestTreeNode, mNewTreeNode : TTreeNode;
    cShCurItem, cNmCurItem : string;
    bCurHsCh, bNewHsCh : boolean;
    nCurAindx, nCurPIndx, nNewPIndx, nAIndxNewParent : LongInt;
    nKdObj, nSvKdObj : integer;
    cShObj, cNmObj, cDestShObj, cDestNmObj : string;
    nTmpIndx : LongInt;
    cOldSh, cNewSh, cNewChldSh, cOldNm, cNewNm, cNewChldNm : string;
begin
  mCurTreeNode := TV.Selected;
  nCurAIndx := TV.Selected.AbsoluteIndex;
  nCurPIndx := TV.Selected.Parent.Index;
  bCurHsCh := TV.Selected.HasChildren;
  cShCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.ShObj;
  cNmCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.NmObj;
  if ObjGoToParent(cShCurItem, cNmCurItem, bCurHsCh,    {z_ObjGoT}
                       nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent) then begin
    bTvReady := false;
    mDestTreeNode := TV.Items.Item[nAIndxNewParent];
    bNewHsCh   := mDestTreeNode.HasChildren;
    nSvKdObj   := PTreeRec(TV.Items[nAIndxNewParent].Data)^.KdObj;
    cDestShObj := PTreeRec(TV.Items[nAIndxNewParent].Data)^.ShObj;
    cDestNmObj := PTreeRec(TV.Items[nAIndxNewParent].Data)^.NmObj;
    // Все изменения сначала вношу только в дерево
    // А потом гамузом перезаписываю всю таблицу z_KdObj (иначе лезут ошибки)
    if not bNewHsCh then begin
      // Запросить реквизиты для нового родителя и старого дитя на новом месте
      cOldSh := cDestShObj + '/нов';
      cOldNm := cDestNmObj + ' (нов.)';
      cNewSh := cDestShObj + '/сб';
      cNewNm := cDestNmObj + ' (сборн.)';
      cNewChldSh := cShCurItem;
      cNewChldNm := cNmCurItem;
      if AddChildObj(cOldSh, cNewSh, cNewChldSh,    {A_EObjCh}
                           cOldNm,  cNewNm,  cNewChldNm) then begin
        // 1. Открыть впереди mDestTreeNode новый TreeNode с названием, производ-
        //    ным от названия mDestTreeNode (добавить "Группа", но с новым кодом
        nTmpIndx := nAIndxNewParent;
        nKdObj := MaxTreeId + 1;
        New(MyRecPtr);
        cShObj := cOldSh;
        cNmObj := cOldNm;
        MyRecPtr.KdObj := nKdObj;
        MyRecPtr.ShObj := cShObj;
        MyRecPtr.NmObj := cNmObj;
        mNewTreeNode := TV.Items.InsertObject(TV.Items[nTmpIndx],
                    IntToStr(nKdObj) + ' ' + cShObj + '  ' + cNmObj, MyRecPtr);
        TV.Selected := mNewTreeNode;
        // Добавить этот новый mNewTreeNode в таблицу z_KdObj
        AddNewObj(nKdObj, cShObj, cNmObj);
        // 2. Теперь приемником становится новый TreeNode. Сам mDestTreeNode
        //    переименовываю в mNewTreeNode и, не меняя его кода (nSvKdObj) и
        //    чуть-чуть перекроив название, переношу в новый узел как 1-й дочерний
        mDestTreeNode := mNewTreeNode;
        // {теперь у приемника изменился АИндкс. Поэтому:}
        nTmpIndx := nTmpIndx + 1;
        mNewTreeNode := TV.Items.Item[nTmpIndx];
        TV.Selected := mNewTreeNode;
        nKdObj := nSvKdObj;
        cShObj := cNewSh;
        cNmObj := cNewNm;
        PTreeRec(TV.Selected.Data)^.KdObj := nKdObj;
        PTreeRec(TV.Selected.Data)^.ShObj := cShObj;
        PTreeRec(TV.Selected.Data)^.NmObj := cNmObj;
        TV.Selected.Text := IntToStr(nKdObj) + ' ' + cShObj + '  ' + cNmObj;
        mNewTreeNode.MoveTo(mDestTreeNode, naAddChildFirst);
        TV.Selected := mNewTreeNode;
        // 3. И наконец переносимый mCurTreeNode перемещаю в mDestTreeNode:
        mCurTreeNode.MoveTo(mDestTreeNode, naAddChild);
        TV.Selected := mCurTreeNode;
        // Правлю z_KdObj
        bTvReady := true;
        UpdLvlIndx;
        qryObj.Close;
        qryObj.Open;
        Synchronize;
        DmMain.qryObjLU.Close;
        DmMain.qryObjLU.Open;
        b_WasUpdated := true; end
      else begin
        Exit;
      end; end
    else begin
      // Без доп. вопросов переносимый mCurTreeNode перемещаю в mDestTreeNode:
      mCurTreeNode.MoveTo(mDestTreeNode, naAddChild);
      TV.Selected := mCurTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      qryObj.Close;
      qryObj.Open;
      Synchronize;
      DmMain.qryObjLU.Close;
      DmMain.qryObjLU.Open;
      b_WasUpdated := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjMoveToBeforeClick(Sender: TObject);
var mCurTreeNode, mDestTreeNode : TTreeNode;
    cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
    nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent : integer;
begin
  mCurTreeNode := TV.Selected;
  nCurAIndx  := TV.Selected.AbsoluteIndex;
  nCurPIndx  := TV.Selected.Parent.Index;
  bCurHsCh   := TV.Selected.HasChildren;
  cShCurItem := IntToStr(PTreeRec(TV.Items[nCurAindx].Data)^.KdObj);
  cNmCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.ShObj;
  if ObjMoveTo(cShCurItem, cNmCurItem, bCurHsCh,          {z_ObjGoT}
                   nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent) then begin
    mDestTreeNode := TV.Items.Item[nAIndxNewParent];
    mCurTreeNode.MoveTo(mDestTreeNode, naInsert);
    TV.Selected := mCurTreeNode;
    bTvReady := true;
    UpdLvlIndx;
    qryObj.Close;
    qryObj.Open;
    Synchronize;
    b_WasUpdated := true;
    with DmMain.qryObjLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjDelClick(Sender: TObject);
var nKdObj : integer; cMsg : string; bCanDelete : boolean;
begin
  if TV.Selected.HasChildren then begin
    MessageDlg('Сначала должны быть по одному удалены все ' +
               'элементы, входящие в узел', mtError, [mbOk], 0);
    Exit;
  end;
  PanelDelMsg.Visible := true;
  Application.ProcessMessages;
  nKdObj := PTreeRec(TV.Selected.Data)^.KdObj;
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Select First 1 * from Z_PERE ' +
            ' where (KdObj = :nKdObj)');
    ParamByName('nKdObj').AsInteger := nKdObj;
    Open;
    bCanDelete := RecordCount = 0;
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select First 1 *  from Z_Otkl ' +
              ' where (KdObj = :nKdObj)');
      ParamByName('nKdObj').AsInteger := nKdObj;
      Open;
      bCanDelete := RecordCount = 0;
    end;
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select First 1 * from Z_NU ' +
              ' where (KdObj = :nKdObj)');
      ParamByName('nKdObj').AsInteger := nKdObj;
      Open;
      bCanDelete := RecordCount = 0;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  PanelDelMsg.Visible := false;
  Application.ProcessMessages;
  if not bCanDelete then begin
    MessageDlg('Нельзя удалять эту запись - на нее ' +
               'есть ссылки в других таблицах', mtError, [mbOk], 0);
    Exit; end
  else begin
    cMsg := '"' + TV.Selected.Text + '"' + #13#10 + 'удаляется безвозвратно';
    cMsg := cMsg + #13#10 + 'Согласны?:';
    if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      bTvReady := false;
      TV.Items.Delete(TV.Selected);
      qryObj.Delete;
      bTvReady := true;
      UpdLvlIndx;
      qryObj.Close;
      qryObj.Open;
      Synchronize;
      b_WasUpdated := true;
      with DmMain.qryObjLU do begin
        Close;
        Open;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjSaveToFileClick(Sender: TObject);
var cTvFile1, cTvFile2 : string;
begin
  with SaveDialog do begin
    InitialDir := cDirSBU;
    Title := 'Сохранение дерева подразделений в файл';
    Filter := 'Файлы видов (*.tv1)|*.tv1';
    DefaultExt := 'tv1';
    if Execute then begin
      cTvFile1 := FileName;
      cTvFile2 := Copy(cTvFile1, 1, Length(cTvFile1)-1) + '2';
      SaveTvToFiles(cTvFile1, cTvFile2);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.SaveTvToFiles(cTvFile1, cTvFile2 : string);
var F : TextFile; cMsg : string; i : integer;
begin
  TV.SaveToFile(cTvFile1);        // штатно сохранить дерево в .tv1
  AssignFile(F, cTvFile2);        // дополнительно записать в .tv2
  Rewrite(F);                     // связки KdObj -> ShObj (Data)
  for i := 0 to TV.Items.Count-1 do begin
    cMsg := IntToStr(PTreeRec(TV.Items[i].Data)^.KdObj) + ' ' +
                               Trim(PTreeRec(TV.Items[i].Data)^.ShObj);
    WriteLn(F, cMsg);
  end;
  CloseFile(F);
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjLoadFromFileClick(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvRebuildObjTableClick(Sender: TObject);
var i, nLvl, nIndx, nAIndx, nPIndx : SmallInt; cHsCh : string;
begin
  // Сохранить индексы и HasChildren дерева в таблицу Z_KdObj
  Form_Dm.DbMain.StartTransaction;
  // Сделать по науке с TRY - EXCEPT
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Update z_KdObj set PIndx = :nPIndx, Indx = :nIndx, ' +
            ' Lvl = :nLvl, HsCh = :cHsCh where AIndx = :nAIndx');
    Prepare;
  end;
  for i := 0 to TV.Items.Count-1 do begin
    nLvl   := TV.Items[i].Level;
    nIndx  := TV.Items[i].Index;
    nAIndx := TV.Items[i].AbsoluteIndex;
    nPIndx := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('nAIndx').AsInteger := nAIndx;
    qryTmp.ParamByName('nPIndx').AsInteger := nPIndx;
    qryTmp.ParamByName('nLvl').AsInteger   := nLvl;
    qryTmp.ParamByName('nIndx').AsInteger  := nIndx;
    qryTmp.ParamByName('cHsCh').AsString   := cHsCh;
    qryTmp.ExecSQL;
  end;
  Form_Dm.DbMain.Commit;
  qryTmp.UnPrepare;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjSaveToTableClick(Sender: TObject);
begin
  TvSaveToTable;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjFullExpandClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullExpand;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjFullCollapseClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullCollapse;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjExitClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.popTvObjVuborClick(Sender: TObject);
begin
  if bVuborMode and (TV.Selected <> nil) and
                          (not TV.Selected.HasChildren) then begin
    ModalResult := mrOk;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
                             State: TCustomDrawState; var DefaultDraw: Boolean);
var i : integer;
begin
  if bNaborMode or bVubor2Mode then with TV.Canvas do begin
    i := m_LstObj.IndexOf(IntToStr(Node.AbsoluteIndex));
    if (cdsSelected in State) then
      Brush.Color := clAqua;
    if i >= 0 then
      Font.Color := clRed
    else
      Font.Color := clWindowText;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.TVKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (bNaborMode or bVubor2Mode) and
                 (TV.Selected <> nil) and (Key = VK_F8) and (Shift = []) then
    sBtnSelCurrent.Click;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.sBtnSelCurrentClick(Sender: TObject);
var nKdObj, i, iSel, iSvSel, nLvl, nTvCount : integer;
    cSelIndx, cShObj, cNmObj  : string;
begin
  if not bNaborMode and not bVubor2Mode then
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
          nKdObj := PTreeRec(TV.Items[iSel].Data)^.KdObj;
          i := m_LstObj.IndexOf(IntToStr(iSel));
          if i < 0 then begin
            m_LstObj.Add(IntToStr(iSel));
            cShObj := PTreeRec(TV.Items[iSel].Data)^.ShObj;
            cNmObj := PTreeRec(TV.Items[iSel].Data)^.NmObj;
            with cdsTmp do begin
              Append;
              FieldByName('AIndx').AsInteger := iSel;
              FieldByName('KdObj').AsInteger := nKdObj;
              FieldByName('ShObj').AsString := cShObj;
              FieldByName('NmObj').AsString := cNmObj;
              Post;
            end; end
          else begin
            m_LstObj.Delete(i);
            if cdsTmp.Locate('KdObj', nKdObj, []) then
              cdsTmp.Delete;
          end; end
        else
          Break;
        if iSel < nTvCount-1 then
          TV.Items[iSel+1].Selected := true
        else begin
          TV.Items[iSel-1].Selected := true;
          TV.Items[iSel].Selected := true;
        end;
      end;
      if Tv.Items[iSvSel].Expanded then
        Tv.Items[iSvSel].Collapse(true);
      Tv.Items[iSvSel].Expand(true);
      TV.Items.EndUpdate; end
    else begin
      nKdObj := PTreeRec(Tv.Selected.Data)^.KdObj;
      cSelIndx := IntToStr(iSel);
      i := m_LstObj.IndexOf(cSelIndx);
      if i < 0 then begin
        m_LstObj.Add(cSelIndx);
        cdsTmp.Append;
        cdsTmp.FieldByName('AIndx').AsInteger := iSel;
        cdsTmp.FieldByName('KdObj').AsInteger := nKdObj;
        cdsTmp.FieldByName('ShObj').AsString := PTreeRec(Tv.Selected.Data)^.ShObj;
        cdsTmp.FieldByName('NmObj').AsString := PTreeRec(Tv.Selected.Data)^.NmObj;
        cdsTmp.Post; end
      else begin
        m_LstObj.Delete(i);
        if cdsTmp.Locate('KdObj', nKdObj, []) then
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
  sBtnSelAll.Enabled := m_LstObj.Count < nTvCount;
  sBtnUnSelAll.Enabled := m_LstObj.Count > 0;
  if m_LstObj.Count > 0 then
    LabelCntSel.Caption := 'Помечено подразделений: ' + IntToStr(m_LstObj.Count)
  else
    LabelCntSel.Caption := '';
(*
  if not bNaborMode then
    Exit;
  nTvCount := TV.Items.Count;
  if (TV.Selected <> nil) then begin
    iSel := TV.Selected.AbsoluteIndex;
    if Tv.Items[iSel].HasChildren then begin
      // Выбрать всю группу
      Tv.Items[iSel].Expand(true);
      while true and (iSel < nTvCount-1)  do begin
        Inc(iSel);
        if not Tv.Items[iSel].HasChildren then begin
          nKdObj := PTreeRec(TV.Items[iSel].Data)^.KdObj;
          i := m_LstObj.IndexOf(IntToStr(iSel));
          if i < 0 then begin
            m_LstObj.Add(IntToStr(iSel));
            cShObj := PTreeRec(TV.Items[iSel].Data)^.ShObj;
            cNmObj := PTreeRec(TV.Items[iSel].Data)^.NmObj;
            with cdsTmp do begin
              Append;
              FieldByName('AIndx').AsInteger := iSel;
              FieldByName('KdObj').AsInteger := nKdObj;
              FieldByName('ShObj').AsString := cShObj;
              FieldByName('NmObj').AsString := cNmObj;
              Post;
            end; end
          else begin
            m_LstObj.Delete(i);
            if cdsTmp.Locate('KdObj', nKdObj, []) then
              cdsTmp.Delete;
          end; end
        else
          Break;
      end; end
    else begin
      nKdObj := PTreeRec(Tv.Selected.Data)^.KdObj;
      cSelIndx := IntToStr(iSel);
      i := m_LstObj.IndexOf(cSelIndx);
      if i < 0 then begin
        m_LstObj.Add(cSelIndx);
        cdsTmp.Append;
        cdsTmp.FieldByName('AIndx').AsInteger := iSel;
        cdsTmp.FieldByName('KdObj').AsInteger := nKdObj;
        cdsTmp.FieldByName('ShObj').AsString := PTreeRec(Tv.Selected.Data)^.ShObj;
        cdsTmp.FieldByName('NmObj').AsString := PTreeRec(Tv.Selected.Data)^.NmObj;
        cdsTmp.Post; end
      else begin
        m_LstObj.Delete(i);
        if cdsTmp.Locate('KdObj', nKdObj, []) then
          cdsTmp.Delete;
      end;
    end;
    if iSel < nTvCount-1 then
      TV.Items[iSel+1].Selected := true
    else begin
      TV.Items[iSel-1].Selected := true;
      TV.Items[iSel].Selected := true;
    end
  end;
  sBtnSelAll.Enabled := m_LstObj.Count < nTvCount;
  sBtnUnSelAll.Enabled := m_LstObj.Count > 0;
  if m_LstObj.Count > 0 then
    LabelCntSel.Caption := 'Помечено подразделений: ' + IntToStr(m_LstObj.Count)
  else
    LabelCntSel.Caption := '';
*)
end;
//------------------------------------------------------------------------------
procedure TFormTObj.sBtnSelAllClick(Sender: TObject);
var i, {nTvCount,} nKdObj : integer; cShObj, cNmObj : string;
begin
  if not bNaborMode and not bVubor2Mode then Exit;
  //nTvCount := TV.Items.Count;
  cdsTmp.Close;
  cdsTmp.CreateDataSet;
  cdsTmp.Open;
  m_LstObj.Clear;
  for i := 0 to TV.Items.Count-1 do begin
    if not Tv.Items[i].HasChildren then begin
      m_LstObj.Add(IntToStr(i));
      nKdObj := PTreeRec(TV.Items[i].Data)^.KdObj;
      cShObj := PTreeRec(TV.Items[i].Data)^.ShObj;
      cNmObj := PTreeRec(TV.Items[i].Data)^.NmObj;
      with cdsTmp do begin
        Append;
        FieldByName('AIndx').AsInteger := i;
        FieldByName('KdObj').AsInteger := nKdObj;
        FieldByName('ShObj').AsString := cShObj;
        FieldByName('NmObj').AsString := cNmObj;
        Post;
      end;
    end;
  end;
  sBtnUnSelAll.Enabled := true;
  LabelCntSel.Caption := 'Помечено подразделений: ' + IntToStr(m_LstObj.Count);
  Tv.Repaint;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.sBtnUnSelAllClick(Sender: TObject);
begin
  if not bNaborMode and not bVubor2Mode then Exit;
  cdsTmp.Close;
  cdsTmp.CreateDataSet;
  cdsTmp.Open;
  m_LstObj.Clear;
  Tv.Repaint;
  LabelCntSel.Caption := '';
  sBtnUnSelAll.Enabled := false;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.dbgrTmpDblClick(Sender: TObject);
var i : integer;
begin
  if cdsTmp.RecordCount > 0 then begin
    i := cdsTmp.FieldByName('AIndx').AsInteger;
    TV.Items[i].Selected := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.dbgrTmpEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.dbgrTmpExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.SpeedButton1Click(Sender: TObject);
begin
  PanelMsg.Visible := not PanelMsg.Visible;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.sBtnDelMeClick(Sender: TObject);
begin
//  Label1.Visible := not Label1.Visible;
end;
//------------------------------------------------------------------------------
procedure TFormTObj.sBtnPrtClick(Sender: TObject);
begin
  F6PrtTObj(qryObj); {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormTObj.FormResize(Sender: TObject);
begin
  PanelDelMsg.Top  := Round((TV.Height - PanelDelMsg.Height) / 2);
  PanelDelMsg.Left := Round((TV.Width - PanelDelMsg.Width) / 2);
end;

end.
