unit z_ShwTem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, ExtCtrls, DBCtrls, DB, DBTables, Grids, DBGrids,
  StdCtrls, Buttons, Menus, ComCtrls, Mask;

type
  TFormShowTemu = class(TForm)
    qryTm: TQuery;
    dsrcTm: TDataSource;
    qryTmNR: TIntegerField;
    qryTmKDTEMU: TSmallintField;
    qryTmKDPSCH: TSmallintField;
    qryTmSCHBU: TStringField;
    qryTmSCH_17: TStringField;
    qryTmPSCH: TStringField;
    qryTmAINDX: TSmallintField;
    qryTmLVL: TSmallintField;
    qryTmPS_17: TStringField;
    qryTmNMSCH: TStringField;
    qryTmHSCH: TStringField;
    qryTmARC: TStringField;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    qryTmp: TQuery;
    popToArc: TMenuItem;
    popFromArc: TMenuItem;
    popSep: TMenuItem;
    popFindByKdTemu: TMenuItem;
    updTm: TUpdateSQL;
    qryTmSORT: TSmallintField;
    qryTmGRP: TSmallintField;
    PanelLeft: TPanel;
    Splitter1: TSplitter;
    qryGrp: TQuery;
    dsrcGrp: TDataSource;
    dbgrGrp: TDBGrid;
    qryGrpNR: TIntegerField;
    qryGrpKDTEMU: TSmallintField;
    qryGrpKDPSCH: TSmallintField;
    qryGrpSCHBU: TStringField;
    qryGrpSCH_17: TStringField;
    qryGrpPSCH: TStringField;
    qryGrpAINDX: TSmallintField;
    qryGrpLVL: TSmallintField;
    qryGrpPS_17: TStringField;
    qryGrpNMSCH: TStringField;
    qryGrpHSCH: TStringField;
    qryGrpARC: TStringField;
    qryGrpSORT: TSmallintField;
    qryGrpGRP: TSmallintField;
    PanelRight: TPanel;
    Panel1: TPanel;
    LabelCntRec: TLabel;
    DbNavTm: TDBNavigator;
    bBtnCancel: TBitBtn;
    bBtnOk: TBitBtn;
    dbgrTm: TDBGrid;
    qryGrpKDPSCH_UMC: TSmallintField;
    qryGrpPSCH_UMC: TStringField;
    qryGrpKDPSCH_ESV: TSmallintField;
    qryGrpPSCH_ESV: TStringField;
    qryGrpKDPSCH_KMD: TSmallintField;
    qryGrpPSCH_KMD: TStringField;
    qryTmKDPSCH_UMC: TSmallintField;
    qryTmPSCH_UMC: TStringField;
    qryTmKDPSCH_ESV: TSmallintField;
    qryTmPSCH_ESV: TStringField;
    qryTmKDPSCH_KMD: TSmallintField;
    qryTmPSCH_KMD: TStringField;
    PanelTemuDet: TPanel;
    dbeNmSch: TDBEdit;
    fbeKdTemu: TDBEdit;
    dbeKdSchZpl: TDBEdit;
    dbePsZpl: TDBEdit;
    dbeKdSchUmc: TDBEdit;
    dbePsUmc: TDBEdit;
    dbeKdSchKmd: TDBEdit;
    dbePsKmd: TDBEdit;
    dbeKdSchEsv: TDBEdit;
    dbePsEsv: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sbtnCloseTemuDet: TSpeedButton;
    popTemuDet: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrTmEnter(Sender: TObject);
    procedure dbgrTmExit(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure popToArcClick(Sender: TObject);
    procedure qryTmAfterPost(DataSet: TDataSet);
    procedure popFromArcClick(Sender: TObject);
    procedure dbgrTmDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrTmDblClick(Sender: TObject);
    procedure qryTmAfterOpen(DataSet: TDataSet);
    procedure qryTmBeforeClose(DataSet: TDataSet);
    procedure qryGrpAfterScroll(DataSet: TDataSet);
    procedure popEdtClick(Sender: TObject);
    procedure dbgrGrpDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popPopup(Sender: TObject);
    procedure popFindByKdTemuClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure qryTmAfterDelete(DataSet: TDataSet);
    procedure popTemuDetClick(Sender: TObject);
    procedure sbtnCloseTemuDetClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure qryTmNewRecord(DataSet: TDataSet);
    procedure qryTmBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    bVuborMode : boolean;
    n_KdTemu, n_SvKdTemu : Smallint;
    nCurKdSchZpl, nCurKdSchUmc, nCurKdSchKmd, nCurKdSchEsv : SmallInt;
    cCurPsZpl, cCurPsUmc, cCurPsKmd, cCurPsEsv : ShortString;
    procedure OpenQryGrp;
    procedure OpenQryTm;
    procedure SetPopStates;
    procedure OpenQryTmForCheck;
  public
    { Public declarations }
  end;

const SECTION ='z_ShwTem';

procedure ShwTemuNICH;

function GetTemu(var nKdTemu, nKdPSch : SmallInt;
                        var cNmTemu, cPSch : ShortString) : boolean;

function CheckKdTemu(nKdTemu : SmallInt; var nKdPSch : SmallInt;
                        var cNmTemu, cPSch : ShortString) : boolean;

var
  FormShowTemu: TFormShowTemu;

implementation

uses A_Const, a_Dm, Z_DM, Z_Main, Z_EATemu, z_FiTemu;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwTemuNICH;
begin
  FormShowTemu := TFormShowTemu.Create(Application);
  with FormShowTemu do begin
    bVuborMode := false;
    Caption := 'Темы  НИЧ';
    bBtnOk.Visible := false;
    pop.AutoPopup := true;
    OpenQryGrp;
    OpenQryTm;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetTemu(var nKdTemu, nKdPSch : SmallInt;
                        var cNmTemu, cPSch : ShortString) : boolean;
begin
  Result := false;
 FormShowTemu := TFormShowTemu.Create(Application);
  with FormShowTemu do begin
    n_KdTemu := nKdTemu;
    bVuborMode := true;
    Caption := 'Выбор темы  НИЧ';
    bBtnOk.Visible := true;
    pop.AutoPopup :=false;
    BBtnCancel.Caption := 'Отказ';
    dbgrTm.ReadOnly := true;
    OpenQryGrp;
    OpenQryTm;
    if ShowModal = mrOk then begin
      nKdTemu := qryTmKdTemu.AsInteger;
      nKdPSch := qryTmKdPSch.AsInteger;
      cNmTemu := qryTmNmSch.AsString;
      cPSch   := qryTmPS_17.AsString;
      Result := true;
    end;;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function CheckKdTemu(nKdTemu : SmallInt; var nKdPSch : SmallInt;
                        var cNmTemu, cPSch : ShortString) : boolean;
begin
  Result := false;
 FormShowTemu := TFormShowTemu.Create(Application);
  with FormShowTemu do begin
    OpenQryTmForCheck;
    if qryTm.Locate('KdTemu',nKdTemu, []) then begin
      nKdPSch := qryTmKdPSch.AsInteger;
      cNmTemu := qryTmNmSch.AsString;
      cPSch   := qryTmPS_17.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.OpenQryTmForCheck;
begin
  with qryTm do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;                                   //41,43 on future
    SQL.Add('Select * from Kd_Temu where Grp in (11,13,21,23,31,33,41,43)');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.OpenQryGrp;
begin
  with qryGrp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_Temu ' +
            ' where Grp in (10,20,30,40,50,60,70,80,90,' +
                           '12,22,32,42,52,62,72,82,92) ' +
            ' order by Grp');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.OpenQryTm;
begin
  with qryTm do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcGrp;
    SQL.Add('Select * from Kd_Temu ' +
            ' where GRP = :nGrp ' +
            ' order by AIndx');
    ParamByName('nGrp').AsInteger := qryGrpGRP.AsInteger + 1;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.qryTmAfterOpen(DataSet: TDataSet);
begin
   if bVuborMode and (n_KdTemu > 0) then
     qryTm.Locate('KdTemu', n_KdTemu, [])
   else if (n_SvKdTemu > 0) then
     qryTm.Locate('KdTemu', n_SvKdTemu, []);
    LabelCntRec.Caption := 'Записей: ' + IntToStr(qryTm.RecordCount);
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
   Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 850);
    PanelLeft.Width := ReadInteger(SECTION, 'PnlLeftW', 260);
    n_SvKdTemu := ReadInteger(SECTION, 'n_SvKdTemu', 0);
    Free;
  end;
  if FileExists(cDirVids + 'TmGrp03.vid') then
    dbgrGrp.Columns.LoadFromFile(cDirVids + 'TmGrp03.vid');
  if FileExists(cDirVids + 'TmTem03.vid') then
    dbgrTm.Columns.LoadFromFile(cDirVids + 'TmTem03.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  dbgrGrp.Columns.SaveToFile(cDirVids + 'TmGrp03.vid');
  dbgrTm.Columns.SaveToFile(cDirVids + 'TmTem03.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'PnlLeftW', PanelLeft.Width);
    WriteInteger(SECTION, 'n_SvKdTemu', n_SvKdTemu);
                                          // qryTmKdTemu.AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.dbgrTmEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow; ;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.dbgrTmExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace; ;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.popDelClick(Sender: TObject);
var bCanDelete : boolean; nKdTemu : SmallInt;
begin
  nKdTemu := qryTmKdTemu.AsInteger;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from z_NU where KdTemu = :nKdTemu');
    ParamByName('nKdTemu').AsInteger := nKdTemu;
    Open;
    bCanDelete := RecordCount = 0;
    if not bCanDelete then
      ShowMessage('Запись удалять нельзя - на неё есть ccылка в таблице "Z_NU".')
    else begin
      Close;
      SQL.Clear;
      SQL.Add('Select first 1 * from u_Book where KdTemuSR = :nKdTemu');
      ParamByName('nKdTemu').AsInteger := nKdTemu;
      Open;
      bCanDelete := RecordCount = 0;
      if not bCanDelete then
        ShowMessage('Запись удалять нельзя - на неё есть ccылка ' +
                    'в таблице "U_BOOK".')
      else begin
        Close;
        SQL.Clear;
        SQL.Add('Select first 1 * from k_Opl where KdTemu = :nKdTemu');
        ParamByName('nKdTemu').AsInteger := nKdTemu;
        Open;
        bCanDelete := RecordCount = 0;
        if not bCanDelete then
          ShowMessage('Запись удалять нельзя - на неё есть ccылка ' +
                      'в таблице "K_OPL".');  end;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
  end;
  if bCanDelete and (MessageDlg('Запись удаляется безвозвратно. Соогласны?:',
                   MtConfirmation, [mbYes, mbNo], 0) = mrYes)  then
    qryTm.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.popPopup(Sender: TObject);
begin
  SetPopStates;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.SetPopStates;
var nMod : double; nGrp : SmallInt;
begin
  nGrp := qryGrpGRP.AsInteger;
  nMod := nGrp mod 10;
  popToArc.Enabled := nMod = 0;
  popFromArc.Enabled := nMod = 2;
  popAdd.Enabled := nMod = 0;


end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.qryTmAfterPost(DataSet: TDataSet);
begin
  if qryTm.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryTm]);
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.qryTmAfterDelete(DataSet: TDataSet);
begin
  if qryTm.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryTm]);
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.popToArcClick(Sender: TObject);
begin
  with qryTm do begin
    DisableControls;
    Edit;        // Спрятать в АРХИВ = увеличить группу на 2 (с 11 на 13,
    qryTmGrp.AsInteger := qryTmGrp.AsInteger + 2; //  с 21 на 23, с 321 на 33)
    Post;
    Next;
    n_SvKdTemu := qryTmKdTemu.AsInteger;
    Close;
    Open;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.popFromArcClick(Sender: TObject);
begin
  with qryTm do begin
    DisableControls;
    Edit;      // Вынуть из АРХИВА = уменьшить группу на 2 (с 13 на 11,
    qryTmGrp.AsInteger := qryTmGrp.AsInteger - 2; // с 23 на 21,с 33 на 31)
    Post;
    Next;
    n_SvKdTemu := qryTmKdTemu.AsInteger;
    Close;
    Open;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.dbgrGrpDrawColumnCell(Sender: TObject;
                       const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var nMod : double; nGrp : SmallInt;
begin
  nGrp := qryGrpGRP.AsInteger;
  nMod := nGrp mod 10;
  with dbgrGrp.Canvas do begin
    if not (gdFocused in State) then begin
     if nMod = 2 then  // значит группа "архивная"  (12, 22, 32
        Brush.Color := clBtnFace;
    end;
  end;
  dbgrGrp.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.dbgrTmDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
(*
  with dbgrTm.Canvas do begin
    if not (gdFocused in State) then begin
      if qryTm.FieldByName('Lvl').AsInteger < 5 then
        Brush.Color := clFuchsia;
    end;
  end;
  dbgrTm.DefaultDrawColumnCell(Rect, DataCol, Column, State);
*)
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.dbgrTmDblClick(Sender: TObject);
begin
  if bVuborMode then
     ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.qryTmBeforeClose(DataSet: TDataSet);
begin
  n_SvKdTemu := qryTmKdTemu.AsInteger;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.qryGrpAfterScroll(DataSet: TDataSet);
var nMod : double; nGrp : SmallInt;
begin
  nGrp := qryGrpGRP.AsInteger;
  nMod := nGrp mod 10;
  if nMod = 2 then
    dbgrTm.Color := clSilver
  else
    dbgrTm.Color := clMoneyGreen;
   OpenQryTm;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.popFindByKdTemuClick(Sender: TObject);
var nKdTemuGrp, nKdTemuPgr :SmallInt;  // cMsg : ShortString;
begin
  if ZFiTemu(nKdTemuGrp, nKdTemuPgr) {z_FiTemu} then begin
    if qryGrp.Locate('KdTemu', nKdTemuGrp, []) then
      qryTm.Locate('KdTemu', nKdTemuPgr, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.popEdtClick(Sender: TObject);
begin
  with qryTm do begin
    Edit;
    if EATemu {z_EATEMU} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  with qryTm do begin
    nSvNR := qryTmNR.AsInteger;
    Append;
    qryTmGrp.AsInteger    := qryGrpGrp.AsInteger + 1;
    qryTmKdPSch.AsInteger := qryGrpKdTemu.AsInteger;
    qryTmPS_17.AsString   :=  qryGrpSch_17.AsString;
    if EATemu {z_EATEMU} then begin
      qryTmAIndx.AsInteger  := Form_Dm.NewTemuAIndx; // нужно для сортировки
      qryTmNr.AsInteger     := Form_Dm.GetNewTemuNr;
      qryTmKdTemu.AsInteger := Form_Dm.GetNewKdTemu;
      Post; end
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.popTemuDetClick(Sender: TObject);
begin
  popTemuDet.Checked := not popTemuDet.Checked;
  PanelTemuDet.Visible := popTemuDet.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.sbtnCloseTemuDetClick(Sender: TObject);
begin
  PanelTemuDet.Visible := false;
  popTemuDet.Checked := false;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.FormResize(Sender: TObject);
begin
//  PanelTemuDet.Top := Round((Height - PanelTemuDet.Height)/2) + 165;
//  PanelTemuDet.Left := Round((Width - PanelTemuDet.Width)/2) - 120;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.qryTmBeforeInsert(DataSet: TDataSet);
begin

    nCurKdSchZpl := dbeKdSchZpl.Field.AsInteger;
    nCurKdSchUmc := dbeKdSchUmc.Field.AsInteger;
    nCurKdSchKmd := dbeKdSchKmd.Field.AsInteger;
    nCurKdSchEsv := dbeKdSchEsv.Field.AsInteger;
    cCurPsZpl    := dbePsZpl.Field.AsString;
    cCurPsUmc    := dbePsUmc.Field.AsString;
    cCurPsKmd    := dbePsKmd.Field.AsString;
    cCurPsEsv    := dbePsEsv.Field.AsString;
end;
//------------------------------------------------------------------------------
procedure TFormShowTemu.qryTmNewRecord(DataSet: TDataSet);
begin
  qryTmKDPSCH.AsInteger     := nCurKdSchZpl;
  qryTmKDPSCH_UMC.AsInteger := nCurKdSchUmc;
  qryTmKDPSCH_Kmd.AsInteger := nCurKdSchKmd;
  qryTmKDPSCH_Esv.AsInteger := nCurKdSchEsv;
  qryTmPS_17.AsString       := cCurPsZpl;
  qryTmPSCH_UMC.AsString    := cCurPsUmc;
  qryTmPSCH_KMD.AsString    := cCurPsKmd;
  qryTmPSCH_ESV.AsString    := cCurPsEsv;
end;

end.
