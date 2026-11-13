unit a_Sbu2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IniFiles, Grids, DBGrids, Db, DBTables, StdCtrls,
  Math, Menus, Buttons, ExtCtrls, DBClient;

type

  String15 = string[15];

  PTreeRec = ^TTreeRec;
  TTreeRec = record
    KdSBU  : SmallInt;
    SchBU  : String15;
    KdPSch : SmallInt;
    PSch   : String15;
    Sch_17 : String15;
    PS_17  : String15;
    NmSBU  : ShortString;
  end;

  TForm_Sbu2 = class(TForm)
    qryTmp: TQuery;
    popTree: TPopupMenu;
    popTreeFullExpand: TMenuItem;
    popTreeFullCollapse: TMenuItem;
    popTreeExit: TMenuItem;
    LabelPopMsg: TLabel;
    LabelNotFound: TLabel;
    LabelIsSborny: TLabel;
    LabelErr3: TLabel;
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Panel2: TPanel;
    TV: TTreeView;
    qrySbu: TQuery;
    dsrcSbu: TDataSource;
    dbgrSBU: TDBGrid;
    SplitterSbu: TSplitter;
    qryXXX: TQuery;
    sBtnPrt: TSpeedButton;
    qrySbuNR: TIntegerField;
    qrySbuKDSCH: TSmallintField;
    qrySbuKDPSCH: TSmallintField;
    qrySbuSCHBU: TStringField;
    qrySbuSCH_17: TStringField;
    qrySbuPSCH: TStringField;
    qrySbuAINDX: TSmallintField;
    qrySbuLVL: TSmallintField;
    qrySbuPS_17: TStringField;
    qrySbuNMSCH: TStringField;
    qrySbuPINDX: TSmallintField;
    qrySbuINDX: TSmallintField;
    qrySbuHSCH: TStringField;
    qrySbuDOPPRIZN: TSmallintField;
    qrySbuOLDSCHET: TStringField;
    qrySbuNR_GORD: TStringField;
    qrySbuARC: TStringField;
    cdsSvSch: TClientDataSet;
    cdsSvSchKdSch: TSmallintField;
    cdsSvSchSchBU: TStringField;
    cdsSvSchPSch: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVDblClick(Sender: TObject);
    procedure TVKeyDown(Sender: TObject; var Key: Word;
                                                 Shift: TShiftState);
    procedure popTreeFullExpandClick(Sender: TObject);
    procedure popTreeFullCollapseClick(Sender: TObject);
    procedure popTreeExitClick(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure FormHide(Sender: TObject);
    procedure TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
                            State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure sBtnPSCHClick(Sender: TObject);
    procedure bBtnOkClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure popTreeChngNmTemuClick(Sender: TObject);
  private
    { Private declarations }
    b_FormSbuReady : boolean;
    m_LstSbu : TStringList;
    bTvReady, b_WasUpdated, bVuborMode, bNaborMode : boolean;
    n_SvKdSbu : integer;
    procedure TvLoadFromTable;
    function MyTVLocateKdSBU(nKdSBu : integer) : boolean;
    function MyTVLocateSchBU(cSchBU : string; var nErrCode : integer) : boolean;
    procedure Synchronize;
    function Get_PSch(nAIndx, nLvl, nPIndx : SmallInt) : ShortString;
  public
    { Public declarations }
  end;

procedure Show_Sbu;
function Get_SBU(var nKdSBU : integer; var cSchBU, cPSch, cNmSBU : ShortString;
                                                 var bHsCh : boolean) : boolean;
//function Check_SBU(var nKdSBU : integer; var cSchBU, cPSch : string;
//                                                var bHsCh : boolean) : boolean;

const SECTION = 'a_Sbu2';

var
  Form_Sbu2: TForm_Sbu2;

implementation

uses a_Const, s_DM, a_Lib, a_CmnPrt;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure Show_Sbu;
var nKdSchDbg : SmallInt;
begin
  Form_Sbu2 := TForm_Sbu2.Create(Application);
  with Form_Sbu2 do begin
    bVuborMode := false;
    bNaborMode := false;
    b_WasUpdated := false;
    popTree.AutoPopup := true;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Закрыть';
    sBtnPrt.Visible := true;
    if cdsSvSch.Active and (cdsSvSch.RecordCount > 0) then
                                                 with cdsSvSch do begin
      First;
      while not Eof do begin
        nKdSchDbg := cdsSvSchKdSch.AsInteger;
        MyTVLocateKdSBU(nKdSchDbg);
        Next;
      end;
    end;
{
    if n_SvKdSBU > 0 then
      MyTVLocateKdSBU(n_SvKdSBU)
    else
      TV.Items[0].Selected := true;
}
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function Get_SBU(var nKdSBU : integer; var cSchBU, cPSch, cNmSBU : ShortString;
                                                 var bHsCh : boolean) : boolean;
var n_ErrCode : integer;
begin
  Result := false;
  Form_Sbu2 := TForm_Sbu2.Create(Application);
  with Form_Sbu2 do begin
    bVuborMode := true;
    bNaborMode := false;
    b_WasUpdated := false;
    bBtnOk.Visible := true;
    sBtnPrt.Visible := false;
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



    if ShowModal = mrOk then begin
      bHsCh := TV.Selected.HasChildren;
      nKdSBU := PTreeRec(TV.Selected.Data)^.KdSBU;
      cSchBU := PTreeRec(TV.Selected.Data)^.SchBU;
      cPSch  := PTreeRec(TV.Selected.Data)^.PSch;
      cNmSBU := PTreeRec(TV.Selected.Data)^.NmSBU;
      bHsCh  := TV.Selected.HasChildren;
      Result := true;
    end;
    Free;
  end;
end;
(*
//------------------------------------------------------------------------------
function CheckSBU(var nKdSBU : integer; var cSchBU, cPSch : string;
                                                var bHsCh : boolean) : boolean;
var nErrCode : integer;
begin
  Result := false;
  // Не делаю Create, т.к. форма создается при входе в программу и
  // потом после ShowModal не делается Free
  with FormTSbu do begin
    bVuborMode := true;
    bNaborMode := false;
    b_WasUpdated := false;
    popTree.AutoPopup := true;
    LabelMsg.Visible := false;
    sBtnSelCurrent.Visible := false;
    sBtnSelAll.Visible := false;
    sBtnUnSelAll.Visible := false;
    sBtnPrt.Visible := false;
    if MyTVLocateSchBU(cSchBu, nErrCode) then begin
      // Выйти, не показывая форму
      Result  := true;
      nKdSBU := PTreeRec(TV.Selected.Data)^.KdSBU;
      cPSch  := PTreeRec(TV.Selected.Data)^.PSch;
      cSchBU := PTreeRec(TV.Selected.Data)^.SchBU;
      bHsCh  := TV.Selected.HasChildren; end
    else begin
      // Показать форму для выбора "правильного" счета
      LabelPopMsg.Visible := false;
      if nErrCode = 1 then begin
        LabelNotFound.Visible := true;
        LabelIsSborny.Visible := false; end
      else if nErrCode = 2 then begin
        LabelNotFound.Visible := false;
        LabelIsSborny.Visible := true;
      end;
      LabelErr3.Visible := true;
      if bLocalIni then begin
        with TIniFile.Create(cLNmIniFile) do begin
          Top    := ReadInteger(SECTION, 'wT', 100);
          Left   := ReadInteger(SECTION, 'wL', 100);
          Height := ReadInteger(SECTION, 'wH', 450);
          Width  := ReadInteger(SECTION, 'wW', 450);
          if bFlagDbg then
            dbgrSBU.Height := ReadInteger(SECTION, 'GrdSbuH', 120);
          n_SvKdSbu := ReadInteger(SECTION, 'nSvKdSbu', 0);
          Free;
        end; end
      else begin
        with TIniFile.Create(cNmIniFile) do begin
          Top    := ReadInteger(SECTION, 'wT', 100);
          Left   := ReadInteger(SECTION, 'wL', 100);
          Height := ReadInteger(SECTION, 'wH', 450);
          Width  := ReadInteger(SECTION, 'wW', 450);
          if bFlagDbg then
            dbgrSBU.Height := ReadInteger(SECTION, 'GrdSbuH', 120);
          n_SvKdSbu := ReadInteger(SECTION, 'nSvKdSbu', 0);
          Free;
        end;
      end;
      PanelNabor.Visible := false;
      Constraints.MaxWidth := 465;
      Constraints.MinWidth := 400;
      if ShowModal = mrOk then begin
        nKdSBU  := PTreeRec(TV.Selected.Data)^.KdSBU;
        cPSch   := PTreeRec(TV.Selected.Data)^.PSch;
        cSchBU  := PTreeRec(TV.Selected.Data)^.SchBU;
        bHsCh   := TV.Selected.HasChildren;
        Result  := true;
      end;
      nKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
      if bLocalIni then begin
        with TIniFile.Create(cLNmIniFile) do begin
          WriteInteger(SECTION, 'wT', Top);
          WriteInteger(SECTION, 'wL', Left);
          WriteInteger(SECTION, 'wH', Height);
          WriteInteger(SECTION, 'wW', Width);
          WriteInteger(SECTION, 'nSvKdSbu', nKdSbu);
          if bFlagDbg then
            WriteInteger(SECTION, 'GrdSbuH', dbgrSBU.Height);
          Free;
        end; end
      else begin
        with TIniFile.Create(cNmIniFile) do begin
          WriteInteger(SECTION, 'wT', Top);
          WriteInteger(SECTION, 'wL', Left);
          WriteInteger(SECTION, 'wH', Height);
          WriteInteger(SECTION, 'wW', Width);
          WriteInteger(SECTION, 'nSvKdSbu', nKdSbu);
          if bFlagDbg then
            WriteInteger(SECTION, 'GrdSbuH', dbgrSBU.Height);
          Free;
        end;
      end;
    end;
    // Free не делать !!!
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TForm_Sbu2.TvLoadFromTable;
// Создать файл cNmTV1 по записям таблицы Kd_SBU и загрузить его
// в дерево (так проще всего). Заполнить связанные объекты
var F1 : TextFile;
    cNmTv1, cMsg : string;
    i : integer;
    MyTreeRec : PTreeRec;
    cSchBU, cSch_17, cNmSch : ShortString;
begin
  bTvReady := false;
  cNmTv1 := 'Sbu.tv1';
  AssignFile(F1, cDirTemp + cNmTV1);
  Rewrite(F1);
  with qrySbu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_SBU order by AIndx, Lvl, PIndx');
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
    if FileExists(cDirTemp + cNmTV1) then
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
(*


    i := 0;
    while not Eof do begin
      New(MyTreeRec);
      MyTreeRec.KdSbu := FieldByName('KdSch').AsInteger;
      MyTreeRec.SchBU := Trim(FieldByName('SchBU').AsString);
      MyTreeRec.PSch  := FieldByName('PSch').AsString;
      MyTreeRec.NmSBU := Trim(FieldByName('NmSch').AsString);
      TV.Items[i].Data := MyTreeRec;
      Inc(i);
      Next;
    end;       // qrySbu не закрываю - полезен при bFlagDbg
  end;
*)
  bTvReady := true;
  TV.Items[0].Selected := true;
  qrySbu.First;
end;
//------------------------------------------------------------------------------
function TForm_Sbu2.MyTVLocateKdSBU(nKdSBU : integer) : boolean;
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
function TForm_Sbu2.MyTVLocateSchBU(cSchBU : string;
                                    var nErrCode : integer) : boolean;
var i : integer;
begin
  Result := false;
  nErrCode := 1;                    // Not Found
  with TV do for i := 0 to Items.Count - 1 do begin
    if PTreeRec(Items[i].Data)^.SchBU = cSchBU then begin
      if Items[i].HasChildren then begin
        nErrCode := 2;              // IsSborny
        Items[i].Selected := true;  // Чтобы показать именно введенный счет
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
procedure TForm_Sbu2.FormCreate(Sender: TObject);
//var i : SmallInt;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Top    := ReadInteger(SECTION, 'wT', 100);
    Left   := ReadInteger(SECTION, 'wL', 100);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 450);
    if bFlagDbg then
      dbgrSBU.Height := ReadInteger(SECTION, 'GrdSbuH', 120);
    Free;
  end;
  if FileExists(cDirVids + 'T_Sbu01.vid') then
    dbgrSbu.Columns.LoadFromFile(cDirVids + 'T_Sbu01.vid');
  SplitterSBU.Visible := bFlagDbg;
  dbgrSbu.Visible := bFlagDbg;
  b_FormSbuReady := false;
  with cdsSvSch do begin
    if FileExists(cDirVids + 'SvSch.cds') then begin
      LoadFromFile(cDirVids + 'SvSch.cds');
      //i := RecordCount;
      First;
     // while  (RecordCount > 5) do begin
     //   Delete;
     // end;
              end
    else begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
  end;
  bTvReady := false;
  //--------------
  TvLoadFromTable;
  //--------------
  Caption := 'План счетов бухгалтерского учета (СБУ)';
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.FormClose(Sender: TObject; var Action: TCloseAction);
var i, k, nKdSbu : SmallInt;
    cSchBU, cPSch, cTmpNmIniFile : ShortString;
    bHsCh : boolean;
begin
  if bFlagDbg then
    dbgrSbu.Columns.SaveToFile(cDirVids + 'T_Sbu01.vid');
  n_SvKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;


   if (TV.Selected <> nil) then begin
    nKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
    cSchBU := PTreeRec(TV.Selected.Data)^.SchBU;
    cPsch  := PTreeRec(TV.Selected.Data)^.PSch;
    bHsCh   := TV.Selected.HasChildren;
//    if not bHsCh and not cdsSvSch.Locate('PSch', cPSch, []) then
//                                                          with cdsSvSch do begin
    if not cdsSvSch.Locate('KdSch', nKdSbu, []) then with cdsSvSch do begin
      Append;
      cdsSvSchKdSch.AsInteger := nKdSbu;
      cdsSvSchSchBU.AsString  := cSchBU;
      cdsSvSchPSch.AsString   := cPSch;
      Post;
    end;
  end;



  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvKdSbu', n_SvKdSbu);
    if bFlagDbg then
      WriteInteger(SECTION, 'GrdSbuH', dbgrSBU.Height);
    Free;
  end;
  if cdsSvSch.Active and (cdsSvSch.RecordCount > 0) then with cdsSvSch do begin
     k := RecordCount;
     i := 0;
     First;
     while i < (k-5) do begin
       Inc(i);
       Delete;
     end;
    cdsSvSch.SaveToFile(cDirVids + 'SvSch.cds');
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.Synchronize;
var nKdSbu : integer;
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
procedure TForm_Sbu2.TVChange(Sender: TObject; Node: TTreeNode);
begin
  Synchronize;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.TVDblClick(Sender: TObject);
begin
  if bVuborMode and (TV.Selected <> nil) and
                          (not TV.Selected.HasChildren) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.TVKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
begin
  if bVuborMode and (Shift = [ssCtrl]) and (Key = VK_RETURN) and
                (TV.Selected <> nil) and not TV.Selected.HasChildren then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.popTreeFullExpandClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullExpand;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.popTreeFullCollapseClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullCollapse;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.popTreeExitClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.FormHide(Sender: TObject);
begin
  n_SvKdSbu := PTreeRec(TV.Selected.Data)^.KdSbu;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.TVCustomDrawItem(Sender: TCustomTreeView;
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
procedure TForm_Sbu2.sBtnPSCHClick(Sender: TObject);
var nAIndx, nLvl, nPIndx, nKdSch : integer; cPSCH : ShortString;
begin
  with qryXXX do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Kd_SBU set PSCH = :cPSch where KdSch = :nKdSch');
    Prepare;
  end;
  with qrySbu do begin
    First;
    while not Eof do begin
      nKdSch := FieldByName('KdSch').AsInteger;
      nAIndx := FieldByName('AIndx').AsInteger;
      nLvl   := FieldByName('Lvl').AsInteger; // + 1;
      nPIndx := FieldByName('PIndx').AsInteger;
      // это все текущего KdSch. Определяю его PSch
      cPSCH  := Get_PSch(nAIndx, nLvl, nPIndx);
      qryXXX.ParamByName('cPSCH').AsString := cPSch;
      qryXXX.ParamByName('nKdSch').AsInteger := nKdSch;
      qryXXX.ExecSQL;
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
function TForm_Sbu2.Get_PSch(nAIndx, nLvl, nPIndx : SmallInt) : ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 AIndx, KdSch, SchBU from Kd_Sbu ' +
            ' where AIndx < :nAIndx and ' +
            ' Lvl = :nLvl and Indx = :nIndx order by AIndx desc');
    ParamByName('nLvl').AsInteger := nLvl - 1; // Папа на один уровень выше
    ParamByName('nAIndx').AsInteger := nAIndx; // AIndx у папы <, чем у дитя
    ParamByName('nIndx').AsInteger := nPIndx;  // Indx у папы, как у дитя PIndx
    Open;    // т.к. Select First 1 и order by AIndx desc, выхожу точно на папу,
    if RecordCount > 0 then            // если он есть. Не подводило ни разу !!!
      Result := FieldByName('SchBU').AsString;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.bBtnOkClick(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.sBtnPrtClick(Sender: TObject);
begin
  F6PrtTSbu(qrySbu); {a_CmnPrt}
end;
(*
//------------------------------------------------------------------------------
procedure TForm_Sbu2.popTreeSaveToTableClick(Sender: TObject);
begin
//  TvSaveToTable;   Сохранено ниже на всякий случай !!!!
end;
*)
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
    SQL.Add('Insert into Kd_SBU ' +
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
procedure TForm_Sbu2.SpeedButton1Click(Sender: TObject);
begin
//  if SbuAdd {a_SbuAdd} then;
end;
//------------------------------------------------------------------------------
procedure TForm_Sbu2.popTreeChngNmTemuClick(Sender: TObject);
begin
//  if SbuAdd {a_SbuAdd} then;
end;

end.
