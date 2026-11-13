unit a_Stz2;

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

  TForm_Stz2 = class(TForm)
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
    qryTmp: TQuery;
    popTree: TPopupMenu;
    popTreeVubor: TMenuItem;
    popTreeFullExpand: TMenuItem;
    popTreeFullCollapse: TMenuItem;
    popTreeExit: TMenuItem;
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
    sBtnPrt: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure popTreeVuborClick(Sender: TObject);
    procedure popTreeFullExpandClick(Sender: TObject);
    procedure popTreeFullCollapseClick(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    //bLocalIni : boolean;
    bTvReady, bVuborMode, b_WasUpdated : boolean;
    n_SvKdStZ, n_LastGetKdStZ : integer;
    function MyTVLocateKdStZ(nKdStZ : integer) : boolean;
    function MyTVLocateShStZ(cShStZ : string; var nErrCode : integer) : boolean;
    procedure TvLoadFromTable;
//    function MaxTreeId : integer;
//    procedure UpdLvlIndx;
    procedure Synchronize;
  public
    { Public declarations }
  end;

procedure Show_StZ;
function Get_StZ(var nKdStZ : integer;
                                   var cShStZ, cNmStZ : ShortString) : boolean;
//function CheckStZ(var nKdStZ : integer; var cShStZ : string) : boolean;

const SECTION = 'A_Stz2';

var
  Form_Stz2: TForm_Stz2;

implementation

uses a_Const, A_DM, A_Lib, a_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure Show_StZ;
begin
  Form_Stz2 := TForm_Stz2.Create(Application);
  with Form_Stz2 do begin
    bVuborMode := false;
    n_LastGetKdStZ := 0;
    b_WasUpdated := false;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Закрыть';
    if n_SvKdStZ >= 0 then
      MyTVLocateKdStZ(n_SvKdStZ);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function Get_StZ(var nKdStZ : integer;
                                   var cShStZ, cNmStZ : ShortString) : boolean;
var n_ErrCode : integer;
begin
  Result := false;
  Form_Stz2 := TForm_Stz2.Create(Application);
  with Form_Stz2 do begin
    n_LastGetKdStZ := 0;
    bVuborMode := true;
    if nKdStZ > 0 then
      MyTVLocateKdStZ(nKdStZ)
    else if n_SvKdStZ > 0 then
      MyTVLocateKdStZ(n_SvKdStZ)
    else if cShStZ <> '' then
      MyTVLocateShStZ(cShStZ, n_ErrCode);
    if ShowModal = mrOk then begin
      nKdStZ := PTreeRec(TV.Selected.Data)^.KdStZ;
      n_LastGetKdStZ := nKdStZ;
      cShStZ := PTreeRec(TV.Selected.Data)^.ShStZ;
      cNmStZ := PTreeRec(TV.Selected.Data)^.NmStZ;
      Result := true;
    end;
    Free;
  end;
end;
(*
//------------------------------------------------------------------------------
function CheckStZ(var nKdStZ : integer; var cShStZ : string) : boolean;
var nErrCode : integer;
begin
  Result := false;
  // Не делаю Create, т.к. форма создается при входе в программу и
  // потом после ShowModal не делается Free
  with FormTStZ do begin
    bVuborMode   := true;
    b_WasUpdated := false;
    if MyTVLocateShStZ(cShStZ, nErrCode) then begin
      Result := true;
      nKdStZ := PTreeRec(TV.Selected.Data)^.KdStZ;
      cShStZ := PTreeRec(TV.Selected.Data)^.ShStZ; end
    else begin
      LabelPopMsg.Visible := false;
      if nErrCode = 1 then begin
        LabelNotFound.Visible := true;
        LabelIsSborny.Visible := false; end
      else if nErrCode = 2 then begin
        LabelNotFound.Visible := false;
        LabelIsSborny.Visible := true;
      end;
      LabelErr3.Visible := true;
      if ShowModal = mrOk then begin
        nKdStZ := PTreeRec(TV.Selected.Data)^.KdStZ;
        cShStZ := PTreeRec(TV.Selected.Data)^.ShStZ;
        Result := true;
      end;
    end;
    // Free не делать !!!
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TForm_Stz2.FormCreate(Sender: TObject);
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
procedure TForm_Stz2.FormClose(Sender: TObject; var Action: TCloseAction);
var nKdStZ : integer;
begin
  nKdStZ := PTreeRec(TV.Selected.Data)^.KdStZ;
  if bFlagDbg then
    dbgrStZ.Columns.SaveToFile(cDirVids + 'TvStZ.vid');
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
procedure TForm_Stz2.TvLoadFromTable;
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
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KdStZ + ' where KdStZ > 100 '+
            ' order by AIndx, Lvl, PIndx');
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
procedure TForm_Stz2.UpdLvlIndx;
var i, nKdStZ, nAIndx, nPIndx, nLvl, nIndx : SmallInt; cHsCh : string;
begin
  // Обновление в таблице Kd_StZ индексов, Level и HasChildren
  Form_Dm.DbMain.StartTransaction;
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
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
  Form_Dm.DbMain.Commit;
  qryTmp.UnPrepare;
  b_WasUpdated := true;
end;
*)
//------------------------------------------------------------------------------
procedure TForm_Stz2.Synchronize;
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
procedure TForm_Stz2.TVChange(Sender: TObject; Node: TTreeNode);
begin
  Synchronize;
end;
//------------------------------------------------------------------------------
function TForm_Stz2.MyTVLocateKdStZ(nKdStZ : integer) : boolean;
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
function TForm_Stz2.MyTVLocateShStZ(cShStZ : string;
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
(*
//------------------------------------------------------------------------------
function TForm_Stz2.MaxTreeId : integer;
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
    DataBaseName := CESMAIN;
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
*)
//------------------------------------------------------------------------------
procedure TForm_Stz2.popTreeVuborClick(Sender: TObject);
begin
  if bVuborMode and (TV.Selected <> nil) and
                          (not TV.Selected.HasChildren) then begin
    ModalResult := mrOk;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Stz2.popTreeFullExpandClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullExpand;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Stz2.popTreeFullCollapseClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullCollapse;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Stz2.TVDblClick(Sender: TObject);
begin
  if bVuborMode and (TV.Selected <> nil) and
                                 (not TV.Selected.HasChildren) then begin
    ModalResult := mrOk;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Stz2.sBtnPrtClick(Sender: TObject);
begin
  F6PrtTStZ(qryStZ);        {a_CmnPrt}
end;

end.
