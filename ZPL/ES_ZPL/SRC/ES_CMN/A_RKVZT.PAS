unit A_Rkvzt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Menus, DBCtrls, StdCtrls, Mask, Db,
  DBTables, Grids, DBGrids, Buttons, IniFiles;

type
  TFormSetUp = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    tsFirma: TTabSheet;
    tsHou: TTabSheet;
    tsBank: TTabSheet;
    BitBtn1: TBitBtn;
    PanelKoop: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryRkvzt: TQuery;
    dsrcRkvzt: TDataSource;
    qryRkvztNR: TIntegerField;
    qryRkvztDTBEG: TDateTimeField;
    qryRkvztNMKOOP: TStringField;
    qryRkvztADRES: TStringField;
    qryRkvztNMPRED: TStringField;
    qryRkvztNMBUH: TStringField;
    Label6: TLabel;
    dbeDtBeg: TDBEdit;
    dbeNmKoop: TDBEdit;
    dbeAdres: TDBEdit;
    dbeNmPred: TDBEdit;
    dbeNmBuh: TDBEdit;
    DBNavigator1: TDBNavigator;
    popMnu: TPopupMenu;
    popMnuHead: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuEdt: TMenuItem;
    popMnuDel: TMenuItem;
    qryRkvztDOLGNPRED: TStringField;
    qryRkvztDOLGNBUH: TStringField;
    Label7: TLabel;
    dbeDolgnPred: TDBEdit;
    Label8: TLabel;
    dbeDolgnBuh: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Bevel2: TBevel;
    chBoxLiftFirst: TCheckBox;
    chBoxAllowValutu: TCheckBox;
    chBoxAllowGrp: TCheckBox;
    chBoxAllowNds: TCheckBox;
    Bevel3: TBevel;
    chBoxAllowKliZa: TCheckBox;
    chBoxAllowParagr: TCheckBox;
    chBoxAllowMainPdr: TCheckBox;
    dtPicDtSaldoPrg: TDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    ChBoxLiftSecond: TCheckBox;
    qryRkvztKDWHO: TSmallintField;
    dbgrRkvzt: TDBGrid;
    tsZpl: TTabSheet;
    tsRaznoe: TTabSheet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label13: TLabel;
    Bevel4: TBevel;
    chBoxAllowKssAutoNum: TCheckBox;
    ChBoxFullRubKopInPoruch: TCheckBox;
    procedure popMnuPopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popMnuAddClick(Sender: TObject);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure chBoxLiftFirstClick(Sender: TObject);
    procedure chBoxAllowValutuClick(Sender: TObject);
    procedure chBoxAllowGrpClick(Sender: TObject);
    procedure chBoxAllowNdsClick(Sender: TObject);
    procedure chBoxAllowKliZaClick(Sender: TObject);
    procedure chBoxAllowParagrClick(Sender: TObject);
    procedure chBoxAllowMainPdrClick(Sender: TObject);
    procedure dtPicDtSaldoPrgCloseUp(Sender: TObject);
    procedure ChBoxLiftSecondClick(Sender: TObject);
    procedure Label12DblClick(Sender: TObject);
    procedure chBoxAllowKssAutoNumClick(Sender: TObject);
    procedure ChBoxFullRubKopInPoruchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowModalFormSetUp;

const SECTION = 'A_Rkvzt';

var
  FormSetUp: TFormSetUp;

implementation

uses A_Const, A_DM, A_ERkvzt;   {A_ERSch,}

{$R *.DFM}

//------------------------------------------------------------------------------
procedure ShowModalFormSetUp;
begin
  FormSetUp := TFormSetUp.Create(Application);
  with FormSetUp do begin
    Caption := 'Реквизиты';
    if not qryRkvzt.Active then
      qryRkvzt.Open;
    qryRkvzt.Last;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
  PageControl1.ActivePage   := tsFirma;
  ChBoxLiftFirst.Checked    := bAppLiftFirstPlatit;
  ChBoxLiftSecond.Checked   := bAppLiftSecondPlatit;
  ChBoxAllowValutu.Checked  := bAppAllowValutu;
  ChBoxAllowGrp.Checked     := bAppAllowGrp;
  ChBoxAllowNds.Checked     := bAppAllowNds;
  ChBoxAllowKliZa.Checked   := bAppAllowKliZa;
  ChBoxAllowParagr.Checked  := bAppAllowParagr;
  ChBoxAllowMainPdr.Checked := bAppAllowBnkPdr;
  dtPicDtSaldoPrg.Date      := dAppHouDtSaldoPrg+1;
  dtPicDtSaldoPrg.Enabled   := (dAppHouDtSaldoPrg =
                                          StrToDate('01-01-1999'));
  chBoxAllowKssAutoNum.Checked := bAppAllowKssAutoNum;
  ChBoxFullRubKopInPoruch.Checked  := bAppFullRubKopInPoruch;
  if FileExists(cDirVids + 'GrRkvzt.vid') then
    dbgrRkvzt.Columns.LoadFromFile(cDirVids + 'GrRkvzt.vid');
  tsRaznoe.TabVisible := false;
  if bSamBankRun then begin
    tsBank.TabVisible := bFlagDbg;
    tsHou.TabVisible := false;
    tsZpl.TabVisible := false; end
  else if bSamZplRun then begin
    tsHou.TabVisible  := false;
    tsBank.TabVisible := false; end
  else if bSamHouRun then begin
    tsHou.TabVisible  := true;
    tsZpl.TabVisible  := false;
    tsBank.TabVisible := false; end
  else begin
    tsHou.TabVisible  := true;
    tsBank.TabVisible := true;
    tsZpl.TabVisible  := true;
  end;
  if bFlagDbg then begin
    tsHou.TabVisible  := true;
    tsBank.TabVisible := true;
    tsZpl.TabVisible  := true;
    tsRaznoe.TabVisible := true;
  end;
  Label12.Visible := tsBank.TabVisible or tsHou.TabVisible or
                             tsZpl.TabVisible or tsRaznoe.TabVisible;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  dbgrRkvzt.Columns.SaveToFile(cDirVids + 'GrRkvzt.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.popMnuPopup(Sender: TObject);
begin
  popMnuHead.Caption := '=== Реквизиты ===';
  popMnuAdd.Enabled := true;
  popMnuEdt.Enabled := qryRkvzt.RecordCount <> 0;
  popMnuDel.Enabled := popMnuEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.popMnuAddClick(Sender: TObject);
var nNwNR, nKdWho : integer;
    bFirstRecord : boolean;
begin
  bFirstRecord := (qryRkvzt.RecordCount = 0);
  if bFirstRecord then
    nKdWho := 0
  else
    nKdWho := qryRkvzt.FieldByName('KdWho').asInteger;
  if AddRkvzt(nNwNR, nKdWho, bFirstRecord, qryRkvzt) then {A_ERkvzt}
                                             with qryRkvzt do begin
    Close;
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.popMnuEdtClick(Sender: TObject);
var nSvNR : integer;
begin
  nSvNr := qryRkvzt.FieldByName('NR').asInteger;
  if EdtRkvzt(qryRkvzt) then {A_ERkvzt} with qryRkvzt do begin
    DisableControls;
    Close;
    Open;
    EnableControls;
    Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.popMnuDelClick(Sender: TObject);
var nSvNR, nDelNR : integer;
    bEof : boolean; cMsg : string;
begin
  if qryRkvzt.RecordCount = 1 then begin
    cMsg := 'В таблице должна быть хотя бы одна запись. ' +
                                      'Удаление невозможно.';
    ShowMessage(cMsg);
    Exit;
  end;
  nDelNR := qryRkvzt.FieldByName('NR').asInteger;
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbNo, mbYes], 0) = mrYes then begin
    nSvNR := 0;
    bEof := false;
    with Form_Dm.qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN; 
      SQL.Add('Delete from Rkvzt where NR = :nDelNr');
      ParamByName('nDelNr').asInteger  := nDelNR;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with qryRkvzt do begin
      DisableControls;
      Next;
      if Eof then
        bEof := true
      else
        nSvNR := FieldByName('NR').asInteger;
      Close;
      Open;
      EnableControls;
      if bEof then
        Last
      else
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.chBoxLiftFirstClick(Sender: TObject);
begin
  bAppLiftFirstPlatit := chBoxLiftFirst.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.ChBoxLiftSecondClick(Sender: TObject);
begin
  bAppLiftSecondPlatit := chBoxLiftSecond.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.chBoxAllowValutuClick(Sender: TObject);
begin
  bAppAllowValutu := chBoxAllowValutu.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.chBoxAllowGrpClick(Sender: TObject);
begin
  bAppAllowGrp := chBoxAllowGrp.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.chBoxAllowNdsClick(Sender: TObject);
begin
  bAppAllowNds := chBoxAllowNds.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.chBoxAllowKliZaClick(Sender: TObject);
begin
  bAppAllowKliZa := chBoxAllowKliZa.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.chBoxAllowParagrClick(Sender: TObject);
begin
  bAppAllowParagr := chBoxAllowParagr.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.chBoxAllowMainPdrClick(Sender: TObject);
begin
  bAppAllowBnkPdr := ChBoxAllowMainPdr.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.chBoxAllowKssAutoNumClick(Sender: TObject);
begin
  bAppAllowKssAutoNum := chBoxAllowKssAutoNum.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.dtPicDtSaldoPrgCloseUp(Sender: TObject);
begin
  dAppHouDtSaldoPrg := dtPicDtSaldoPrg.Date-1;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.Label12DblClick(Sender: TObject);
begin
  tsRaznoe.TabVisible := not tsRaznoe.TabVisible;
end;
//------------------------------------------------------------------------------
procedure TFormSetUp.ChBoxFullRubKopInPoruchClick(Sender: TObject);
begin
  bAppFullRubKopInPoruch := ChBoxFullRubKopInPoruch.Checked;
end;

end.
