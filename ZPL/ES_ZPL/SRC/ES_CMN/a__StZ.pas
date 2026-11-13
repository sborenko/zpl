unit a__StZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Grids, DBGrids, ComCtrls, Buttons, ExtCtrls,
  Math, DBTables, DB, Menus;

type

  String10 = string[10];
  PTreeRec = ^TTreeRec;
  TTreeRec = record
    KdStZ : SmallInt;  // мои цифровые коды
    ShStZ : string10;  // тут старые коды (1111, 1111д, 2112...)
    NmStZ : string;
  end;

  TForm_TStZ = class(TForm)
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Panel2: TPanel;
    TV: TTreeView;
    dbgrStZ: TDBGrid;
    LabelPopMsg: TLabel;
    LabelNotFound: TLabel;
    LabelIsSborny: TLabel;
    LabelErr3: TLabel;
    qryStZ: TQuery;
    dsrcStZ: TDataSource;
    updStZ: TUpdateSQL;
    qryTmp: TQuery;
    popTree: TPopupMenu;
    popTreeVubor: TMenuItem;
    popTreeFullExpand: TMenuItem;
    popTreeFullCollapse: TMenuItem;
    popTreeExit: TMenuItem;
    popTreeSep1: TMenuItem;
    popTreeEdt: TMenuItem;
    popTreeAddInRoot: TMenuItem;
    popTreeAddFirstInCurrent: TMenuItem;
    popTreeAddLastInCurrent: TMenuItem;
    popTreeInsertBeforeCurrent: TMenuItem;
    popTreeAddInNode: TMenuItem;
    popTreeMoveInTo: TMenuItem;
    popTreeMoveTo: TMenuItem;
    popTreeDel: TMenuItem;
    popTreeSep2: TMenuItem;
    popTreeSaveToTable: TMenuItem;
    popTreeLoadFromTable: TMenuItem;
    qryStZNR: TIntegerField;
    qryStZKDSTZ: TSmallintField;
    qryStZSHSTZ: TStringField;
    qryStZNMSTZ: TStringField;
    qryStZAINDX: TSmallintField;
    qryStZPINDX: TSmallintField;
    qryStZLVL: TSmallintField;
    qryStZINDX: TSmallintField;
    qryStZHSCH: TStringField;
    qryStZPVNUTR: TStringField;
    qryStZSH_STZ: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure popTreePopup(Sender: TObject);
    procedure popTreeVuborClick(Sender: TObject);
    procedure popTreeFullExpandClick(Sender: TObject);
    procedure popTreeFullCollapseClick(Sender: TObject);
    procedure popTreeEdtClick(Sender: TObject);
    procedure popTreeAddInRootClick(Sender: TObject);
    procedure qryStZAfterPost(DataSet: TDataSet);
    procedure popTreeAddFirstInCurrentClick(Sender: TObject);
    procedure popTreeAddLastInCurrentClick(Sender: TObject);
    procedure popTreeInsertBeforeCurrentClick(Sender: TObject);
    procedure popTreeAddInNodeClick(Sender: TObject);
    procedure qryStZBeforePost(DataSet: TDataSet);
    procedure popTreeMoveInToClick(Sender: TObject);
    procedure popTreeMoveToClick(Sender: TObject);
    procedure popTreeDelClick(Sender: TObject);
    procedure popTreeSaveToTableClick(Sender: TObject);
    procedure popTreeLoadFromTableClick(Sender: TObject);
  private
    { Private declarations }
    bTvReady, bVuborMode, b_WasUpdated : boolean;
    n_SvKdStZ, n_LastGetKdStZ : integer;
    function MyTVLocateKdStZ(nKdStZ : integer) : boolean;
    function MyTVLocateShStZ(cShStZ : string; var nErrCode : integer) : boolean;
    procedure TvLoadFromTable;
    // procedure TvSaveToTable;
    function MaxTreeId : integer;
    function MyNewStZ : integer;
    procedure UpdLvlIndx;
    procedure Synchronize;
    procedure AddNewStZ(nKdStZ, nSh_StZ : integer; cShStZ, cNmStZ : string);
  public
    { Public declarations }
  end;

procedure Show_StZ(var bWasUpdated : boolean);
function GetStZ(var nKdStZ : integer; var cShStZ, cNmStZ : string) : boolean;
function CheckStZ(var nKdStZ : integer; var cShStZ : string) : boolean;

const SECTION = 'A_StZ';

var
  Form_TStZ: TForm_TStZ;

implementation

uses a_Const, A_DM, A_Lib, A_EStZ, A_EStZCh, a_StZGoT;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure Show_StZ(var bWasUpdated : boolean);
begin
//  Form_TStZ := TForm_TStZ.Create(Application);
  with Form_TStZ do begin
    bVuborMode := false;
    n_LastGetKdStZ := 0;
    b_WasUpdated := false;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Закрыть';
    if n_SvKdStZ >= 0 then
      MyTVLocateKdStZ(n_SvKdStZ);
    ShowModal;
    bWasUpdated := b_WasUpdated;
  end;
end;
//------------------------------------------------------------------------------
function GetStZ(var nKdStZ : integer; var cShStZ, cNmStZ : string) : boolean;
begin
  Result := false;
end;
//------------------------------------------------------------------------------
function CheckStZ(var nKdStZ : integer; var cShStZ : string) : boolean;
begin
  Result := false;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.FormCreate(Sender: TObject);
begin
  bTvReady := false;
  with TIniFile.Create(cNmIniFile) do begin
    Top    := ReadInteger(SECTION, 'wT', 100);
    Left   := ReadInteger(SECTION, 'wL', 100);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 450);
    n_SvKdStZ := ReadInteger(SECTION, 'nSvKdStZ', 0);
    Free;
  end;
  dbgrStZ.Visible := bFlagDbg;
  if FileExists(cDirVids + 'TvStZ.vid') then
    dbgrStZ.Columns.LoadFromFile(cDirVids + 'TvStZ.vid');
  TvLoadFromTable;
  Caption := 'Статьи затрат [КЕКВ]';
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.FormClose(Sender: TObject; var Action: TCloseAction);
var nKdStZ : integer;
begin
  dbgrStZ.Columns.SaveToFile(cDirVids + 'TvStZ.vid');
  nKdStZ := PTreeRec(TV.Selected.Data)^.KdStZ;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvKdStZ', nKdStZ);
    WriteInteger(SECTION, 'nLastKdStZ', nKdStZ);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.TvLoadFromTable;
// Создать файл cNmTV1 по записям таблицы Kd_StZ и загрузить его в дерево.
// Заполнить связанные объекты
var F1 : TextFile; cNmTv1, cMsg : string;
    i : integer;  MyTreeRec : PTreeRec;
begin
  cNmTv1 := 'StZ.tv1';
  AssignFile(F1, cDirSbu + cNmTV1);
  Rewrite(F1);
  bTvReady := false;
  with qryStZ do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cAppWorkDB;
    SQL.Add('Select * from Kd_StZ order by AIndx, Lvl, PIndx');
    Open;
    First;
    while not Eof do begin
      cMsg := '';
      for i := 1 to FieldByName('Lvl').AsInteger do begin
        cMsg := cMsg + ' ';
      end;
      cMsg := cMsg + FieldByName('ShStZ').asString + '  ' +
                                    Copy(FieldByName('NmStZ').asString, 1, 82);
      WriteLn(F1, cMsg);
      Next;
    end;
    CloseFile(F1);
    TV.Items.BeginUpdate;
    TV.Items.Clear;
    TV.LoadFromFile(cDirSbu + cNmTV1);
    TV.Items.EndUpdate;
    if not bFlagDbg and FileExists(cDirSbu + cNmTV1) then
      DeleteFile(cDirSbu + cNmTV1);
    // Заполнить связанные Objects
    First;
    i := 0;
    while not Eof do begin
      New(MyTreeRec);
      MyTreeRec.KdStZ := FieldByName('KdStZ').AsInteger;
      MyTreeRec.ShStZ := Trim(FieldByName('ShStZ').AsString);
      MyTreeRec.NmStZ := Trim(FieldByName('NmStZ').AsString);
      TV.Items[i].Data := MyTreeRec;
      Inc(i);
      Next;
    end;
//    Close;
//    SQL.Clear;
//    DataBaseName := '';
    bTvReady := true;
  end;
end;
(*
//------------------------------------------------------------------------------
procedure TForm_TStZ.TvSaveToTable;
var cShStZ, cNmStZ, cHsCh : string;
    i, nCntAdd, nKdStZ, nSh_StZ, nLvl, nIndx, nAIndx, nPIndx : SmallInt;
begin
  // Сохранить дерево в таблицу Kd_SBU
  Form_Dm.Db1.StartTransaction;
  // Сделать по науке с TRY - EXCEPT
  with qryTmp do begin
    if Active then Close;
    DataBaseName := cAppWorkDB;
    SQL.Clear;
    SQL.Add('Delete from Kd_StZ');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Set generator Nr_Kd_StZ to 0');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Insert into Kd_StZ ' +
            ' (KdStZ, Sh_StZ, ShStZ, NmStZ, AIndx, PIndx, Lvl, Indx, HsCh) ');
    SQL.Add(' values (:nKdStZ, :nSh_StZ, :cShStZ, :cNmStZ, ' +
             ' :nAIndx, :nPIndx, :nLvl, :nIndx, :cHsCh)');
    Prepare;
  end;
  nCntAdd := 0;
  for i := 0 to TV.Items.Count-1 do begin
    nKdStZ := PTreeRec(TV.Items[i].Data)^.KdStZ;
    cShStZ := PTreeRec(TV.Items[i].Data)^.ShStZ;
    nSh_StZ := StrToInt(cShStZ);
    cNmStZ := PTreeRec(TV.Items[i].Data)^.NmStZ;
    nLvl   := TV.Items[i].Level;
    nIndx  := TV.Items[i].Index;
    nAIndx := TV.Items[i].AbsoluteIndex;
    nPIndx := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('nKdStZ').AsInteger  := nKdStZ;
    qryTmp.ParamByName('nSh_StZ').AsInteger := nSh_StZ;
    qryTmp.ParamByName('cShStZ').AsString   := cShStZ;
    qryTmp.ParamByName('cNmStZ').asString   := cNmStZ;
    qryTmp.ParamByName('nAIndx').asSmallInt := nAIndx;
    qryTmp.ParamByName('nPIndx').asSmallInt := nPIndx;
    qryTmp.ParamByName('nLvl').asSmallInt   := nLvl;
    qryTmp.ParamByName('nIndx').asSmallInt  := nIndx;
    qryTmp.ParamByName('cHsCh').asString    := cHsCh;
    qryTmp.ExecSQL;
    Inc(nCntAdd);
  end;
  Form_Dm.Db1.Commit;
  qryTmp.UnPrepare;
  b_WasUpdated := true;
  //if bFlagDbg then
  //  ShowMessage('Добавлено записей: ' + IntToStr(nCntAdd));
  // Переоткрыть наборы
end;
*)
//------------------------------------------------------------------------------
procedure TForm_TStZ.UpdLvlIndx;
var i, nKdStZ, nAIndx, nPIndx, nLvl, nIndx : SmallInt; cHsCh : string;
begin
  // Обновление в таблице Kd_StZ индексов, Level и HasChildren
  Form_Dm.Db1.StartTransaction;
  with qryTmp do begin
    if Active then Close;
    DataBaseName := cAppWorkDB;
    SQL.Clear;
    SQL.Add('Update Kd_StZ Set AIndx = :nAIndx, PIndx = :nPIndx, ' +
            ' Lvl = :nLvl, Indx = :nIndx, HsCh = :cHsCh ' +
            ' where KdStZ = :nKdStZ');
    Prepare;
  end;
  for i := 0 to TV.Items.Count-1 do begin
    nKdStZ := PTreeRec(TV.Items[i].Data)^.KdStZ;
    nLvl   := TV.Items[i].Level;
    nIndx  := TV.Items[i].Index;
    nAIndx := TV.Items[i].AbsoluteIndex;
    nPIndx := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('nKdStZ').AsSmallInt := nKdStZ;
    qryTmp.ParamByName('nAIndx').AsSmallInt := nAIndx;
    qryTmp.ParamByName('nPIndx').asSmallInt := nPIndx;
    qryTmp.ParamByName('nLvl').asSmallInt   := nLvl;
    qryTmp.ParamByName('nIndx').asSmallInt  := nIndx;
    qryTmp.ParamByName('cHsCh').asString    := cHsCh;
    qryTmp.ExecSQL;
  end;
  Form_Dm.Db1.Commit;
  qryTmp.UnPrepare;
  b_WasUpdated := true;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.Synchronize;
var nKdStZ : integer;
begin
  if not bTvReady then
    Exit;
  if (qryStZ.State in [dsEdit, dsInsert]) then
    qryStZ.Post;
  if (TV.Selected <> nil) then begin
    nKdStZ := PTreeRec(TV.Selected.Data)^.KdStZ;
    if nKdStZ <> 0 then
      qryStZ.Locate('KdStZ', nKdStZ, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.TVChange(Sender: TObject; Node: TTreeNode);
begin
  Synchronize;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.AddNewStZ(nKdStZ, nSh_StZ : integer;
                                                 cShStZ, cNmStZ : string);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cAppWorkDB;
    SQL.Add('Insert into Kd_StZ ' +
            ' (KdStZ, Sh_StZ, ShStZ, NmStZ) values ' +
            ' (:nKdStZ, :nSh_StZ, :cShStZ, :cNmStZ)');
    ParamByName('nKdStZ').AsInteger := nKdStZ;
    ParamByName('nSh_StZ').AsInteger := nSh_StZ;
    ParamByName('cShStZ').AsString  := cShStZ;
    ParamByName('cNmStZ').AsString  := cNmStZ;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_TStZ.MyTVLocateKdStZ(nKdStZ : integer) : boolean;
var i : integer;
begin
  Result := false;
  with TV do for i := 0 to Items.Count - 1 do
    if PTreeRec(Items[i].Data)^.KdStZ = nKdStZ then begin
      Items[i].Selected := true;
      Result := true;
      Break;
    end;
end;
//------------------------------------------------------------------------------
function TForm_TStZ.MyTVLocateShStZ(cShStZ : string;
                                           var nErrCode : integer) : boolean;
var i : integer;
begin
  Result := false;
  nErrCode := 1;                    // Не найден
  with TV do for i := 0 to Items.Count - 1 do begin
    if PTreeRec(Items[i].Data)^.ShStZ = cShStZ then begin
      if Items[i].HasChildren then begin
        nErrCode := 2;              // Нельзя выбирать - сборный
        Items[i].Selected := true;  // Чтобы показать именно введенный StZ
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
//------------------------------------------------------------------------------
function TForm_TStZ.MaxTreeId : integer;
var i : integer;
begin
  Result := 0;
  with TV do begin
    // определить максимальный KdStZ в дереве
    for i := 0 to Items.Count-1 do begin
      if PTreeRec(Items[i].Data)^.KdStZ > Result then
        Result := PTreeRec(Items[i].Data)^.KdStZ;
    end;
  end;
  with qryTmp do begin
    // определить максимальный KdStZ в Kd_StZ
    if Active then Close;
    DataBaseName := cAppWorkDB;
    SQL.Clear;
    Params.Clear;
    SQL.Add('Select Max(KdStZ) as nMax from Kd_StZ');
    Open;
    if (RecordCount <> 0) and (FieldByName('nMax').asInteger > 0) then
      // выбрать наибольший
      Result := Max(Result, FieldByName('nMax').asInteger);
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.qryStZAfterPost(DataSet: TDataSet);
begin
  Form_Dm.Db1.ApplyUpdates([qryStZ]);
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreePopup(Sender: TObject);
var bAllowEdt : boolean;
begin
  if (TV.Selected = nil) then Exit;
  LabelPopMsg.Visible := false;
  popTreeSaveToTable.Visible   := bFlagDbg;
  popTreeLoadFromTable.Visible := bFlagDbg;
  popTreeSep2.Visible := popTreeLoadFromTable.Visible or
                               popTreeLoadFromTable.Visible;
  bAllowEdt := bAppAllowEdtTVSBU or bFlagDbg or bFlagGMS;
  popTreeVubor.Visible := bVuborMode;
  popTreeSep1.Visible := bAllowEdt;
  popTreeEdt.Visible := bAllowEdt and (TV.Items.Count > 0);
  popTreeAddInRoot.Visible := bAllowEdt;
  popTreeAddFirstInCurrent.Visible := bAllowEdt and
                                              (TV.Items.Count > 0);
  popTreeAddLastInCurrent.Visible := bAllowEdt and
                                              (TV.Items.Count > 0);
  popTreeInsertBeforeCurrent.Visible := bAllowEdt and
                                              (TV.Items.Count > 0);
  popTreeAddInNode.Visible := bAllowEdt and (TV.Items.Count > 0);
  popTreeDel.Visible := bAllowEdt and (TV.Items.Count > 0);
  popTreeAddInNode.Enabled := popTreeAddInNode.Visible and
                                     (not TV.Selected.HasChildren);
  popTreeMoveInTo.Visible := bAllowEdt and (TV.Items.Count > 1);
  popTreeMoveTo.Visible := bAllowEdt and (TV.Items.Count > 1);
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeVuborClick(Sender: TObject);
begin
  if bVuborMode and (TV.Selected <> nil) and
                          (not TV.Selected.HasChildren) then begin
    ModalResult := mrOk;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeFullExpandClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullExpand;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeFullCollapseClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullCollapse;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeEdtClick(Sender: TObject);
var cMsg : string;
begin
  cMsg := 'Редактирование узла "' + TV.Selected.Text + '"';
  with qryStZ do begin
    Edit;
    if AddEdtStZ(cMsg) then begin     {A_EStZ}
      Post;
      PTreeRec(TV.Selected.Data)^.ShStZ := FieldByName('ShStZ').AsString;
      PTreeRec(TV.Selected.Data)^.NmStZ := FieldByName('NmStZ').AsString;
      TV.Selected.Text := FieldByName('ShStZ').AsString + '  ' +
                                            FieldByName('NmStZ').AsString;
      Form_Dm.sdsStZLU.Close;
      Form_Dm.sdsStZLU.Open;
      b_WasUpdated := true; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeAddInRootClick(Sender: TObject);
var MyRecPtr: PTreeRec; NewTreeNode : TTreeNode;
    nKdStZ, TreeViewIndex : integer; cMsg : string;
begin
  if TV.Items.Count = 0 then
    cMsg := 'Первый элемент в корень'
  else
    cMsg := 'Элемент добавляется последним в корень';
  with qryStZ do begin
    Append;
    if AddEdtStZ(cMsg) then begin  {a_EStZ}
      nKdStZ := MaxTreeId + 1;
      FieldByName('KdStZ').AsInteger := nKdStZ;
      Post;
      bTvReady := false;
      New(MyRecPtr);
      MyRecPtr.KdStZ := nKdStZ;
      MyRecPtr.ShStZ := FieldByName('ShStZ').AsString;
      MyRecPtr.NmStZ := FieldByName('NmStZ').AsString;
      NewTreeNode := TV.Items.AddObject(nil,
                                FieldByName('ShStZ').AsString + '  ' +
                                 FieldByName('NmStZ').AsString, MyRecPtr);
      TV.Selected := NewTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      with Form_Dm.sdsStZLU do begin
        Close;
        Open;
      end; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeAddFirstInCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec; NewTreeNode : TTreeNode;
    nKdStZ, TreeViewIndex : integer; cMsg : string;
begin
  cMsg := 'Элемент добавляется первым на текущий уровень';
  with qryStZ do begin
    Append;
    if AddEdtStZ(cMsg) then begin  {a_EStZ}
      nKdStZ := MaxTreeId + 1;
      FieldByName('KdStZ').AsInteger := nKdStZ;
      Post;
      bTvReady := false;
      TreeViewIndex := TV.Selected.AbsoluteIndex;
      New(MyRecPtr);
      MyRecPtr.KdStZ := nKdStZ;
      MyRecPtr.ShStZ := FieldByName('ShStZ').AsString;
      MyRecPtr.NmStZ := FieldByName('NmStZ').AsString;
      NewTreeNode := TV.Items.AddObjectFirst(TV.Items[TreeViewIndex],
                                FieldByName('ShStZ').AsString + '  ' +
                                 FieldByName('NmStZ').AsString, MyRecPtr);
      TV.Selected := NewTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      with Form_Dm.sdsStZLU do begin
        Close;
        Open;
      end; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeAddLastInCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec; NewTreeNode : TTreeNode;
    nKdStZ, TreeViewIndex : integer; cMsg : string;
begin
  cMsg := 'Элемент добавляется последним на текущий уровень';
  with qryStZ do begin
    Append;
    if AddEdtStZ(cMsg) then begin  {a_EStZ}
      nKdStZ := MaxTreeId + 1;
      FieldByName('KdStZ').AsInteger := nKdStZ;
      Post;
      bTvReady := false;
      TreeViewIndex := TV.Selected.AbsoluteIndex;
      New(MyRecPtr);
      MyRecPtr.KdStZ := nKdStZ;
      MyRecPtr.ShStZ := FieldByName('ShStZ').AsString;
      MyRecPtr.NmStZ := FieldByName('NmStZ').AsString;
      NewTreeNode := TV.Items.AddObject(TV.Items[TreeViewIndex],
                                FieldByName('ShStZ').AsString + '  ' +
                                 FieldByName('NmStZ').AsString, MyRecPtr);
      TV.Selected := NewTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      with Form_Dm.sdsStZLU do begin
        Close;
        Open;
      end; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeInsertBeforeCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec; NewTreeNode : TTreeNode;
    nKdStZ, TreeViewIndex : integer; cMsg : string;
begin
  cMsg := 'Элемент вставляется впереди "' + TV.Selected.Text + '"';
  with qryStZ do begin
    Append;
    if AddEdtStZ(cMsg) then begin  {a_EStZ}
      nKdStZ := MaxTreeId + 1;
      FieldByName('KdStZ').AsInteger := nKdStZ;
      Post;
      bTvReady := false;
      TreeViewIndex := TV.Selected.AbsoluteIndex;
      New(MyRecPtr);
      MyRecPtr.KdStZ := nKdStZ;
      MyRecPtr.ShStZ := FieldByName('ShStZ').AsString;
      MyRecPtr.NmStZ := FieldByName('NmStZ').AsString;
      NewTreeNode := TV.Items.InsertObject(TV.Items[TreeViewIndex],
                                FieldByName('ShStZ').AsString + '  ' +
                                 FieldByName('NmStZ').AsString, MyRecPtr);
      TV.Selected := NewTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true;
      with Form_Dm.sdsStZLU do begin
        Close;
        Open;
      end; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
function TForm_TStZ.MyNewStZ : integer;
begin
  Result := 1000;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cAppWorkDB;
    SQL.Add('Select Max(Sh_StZ) as MaxStZ from Kd_StZ');
    Open;
    if (RecordCount > 0) and (FieldByName('MaxStZ').AsInteger > 0) then
      Result := FieldByName('MaxStZ').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeAddInNodeClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    cShStZ, cNmStZ, cOldSh, cNewSh, cNewChldSh,
                   cOldNm, cNewNm, cNewChldNm, cMsg : string;
    nSvKdStZ, nKdStZ, nSh_StZ : integer;
    mDestTreeNode, mNewTreeNode : TTreeNode;
    nTmpIndx, nTreeViewIndex: LongInt;
begin
{
  TTreeRec = record
    KdStZ : SmallInt;  // мои цифровые коды
    ShStZ : string10;  // тут старые коды (1111, 1111д, 2112...)
    NmStZ : string;
  end;
}
  nTreeViewIndex := TV.Selected.AbsoluteIndex;
  cMsg := 'Первый элемент ВНУТРЬ узла "' + TV.Selected.Text + '"';
  nSvKdStZ := PTreeRec(TV.Items[nTreeViewIndex].Data)^.KdStZ;
  cOldSh := PTreeRec(TV.Items[nTreeViewIndex].Data)^.ShStZ;
  cOldNm := PTreeRec(TV.Items[nTreeViewIndex].Data)^.NmStZ + ' (стар)';
  nSh_StZ := MyNewStZ;
  cNewSh := IntToStr(nSh_StZ);
  cNewChldSh := IntToStr(nSh_StZ+1);
  cNewNm := PTreeRec(TV.Items[nTreeViewIndex].Data)^.NmStZ + ' (сб)';
  if AddChildStZ(cOldSh, cNewSh, cNewChldSh,    {A_EStZCh}
                                 cOldNm, cNewNm, cNewChldNm) then begin
    // Не изменяя старого, который хотим расширить до родительского, ввожу
    // нового родителя с новым автоКодом, но с производным от старого названием
    // Потом в него переношу старый уже существующий счет первым дитем
    // Потом добавляю заказанный счет вторым дитем
    if bFlagDbg then
      ShowMessage('Новые шифр и назв. отца ' + cNewSh + ' ' + cNewNm +
          #13#10 + 'Новые шифр и назв. дочки ' + cNewChldSh + ' ' + cNewChldNm);
    nTmpIndx := nTreeViewIndex;
    nKdStZ := MaxTreeId + 1;
    bTvReady := false;
    New(MyRecPtr);
    cShStZ := cNewSh;
    cNmStZ := cNewNm;
    MyRecPtr.KdStZ := nKdStZ;
    MyRecPtr.ShStZ := cShStZ;
    MyRecPtr.NmStZ := cNmStZ;
    mNewTreeNode := TV.Items.InsertObject(TV.Items[nTmpIndx],
                                        cShStZ + '  ' + cNmStZ, MyRecPtr);
    TV.Selected := mNewTreeNode;
    // Добавить этот новый TreeNode в таблицу Kd_StZ
    AddNewStZ(nKdStZ, nSh_StZ, cShStZ, cNmStZ);
    // теперь в него ввести 1-м дитем старый счет со СТАРЫМ KdStZ
    mDestTreeNode := mNewTreeNode;
    // у старого изменился АИндкс, т.к. перед ним вставили новый. Поэтому:
    nTmpIndx := nTmpIndx + 1;
    mNewTreeNode := TV.Items.Item[nTmpIndx];
    TV.Selected := mNewTreeNode;
    nKdStZ := nSvKdStZ;
    cShStZ := cOldSh;
    cNmStZ := cOldNm;
    PTreeRec(TV.Selected.Data)^.KdStZ := nKdStZ;
    PTreeRec(TV.Selected.Data)^.ShStZ := cShStZ;
    PTreeRec(TV.Selected.Data)^.NmStZ := cNmStZ;
    TV.Selected.Text := cShStZ + '  ' + cNmStZ;
    mNewTreeNode.MoveTo(mDestTreeNode, naAddChildFirst);
    // т.к. код StZ не изменился - ни в каких проводках ничего не исправляю!!!
    TV.Selected := mNewTreeNode;
    // Ввести новый эл-т, как второе дитя с новым автоКодом
    nTreeViewIndex := TV.Selected.AbsoluteIndex;
    nKdStZ := MaxTreeId + 1;
    New(MyRecPtr);
    MyRecPtr.KdStZ := nKdStZ;
    MyRecPtr.ShStZ := cNewChldSh;
    MyRecPtr.NmStZ := cNewChldNm;
    mNewTreeNode := TV.Items.AddObject(TV.Items[nTreeViewIndex],
                                   cNewChldSh + '  ' + cNewChldNm, MyRecPtr);
    TV.Selected := mNewTreeNode;
    // И этот новый TreeNode тоже добавить в таблицу Kd_SBU
    nSh_StZ := StrToInt(cNewChldSh);
    AddNewStZ(nKdStZ, nSh_StZ, cNewChldSh, cNewChldNm);
    bTvReady := true;
    // Правлю Kd_StZ
    UpdLvlIndx;
    qryStZ.Close;
    qryStZ.Open;
    Synchronize;
    b_WasUpdated := true;
    with Form_Dm.sdsStZLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.qryStZBeforePost(DataSet: TDataSet);
begin
  qryStZSh_StZ.AsInteger := StrToInt(qryStZShStZ.AsString);
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeMoveInToClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    mCurTreeNode, mDestTreeNode, mNewTreeNode : TTreeNode;
    cShCurItem, cNmCurItem : string;
    bCurHsCh, bNewHsCh : boolean;
    nCurAindx, nCurPIndx, nNewPIndx, nAIndxNewParent : LongInt;
    nKdStZ, nSvKdStZ, nSh_StZ : integer;
    cShStZ, cNmStZ, cDestShStZ, cDestNmStZ : string;
    nTmpIndx : LongInt;
    cOldSh, cNewSh, cNewChldSh, cOldNm, cNewNm, cNewChldNm : string;
begin
  mCurTreeNode := TV.Selected;
  nCurAIndx := TV.Selected.AbsoluteIndex;
  nCurPIndx := TV.Selected.Parent.Index;
  bCurHsCh := TV.Selected.HasChildren;
  cShCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.ShStZ;
  cNmCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.NmStZ;
  if StZGoToParent(cShCurItem, cNmCurItem, bCurHsCh,  {a_StZGoT}
                   nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent) then begin
    mDestTreeNode := TV.Items.Item[nAIndxNewParent];
    bNewHsCh   := mDestTreeNode.HasChildren;
    nSvKdStZ   := PTreeRec(TV.Items[nAIndxNewParent].Data)^.KdStZ;
    cDestShStZ := PTreeRec(TV.Items[nAIndxNewParent].Data)^.ShStZ;
    cDestNmStZ := PTreeRec(TV.Items[nAIndxNewParent].Data)^.NmStZ;
    bTvReady := false;
    // Все изменения сначала вношу только в дерево
    // А потом гамузом перестраиваю всю таблицу Kd_StZ
    if not bNewHsCh then begin
      // Запросить реквизиты для нового родителя и старого дитя на новом месте
      cOldSh := cDestShStZ;  //  + '/нов';
      cOldNm := cDestNmStZ + ' (нов.)';
      nSh_StZ := MyNewStZ;
      cNewSh := IntToStr(nSh_StZ);  // cDestShSch + '/сб';
      cNewNm := cDestNmStZ + ' (сборн.)';
      cNewChldSh := IntToStr(nSh_StZ+1); // cShCurItem;
      cNewChldNm := cNmCurItem;
      if AddChildStZ(cOldSh, cNewSh, cNewChldSh,    {A_EStZCh}
                           cOldNm,  cNewNm,  cNewChldNm) then begin
        // 1. Открыть впереди mDestTreeNode новый TreeNode с названием, производ-
        //    ным от названия mDestTreeNode (добавить "Группа", но с новым кодом
        nTmpIndx := nAIndxNewParent;
        nKdStZ := MaxTreeId + 1;
        New(MyRecPtr);
        cShStZ := cNewSh;
        cNmStZ := cNewNm;
        MyRecPtr.KdStZ := nKdStZ;
        MyRecPtr.ShStZ := cShStZ;
        MyRecPtr.NmStZ := cNmStZ;
        mNewTreeNode := TV.Items.InsertObject(TV.Items[nTmpIndx],
                                      cShStZ + '  ' + cNmStZ, MyRecPtr);
        TV.Selected := mNewTreeNode;
        // Добавить этот новый mNewTreeNode в таблицу Kd_SBU
        AddNewStZ(nKdStZ, nSh_StZ, cShStZ, cNmStZ);
        // 2. Теперь приемником становится новый TreeNode. Сам mDestTreeNode
        //    переименовываю в mNewTreeNode и, не меняя его кода (nSvKdSbu) и
        //    чуть-чуть перекроив название, переношу в новый узел как 1-й дочерний
        mDestTreeNode := mNewTreeNode;
        // {теперь у приемника изменился АИндкс. Поэтому:}
        nTmpIndx := nTmpIndx + 1;
        mNewTreeNode := TV.Items.Item[nTmpIndx];
        TV.Selected := mNewTreeNode;
        nKdStZ := nSvKdStZ;
        cShStZ := cOldSh;
        cNmStZ := cOldNm;
        PTreeRec(TV.Selected.Data)^.KdStZ := nKdStZ;
        PTreeRec(TV.Selected.Data)^.ShStZ := cShStZ;
        PTreeRec(TV.Selected.Data)^.NmStZ := cNmStZ;
        TV.Selected.Text := cShStZ + '  ' + cNmStZ;
        mNewTreeNode.MoveTo(mDestTreeNode, naAddChildFirst);
        TV.Selected := mNewTreeNode;
        // 3. И наконец переносимый mCurTreeNode перемещаю в mDestTreeNode:
        mCurTreeNode.MoveTo(mDestTreeNode, naAddChild);
        TV.Selected := mCurTreeNode;
        // Правлю Kd_StZ
        bTvReady := true;
        UpdLvlIndx;
        qryStZ.Close;
        qryStZ.Open;
        Synchronize;
        Form_Dm.sdsStZLU.Close;
        Form_Dm.sdsStZLU.Open;
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
      qryStZ.Close;
      qryStZ.Open;
      Synchronize;
      Form_Dm.sdsStZLU.Close;
      Form_Dm.sdsStZLU.Open;
      b_WasUpdated := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeMoveToClick(Sender: TObject);
var mCurTreeNode, mDestTreeNode : TTreeNode;
    cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
    nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent : integer;
begin
  mCurTreeNode := TV.Selected;
  nCurAIndx  := TV.Selected.AbsoluteIndex;
  nCurPIndx  := TV.Selected.Parent.Index;
  bCurHsCh   := TV.Selected.HasChildren;
  cShCurItem := IntToStr(PTreeRec(TV.Items[nCurAindx].Data)^.KdSTz);
  cNmCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.ShsTz;
  if StZMoveTo(cShCurItem, cNmCurItem, bCurHsCh,          {a_StZGoT}
                   nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent) then begin
    mDestTreeNode := TV.Items.Item[nAIndxNewParent];
    mCurTreeNode.MoveTo(mDestTreeNode, naInsert);
    TV.Selected := mCurTreeNode;
    bTvReady := true;
    UpdLvlIndx;
    qrySTz.Close;
    qrySTz.Open;
    Synchronize;
    b_WasUpdated := true;
    with Form_Dm.sdsSTzLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeDelClick(Sender: TObject);
var nKdStZ : integer; cMsg : string; bCanDelete : boolean;
begin
  if TV.Selected.HasChildren then begin
    MessageDlg('Сначала должны быть по одному удалены все ' +
               'элементы, входящие в узел', mtError, [mbOk], 0);
    Exit;
  end;
  Application.ProcessMessages;
  nKdStZ := PTreeRec(TV.Selected.Data)^.KdStZ;
  with qryTmp do begin
    if Active then Close;
    DataBaseName := cAppWorkDB;
    SQL.Clear;
    SQL.Add('Select Count( * ) as CNT from Provodki_StZ ' +
            ' where (KdStZ = :nKdStZ)');
    ParamByName('nKdStZ').asInteger := nKdStZ;
    Open;
    bCanDelete := (RecordCount <> 0) and (FieldByName('CNT').asInteger = 0);
    if bCanDelete then begin
      SQL.Clear;
      SQL.Add('Select Count( * ) as CNT from Prov106stz ' +
              ' where (KdStZ = :nKdStZ)');
      ParamByName('nKdStZ').asInteger := nKdStZ;
      Open;
      bCanDelete := (RecordCount <> 0) and (FieldByName('CNT').asInteger = 0);
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if not bCanDelete then begin
    MessageDlg('Нельзя удалять эту запись - на нее ' +
               'есть ссылки в других таблицах', mtError, [mbOk], 0);
    Exit; end
  else begin
    cMsg := '"' + TV.Selected.Text + '"' + #13#10 + 'удаляется безвозвратно';
    cMsg := cMsg + #13#10 + 'Вы согласны?:';
    if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      bTvReady := false;
      TV.Items.Delete(TV.Selected);
      qryStZ.Delete;
      bTvReady := true;
      UpdLvlIndx;
      qryStZ.Close;
      qryStZ.Open;
      Synchronize;
      b_WasUpdated := true;
      with Form_Dm.sdsStZLU do begin
        Close;
        Open;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeLoadFromTableClick(Sender: TObject);
begin
  TvLoadFromTable;
end;
//------------------------------------------------------------------------------
procedure TForm_TStZ.popTreeSaveToTableClick(Sender: TObject);
begin
//  TvSaveToTable;
end;

end.
