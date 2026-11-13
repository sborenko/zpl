unit a_Usrs2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, IniFiles, Menus, ExtCtrls,
  Buttons, StdCtrls, ComCtrls;

type
  TForm_UsersNew = class(TForm)
    qryUsers: TQuery;
    dsrcUsers: TDataSource;
    qryUsersNR: TAutoIncField;
    qryUsersNmUsr: TStringField;
    qryUsersKdKatUsr: TSmallintField;
    qryUsersPswUsr: TStringField;
    qryUsersVkl: TStringField;
    qryUsersNotes: TStringField;
    qryUsersKdUsr: TSmallintField;
    updUsers: TUpdateSQL;
    qryTmp: TQuery;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    popHead: TMenuItem;
    qryUsersKDSPS: TSmallintField;
    qryUsersINCLZPLSPZ: TStringField;
    PageControlUsrs: TPageControl;
    ts1: TTabSheet;
    dbgrUsers: TDBGrid;
    ts2: TTabSheet;
    Panel1: TPanel;
    bBtnCancel1: TBitBtn;
    sBtnForw1: TSpeedButton;
    Panel2: TPanel;
    sBtnBack2: TSpeedButton;
    bBtnCancel2: TBitBtn;
    qryUsrCmp: TQuery;
    dsrcUsrCmp: TDataSource;
    updUsrCmp: TUpdateSQL;
    dbgrUsrCmp: TDBGrid;
    PageControlCmp: TPageControl;
    tsBnkPdr: TTabSheet;
    Splitter1: TSplitter;
    qryUsrCmpNR: TIntegerField;
    qryUsrCmpKDUSR: TSmallintField;
    qryUsrCmpNMCMP: TStringField;
    qryUsrCmpLVL: TSmallintField;
    qryUsrCmpNOTES: TStringField;
    LabelNmUsr: TLabel;
    tsZero: TTabSheet;
    qryBPdr: TQuery;
    dbgrBPdr: TDBGrid;
    dsrcBPdr: TDataSource;
    updBPdr: TUpdateSQL;
    qryBPdrNR: TIntegerField;
    qryBPdrKDPDR: TSmallintField;
    qryBPdrNMWHO: TStringField;
    qryBPdrKDSBU: TSmallintField;
    qryBPdrSCHBU: TStringField;
    qryBPdrKDVALPDR: TSmallintField;
    qryBPdrNMVALSOKR: TStringField;
    qryBPdrRSCH: TStringField;
    tsZplSps: TTabSheet;
    qryUsrZplSps: TQuery;
    dsrcUsrZplSps: TDataSource;
    updUsrZplSps: TUpdateSQL;
    dbgrUsrZplSps: TDBGrid;
    qryUsrZplSpsNR: TIntegerField;
    qryUsrZplSpsKDUSR: TSmallintField;
    qryUsrZplSpsKDSPS: TSmallintField;
    qryUsrZplSpsNOTES: TStringField;
    qryUsrZplSpsSHSPS: TStringField;
    qryUsrZplSpsNMSPS: TStringField;
    qryUsrZplSpsNOTES_1: TStringField;
    popCreKdObjLst: TMenuItem;
    tsPstSBU: TTabSheet;
    qryPstSbu: TQuery;
    dsrcPstSbu: TDataSource;
    updPstSbu: TUpdateSQL;
    dbgrPstSbu: TDBGrid;
    qryPstSbuKDSCH: TSmallintField;
    qryPstSbuSCHBU: TStringField;
    qryPstSbuNMSCH: TStringField;
    qryPstSbuNR: TIntegerField;
    qryPstSbuKDUSR: TSmallintField;
    qryPstSbuKDSBU: TSmallintField;
    qryPstSbuNOTES: TStringField;
    tsStG: TTabSheet;
    qryUsrOb: TQuery;
    dsrcUsrOb: TDataSource;
    updUsrOb: TUpdateSQL;
    dbgrUsrOb: TDBGrid;
    qryUsrObNR: TIntegerField;
    qryUsrObKDUSR: TSmallintField;
    qryUsrObKDOB: TSmallintField;
    qryUsrObNMOB: TStringField;
    popUsrObLst: TMenuItem;
    LabelMsg: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryUsersAfterPost(DataSet: TDataSet);
    procedure qryUsersBeforePost(DataSet: TDataSet);
    procedure dbgrUsersDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popEdtClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure dbgrUsersDblClick(Sender: TObject);
    procedure dsrcUsersDataChange(Sender: TObject; Field: TField);
    procedure sBtnForw1Click(Sender: TObject);
    procedure sBtnBack2Click(Sender: TObject);
    procedure dsrcUsrCmpDataChange(Sender: TObject; Field: TField);
    procedure sBtnBack3Click(Sender: TObject);
    procedure UsrAddZplSpzWithCheck(nKdUsr, nKdSpZ : SmallInt; bHsCh : boolean);
    procedure UsrAddBnkPdrWithCheck(nKdUsr, nKdPdr : SmallInt);
    procedure UsrAddCmpWithCheck(nKdUsr : SmallInt; cShCmp : ShortString);
    procedure dbgrUsrSpZDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryUsrZplSpsAfterPost(DataSet: TDataSet);
    procedure qryUsrZplSpsAfterDelete(DataSet: TDataSet);
    procedure popCreKdObjLstClick(Sender: TObject);
    procedure qryPstSbuNewRecord(DataSet: TDataSet);
    procedure qryPstSbuSCHBUValidate(Sender: TField);
    procedure popUsrObLstClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
  private
    { Private declarations }
    bVuborMode : boolean;
    procedure OpenQryUsers;
    procedure OpenQryUsrZplSps;
    procedure OpenQryUsrBnkPdr;
    procedure OpenQryUsrPstSbu;
    procedure OpenQryUsrOb;
    procedure OpenQryUsrCmp;
    procedure SetFormCaption;
  public
    { Public declarations }
    function NewKdUsr : integer;
    procedure QryUsrObAdd(nKdUsr, nKdOb : SmallInt; cNmOb : ShortString);
    procedure QryUsrObDel(nKdUsr, nKdOb : SmallInt);
  end;

procedure ShowUsersNew;

const SECTION = 'a_Usrs2';

var
  Form_UsersNew: TForm_UsersNew;

implementation

uses a_Const, A_Dm, a_EUsrs, A_SBU, a_PCmp, a_EUsrCm, a_UsrZpl,
                    a_ZUObj, a_BnkPdr, a_LstOb;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowUsersNew;
begin
  Form_UsersNew := TForm_UsersNew.Create(Application);
  with Form_UsersNew do begin
    bVuborMode := false;
    OpenQryUsers;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.OpenQryUsers;
begin
  with qryUsers do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Usrs where KdUsr > 0 order by KdUsr');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.OpenQryUsrCmp;
begin
  with qryUsrCmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUsers;
    SQL.Add('Select * from zz_UsrCmp ' +
            ' where KdUsr = :KdUsr order by NmCmp');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.OpenQryUsrZplSps;
begin
  with qryUsrZplSps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUsers;
    SQL.Add('Select us.*, s.ShSps, s.NmSps, s.Notes from zz_UsrKdSps us ' +
            ' Left outer join z_KdSps s on s.KdSps = us.KdSps ' +
            ' where us.KdUsr = :KdUsr order by us.KdUsr, us.KdSps ');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.OpenQryUsrBnkPdr;
begin
  with qryBPdr do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUsers;
    SQL.Add('Select bp.NR, bp.KdPdr, w.NmWho, w.KdSbu, s.SchBU, ' +
            ' w.KdValPdr, v.NmValSokr, rs.RSch ' +
            ' from Zz_UsrBPdr bp ' +
            ' Left outer join kd_Who w on w.KdWho = bp.KdPdr ' +
            ' Left outer join kd_RSCH rs on rs.KdWho = bp.KdPdr ' +
            ' Left outer join kd_SBU s on s.KdSch = w.KdSbu ' +
            ' Left outer join kd_Val v on v.KdVal = w.KdValPdr ' +
            ' where bp.KdUsr = :KdUsr order by KdPdr');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.OpenQryUsrPstSbu;
begin
  with qryPstSbu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUsers;
    SQL.Add('Select s.KdSch, s.SchBU, s.NmSch, u.* ' +
            ' from zz_usrSbu u ' +
            ' Left Outer join Kd_Sbu s on s.KdSch = u.KdSbu ' +
            ' where u.KdUsr = :KdUsr order by s.SchBU');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.OpenQryUsrOb;
begin
  with qryUsrOb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUsers;
    SQL.Add('Select uo.*, ob.NmOb from sg_UsrOb uo ' +
            ' Left Outer Join sg_KdOb ob on ob.KdOb = uo.KdOb ' +
            ' where uo.KdUsr = :KdUsr order by uo.KdOb');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.FormCreate(Sender: TObject);
begin
  Caption := 'Пользователи';
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 151);
	  Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 650);
    Width  := ReadInteger(SECTION, 'wW', 450);
    dbgrUsrCmp.Height := ReadInteger(SECTION, 'pcCmpH', 250);
	  Free;
  end;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  tsZplSps.TabVisible := false;
  tsBnkPdr.TabVisible := false;
  tsPstSBU.TabVisible := false;
  tsStG.TabVisible    := false;
  tsZero.TabVisible   := false;
  PageControlUsrs.ActivePage := ts1;
  PageControlCmp.ActivePage := tsZero;
  LabelMsg.Caption := '';
  if FileExists(cDirVids + 'nwUsrs01.vid') then
    dbgrUsers.Columns.LoadFromFile(cDirVids + 'nwUsrs01.vid');
  if FileExists(cDirVids + 'nwUsrs02.vid') then
    dbgrUsrCmp.Columns.LoadFromFile(cDirVids + 'nwUsrs02.vid');
  if FileExists(cDirVids + 'nwUsrs05.vid') then
    dbgrUsrZplSps.Columns.LoadFromFile(cDirVids + 'nwUsrs05.vid');
  if FileExists(cDirVids + 'nwUsrs04.vid') then
    dbgrBPdr.Columns.LoadFromFile(cDirVids + 'nwUsrs04.vid');
  if FileExists(cDirVids + 'UsrStgOb.vid') then
    dbgrUsrOb.Columns.LoadFromFile(cDirVids + 'UsrStgOb.vid');
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrUsers.Columns.SaveToFile(cDirVids + 'nwUsrs01.vid');
  dbgrUsrCmp.Columns.SaveToFile(cDirVids + 'nwUsrs02.vid');
  dbgrUsrZplSps.Columns.SaveToFile(cDirVids + 'nwUsrs03.vid');
  dbgrBPdr.Columns.SaveToFile(cDirVids + 'nwUsrs04.vid');
  dbgrUsrOb.Columns.SaveToFile(cDirVids + 'UsrStgOb.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'pcCmpH', dbgrUsrCmp.Height);
	  Free;
  end;
  qryUsers.Close;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.qryUsersAfterPost(DataSet: TDataSet);
var nSvKdUsr : integer;
begin
  with qryUsers do begin
    ApplyUpdates;
    nSvKdUsr := FieldByName('KdUsr').AsInteger;
    Close;
    Open;
    Locate('KdUsr', nSvKdUsr, []);
  end;
end;
//------------------------------------------------------------------------------
function TForm_UsersNew.NewKdUsr : integer;
begin
  Result := 100;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryUsers.DatabaseName;
    SQL.Add('Select Max(KdUsr) as MaxKd from Usrs');
    Open;
    if (RecordCount > 0) and (FieldByName('MaxKd').AsInteger > 0) then
      Result := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.qryUsersBeforePost(DataSet: TDataSet);
begin
  if qryUsers.State = dsInsert then
    qryUsersKdUsr.AsInteger := NewKdUsr;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.dbgrUsersDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrUsers.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryUsersVkl.AsString = 'Y') or (qryUsersVkl.AsString = 'T') then
        Font.Color := clWindowText
      else begin
        Font.Color := clMaroon;
        Font.Style := [];
      end
    end;
  end;
  dbgrUsers.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.popPopup(Sender: TObject);
begin
  popCreKdObjLst.Visible := false;
  popUsrObLst.Visible := false;
  if pop.PopupComponent = dbgrUsers then begin
    popHead.Caption := '== Пользователи ==';
    popEdt.Enabled := qryUsers.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled; end
  else if pop.PopupComponent = dbgrUsrCmp then begin
    popHead.Caption := '== Программные компоненты ==';
    popAdd.Visible := true;
    popEdt.Enabled := qryUsrCmp.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled; end
  else if (pop.PopupComponent = dbgrUsrZplSps) {and
                                   (qryUsrZplSps.Active)} then begin
    popHead.Caption := '== "Списки" по зарплате ==';
    popEdt.Enabled := qryUsrZplSps.RecordCount > 0;
    popCreKdObjLst.Visible := true;
    popDel.Enabled :=  popEdt.Enabled; end
  else if (pop.PopupComponent = dbgrBPdr) and (qryBPdr.Active) then begin
    popHead.Caption := '== Банковские счета ==';
    popDel.Enabled := qryBPdr.RecordCount > 0;
    popEdt.Enabled := false; end
  else if (pop.PopupComponent = dbgrUsrOb) then begin
    popHead.Caption := '== Общежития студгородка ==';
    popAdd.Visible := false;
    popEdt.Visible := false;
    popDel.Visible := false;
    popUsrObLst.Visible := true;
    popDel.Enabled := qryUsrOb.RecordCount > 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.popEdtClick(Sender: TObject);
var nSvNR : integer;
begin
  if pop.PopupComponent = dbgrUsers then with qryUsers do begin
    Edit;
    if EAUser(dsrcUsers) {a_EUsrs} then
      Post
    else
      Cancel; end
  else if pop.PopupComponent = dbgrUsrCmp then with qryUsrCmp do begin
    Edit;
    if AEUsrCmp(dsrcUsrCmp) {a_EUsrCm} then begin
      nSvNR := FieldByName('NR').AsInteger;
      Post;
      ApplyUpdates;
      Close;
      Open;
      Locate('NR', nSvNR, []); end
    else
      Cancel; end
  else if pop.PopupComponent = dbgrUsrZplSps then with qryUsrZplSps do begin
    Edit;
    if EAUsrsZpl {a_UsrZpl} then begin
      nSvNR := FieldByName('NR').AsInteger;
      Post;
      ApplyUpdates;
      Close;
      Open;
      Locate('NR', nSvNR, []); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.dbgrUsersDblClick(Sender: TObject);
begin
  if not bVuborMode and (qryUsers.RecordCount > 0) then with qryUsers do begin
    Edit;
    if EAUser(dsrcUsers) {a_EUsrs} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.popAddClick(Sender: TObject);
var nSvNR : integer;
    nKdSps : integer;
    nKdPdr : SmallInt;
//    cSchBU, cPSch, cNmSBU : string;
    cShCmp, cCallForm : ShortString; //bHsCh : boolean;
begin
  if pop.PopupComponent = dbgrUsers then with qryUsers do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    if EAUser(dsrcUsers) {a_EUsrs} then
      Post
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end; end
  else if pop.PopupComponent = dbgrUsrCmp then begin
    cShCmp := '';
    if GetPCmp(cShCmp) {a_PCmp} then
      UsrAddCmpWithCheck(qryUsersKdUsr.AsInteger, cShCmp); end
  else if pop.PopupComponent = dbgrUsrZplSps then with qryUsrZplSps do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('KdUsr').AsInteger := qryUsers.FieldByName('KdUsr').AsInteger;
    if EAUsrsZpl then begin
      Post;
      ApplyUpdates;
      Close;
      Open; end
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end; end
  else if pop.PopupComponent = dbgrBPdr then begin
    cCallForm := 'a_Usrs2';
    nKdPdr := 0;
    if GetBnkPdr(nKdPdr, cCallForm) then {a_BnkPdr} with qryBPdr do begin
      UsrAddBnkPdrWithCheck(qryUsersKdUsr.AsInteger, nKdPdr);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.UsrAddZplSpzWithCheck(nKdUsr, nKdSpZ : SmallInt;
                                                              bHsCh : boolean);
var nSvNR : integer; bIsComponent : boolean;
begin
(*
  with qryUsrSpZ do begin
    // Проверить, нет ли такого. Если нет - добавить.
    nSvNR := FieldByName('NR').AsInteger;
    bIsComponent := false;
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('KdSpZ').AsInteger = nKdSpZ then begin
        bIsComponent := true;
        Break;
      end;
      Next;
    end;
  end;
  if not bIsComponent then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Insert into zz_UsrSpZ (KdUsr, KdSpZ, HsCh) values ' +
              ' (:nKdUsr, :nKdSpZ, :cHsCh)');
      ParamByName('nKdUsr').AsInteger := nKdUsr;
      ParamByName('nKdSpZ').AsInteger := nKdSpZ;
      if bHsCh then
        ParamByName('cHsCh').AsString := 'Y'
      else
        ParamByName('cHsCh').AsString := '';
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with qryUsrSpZ do begin
      Close;
      Open;
      Locate('KdSpZ', nKdSpZ, []);
      EnableControls;
    end; end
  else with qryUsrSpZ do begin
    if nSvNR <> 0 then
      Locate('NR', nSvNr, []);
    EnableControls;
    ShowMessage('Такой СубСчет уже есть');
  end;
*)end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.UsrAddBnkPdrWithCheck(nKdUsr, nKdPdr : SmallInt);
var nSvNR : integer; bIsComponent : boolean;
begin
  with qryBPdr do begin
    // Проверить, нет ли такого. Если нет - добавить.
    nSvNR := FieldByName('NR').AsInteger;
    bIsComponent := false;
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('KdPdr').AsInteger = nKdPdr then begin
        bIsComponent := true;
        Break;
      end;
      Next;
    end;
  end;
  if not bIsComponent then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Insert into zz_UsrBPdr (KdUsr, KdPdr) values ' +
              ' (:nKdUsr, :nKdPdr)');
      ParamByName('nKdUsr').AsInteger := nKdUsr;
      ParamByName('nKdPdr').AsInteger := nKdPdr;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with qryBPdr do begin
      Close;
      Open;
      Locate('KdPdr', nKdPdr, []);
      EnableControls;
    end; end
  else with qryBPdr do begin
    if nSvNR <> 0 then
      Locate('NR', nSvNr, []);
    EnableControls;
    ShowMessage('Такой счет уже есть');
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.UsrAddCmpWithCheck(nKdUsr : SmallInt;
                                                          cShCmp : ShortString);
var nSvNR : integer; bIsComponent : boolean;
begin
  with qryUsrCmp do begin
    // Проверить, нет ли такого. Если нет - добавить.
    nSvNR := FieldByName('NR').AsInteger;
    bIsComponent := false;
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('NmCmp').AsString = cShCmp then begin
        bIsComponent := true;
        Break;
      end;
      Next;
    end;
  end;
  if not bIsComponent then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Insert into zz_UsrCmp (KdUsr, NmCmp, Lvl) values ' +
              ' (:nKdUsr, :cShCmp, 3)');
      ParamByName('nKdUsr').AsInteger := nKdUsr;
      ParamByName('cShCmp').AsString := cShCmp;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with qryUsrCmp do begin
      Close;
      Open;
      Locate('NmCmp', cShCmp, []);
      EnableControls;
    end; end
  else with qryUsrCmp do begin
    if nSvNR <> 0 then
      Locate('NR', nSvNr, []);
    EnableControls;
    ShowMessage('Такой компонент уже есть');
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.popDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes then
                         with qryUsers do begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    if pop.PopupComponent = dbgrUsers then
      qryUsers.Delete
    else if pop.PopupComponent = dbgrUsrCmp then begin
      qryUsrCmp.Delete;
      Form_Dm.DbMain.ApplyUpdates([qryUsrCmp]); end
    else if pop.PopupComponent = dbgrUsrZplSps then begin
      qryUsrZplSps.Delete;
      Form_Dm.DbMain.ApplyUpdates([qryUsrZplSps]); end
    else if pop.PopupComponent = dbgrBPdr then begin
      qryBPdr.Delete;
      Form_Dm.DbMain.ApplyUpdates([qryBPdr]);
    end;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.dsrcUsersDataChange(Sender: TObject;  Field: TField);
begin
  LabelNmUsr.Caption := '';
  with dsrcUsers do begin
    if qryUsers.Active and (State = dsBrowse) then
      LabelNmUsr.Caption := qryUsersKdUsr.AsString + ' ' +
                                                 qryUsersNmUsr.AsString;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.sBtnForw1Click(Sender: TObject);
begin
  OpenQryUsrCmp;
  OpenQryUsrZplSps;
  OpenQryUsrBnkPdr;
  OpenQryUsrPstSbu;
  OpenQryUsrOb;
  PageControlUsrs.ActivePage := ts2;
  SetFormCaption;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.sBtnBack2Click(Sender: TObject);
begin
  qryBPdr.Close;
  qryUsrZplSps.Close;
  qryUsrCmp.Close;
  PageControlUsrs.ActivePage := ts1;
  SetFormCaption;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.sBtnBack3Click(Sender: TObject);
begin
  PageControlUsrs.ActivePage := ts1;
  SetFormCaption;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.SetFormCaption;
begin
  if PageControlUsrs.ActivePage = ts2 then
    Caption := 'Компоненты, доступные пользователю'
  else if PageControlUsrs.ActivePage = ts1 then
    Caption := 'Пользователи'
  else    // чего пока не может быть
    Caption := 'Пользователи';
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.dsrcUsrCmpDataChange(Sender: TObject; Field: TField);
var cShCmp : ShortString;
begin
  LabelMsg.Caption := '';
  if qryUsrCmp.Active and (qryUsrCmp.State = dsBrowse) then begin
    cShCmp := AnsiUpperCase(qryUsrCmpNmCmp.AsString);
    if cShCmp = 'ZPL' then
      PageControlCmp.ActivePage := tsZplSps
    else if cShCmp = 'BNK' then
      PageControlCmp.ActivePage := tsBnkPdr
    else if cShCmp = 'P64' then
      PageControlCmp.ActivePage := tsPstSBU
    else if cShCmp = 'STG' then begin
      LabelMsg.Caption := 'При пустом списке общежитий - доступны все.';
      PageControlCmp.ActivePage := tsStG; end
    else
      PageControlCmp.ActivePage := tsZero;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.dbgrUsrSpZDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
(*
  with dbgrUsrSpZ.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryUsrSpzHsCh.AsString = 'Y') then begin
        Font.Color := clMaroon;
        Font.Style := [fsBold]; end
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrUsrSpZ.DefaultDrawColumnCell(Rect, DataCol, Column, State);
*)
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.qryUsrZplSpsAfterPost(DataSet: TDataSet);
begin
  ;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.qryUsrZplSpsAfterDelete(DataSet: TDataSet);
begin
  ;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.popCreKdObjLstClick(Sender: TObject);
begin
  ShowMessage('Пока не готово... Надо ввести подразделения ' +
                         '"ручками" в таблицу "ZZ_UsrObj"');
//  ShowUsrObj(qryUsersKdUsr.AsInteger);   {a_ZUObj} а может быть и не отсюда!!!
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.qryPstSbuNewRecord(DataSet: TDataSet);
begin
  qryPstSbuKdUsr.AsInteger := qryUsersKdUsr.AsInteger;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.qryPstSbuSCHBUValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean;
begin
{
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := IsVidNInDic(cText);
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике вида ' + cText);
  end;
}
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.popUsrObLstClick(Sender: TObject);
var nKdUsr : SmallInt; cNmUsr : ShortString;
begin
  nKdUsr := qryUsersKdUsr.AsInteger;
  cNmUsr := qryUsersNmUsr.AsString;
  ShNaborOb(nKdUsr, cNmUsr); {a_LstOb}
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.QryUsrObAdd(nKdUsr, nKdOb: SmallInt;
                                                            cNmOb: ShortString);
begin
  with qryUsrOb do begin
    Append;
    qryUsrObKdUsr.AsInteger := nKdUsr;
    qryUsrObKdOb.AsInteger := nKdOb;
    qryUsrObNmOb.AsString := cNmOb;
    Post;
    Form_Dm.DbMain.ApplyUpdates([qryUsrOb]);
    Close;
    Open;
    Locate('KdOb', nKdOb, [])
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.QryUsrObDel(nKdUsr, nKdOb: SmallInt);
begin
  if qryUsrOb.Locate('KdOb', nKdOb, []) then begin
    qryUsrOb.Delete;
    Form_Dm.DbMain.ApplyUpdates([qryUsrOb]);
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TForm_UsersNew.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
