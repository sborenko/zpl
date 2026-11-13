unit z_GetMG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ComCtrls, DB, Mask, DBCtrls,
  DBClient, Grids, DBGrids, DBTables, ExtCtrls, Menus;

type
  TFormGetMG = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    Label1: TLabel;
    edMes: TEdit;
    UpDownMes: TUpDown;
    edGod: TEdit;
    UpDownGod: TUpDown;
    bBtnOk: TBitBtn;
    qryVids: TQuery;
    dsrcVids: TDataSource;
    dbgrVids: TDBGrid;
    qryVidsNR: TIntegerField;
    qryVidsVIDN: TStringField;
    qryVidsOLDKDVIDN: TSmallintField;
    qryVidsSHVIDN: TStringField;
    qryVidsNMVIDN: TStringField;
    qryVidsAINDX: TSmallintField;
    qryVidsPINDX: TSmallintField;
    qryVidsLVL: TSmallintField;
    qryVidsINDX: TSmallintField;
    qryVidsHSCH: TStringField;
    qryVidsNDBE: TStringField;
    qryVidsNOSHOW: TStringField;
    qryVidsZP13: TStringField;
    qryVidsOTP: TStringField;
    qryVidsBLN: TStringField;
    qryVidsOTPUSKN: TStringField;
    qryVidsBOLNIC: TStringField;
    qryVidsSPRM: TStringField;
    qryVidsCPRM: TStringField;
    qryVidsSSRK: TStringField;
    qryVidsDETI: TStringField;
    qryVidsDETIM: TStringField;
    qryVidsDETIK: TStringField;
    qryVidsDETIG: TStringField;
    qryVidsIND: TStringField;
    qryVidsDHD: TStringField;
    qryVidsOKLFND: TStringField;
    qryVidsCBUDG: TStringField;
    qryVidsSNDB: TStringField;
    qryVidsSPDN: TStringField;
    qryVidsSPRF: TStringField;
    qryVidsSPENS: TStringField;
    qryVidsSALIM: TStringField;
    qryVidsCNDB: TStringField;
    qryVidsSSOCSTRAH: TStringField;
    qryVidsSBZR: TStringField;
    qryVidsLITTLEHLP: TStringField;
    qryVidsKDSPZ: TSmallintField;
    qryVidsOLDSZATR: TStringField;
    qryVidsSP_PF: TStringField;
    qryVidsSP_FSTVP: TStringField;
    qryVidsSP_FSNV: TStringField;
    qryVidsSP_FZ: TStringField;
    qryVidsSOVM: TStringField;
    qryVidsSPOV: TStringField;
    qryVidsKEKV: TStringField;
    qryVidsKDSCHDT: TSmallintField;
    qryVidsKDSCHKT: TSmallintField;
    sBtnF8: TSpeedButton;
    LbxF8: TListBox;
    pop: TPopupMenu;
    popUnSelAll: TMenuItem;
    popSelAll: TMenuItem;
    Panel2: TPanel;
    LabelCntSel: TLabel;
    LabelCntRec: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edMesEnter(Sender: TObject);
    procedure edMesExit(Sender: TObject);
    procedure sBtnF8Click(Sender: TObject);
    procedure dbgrVidsDblClick(Sender: TObject);
    procedure dbgrVidsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popSelAllClick(Sender: TObject);
    procedure popUnSelAllClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure dbgrVidsEnter(Sender: TObject);
    procedure dbgrVidsExit(Sender: TObject);
    procedure dbgrVidsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    n_SvMes, n_SvGod : SmallInt;
    procedure OpenQryVids;
  public
    { Public declarations }
  end;

function GetMesGodVids(var nMes, nGod : SmallInt;
                                             mLstVids : TStringList) : boolean;

const SECTION = 'z_GetMG';

var
  FormGetMG: TFormGetMG;

implementation

uses a_Const, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetMesGodVids(var nMes, nGod : SmallInt;
                                             mLstVids : TStringList) : boolean;
begin
  Result := false;
  FormGetMG := TFormGetMG.Create(Application);
  with FormGetMG do begin
    Caption := 'Выбор месяца, года и видов надбавок и доплат';
    if n_SvMes > 0 then
      UpDownMes.Position := n_SvMes
    else
      UpDownMes.Position := nMes;
    if n_SvGod > 0 then
      UpDownGod.Position := n_SvGod
    else
      UpDownGod.Position := nGod;
    LbxF8.Items.Assign(mLstVids);
    OpenQryVids;
    if LbxF8.Items.Count = 0 then
      LabelCntSel.Caption := 'Выделенных видов нет'
    else
      LabelCntSel.Caption := 'Выделено видов: ' + IntToStr(LbxF8.Items.Count);
    bBtnOk.Enabled := LbxF8.Items.Count > 0;
    if ShowModal = mrOk then begin
      mLstVids.Assign(LbxF8.Items);
      nMes := UpDownMes.Position;
      nGod := UpDownGod.Position;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.OpenQryVids;
begin
  with qryVids do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdVidN where (VidN >= "1400" and ' +
            ' VidN < "1500") or (VidN >= "1600" and VidN < "1700") or ' +
            ' (VidN in ("5000","5011","5012")) order by VidN');
    Open;
    LabelCntRec.Caption := '  Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 640);
    n_SvMes := ReadInteger(SECTION, 'nSvMes', 0);
    n_SvGod := ReadInteger(SECTION, 'nSvGod', 0);
    Free;
  end;
  if FileExists(cDirVids + 'GetMGV.vid') then
    dbgrVids.Columns.LoadFromFile(cDirVids + 'GetMGV.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVids.Columns.SaveToFile(cDirVids + 'GetMGV.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvMes', UpDownMes.Position);
    WriteInteger(SECTION, 'nSvGod', UpDownGod.Position);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.edMesEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.edMesExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.sBtnF8Click(Sender: TObject);
var i : SmallInt;
begin
  with qryVids do begin
    if not qryVidsHsCh.AsBoolean then begin
      i := LbxF8.Items.IndexOf(qryVidsVidN.AsString);
      if i < 0 then
        LbxF8.Items.Add(qryVidsVidN.AsString)
      else
        LbxF8.Items.Delete(i);
    end;
    if not Eof then
      Next
    else
      dbgrVids.Refresh;
  end;
  if LbxF8.Items.Count = 0 then
    LabelCntSel.Caption := 'Выделенных видов нет'
  else
    LabelCntSel.Caption := 'Выделено видов: ' + IntToStr(LbxF8.Items.Count);
  bBtnOk.Enabled := LbxF8.Items.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.dbgrVidsKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnF8.Click;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.dbgrVidsDblClick(Sender: TObject);
begin
  sBtnF8.Click;;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.dbgrVidsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrVids.Canvas do begin
    if LbxF8.Items.IndexOf(qryVidsVidN.AsString) >= 0 then
      Font.Color := clRed;
  end;
  dbgrVids.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.popSelAllClick(Sender: TObject);
var cSvVidN : ShortString;
begin
  LbxF8.Clear;
  with qryVids do begin
    cSvVidN := qryVidsVidN.AsString;
    DisableControls;
    First;
    while not Eof do begin
      if not qryVidsHsCh.AsBoolean then
        LbxF8.Items.Add(qryVidsVidN.AsString);
      Next;
    end;
    Locate('VidN', cSvVidn, []);
    EnableControls;
  end;
  LabelCntSel.Caption := 'Выделенно видов: ' + IntToStr(LbxF8.Items.Count);
  bBtnOk.Enabled := LbxF8.Items.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.popUnSelAllClick(Sender: TObject);
begin
  LbxF8.Clear;
  LabelCntSel.Caption := 'Выделенных видов нет';
  bBtnOk.Enabled := LbxF8.Items.Count > 0;
  dbgrVids.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.popPopup(Sender: TObject);
begin
  popUnSelAll.Enabled := LbxF8.Items.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.dbgrVidsEnter(Sender: TObject);
begin
  dbgrVids.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGetMG.dbgrVidsExit(Sender: TObject);
begin
  dbgrVids.FixedColor := clBtnFace;
end;

end.