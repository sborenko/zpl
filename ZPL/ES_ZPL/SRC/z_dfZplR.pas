unit z_dfZplR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, Grids, DBGrids, ComCtrls, Buttons, StdCtrls, ExtCtrls,
  DBTables, Menus, Provider, DBClient;

type
  TFormDfPromRes = class(TForm)
    PanelTools: TPanel;
    bBtnExit: TBitBtn;
    sBtnPrt: TSpeedButton;
    PageControl1: TPageControl;
    ts2: TTabSheet;
    qryFio2: TQuery;
    qryFio2NR: TIntegerField;
    qryFio2NP: TIntegerField;
    qryFio2cDir: TStringField;
    qryFio2TIN: TStringField;
    qryFio2TabN: TIntegerField;
    qryFio2Fam: TStringField;
    qryFio2Ima: TStringField;
    qryFio2Otch: TStringField;
    qryFio2S_NAR: TFloatField;
    qryFio2S_DOX: TFloatField;
    qryFio2S_TAXN: TFloatField;
    qryFio2S_TAXP: TFloatField;
    qryFio2OZN_DOX: TSmallintField;
    qryFio2D_PRIYN: TDateField;
    qryFio2D_ZVILN: TDateField;
    qryFio2OZN_PILG: TSmallintField;
    qryFio2OZNAKA: TSmallintField;
    ts1: TTabSheet;
    dsrcID: TDataSource;
    dbgrID: TDBGrid;
    Splitter1: TSplitter;
    dbgrId2: TDBGrid;
    qryId2: TQuery;
    dsrcId2: TDataSource;
    tblID: TTable;
    tblFIO: TTable;
    dsrcFIO: TDataSource;
    dsrcFio2: TDataSource;
    dbgrFio: TDBGrid;
    Splitter2: TSplitter;
    dbgrFio2: TDBGrid;
    tblFIONR: TAutoIncField;
    tblFIONP: TIntegerField;
    tblFIOFam: TStringField;
    tblFIOIma: TStringField;
    tblFIOOtch: TStringField;
    tblFIOS_NAR: TFloatField;
    tblFIOS_DOX: TFloatField;
    tblFIOS_TAXN: TFloatField;
    tblFIOS_TAXP: TFloatField;
    tblFIOOZN_DOX: TSmallintField;
    tblFIOD_PRIYN: TDateField;
    tblFIOD_ZVILN: TDateField;
    tblFIOOZN_PILG: TSmallintField;
    tblFIOOZNAKA: TSmallintField;
    tblIDNR: TAutoIncField;
    tblIDNP: TIntegerField;
    tblIDTIN: TStringField;
    tblIDFam: TStringField;
    tblIDIma: TStringField;
    tblIDOtch: TStringField;
    tblIDS_NAR: TFloatField;
    tblIDS_DOX: TFloatField;
    tblIDS_TAXN: TFloatField;
    tblIDS_TAXP: TFloatField;
    tblIDOZN_DOX: TSmallintField;
    tblIDD_PRIYN: TDateField;
    tblIDD_ZVILN: TDateField;
    tblIDOZN_PILG: TSmallintField;
    tblIDOZNAKA: TSmallintField;
    sBtnCopyDisk: TSpeedButton;
    ChBoxZeroLines: TCheckBox;
    tblFIOPasport: TStringField;
    tblForCopy: TTable;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    tblIDDopRec: TStringField;
    tblFIODopRec: TStringField;
    tblFIOTIN: TStringField;
    ChBox1000: TCheckBox;
    qry1000: TQuery;
    tbl1000: TTable;
    ChBoxDataPodannja: TCheckBox;
    qryTmp: TQuery;
    tblIDSovm: TSmallintField;
    tblFIOSovm: TSmallintField;
    popSep1: TMenuItem;
    popEdtInTable: TMenuItem;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    LabelCntRec: TLabel;
    popPoisk: TMenuItem;
    popPoiskByTin: TMenuItem;
    popPoiskByFam: TMenuItem;
    popPoiskWithDUvoln: TMenuItem;
    tblFIOBadId: TStringField;
    tblIDBadId: TStringField;
    qryFio2BadId: TStringField;
    qryFio2fNU: TSmallintField;
    qryFio2NoNwBD: TBooleanField;
    tblIDRecNR: TIntegerField;
    qryId2NR: TIntegerField;
    qryId2NP: TIntegerField;
    qryId2cDir: TStringField;
    qryId2fNU: TSmallintField;
    qryId2BadId: TStringField;
    qryId2TIN: TStringField;
    qryId2TabN: TIntegerField;
    qryId2Sovm: TSmallintField;
    qryId2Fam: TStringField;
    qryId2Ima: TStringField;
    qryId2Otch: TStringField;
    qryId2S_NAR: TFloatField;
    qryId2S_DOX: TFloatField;
    qryId2S_TAXN: TFloatField;
    qryId2S_TAXP: TFloatField;
    qryId2OZN_DOX: TSmallintField;
    qryId2D_PRIYN: TDateField;
    qryId2D_ZVILN: TDateField;
    qryId2OZN_PILG: TSmallintField;
    qryId2OZNAKA: TSmallintField;
    qryId2NoNwBD: TBooleanField;
    qryId2DopRec: TStringField;
    dbgrProm: TDBGrid;
    Splitter3: TSplitter;
    qryProm: TQuery;
    dsrcProm: TDataSource;
    qryPromTIN: TStringField;
    qryPromBadID: TStringField;
    qryPromSovm: TSmallintField;
    qryPromTabN: TIntegerField;
    qryPromFam: TStringField;
    qryPromIma: TStringField;
    qryPromOtch: TStringField;
    qryPromOzn_Dox: TSmallintField;
    qryPromOzn_Pilg: TSmallintField;
    qryPromd_Zviln: TDateField;
    qryPromd_Priyn: TDateField;
    qryPromOznaka: TSmallintField;
    qryPromDopRec: TStringField;
    qryPromS_NAR: TFloatField;
    qryPromS_DOX: TFloatField;
    qryPromS_TAXN: TFloatField;
    qryPromS_TAXP: TFloatField;
    tblIDTabN: TIntegerField;
    tblFIOTabN: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
    procedure sBtnCopyDiskClick(Sender: TObject);
    procedure dbgrId2DblClick(Sender: TObject);
    procedure dbgrFio2DblClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure popEdtInTableClick(Sender: TObject);
    procedure popPoiskByTinClick(Sender: TObject);
    procedure popPoiskByFamClick(Sender: TObject);
    procedure popPoiskWithDUvolnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bBtnExitClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbgrIDDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrPromDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrId2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    n_Kv, n_YY : word;
    cSvTIN : ShortString;
    procedure OpenTblId(nKv, nYY : word);
    procedure OpenQryProm(nKv, nYY : word);
    procedure OpenQryId2(nKv, nYY : word);
    procedure OpenTblFio(nKv, nYY : word);
    procedure OpenQryFio2(nKv, nYY : word);
    procedure CopyToDiskId(cNmDA : ShortString;
                               var nCntRecBez777 : integer); // сплошным файлом
    procedure Copy1000ToDiskId(cNmDA : string);  // по 1000 записей
    procedure CopyToDiskFio;
    procedure AddRecToDbfId(cKod, cTin : string;
                     nPp, nKv, nYY, nTyp, nOznDox, nOznPilg, nOznaka : integer;
                     nSmNar, nSmDox, nSmTaxN, nSmTaxP : double;
                     dDtPriyn, dDtZviln : TDateTime);
    procedure AddSpecRecToDbfId(cKod, cTin : string;
                                        nPp, nKv, nYY, nTyp, nPhone : integer);
    procedure AddSmmRecToDbfId(cKod, cTin : string;
                                 nPp, nKv, nYY, nTyp : integer;
                                     nSmNar, nSmDox, nSmTaxN, nSmTaxP : double);
    procedure AddRecTo1000(cNP, cTIN, cFAM, cIMA, cOTCH, cS_NAR,
                        cS_DOX, cS_TAXN, cS_TAXP, cOZN_DOX, cD_PRIYN, cD_ZVILN,
                                          cOZN_PILG, cOZNAKA, cDOPREC : string);
    procedure SetLabelCntRecCaption;
  public
    { Public declarations }
  end;

procedure ShowDfPromRes(nKv, nYY : word);

const SECTION = 'z_dfZplR';

var
  FormDfPromRes: TFormDfPromRes;

implementation

uses a_Const, z_Main, z_DfMain, z_dfGtFm, z_dfGtNF, z_dfGtTn, z_dfGtZv,
                                 z_dfETin, z_dfEFio, z_DfShNu, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowDfPromRes(nKv, nYY : word);
begin
  if not bIsFormDfPromResults then begin
    FormDfPromRes := TFormDfPromRes.Create(Application);
    bIsFormDfPromResults := true;
    with FormDfPromRes do begin
      n_Kv := nKv;
      n_YY := nYY;
      StatusBar1.SimpleText := '  Директория ' + cDfDirProm;
      OpenTblId(nKv, nYY);
      if cSvTIN > '' then
        tblID.Locate('TIN', cSvTIN, []);
      OpenQryProm(nKv, nYY);
      OpenQryId2(nKv, nYY);
      OpenTblFio(nKv, nYY);
      OpenQryFio2(nKv, nYY);
      SetLabelCntRecCaption;
      Show; //Modal;
    end; end
  else begin
    if FormDfPromRes.WindowState = wsMinimized then
      FormDfPromRes.WindowState := wsNormal;
    FormDfPromRes.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.FormCreate(Sender: TObject);
begin
  LabelCntRec.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 600);
    cSvTIN := ReadString(SECTION, 'cSvTin', '');
    dbgrID.Height := ReadInteger(SECTION, 'grIdH', 300);
    dbgrFio.Height := ReadInteger(SECTION, 'grFioH', 300);
    dbgrProm.Height := ReadInteger(SECTION, 'grFPromH', 300);
    ChBoxZeroLines.Checked := ReadBool(SECTION, 'chBxZ', true);
    ChBox1000.Checked := false; //ReadBool(SECTION, 'chBx1000', true);
    ChBoxDataPodannja.Checked := ReadBool(SECTION, 'chBxDtPod', true);
    Free;
  end;
  if FileExists(cDirVids + 'DfId_x5.Vid') then
    dbgrID.Columns.LoadFromFile(cDirVids + 'DfId_x5.Vid');
  if FileExists(cDirVids + 'DfId_x6.Vid') then
    dbgrId2.Columns.LoadFromFile(cDirVids + 'DfId_x6.Vid');
  if FileExists(cDirVids + 'DfFi_x1.Vid') then
    dbgrFio.Columns.LoadFromFile(cDirVids + 'DfFi_x1.Vid');
  if FileExists(cDirVids + 'DfFi_x3.Vid') then
    dbgrFio2.Columns.LoadFromFile(cDirVids + 'DfFi_x3.Vid');
  if FileExists(cDirVids + 'Df_Prom.vid') then
    dbgrProm.Columns.LoadFromFile(cDirVids + 'Df_Prom.vid');
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormDfPromResults := false;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrID.Columns.SaveToFile(cDirVids   + 'DfId_x5.vid');
  dbgrId2.Columns.SaveToFile(cDirVids  + 'DfId_x6.vid');
  dbgrFio.Columns.SaveToFile(cDirVids  + 'DfFi_x1.vid');
  dbgrFio2.Columns.SaveToFile(cDirVids + 'DfFi_x3.vid');
  if qryProm.Active then
    dbgrProm.Columns.SaveToFile(cDirVids + 'Df_Prom.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if tblID.Active then
      WriteString(SECTION, 'cSvTin', tblIdTIN.AsString);
    WriteInteger(SECTION, 'grIdH', dbgrID.Height);
    WriteInteger(SECTION, 'grFioH', dbgrFio.Height);
    WriteInteger(SECTION, 'grFPromH', dbgrProm.Height);
    WriteBool(SECTION, 'chBxZ', ChBoxZeroLines.Checked);
    // WriteBool(SECTION, 'chBx1000', ChBox1000.Checked);
    WriteBool(SECTION, 'chBxDtPod', ChBoxDataPodannja.Checked);
    Free;
  end;
  bIsFormDfPromResults := false;
  Action := caFree;
end;
(*
//------------------------------------------------------------------------------
procedure TFormDfResults.ZplRDisplayHint(Sender: TObject);
begin
  StatusBar1.SimpleText := GetLongHint(Application.Hint);
end;
*)
//------------------------------------------------------------------------------
procedure TFormDfPromRes.OpenTblId(nKv, nYY : word);
begin
  with tblId do begin
    if Active then Close;
    DataBaseName := cDfDirProm;
    TableName := cDfFileId;
    Open;
    IndexName := 'OnTinOznDox';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.OpenQryProm(nKv, nYY : word);
begin
  if {bFlagDbg and}
              FileExists(cDfDirProm + 'tblProm.db') then with qryProm do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDfDirProm;
    DataSource := dsrcId;
    SQL.Add('Select TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg, ' +
            ' d_Priyn, d_Zviln, OZNAKA, DopRec, Sum(S_Nar) as S_NAR, ' +
            ' Sum(S_Dox) as S_DOX, Sum(S_TaxN) as S_TAXN, ' +
            ' Sum(S_TaxP) as S_TAXP from tblProm where TIN = :TIN ' +
            ' group by TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg, ' +
            ' d_Priyn, d_Zviln, OZNAKA, DopRec');
    Open;
    dbgrProm.Visible := true;
    Splitter3.Visible := true; end
  else begin
    dbgrProm.Visible := false;
    Splitter3.Visible := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.OpenQryId2(nKv, nYY : word);
begin
  with qryId2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDfDirProm;
    DataSource := dsrcId;
    SQL.Add('Select * from ' + cDfFileUni +
            ' where (TIN = :TIN) order by TIN, Ozn_Dox, fNU, cDir, Ozn_Pilg');
    Open;                              // как при объединениях в z_DfMain
  end;

end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.OpenTblFio(nKv, nYY : word);
begin
  with tblFIO do begin
    if Active then Close;
    DataBaseName := cDfDirProm;
    TableName := cDfFileFI;
    Open;
    IndexName := 'OnFIO';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.OpenQryFio2(nKv, nYY : word);
begin
  with qryFio2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDfDirProm;
    DataSource := dsrcFIO;
    SQL.Add('Select * from ' + cDfFileUni +
            ' where (TIN = :TIN) order by cDir, fNU');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.sBtnPrtClick(Sender: TObject);
var nCntPrac, nCntSuvm, nCntPorc, nCntRec, nRec, i : integer;
    cNmDA : string; nMod : double; cLastID, cPredLastID : ShortString;
    cID : ShortString;  nCntRecBez777 : integer;
begin
  if not ChBox1000.Checked then begin
    if PageControl1.ActivePage = ts1 then begin
      // печать имущих ИД
      qryId2.DataSource := nil;                          {d_CmPrt}
      with qryTmp do begin
        // Найти численность несовместителей
        if Active then Close;
        DataBaseName := tblId.DatabaseName;
        SQL.Clear;
        SQL.Add('Select distinct TIN from ' + tblId.TableName);
        if ChBoxZeroLines.Checked then
          SQL.Add(' where ((S_NAR <> 0) or (S_DOX <> 0) or ' +
                        ' (S_TAXN <> 0) or (S_TAXP <> 0) or ' +
                        ' (Ozn_Pilg = 4) or not D_Priyn is null or ' +
                        ' not D_Zviln is NULL ) and (Sovm = 0)');
        Open;
        nCntPrac := RecordCount;
        Close;
        // Найти численность совместителей
        SQL.Clear;
        SQL.Add('Select distinct TIN from ' + tblId.TableName);
        if ChBoxZeroLines.Checked then
          SQL.Add(' where ((S_NAR <> 0) or (S_DOX <> 0) or ' +
                        ' (S_TAXN <> 0) or (S_TAXP <> 0) or ' +
                        ' (Ozn_Pilg = 4) or not D_Priyn is null or ' +
                        ' not D_Zviln is NULL) and (Sovm > 0)');
        Open;
        nCntSuvm := RecordCount;
        Close;
      end;
      // копирование имущих ИД
      cNmDA := 'da150301.' + IntToStr(n_Kv);
      nCntRecBez777 := 0;
      CopyToDiskId(cNmDA, nCntRecBez777);
      F6_NewPrtID(n_Kv, n_YY, FormDfMain.qryRkvzt, tblId,
                          ChBoxZeroLines.Checked, ChBoxDataPodannja.Checked,
                                   nCntRecBez777, nCntPrac, nCntSuvm, 0, '');
      qryId2.DataSource := dsrcId; end
    else begin
      ShowMessage('Для неИмеющих ТИНы процедура не выполняется');
      // печать неимущих ИД
      //qryFio2.DataSource := nil;                          {d_CmPrt}
//      F6_PrtFio(n_Kv, n_YY, Form8Main.tblRkvzt, tblFio,
//                                     ChBoxZeroLines.Checked);
      //qryFio2.DataSource := dsrcFio;
    end; end
  else begin
    Screen.Cursor := crHourGlass;
    if PageControl1.ActivePage = ts1 then begin
      with qryTmp do begin
        if Active then Close;
        DataBaseName := tblId.DatabaseName;
        SQL.Clear;
        SQL.Add('Select distinct TIN from ' + tblId.TableName);
        if ChBoxZeroLines.Checked then
          SQL.Add(' where ((S_NAR <> 0) or (S_DOX <> 0) or ' +
                        ' (S_TAXN <> 0) or (S_TAXP <> 0) or ' +
                        ' (Ozn_Pilg = 4)) and (Sovm = 0)');
        Open;
        nCntPrac := RecordCount;
        Close;
        SQL.Clear;
        SQL.Add('Select distinct TIN from ' + tblId.TableName);
        if ChBoxZeroLines.Checked then
          SQL.Add(' where ((S_NAR <> 0) or (S_DOX <> 0) or ' +
                        ' (S_TAXN <> 0) or (S_TAXP <> 0) or ' +
                        ' (Ozn_Pilg = 4)) and (Sovm > 0)');
        Open;
        nCntSuvm := RecordCount;
        Close;
      end;
      with qry1000 do begin  // Разбивка на порции по 1000 записей
        if Active then Close;
        DataBaseName := tblId.DatabaseName;
        SQL.Clear;
        SQL.Add('Select * from ' + tblId.TableName);
        if ChBoxZeroLines.Checked then
          SQL.Add(' where (S_NAR <> 0) or (S_DOX <> 0) or ' +
                          ' (S_TAXN <> 0) or (S_TAXP <> 0) or ' +
                          ' (Ozn_Pilg = 4)');
        SQL.Add(' order by TIN, Ozn_Dox, Ozn_Pilg');
        Open;
        nCntRec := RecordCount;
        nCntPorc := nCntRec div 1000;
        nMod := nCntRec mod 1000;
        if nMod <> 0 then
          nCntPorc := nCntPorc + 1;
        nCntRec := 1000;
      end;
      with qry1000 do begin
        First;          // Один ТИН с несколькими записями может разложиться в
        cLastID := '';  // две смежных порции и посчитаться дважды. Борюсь с
        cPredLastID := 'xxxxxxxxxx';  // этим с помощью cLastID и cPredLastID
        for i := 1 to nCntPorc do begin
          Application.ProcessMessages;
          Screen.Cursor := crHourGlass;
          if tbl1000.Active then tbl1000.Close;
          tbl1000.DataBaseName := tblId.DatabaseName;
          if tbl1000.Exists then tbl1000.DeleteTable;
          tbl1000.FieldDefs := tblId.FieldDefs;
          tbl1000.CreateTable;
          tbl1000.Open;
          nRec := 0;
          while not Eof and (nRec < nCntRec) do begin
            Inc(nRec);
            cID := FieldByName('TIN').AsString;
            if Copy(cID, 1, 2) = 'БК' then
              cID := Copy(cID, 3, 10);
            AddRecTo1000(FieldByName('NP').AsString,
                         cID, //FieldByName('TIN').AsString,
                         FieldByName('FAM').AsString,
                         FieldByName('IMA').AsString,
                         FieldByName('OTCH').AsString,
                         FieldByName('S_NAR').AsString,
                         FieldByName('S_DOX').AsString,
                         FieldByName('S_TAXN').AsString,
                         FieldByName('S_TAXP').AsString,
                         FieldByName('OZN_DOX').AsString,
                         FieldByName('D_PRIYN').AsString,
                         FieldByName('D_ZVILN').AsString,
                         FieldByName('OZN_PILG').AsString,
                         FieldByName('OZNAKA').AsString,
                         FieldByName('DOPREC').AsString);
            cLastID := FieldByName('TIN').AsString;
            Next;
          end;
          cNmDA := 'da1503';
          if i < 10 then
            cNmDA := cNmDA + '0';
          cNmDA := cNmDA + IntToStr(i);
          cNmDA := cNmDA;
          Copy1000ToDiskId(cNmDA);
          Application.ProcessMessages;
          Screen.Cursor := crHourGlass;
          qryId2.DataSource := nil;
          dsrcID.DataSet := tbl1000;
          F6_NewPrtID(n_Kv, n_YY, FormDfMain.qryRkvzt, tbl1000,
                           ChBoxZeroLines.Checked, ChBoxDataPodannja.Checked,
                         nCntRecBez777, nCntPrac, nCntSuvm, i, cPredLastID);
          tbl1000.Close;
          cPredLastID := cLastID;
          Application.ProcessMessages;
          dsrcID.DataSet := tblId;
          qryId2.DataSource := dsrcID;
          Screen.Cursor := crDefault;
        end;
        Close;
      end; end
    else
      ShowMessage('Для неИмеющих ТИНы процедура не выполняется');

    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.AddRecTo1000(cNP, cTIN, cFAM, cIMA, cOTCH, cS_NAR,
                        cS_DOX, cS_TAXN, cS_TAXP, cOZN_DOX, cD_PRIYN, cD_ZVILN,
                                          cOZN_PILG, cOZNAKA, cDOPREC : string);
begin
//  if cNP = '998' then
//    ShowMessage('Вышли на cNP = ' + cNP);
  with tbl1000 do begin
    Append;
    FieldByName('NP').AsString       := cNP;
    FieldByName('TIN').AsString      := cTIN;
    FieldByName('FAM').AsString      := cFAM;
    FieldByName('IMA').AsString      := cIMA;
    FieldByName('OTCH').AsString     := cOTCH;
    FieldByName('S_NAR').AsString    :=  cS_NAR;
    FieldByName('S_DOX').AsString    :=  cS_DOX;
    FieldByName('S_TAXN').AsString   :=  cS_TAXN;
    FieldByName('S_TAXP').AsString   :=  cS_TAXP;
    FieldByName('OZN_DOX').AsString  :=  cOZN_DOX;
    FieldByName('D_PRIYN').AsString  :=  cD_PRIYN;
    FieldByName('D_ZVILN').AsString  :=  cD_ZVILN;
    FieldByName('OZN_PILG').AsString :=  cOZN_PILG;
    FieldByName('OZNAKA').AsString   :=  cOZNAKA;
    FieldByName('DOPREC').AsString   :=  cDOPREC;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.sBtnCopyDiskClick(Sender: TObject);
var cNmDA : ShortString; nCntRecBez777 : integer;
begin
  nCntRecBez777 := 0;
  if PageControl1.ActivePage = ts1 then begin
    // копирование имущих ИД
    qryId2.DataSource := nil;                          {d_CmPrt}
    cNmDA := 'da150301.' + IntToStr(n_Kv);
    CopyToDiskId(cNmDA, nCntRecBez777);
    qryId2.DataSource := dsrcId; end
  else begin
    // копирование неимущих ИД
    qryFio2.DataSource := nil;                          {d_CmPrt}
    CopyToDiskFio;
    qryFio2.DataSource := dsrcFio;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.Copy1000ToDiskId(cNmDA : string);
var cDbfTemplate, cNewFileName, cFileDA : string;
    bfEx, bSkipZero : boolean;
    nSvNr, nPp, nTyp, nPhone : integer;
    cKod, cTin, cNP : string;
    nSmNar, nSmDox, nSmTaxN, nSmTaxP : double;
begin
  if bFlagDbg then begin
    ShowMessage('Сначала надо переделать порядок извлечения шаблона' + #13#10 +
                'Смотри таблицу "Шаблоны" и процедуру' + #13#10 +
                'FormZpCmnPrt.CrePrvBankDbf(cNmPrvBnkDbf: ShortString)');
    Exit;
{
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select FVid from Ex_Tmplts ' +
              ' where KdTmpl = :nKdTmpl ');
    ParamByName('nKdTmpl').AsInteger := 320;
    Open;
    if RecordCount > 0 then
      (FieldByName('FVid') as TBlobField).SaveToFile(cNmPrvBnkDbf);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
}
  end;
  bfEx := true;
  nTyp := 0; // 0 - юр.лицо, 1 - физ.лицо
  cKod := FormDfMain.qryRkvzt.FieldByName('OrgEDRPOU').AsString;
  bSkipZero := ChBoxZeroLines.Checked;
  cDbfTemplate := cDfDirDocs + 'df1_shbl.dbf';
  cNewFileName := cDfDirResults + cNmDA + '.dbf';
  cFileDA := cDfDirResults + cNmDA + '.' + IntToStr(n_Kv);
  if not FileExists(cDbfTemplate) then begin




    ShowMessage('Не найден файл-шаблон для da1503... ' + cDbfTemplate);
    Exit;
  end;
  if FileExists(cFileDA) then
    DeleteFile(cFileDA);
  CopyFile(PChar(cDbfTemplate), PChar(cNewFileName), bfEx);
  with tblForCopy do begin
    if Active then Close;
    DataBaseName := cDfDirResults;
    TableType := ttDBase;
    TableName := cNewFileName;
    Open;
  end;
  with tbl1000 do begin
    nSvNr := FieldByName('NP').AsInteger;
    First;
    nPp := 0;
    nSmNar := 0;
    nSmDox := 0;
    nSmTaxN := 0;
    nSmTaxP := 0;
    while not Eof do begin
      if bSkipZero and (FieldByName('S_NAR').AsFloat = 0) and
                        (FieldByName('S_DOX').AsFloat = 0) and
                         (FieldByName('S_TAXN').AsFloat = 0) and
                          (FieldByName('S_TAXP').AsFloat = 0) and
                           (FieldByName('Ozn_Pilg').AsInteger <> 4) then begin
        Next;
        Continue;
      end;
      Inc(nPp);
      cTin := FieldByName('TIN').AsString;
      if FieldByName('NP').AsInteger < 99990 then
        cNP := IntToStr(nPp)
      else
        cNP := FieldByName('NP').AsString;
      AddRecToDbfId(cKod, cTin, nPp, n_Kv, n_YY, nTyp,
                     FieldByName('Ozn_Dox').AsInteger,
                      FieldByName('Ozn_Pilg').AsInteger,
                       FieldByName('Oznaka').AsInteger,
                        FieldByName('S_NAR').AsFloat,
                         FieldByName('S_DOX').AsFloat,
                          FieldByName('S_TAXN').AsFloat,
                           FieldByName('S_TAXP').AsFloat,
                             FieldByName('d_Priyn').AsDateTime,
                              FieldByName('d_Zviln').AsDateTime);
      nSmNar := nSmNar + FieldByName('S_NAR').AsFloat;
      nSmDox := nSmDox + FieldByName('S_DOX').AsFloat;
      nSmTaxN := nSmTaxN + FieldByName('S_TAXN').AsFloat;
      nSmTaxP := nSmTaxP + FieldByName('S_TAXP').AsFloat;
      Next;
    end;
    // Добавить "спец"-строки
    nPp := 99991;
    cTin := FormDfMain.qryRkvzt.FieldByName('Dir_ID').AsString;
    nPhone := StrToInt(FormDfMain.qryRkvzt.FieldByName('Dir_Phone').AsString);
    AddSpecRecToDbfId(cKod, cTin, nPp, n_Kv, n_YY, nTyp, nPhone);
    nPp := 99992;
    cTin := FormDfMain.qryRkvzt.FieldByName('Buh_ID').AsString;
    nPhone := StrToInt(FormDfMain.qryRkvzt.FieldByName('Buh_Phone').AsString);
    AddSpecRecToDbfId(cKod, cTin, nPp, n_Kv, n_YY, nTyp, nPhone);
    nPp := 99999;
    cTin := '';
    AddSmmRecToDbfId(cKod, cTin, nPp, n_Kv, n_YY, nTyp,
                                           nSmNar, nSmDox, nSmTaxN, nSmTaxP);
    Locate('NP', nSvNR, []);
  end;
  tblForCopy.Close;
//  Rename(cNewFileName, FileDa);
  CopyFile(PChar(cNewFileName), PChar(cFileDa), bfEx);
  if FileExists(cFileDa) then
    DeleteFile(cNewFileName);
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.CopyToDiskId(cNmDA : ShortString;
                                                  var nCntRecBez777 : integer);
var cDbfTemplate, cNewFileName : string;
    bfEx, bSkipZero : boolean;
    nSvNr, nPp, nTyp, nPhone : integer;
    cKod, cTin : string;
    nSmNar, nSmDox, nSmTaxN, nSmTaxP : double;
begin
  bfEx := true;
  nTyp := 0; // 0 - юр.лицо, 1 - физ.лицо
  cKod := FormDfMain.qryRkvzt.FieldByName('OrgEDRPOU').AsString;
  bSkipZero := ChBoxZeroLines.Checked;
  cDbfTemplate := 'da_tmplt.dbf';
  cNewFileName := cDfDirResults + cNmDA;
  if FileExists(cNewFileName) then
    DeleteFile(cNewFileName);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select FVid from Ex_Tmplts ' +
              ' where NmTmpl = :cNmTmpl ');
    ParamByName('cNmTmpl').AsString := cDbfTemplate;
    Open;
    if RecordCount > 0 then
      (FieldByName('FVid') as TBlobField).SaveToFile(cNewFileName);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with tblForCopy do begin
    if Active then Close;
    DataBaseName := cDfDirResults;
    TableType := ttDBase;
    TableName := cNmDA;
    Open;
  end;
  with tblId do begin
    nSvNr := FieldByName('NR').AsInteger;
    First;
    nPp := 0;
    nSmNar  := 0;
    nSmDox  := 0;
    nSmTaxN := 0;
    nSmTaxP := 0;
    nCntRecBez777 := 0;
    while not Eof do begin
      if bSkipZero and (FieldByName('S_NAR').AsFloat = 0) and
                        (FieldByName('S_DOX').AsFloat = 0) and
                         (FieldByName('S_TAXN').AsFloat = 0) and
                          (FieldByName('S_TAXP').AsFloat = 0) and
                           (FieldByName('Ozn_Pilg').AsInteger <> 4) then begin
        Next;
        Continue;
      end;
      if FieldByName('Ozn_Dox').AsInteger = 777 then begin
        Next;
        Continue;
      end;
      Inc(nPp);
      Inc(nCntRecBez777);
      cTin := FieldByName('TIN').AsString;
      if Copy(cTin, 1, 2) = 'БК' then
        cTin := Copy(cTin, 3, 10);
      AddRecToDbfId(cKod, cTin, nPp, n_Kv, n_YY, nTyp,
                     FieldByName('Ozn_Dox').AsInteger,
                      FieldByName('Ozn_Pilg').AsInteger,
                       FieldByName('Oznaka').AsInteger,
                        FieldByName('S_NAR').AsFloat,
                         FieldByName('S_DOX').AsFloat,
                          FieldByName('S_TAXN').AsFloat,
                           FieldByName('S_TAXP').AsFloat,
                             FieldByName('d_Priyn').AsDateTime,
                              FieldByName('d_Zviln').AsDateTime);
      nSmNar  := nSmNar  + FieldByName('S_NAR').AsFloat;
      nSmDox  := nSmDox  + FieldByName('S_DOX').AsFloat;
      nSmTaxN := nSmTaxN + FieldByName('S_TAXN').AsFloat;
      nSmTaxP := nSmTaxP + FieldByName('S_TAXP').AsFloat;
      Next;
    end;
    nPp := 99991;
    cTin := FormDfMain.qryRkvzt.FieldByName('Dir_ID').AsString;
    nPhone := StrToInt(FormDfMain.qryRkvzt.FieldByName('Dir_Phone').AsString);
    AddSpecRecToDbfId(cKod, cTin, nPp, n_Kv, n_YY, nTyp, nPhone);
    nPp := 99992;
    cTin := FormDfMain.qryRkvzt.FieldByName('Buh_ID').AsString;
    nPhone := StrToInt(FormDfMain.qryRkvzt.FieldByName('Buh_Phone').AsString);
    AddSpecRecToDbfId(cKod, cTin, nPp, n_Kv, n_YY, nTyp, nPhone);
    nPp := 99999;
    cTin := '';
    AddSmmRecToDbfId(cKod, cTin, nPp, n_Kv, n_YY, nTyp,
                                           nSmNar, nSmDox, nSmTaxN, nSmTaxP);


    Locate('NR', nSvNR, []);
  end;
  tblForCopy.Close;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.AddSpecRecToDbfId(cKod, cTin : string;
                                        nPp, nKv, nYY, nTyp, nPhone : integer);
begin
  with tblForCopy do begin
    Append;
    FieldByName('NP').AsInteger := nPp;
    FieldByName('Period').AsInteger := nKv;
    FieldByName('Rik').AsInteger := nYY;
    FieldByName('Kod').AsString := cKod;
    FieldByName('Typ').AsInteger := nTyp;
    FieldByName('TIN').AsString := cTin;
    FieldByName('S_DOX').AsFloat := nPhone;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.AddSmmRecToDbfId(cKod, cTin : string;
                                          nPp, nKv, nYY, nTyp : integer;
                                     nSmNar, nSmDox, nSmTaxN, nSmTaxP : double);
begin
  with tblForCopy do begin
    Append;
    FieldByName('NP').AsInteger := nPp;
    FieldByName('Period').AsInteger := nKv;
    FieldByName('Rik').AsInteger := nYY;
    FieldByName('Kod').AsString := cKod;
    FieldByName('Typ').AsInteger := nTyp;
    FieldByName('TIN').AsString := cTin;
    FieldByName('S_NAR').AsFloat := nSmNar;
    FieldByName('S_DOX').AsFloat := nSmDox;
    FieldByName('S_TAXN').AsFloat := nSmTaxN;
    FieldByName('S_TAXP').AsFloat := nSmTaxP;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.AddRecToDbfId(cKod, cTin : string;
                     nPp, nKv, nYY, nTyp, nOznDox, nOznPilg, nOznaka : integer;
                     nSmNar, nSmDox, nSmTaxN, nSmTaxP : double;
                     dDtPriyn, dDtZviln : TDateTime);
begin
  with tblForCopy do begin
    Append;
    FieldByName('NP').AsInteger := nPp;
    FieldByName('Period').AsInteger := nKv;
    FieldByName('Rik').AsInteger := nYY;
    FieldByName('Kod').AsString := cKod;
    FieldByName('Typ').AsInteger := nTyp;
    FieldByName('TIN').AsString := cTin;
    FieldByName('S_NAR').AsFloat := nSmNar;
    FieldByName('S_DOX').AsFloat := nSmDox;
    FieldByName('S_TAXN').AsFloat := nSmTaxN;
    FieldByName('S_TAXP').AsFloat := nSmTaxP;
    FieldByName('OZN_DOX').AsInteger := nOznDox;
    if dDtPriyn <> 0 then
      FieldByName('D_PRIYN').AsDateTime := dDtPriyn;
    if dDtZviln <> 0 then
      FieldByName('D_ZVILN').AsDateTime := dDtZviln;
    FieldByName('OZN_PILG').AsInteger := nOznPilg;
    FieldByName('Oznaka').AsInteger := nOznaka;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.CopyToDiskFio;
begin
  ShowMessage('Для неИмеющих ТИНы процедура не выполняется');
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.dbgrId2DblClick(Sender: TObject);
begin
   ShowDfNu(qryId2.FieldByName('cDir').AsString,
             qryId2.FieldByName('fNU').AsInteger,
              n_Kv, n_YY,
               qryId2.FieldByName('TabN').AsInteger);  {z_DfShNu}
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.dbgrFio2DblClick(Sender: TObject);
begin
//   ShowDfNu(qryFio2.FieldByName('cDir').AsString,
//           qryFio2.FieldByName('fNU').AsString,
//           qryFio2.FieldByName('TabN').AsInteger);  {z_DfShNu}
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.popPopup(Sender: TObject);
begin
  if pop.PopupComponent = dbgrID then
    popEdt.Enabled := tblId.RecordCount > 0
  else if pop.PopupComponent = dbgrFio then
    popEdt.Enabled := tblFio.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  if pop.PopupComponent = dbgrID then with tblID do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    if EAZplID(tblID) {z_dfETin} then
      Post
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
    end
  else if pop.PopupComponent = dbgrFio then with tblFio do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    if EAZplFio(tblFio) {z_dfEFio} then
      Post
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.popEdtClick(Sender: TObject);
begin
  if pop.PopupComponent = dbgrID then with tblID do begin
    Edit;
    if EAZplID(tblID) {z_dfETin} then
      Post
    else
      Cancel;
    end
  else if pop.PopupComponent = dbgrFio then with tblFio do begin
    Edit;
    if EAZplFio(tblFio) {z_dfEFio} then
      Post
    else
      Cancel;
    end
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.popDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                       mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    if pop.PopupComponent = dbgrID then
      tblId.Delete
    else if pop.PopupComponent = dbgrFio then
      tblFio.Delete
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.SetLabelCntRecCaption;
begin
  if (PageControl1.ActivePage = ts1) and tblId.Active then begin
    PanelTools.Visible := true;
    LabelCntRec.Caption := 'Записей всего ' + IntToStr(tblId.RecordCount); end
  else if (PageControl1.ActivePage = ts2) and tblFio.Active then begin
    PanelTools.Visible := true;
    LabelCntRec.Caption := 'Записей всего ' + IntToStr(tblFio.RecordCount); end
  else
    LabelCntRec.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.PageControl1Change(Sender: TObject);
begin
  SetLabelCntRecCaption;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.popEdtInTableClick(Sender: TObject);
begin
  if not popEdtInTable.Checked then begin
    popEdtInTable.Checked := true;
    dbgrId.Options := dbgrId.Options + [dgEditing];
    dbgrId.Color := clInfoBk; end
  else begin
    popEdtInTable.Checked := false;
    dbgrId.Options := dbgrId.Options - [dgEditing];
    dbgrId.Color := clWindow;
  end;
  Panel2.Visible := popEdtInTable.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.popPoiskByTinClick(Sender: TObject);
var cTIN : string;
begin
  if Get_Tin(cTin) {z_dfGtTn} then begin
    if not tblId.Locate('TIN', cTin, []) then
      ShowMessage('Нет ТИН''а ' + cTin + ' в таблице');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.popPoiskByFamClick(Sender: TObject);
var cFam : string; nNr : integer;
begin
  if GetFam(cFam) {z_dfGtFm} then begin                    {z_dfGtNF}
    if GetFamNR(nNR, tblId.DatabaseName, tblId.TableName, cFam) then begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      tblId.Locate('NR', nNR, []);
      Screen.Cursor := crDefault;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.popPoiskWithDUvolnClick(Sender: TObject);
var nNr : integer;
begin
  if GetZviln(nNR, tblId.DatabaseName, tblId.TableName) {z_dfGtZv} then begin
    Screen.Cursor := crSQLWait;
    Application.ProcessMessages;
    tblId.Locate('NR', nNR, []);
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.bBtnExitClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.dbgrIDDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrID.Canvas do begin
    if not (gdFocused in State) then begin
      if (tblIdOzn_Dox.AsInteger = 777) then
        Font.Color := clSilver;
    end;
  end;
  dbgrID.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.dbgrPromDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrProm.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryPromOzn_Dox.AsInteger = 777) then
        Font.Color := clSilver;
    end;
  end;
  dbgrProm.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormDfPromRes.dbgrId2DrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrId2.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryId2Ozn_Dox.AsInteger = 777) then
        Font.Color := clSilver;
    end;
  end;
  dbgrId2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
