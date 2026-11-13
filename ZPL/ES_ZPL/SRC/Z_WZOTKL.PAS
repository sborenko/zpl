unit z_WzOtkl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IniFiles, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls,
  DB, DBClient, Grids, DBGrids, DBTables, Provider, Menus;

type
  String15 = string[15];
  PTreeRec = ^TTreeRec;
  TTreeRec = record
    KdObj : SmallInt;
    ShObj : String15;
    NmObj : string;
    KdSPZ : SmallInt;
  end;
  TFormWizardOtkl = class(TForm)
    PageControl: TPageControl;
    tsObjKat: TTabSheet;
    tsVidSum: TTabSheet;
    ts3: TTabSheet;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    cdsOtkl: TClientDataSet;
    dsrcOtkl: TDataSource;
    cdsOtklDtProc: TDateField;
    cdsOtklZaMesGod: TDateField;
    cdsOtklKdVidN: TSmallintField;
    cdsOtklDtBeg: TDateField;
    cdsOtklDtEnd: TDateField;
    cdsOtklChasu: TFloatField;
    cdsOtklSumProc: TFloatField;
    cdsOtklPdN: TSmallintField;
    cdsOtklSmPrc: TStringField;
    cdsOtklSPZ: TStringField;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    sBtnVidN: TSpeedButton;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    sBtnSPZ: TSpeedButton;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    DBComboBox1: TDBComboBox;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Label10: TLabel;
    cdsMmYy: TClientDataSet;
    dsrcMmYy: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    ts1: TTabSheet;
    ts2: TTabSheet;
    tsResult: TTabSheet;
    Panel5: TPanel;
    DBGrid4: TDBGrid;
    Splitter1: TSplitter;
    Panel6: TPanel;
    DBGrid3: TDBGrid;
    Panel7: TPanel;
    dbgrKatP: TDBGrid;
    cdsObj: TClientDataSet;
    dsrcKatP: TDataSource;
    dsrcObj: TDataSource;
    dspTmp: TDataSetProvider;
    qryTmp: TQuery;
    Splitter2: TSplitter;
    TV: TTreeView;
    lbxObjF8: TListBox;
    lbxKatPF8: TListBox;
    LabelObj: TLabel;
    Panel8: TPanel;
    Label1: TLabel;
    grBoxObj: TGroupBox;
    rBtnAllObj: TRadioButton;
    rBtnSelObj: TRadioButton;
    grBoxKatP: TGroupBox;
    rBtnAllKatP: TRadioButton;
    rBtnSelKatP: TRadioButton;
    dtPicDtRep: TDateTimePicker;
    chBoxFromUpi: TCheckBox;
    LabelKatP: TLabel;
    LabelObj2: TLabel;
    LabelCountSelObj: TLabel;
    LabelCountSelKatP: TLabel;
    dbgrUpi: TDBGrid;
    dbgrOtkl1: TDBGrid;
    Splitter3: TSplitter;
    cdsUpi: TClientDataSet;
    dsrcUpi: TDataSource;
    cdsUpiUPI_NR: TIntegerField;
    cdsUpiTABN: TIntegerField;
    cdsUpiID: TStringField;
    cdsUpiFAM: TStringField;
    cdsUpiIMA: TStringField;
    cdsUpiOTCH: TStringField;
    cdsUpiDT_PRIEM: TDateTimeField;
    cdsUpiDT_UVOLN: TDateTimeField;
    cdsUpiPRMUV_DT_PRIKAZA: TDateTimeField;
    cdsUpiPRMUV_NR_PRIKAZA: TStringField;
    cdsUpiPRMUV_NOTES: TStringField;
    cdsUpiPERE_NR: TIntegerField;
    cdsUpiDT_BEG: TDateTimeField;
    cdsUpiKDOBJ: TSmallintField;
    cdsUpiKDKATP: TSmallintField;
    cdsUpiSO: TSmallintField;
    cdsUpiOKLTRF: TFloatField;
    cdsUpiAVANS: TFloatField;
    cdsUpiPRCWRKTIME: TFloatField;
    cdsUpiSP_AV: TStringField;
    cdsUpiDOLGNOST: TStringField;
    cdsUpiKDSPZ: TSmallintField;
    cdsUpiPR_PENS: TSmallintField;
    cdsUpiSOVM: TSmallintField;
    cdsUpiPDNLG: TSmallintField;
    cdsUpiPROCLG: TFloatField;
    cdsUpiKOLMIN: TSmallintField;
    cdsUpiPRFS: TSmallintField;
    cdsUpiINV: TSmallintField;
    cdsUpiRANG: TSmallintField;
    cdsUpiRAZR: TSmallintField;
    cdsUpiPERE_NR_PRIKAZA: TStringField;
    cdsUpiPERE_DT_PRIKAZA: TDateTimeField;
    cdsUpiPERE_NOTES: TStringField;
    popUpi: TPopupMenu;
    popUpiSort: TMenuItem;
    popUpiSortByFIO: TMenuItem;
    popUpiSortByTabN: TMenuItem;
    popUpiSortByObjFIO: TMenuItem;
    popUpiFind: TMenuItem;
    popUpiFindByFam: TMenuItem;
    popUpiFindByTabN: TMenuItem;
    Panel9: TPanel;
    SpeedButton6: TSpeedButton;
    Label9: TLabel;
    Label11: TLabel;
    BitBtn4: TBitBtn;
    SpeedButton7: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chBoxFromUpiClick(Sender: TObject);
    procedure TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
                             State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TVDblClick(Sender: TObject);
    procedure TVEnter(Sender: TObject);
    procedure TVExit(Sender: TObject);
    procedure dbgrKatPEnter(Sender: TObject);
    procedure dbgrKatPExit(Sender: TObject);
    procedure Panel4Resize(Sender: TObject);
    procedure rBtnAllKatPClick(Sender: TObject);
    procedure rBtnSelKatPClick(Sender: TObject);
    procedure rBtnAllObjClick(Sender: TObject);
    procedure rBtnSelObjClick(Sender: TObject);
    procedure dbgrKatPDblClick(Sender: TObject);
    procedure dbgrKatPDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsUpiBeforeOpen(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure popUpiSortByFIOClick(Sender: TObject);
    procedure popUpiSortByTabNClick(Sender: TObject);
    procedure popUpiSortByObjFIOClick(Sender: TObject);
    procedure popUpiFindByFamClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
    bTvReady : boolean;
    nUpiIndexNum : word;
    procedure SetButtonsEnabled;
    procedure SetLabelKatPState;
    procedure SetLabelObj2State;
    procedure CreTvObj;
    procedure CreOpenCdsMmYy(dDtProc : TDateTime);
    procedure CreOpenCdsOtkl(dDtProc : TDateTime);
    procedure SetUpiSort;
  public
    { Public declarations }
  end;

function WizardOtkl : boolean;

const SECTION = 'z_WzOtkl';

var
  FormWizardOtkl: TFormWizardOtkl;

implementation

uses a_Const, Z_Main, Z_Dm, A_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function WizardOtkl : boolean;
begin
  Result := false;
  FormWizardOtkl := TFormWizardOtkl.Create(Application);
  with FormWizardOtkl do begin
    LabelCountSelKatP.Caption := '';
    LabelCountSelObj.Caption := '';
    if not dsrcKatP.DataSet.Active then
      dsrcKatP.DataSet.Open;
    CreTvObj;
    CreOpenCdsMmYy(dDtProc);
    CreOpenCdsOtkl(dDtProc);
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.CreTvObj;
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
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from z_KdObj order by AIndx, Lvl, PIndx');
    Open;
    First;
    while not Eof do begin
      cMsg := '';
      for i := 1 to FieldByName('Lvl').AsInteger do begin
        cMsg := cMsg + ' ';
      end;
      cMsg := cMsg + FieldByName('KdObj').AsString + ' ' +
                      FieldByName('ShObj').AsString + '  ' +
                       Trim(FieldByName('NmObj').asString);
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
      TV.Items[i].Data := MyTreeRec;
      Inc(i);
      Next;
    end;
  end;
  bTvReady := true;
  TV.Items[0].Selected := true;
  qryTmp.Close;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.CreOpenCdsOtkl(dDtProc : TDateTime);
begin
  with cdsOtkl do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    FieldByName('DtProc').AsDateTime :=
                                   cdsMmYy.FieldByName('ZamesGod').asDateTime;
    FieldByName('ZaMesGod').AsDateTime :=
                                   cdsMmYy.FieldByName('ZamesGod').asDateTime;
    FieldByName('DtBeg').AsDateTime :=
                                   cdsMmYy.FieldByName('ZamesGod').asDateTime;
    FieldByName('DtEnd').AsDateTime :=
                         myLastDOM(cdsMmYy.FieldByName('ZamesGod').asDateTime);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.CreOpenCdsMmYy(dDtProc : TDateTime);
var i : integer; nY, nM, nD : word; dDtTmp : TDateTime;
begin
  // Заполнить месяцами от текущего 12 месяцев назад
  with cdsMmYy do begin
    DecodeDate(dDtProc, nY, nM, nD);
    nM := nM + 1;
    if nM > 12 then begin
      nM := 1;
      nY := nY + 1;
    end;
    dDtTmp := EnCodeDate(nY, nM, 1);
    DbComboBox1.Items.Clear;
    if Active then Close;
    CreateDataSet;
    Open;
    for i := 13 downto 1 do begin
      DecodeDate(dDtTmp, nY, nM, nD);
      Append;
      FieldByName('ZaMesGod').AsDateTime := dDtTmp;
      FieldByName('MesRus').AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
      Post;
      DbComboBox1.Items.Add(FieldByName('MesRus').AsString);
      nM := nM - 1;
      if nM < 1 then begin
        nM := 12;
        nY := nY - 1;
      end;
      dDtTmp := EnCodeDate(nY, nM, 1);
    end;
    First;
    Next;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.FormCreate(Sender: TObject);
begin
  tsObjKat.TabVisible := bFlagDbg;
  tsVidSum.TabVisible := bFlagDbg;
  tsResult.TabVisible := bFlagDbg;
  ts1.TabVisible := bFlagDbg;
  ts2.TabVisible := bFlagDbg;
  ts3.TabVisible := bFlagDbg;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 510);
    nUpiIndexNum := ReadInteger(SECTION, 'nUpiOrd', 1);
    dtPicDtRep.Date := ReadDate(SECTION, 'dDtRep', Date);
    dbgrKatP.Height := ReadInteger(SECTION, 'grKatPH', 130);
    dbgrUpi.Width := ReadInteger(SECTION, 'grUpiW', 300);
    chBoxFromUpi.Checked := ReadBool(SECTION, 'bFrUpi', false);
    rBtnAllKatP.Checked := ReadBool(SECTION, 'bAllKatP', true);
    rBtnSelKatP.Checked := not rBtnAllKatP.Checked;
    rBtnAllObj.Checked := ReadBool(SECTION, 'bAllObj', true);
    rBtnSelObj.Checked := not rBtnAllObj.Checked;
    Free;
  end;
  if nUpiIndexNum = 1 then begin
    popUpiSortByFIO.Checked := true;
    popUpiSortByTabN.Checked := false;
    popUpiSortByObjFIO.Checked := false; end
  else if nUpiIndexNum = 2 then begin
    popUpiSortByFIO.Checked := false;
    popUpiSortByTabN.Checked := true;
    popUpiSortByObjFIO.Checked := false; end
  else begin
    popUpiSortByFIO.Checked := false;
    popUpiSortByTabN.Checked := false;
    popUpiSortByObjFIO.Checked := true;
  end;
  if FileExists(cDirVids + 'pvoKatP.vid' ) then
    dbgrKatP.Columns.LoadFromFile(cDirVids + 'pvoKatP.vid' );
  if FileExists(cDirVids + 'pvoUpi.vid' ) then
    dbgrUpi.Columns.LoadFromFile(cDirVids + 'pvoUpi.vid' );
  PageControl.ActivePage := tsObjKat;
  SetButtonsEnabled;
  SetLabelKatPState;
  SetLabelObj2State;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrKatP.Columns.SaveToFile(cDirVids + 'pvoKatP.vid' );
  dbgrUpi.Columns.SaveToFile(cDirVids + 'pvoUpi.vid' );
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nUpiOrd', nUpiIndexNum);
    WriteDate(SECTION, 'dDtRep', dtPicDtRep.Date);
    WriteInteger(SECTION, 'grKatPH', dbgrKatP.Height);
    WriteInteger(SECTION, 'grUpiW', dbgrUpi.Width);
    WriteBool(SECTION, 'bFrUpi', chBoxFromUpi.Checked);
    WriteBool(SECTION, 'bAllKatP', rBtnAllKatP.Checked);
    WriteBool(SECTION, 'bAllObj', rBtnAllObj.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.SetButtonsEnabled;
begin
  rBtnAllObj.Enabled  := not chBoxFromUpi.Checked;
  rBtnSelObj.Enabled  := not chBoxFromUpi.Checked;
  rBtnAllKatP.Enabled := not chBoxFromUpi.Checked;
  rBtnSelKatP.Enabled := not chBoxFromUpi.Checked;
  dtPicDtRep.Enabled  := not chBoxFromUpi.Checked;
  LabelKatP.Enabled := not chBoxFromUpi.Checked;
  LabelObj2.Enabled := not chBoxFromUpi.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.chBoxFromUpiClick(Sender: TObject);
begin
  SetButtonsEnabled;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.dbgrKatPDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrKatP.Canvas do begin
    if not (gdFocused in State) then begin
      if LbxKatPF8.Items.IndexOf(dsrcKatP.DataSet.
                                 FieldByName('NR').AsString) >= 0 then
        Font.Color := clRed
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrKatP.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.dbgrKatPDblClick(Sender: TObject);
var i : integer;
begin
  i := LbxKatPF8.Items.IndexOf(dsrcKatP.DataSet.FieldByName('NR').AsString);
  if i < 0 then
    LbxKatPF8.Items.Add(dsrcKatP.DataSet.FieldByName('NR').AsString)
  else
    LbxKatPF8.Items.Delete(i);
  if i < dsrcKatP.DataSet.RecordCount then
    dsrcKatP.DataSet.Next
  else
    dbgrKatP.Refresh;
  if LbxKatPF8.Items.Count > 0 then
    LabelCountSelKatP.Caption :=
             'Выделено категорий: ' + IntToStr(LbxKatPF8.Items.Count)
  else
    LabelCountSelKatP.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.TVCustomDrawItem(Sender: TCustomTreeView;
                                           Node: TTreeNode;
                                           State: TCustomDrawState;
                                           var DefaultDraw: Boolean);
var i : integer;
begin
  with TV.Canvas do begin
    if not (cdsSelected in State) then begin
      i := LbxObjF8.Items.IndexOf(IntToStr(Node.AbsoluteIndex));
      if i < 0 then
        Font.Color := clWindowText
      else
        Font.Color := clRed;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.TVDblClick(Sender: TObject);
var i, x : integer;
begin
  x := TV.Selected.AbsoluteIndex;
  i := LbxObjF8.Items.IndexOf(IntToStr(x));
  if i < 0 then begin
    // если не имеет детей
    if not TV.Selected.HasChildren then
      LbxObjF8.Items.Add(IntToStr(x))
    else begin
      // переместиться ниже
      //Inc(x);
      if x < TV.Items.Count then
        TV.Items[x].Selected := true;
    end; end
  else
    LbxObjF8.Items.Delete(i);
  Inc(x);
  if x < TV.Items.Count then
    TV.Items[x].Selected := true
  else begin  // вернуть назад (вверх)
    x := x - 2;
    TV.Items[x].Selected := true;
  end;
  if LbxObjF8.Items.Count > 0 then
    LabelCountSelObj.Caption :=
             'Выделено подразделений: ' + IntToStr(LbxObjF8.Items.Count)
  else
    LabelCountSelObj.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.TVEnter(Sender: TObject);
begin
  LabelObj.Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.TVExit(Sender: TObject);
begin
  LabelObj.Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.dbgrKatPEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.dbgrKatPExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.Panel4Resize(Sender: TObject);
begin
  Panel8.Top := Round((Panel4.Height - Panel8.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.rBtnAllKatPClick(Sender: TObject);
begin
  SetLabelKatPState;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.rBtnSelKatPClick(Sender: TObject);
begin
  SetLabelKatPState;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.SetLabelKatPState;
begin
  LabelKatP.Enabled := rBtnSelKatP.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.rBtnAllObjClick(Sender: TObject);
begin
  SetLabelObj2State;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.rBtnSelObjClick(Sender: TObject);
begin
  SetLabelObj2State;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.SetLabelObj2State;
begin
  LabelObj2.Enabled := rBtnSelObj.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.cdsUpiBeforeOpen(DataSet: TDataSet);
begin
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.SpeedButton1Click(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('select * from WhereIsAll (:dDtRep, :dDtRep) ' +
            ' order by KdObj, Fam, Ima, Otch ');
    ParamByName('dDtRep').AsDateTime := dtPicDtRep.Date;
  end;
  with cdsUpi do begin
    if Active then Close;
    IndexDefs.Clear;
    CommandText := '';
    ProviderName := 'dspTmp';
    Open;
    AddIndex('OnFIO', 'Fam;Ima;Otch', [ixCaseInsensitive]);
    AddIndex('OnObjFIO', 'KdObj;Fam;Ima;Otch', [ixCaseInsensitive]);
    AddIndex('OnTabN', 'TabN', []);
    SetUpiSort;
    First;
    ProviderName := '';
  end;
  PageControl.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.SetUpiSort;
begin
  if nUpiIndexNum = 1 then
    cdsUpi.IndexName := 'OnFIO'
  else if nUpiIndexNum = 2 then
    cdsUpi.IndexName := 'OnTabN'
  else
    cdsUpi.IndexName := 'OnObjFIO';
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.popUpiSortByFIOClick(Sender: TObject);
begin
  if not popUpiSortByFIO.Checked then begin
    popUpiSortByFIO.Checked := true;
    popUpiSortByTabN.Checked := false;
    popUpiSortByObjFIO.Checked := false;
    nUpiIndexNum := 1;
    SetUpiSort;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.popUpiSortByTabNClick(Sender: TObject);
begin
  if not popUpiSortByTabN.Checked then begin
    popUpiSortByFIO.Checked := false;
    popUpiSortByTabN.Checked := true;
    popUpiSortByObjFIO.Checked := false;
    nUpiIndexNum := 2;
    SetUpiSort;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.popUpiSortByObjFIOClick(Sender: TObject);
begin
  if not popUpiSortByObjFIO.Checked then begin
    popUpiSortByFIO.Checked := false;
    popUpiSortByTabN.Checked := false;
    popUpiSortByObjFIO.Checked := true;
    nUpiIndexNum := 3;
    SetUpiSort;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.popUpiFindByFamClick(Sender: TObject);
var cCaption, cPrompt, cFam, cFilter : string;
begin
  cCaption := 'Ввод фамилии';
  cPrompt  := 'Введите фамилию:';
  if InputQuery(cCaption, cPrompt, cFam) then with cdsUpi do begin
    cFilter := 'Fam = ''' + cFam + '''';
    Filter := cFilter;
    Filtered := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWizardOtkl.SpeedButton7Click(Sender: TObject);
begin
  with cdsUpi do begin
    Filtered := false;
    Filter := '';
  end;
end;

end.
