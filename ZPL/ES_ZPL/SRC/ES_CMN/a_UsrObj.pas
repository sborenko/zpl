unit a_UsrObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Grids, DBGrids, ExtCtrls, ComCtrls, DBTables,
  StdCtrls, Buttons, Provider, DBClient;

type
  String4 = string[4];
  String15 = string[15];
  PTreeRec = ^TTreeRec;
  TTreeRec = record
    KdObj : SmallInt;
    ShObj : String15;
    NmObj : string;
  end;
  TFormUsrObj = class(TForm)
    Panel1: TPanel;
    bBtnClose: TBitBtn;
    qryObj: TQuery;
    dsrcObj: TDataSource;
    Splitter1: TSplitter;
    qryUsrObj: TQuery;
    dbgrUsrObj: TDBGrid;
    qryUsrObjNR: TIntegerField;
    qryUsrObjKDUSR: TSmallintField;
    qryUsrObjKDOBJ: TSmallintField;
    qryUsrObjSHOBJ: TStringField;
    qryUsrObjNMOBJ: TStringField;
    PanelLeft: TPanel;
    TvObj: TTreeView;
    dbgrObj: TDBGrid;
    Splitter2: TSplitter;
    qryUsrObjAINDX: TSmallintField;
    LbxF8: TListBox;
    qryUsrObjHSCH: TStringField;
    Label1: TLabel;
    sBtnF8: TSpeedButton;
    updUsrObj: TUpdateSQL;
    cdsUsrObj: TClientDataSet;
    dsrcUsrObj: TDataSource;
    dspUsrObj: TDataSetProvider;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TvObjChange(Sender: TObject; Node: TTreeNode);
    procedure dbgrUsrObjDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TvObjCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure sBtnF8Click(Sender: TObject);
  private
    { Private declarations }
    n_KdUsr : SmallInt;
    bTreeObjChanged : boolean; // Чтобы разделить перемещение по дереву и по qryObj
    procedure CreTvObj_FromTable;
    procedure CreTvObjItems;
    procedure SyncQryObj;
    procedure OpenCdsUsrObj(nKdUsr : SmallInt);
  public
    { Public declarations }
  end;

function ShowUsrObj(nKdUsr : SmallInt) : boolean;

const SECTION = 'a_UsrObj';

var
  FormUsrObj: TFormUsrObj;
  bEndTvObjUpdated : boolean;

implementation

uses a_Const, A_Dm;

{$R *.dfm}

//------------------------------------------------------------------------------
function ShowUsrObj(nKdUsr : SmallInt) : boolean;
begin
  Result := false;
  FormUsrObj := TFormUsrObj.Create(Application);
  with FormUsrObj do begin
    n_KdUsr := nKdUsr;
    Caption := 'Выбор доступных пользователю подразделений';
    OpenCdsUsrObj(nKdUsr);
    bEndTvObjUpdated := false;
    CreTvObj_FromTable;
    bEndTvObjUpdated := true;
//    SyncQryObj;
    TvObj.FullExpand;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.OpenCdsUsrObj(nKdUsr: SmallInt);
begin
  if cdsUsrObj.Active then cdsUsrObj.Close;
  with qryUsrObj do begin
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.*, o.ShObj, o.NmObj, o.AIndx, o.HsCh from z_Usr_Obj u ' +
            ' Left Outer Join z_KdObj o on o.KdObj = u.KdObj ' +
            ' order by o.Aindx');
  end;
  dspUsrObj.DataSet := qryUsrObj;
  with cdsUsrObj do begin
    ProviderName := 'dspUsrObj';
    Open;
    First;
    LbxF8.Clear;
    while not Eof do begin
      LbxF8.Items.Add(cdsUsrObj.FieldByName('AIndx').AsString);
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.CreTvObj_FromTable;
begin                           {Создать дерево из таблицы z_KdObj}
  with qryObj do begin
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdObj ' +
              ' order by AIndx, Lvl, PIndx');
    Open;
    CreTvObjItems;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.CreTvObjItems;
var F : TextFile; MyTreeRec : PTreeRec;
    cTmpFile, cMsg : string; i : integer;
begin
  cTmpFile := cDirTemp + 'tmp.obj';
  AssignFile(F, cTmpFile);
  Rewrite(F);
  with qryObj do begin
    DisableControls;
    First;
    while not Eof do begin
      cMsg := '';
      for i := 1 to FieldByName('Lvl').AsInteger do begin
        cMsg := cMsg + ' ';
      end;
      cMsg := cMsg + FieldByName('KdObj').AsString + ' ' +
                         FieldByName('NmObj').AsString;
      WriteLn(F, cMsg);
      Next;
    end;
    CloseFile(F);
    TvObj.Items.BeginUpdate;
    TvObj.Items.Clear;
    TvObj.LoadFromFile(cTmpFile);
    if FileExists(cTmpFile) then
      DeleteFile(cTmpFile);
    First; // Заполнить связанные Objects
    i := 0;
    while not Eof do begin
      New(MyTreeRec);
      MyTreeRec.KdObj := FieldByName('KdObj').AsInteger;
      MyTreeRec.ShObj := Trim(FieldByName('ShObj').AsString);
      MyTreeRec.NmObj := Trim(FieldByName('NmObj').AsString);
      TvObj.Items[i].Data := MyTreeRec;
      Inc(i);
      Next;                    // qryObj не закрываю - будет нужен
    end;
    TvObj.Items.EndUpdate;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 100);
	  Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 575);
    PanelLeft.Width := ReadInteger(SECTION, 'pnlLeftW', 250);
    dbgrObj.Height := ReadInteger(SECTION, 'grdObjH', 120);
	  Free;
  end;
  if FileExists(cDirVids + 'uoObj.Vid') then
    dbgrObj.Columns.LoadFromFile(cDirVids + 'uoObj.Vid');
  if FileExists(cDirVids + 'uoUsrObj.Vid') then
    dbgrUsrObj.Columns.LoadFromFile(cDirVids + 'uoUsrObj.Vid');
  LbxF8.Visible := bFlagDbg;
  dbgrObj.Visible := bFlagDbg;
  Splitter2.Visible := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrObj.Columns.SaveToFile(cDirVids + 'uoObj.Vid');
  dbgrUsrObj.Columns.SaveToFile(cDirVids + 'uoUsrObj.Vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'pnlLeftW', PanelLeft.Width);
    WriteInteger(SECTION, 'grdObjH', dbgrObj.Height);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.TvObjChange(Sender: TObject; Node: TTreeNode);
begin
  SyncQryObj;
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.SyncQryObj;
var nKdObj : SmallInt;
begin
  if (qryObj.State in [dsEdit, dsInsert]) or (not bEndTvObjUpdated) then
    Exit;
  bTreeObjChanged := true;
  nKdObj := PTreeRec(TvObj.Selected.Data)^.KdObj;
  qryObj.Locate('KdObj', nKdObj, []);
  bTreeObjChanged := false;
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.dbgrUsrObjDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrUsrObj.Canvas do begin
    if not (gdFocused in State) then begin
      if cdsUsrObj.FieldByName('HsCh').AsBoolean then
        Font.Style := [fsBold]
      else
        Font.Style := [];
    end;
  end;
  dbgrUsrObj.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.TvObjCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var i : integer;
begin
  with TvObj.Canvas do begin
    i := LbxF8.Items.IndexOf(IntToStr(Node.AbsoluteIndex));
    if (cdsSelected in State) then
      Brush.Color := clAqua;
    if i >= 0 then
      Font.Color := clRed
    else
      Font.Color := clWindowText;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUsrObj.sBtnF8Click(Sender: TObject);
var nKdObj, i, iSel, iSvSel, nTvCount, nLvl : integer;
    cSelIndx, cShObj, cNmObj  : string;
begin
  nTvCount := TvObj.Items.Count;
  if (TvObj.Selected <> nil) then begin
    iSel := TvObj.Selected.AbsoluteIndex;
    if TvObj.Items[iSel].HasChildren then begin
      iSvSel := iSel;  // сохранить позицию "папаши"
      TvObj.Items.BeginUpdate;
      // Выбрать всю группу
      nLvl := TvObj.Items[iSel].Level + 1;
      while TRUE and (iSel < nTvCount-1) do begin
        Inc(iSel);
        if (not TvObj.Items[iSel].HasChildren) and
                           (TvObj.Items[iSel].Level = nLvl) then begin
          nKdObj := PTreeRec(TvObj.Items[iSel].Data)^.KdObj;
          i := LbxF8.Items.IndexOf(IntToStr(iSel));
          if i < 0 then begin
            LbxF8.Items.Add(IntToStr(iSel));
            cShObj := PTreeRec(TvObj.Items[iSel].Data)^.ShObj;
            cNmObj := PTreeRec(TvObj.Items[iSel].Data)^.NmObj;
            with cdsUsrObj do begin
              Append;
              FieldByName('KdUsr').AsInteger := n_KdUsr;
              FieldByName('AIndx').AsInteger := iSel;
              FieldByName('KdObj').AsInteger := nKdObj;
              FieldByName('ShObj').AsString  := cShObj;
              FieldByName('NmObj').AsString  := cNmObj;
              Post;
            end; end
          else begin
            LbxF8.Items.Delete(i);
            if cdsUsrObj.Locate('KdObj', nKdObj, []) then
              cdsUsrObj.Delete;
          end; end
        else begin
//          TvObj.Items[iSel].Selected := true;
          Break;
        end;
        if iSel < nTvCount-1 then
          TvObj.Items[iSel+1].Selected := true
        else begin
          TvObj.Items[iSel-1].Selected := true;
          TvObj.Items[iSel].Selected := true;
        end;
      end;
//      TvObj.Items.BeginUpdate;
      if TvObj.Items[iSvSel].Expanded then
        TvObj.Items[iSvSel].Collapse(true);
      TvObj.Items[iSvSel].Expand(true);
      TvObj.Items.EndUpdate; end
    else begin
      nKdObj := PTreeRec(TvObj.Selected.Data)^.KdObj;
      cSelIndx := IntToStr(iSel);
      i := LbxF8.Items.IndexOf(cSelIndx);
      if i < 0 then begin
        LbxF8.Items.Add(cSelIndx);
        cdsUsrObj.Append;
        cdsUsrObj.FieldByName('KdUsr').AsInteger := n_KdUsr;
        cdsUsrObj.FieldByName('AIndx').AsInteger := iSel;
        cdsUsrObj.FieldByName('KdObj').AsInteger := nKdObj;
        cdsUsrObj.FieldByName('ShObj').AsString :=
                                          PTreeRec(TvObj.Selected.Data)^.ShObj;
        cdsUsrObj.FieldByName('NmObj').AsString :=
                                          PTreeRec(TvObj.Selected.Data)^.NmObj;
        cdsUsrObj.Post; end
      else begin
        LbxF8.Items.Delete(i);
        if cdsUsrObj.Locate('KdObj', nKdObj, []) then
          cdsUsrObj.Delete;
      end;
      if iSel < nTvCount-1 then
        TvObj.Items[iSel+1].Selected := true
      else begin
        TvObj.Items[iSel-1].Selected := true;
        TvObj.Items[iSel].Selected := true;
      end;
    end;
  end;
//  sBtnSelAll.Enabled := m_LstSbu.Count < nTvCount;
//  sBtnUnSelAll.Enabled := m_LstSbu.Count > 0;
//  if m_LstSbu.Count > 0 then
//    LabelCntSel.Caption := 'Помечено счетов: ' + IntToStr(m_LstSbu.Count)
//  else
//    LabelCntSel.Caption := '';
end;

end.
