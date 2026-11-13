unit z_ShPere;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  Math, DBClient, Provider, DBTables, Menus, ComCtrls, DBCtrls;

type
  TFormShwPere = class(TForm)
    cdsSps: TClientDataSet;
    qryTmp: TQuery;
    dsrcSps: TDataSource;
    cdsSpsNR: TAutoIncField;
    cdsSpsTabN: TIntegerField;
    cdsSpsFamIO: TStringField;
    cdsSpsKdObj: TSmallintField;
    cdsSpsShObj: TStringField;
    cdsSpsNmObj: TStringField;
    cdsSpsKdKatP: TSmallintField;
    cdsSpsShKatP: TStringField;
    cdsSpsNmKatP: TStringField;
    qryPere: TQuery;
    dsrcTmp: TDataSource;
    cdsSpsDt_Beg: TDateField;
    cdsSpsOklTrf: TFloatField;
    cdsSpsNwDtBeg: TDateField;
    cdsSpsNwKdObj: TSmallintField;
    cdsSpsNwKdKatP: TSmallintField;
    cdsSpsNwOklTrf: TFloatField;
    cdsSpsNrPrikaza: TStringField;
    cdsSpsDtPrikaza: TDateField;
    pop: TPopupMenu;
    popSpsSort: TMenuItem;
    popSpsSortTabN: TMenuItem;
    popSpsSortFamIO: TMenuItem;
    popSpsSortKdObjTabN: TMenuItem;
    popSpsSortKdObjFamIO: TMenuItem;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Panel1: TPanel;
    sBtnCreSps: TSpeedButton;
    sBtnZadanie: TSpeedButton;
    sBtnSavePere: TSpeedButton;
    LabelCntRec: TLabel;
    LabelSort: TLabel;
    dbgrSps: TDBGrid;
    qryPktPere: TQuery;
    dsrcPktPere: TDataSource;
    dbgrPktPere: TDBGrid;
    qryPktPereNR: TIntegerField;
    qryPktPereNRPKT: TIntegerField;
    qryPktPereDTVPKT: TDateTimeField;
    qryPktPereKDUSR: TSmallintField;
    qryPktPereMYNOTES: TStringField;
    updPktPere: TUpdateSQL;
    popPktPere: TPopupMenu;
    qryPktPereNmUsr: TStringField;
    popPktPereAdd: TMenuItem;
    popPktPereHead: TMenuItem;
    popPktPereDel: TMenuItem;
    popSpsDel: TMenuItem;
    cdsSpsSaved: TBooleanField;
    Panel2: TPanel;
    bBtnClose: TBitBtn;
    sBtnGoBack: TSpeedButton;
    cdsSpsPrcWrkTime: TFloatField;
    cdsSpsSO: TSmallintField;
    cdsSpsAvans: TFloatField;
    cdsSpsSp_Av: TStringField;
    cdsSpsKdDolgn: TSmallintField;
    cdsSpsDolgnost: TStringField;
    cdsSpsKdSpZ: TSmallintField;
    cdsSpsPr_Pens: TSmallintField;
    cdsSpsSovm: TSmallintField;
    cdsSpsPdNlg: TSmallintField;
    cdsSpsProcLg: TFloatField;
    cdsSpsKolMin: TSmallintField;
    cdsSpsPrfs: TSmallintField;
    cdsSpsNotes: TStringField;
    cdsSpsInv: TSmallintField;
    cdsSpsRang: TSmallintField;
    cdsSpsRazr: TSmallintField;
    cdsSpsDt_End: TDateField;
    cdsSpsOldKdObj: TSmallintField;
    cdsSpsPrDekr: TStringField;
    cdsSpsCmbOkl: TStringField;
    cdsSpsNrPkt: TIntegerField;
    cdsSpsKdSps: TSmallintField;
    cdsSpsDtVPkt: TDateField;
    qrySvPere: TQuery;
    updSvPere: TUpdateSQL;
    qryShwPere: TQuery;
    dsrcShwPere: TDataSource;
    Splitter1: TSplitter;
    dbgrShwPere: TDBGrid;
    qryShwPereNR: TIntegerField;
    qryShwPereKDSPS: TSmallintField;
    qryShwPereTABN: TIntegerField;
    qryShwPereDT_BEG: TDateTimeField;
    qryShwPereKDOBJ: TSmallintField;
    qryShwPereKDKATP: TSmallintField;
    qryShwPerePRCWRKTIME: TFloatField;
    qryShwPereSO: TSmallintField;
    qryShwPereOKLTRF: TFloatField;
    qryShwPereAVANS: TFloatField;
    qryShwPereSP_AV: TStringField;
    qryShwPereKDDOLGN: TSmallintField;
    qryShwPereDOLGNOST: TStringField;
    qryShwPereKDSPZ: TSmallintField;
    qryShwPerePR_PENS: TSmallintField;
    qryShwPereSOVM: TSmallintField;
    qryShwPerePDNLG: TSmallintField;
    qryShwPerePROCLG: TFloatField;
    qryShwPereKOLMIN: TSmallintField;
    qryShwPerePRFS: TSmallintField;
    qryShwPereNR_PRIKAZA: TStringField;
    qryShwPereDT_PRIKAZA: TDateTimeField;
    qryShwPereNOTES: TStringField;
    qryShwPereINV: TSmallintField;
    qryShwPereRANG: TSmallintField;
    qryShwPereRAZR: TSmallintField;
    qryShwPereDT_END: TDateTimeField;
    qryShwPereOLDKDOBJ: TSmallintField;
    qryShwPerePRDEKR: TStringField;
    qryShwPereCMBOKL: TStringField;
    qryShwPereSPEC_NR: TIntegerField;
    qryShwPereNRPKT: TIntegerField;
    qryShwPereDTVPKT: TDateTimeField;
    qryShwPereFamIO: TStringField;
    sBtnAddPktPere: TSpeedButton;
    sBtnDelPktPere: TSpeedButton;
    sBtnEdtPktPere: TSpeedButton;
    updShwPere: TUpdateSQL;
    popShwSort: TMenuItem;
    popShwDel: TMenuItem;
    pop_ShwEdt: TMenuItem;
    popShwSortFIO: TMenuItem;
    popShwSortTabN: TMenuItem;
    popShwSortObjFIO: TMenuItem;
    popShwSortObjTabN: TMenuItem;
    LabelShwPereCntRec: TLabel;
    LabelShwPereSort: TLabel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    LbxObj: TListBox;
    LbxKatP: TListBox;
    qryIs8802: TQuery;
    qryAdd8802: TQuery;
    qryShwPereNPD: TSmallintField;
    cdsSpsNPD: TSmallintField;
    cdsSpsKdTemu: TSmallintField;
    cdsSpsOldKdOk: TSmallintField;
    cdsSpsNewKdOk: TSmallintField;
    qryShwPereKDTEMU: TSmallintField;
    qryShwPereCODE: TStringField;
    qryShwPereZ_KPP: TStringField;
    qryShwPereNOINDX: TStringField;
    qryShwPereOLDKDOK: TSmallintField;
    qryShwPereNEWKDOK: TSmallintField;
    qryShwPereBM: TStringField;
    cdsSpsBM: TStringField;
    LabelBM: TLabel;
    qryShwPereDTBM: TDateTimeField;
    cdsSpsDtBM: TDateField;
    qryShwPereIS_PERE: TStringField;
    cdsSpsIS_PERE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnCreSpsClick(Sender: TObject);
    procedure popSpsSortTabNClick(Sender: TObject);
    procedure popSpsSortFamIOClick(Sender: TObject);
    procedure popSpsSortKdObjTabNClick(Sender: TObject);
    procedure popSpsSortKdObjFamIOClick(Sender: TObject);
    procedure sBtnZadanieClick(Sender: TObject);
    procedure qryPktPereCalcFields(DataSet: TDataSet);
    procedure popPktPerePopup(Sender: TObject);
    procedure sBtnSavePereClick(Sender: TObject);
    procedure popSpsDelClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnGoBackClick(Sender: TObject);
    procedure popPktPereAddClick(Sender: TObject);
    procedure dbgrPktPereDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryShwPereCalcFields(DataSet: TDataSet);
    procedure popPktPereDelClick(Sender: TObject);
    procedure qryPktPereAfterScroll(DataSet: TDataSet);
    procedure sBtnEdtPktPereClick(Sender: TObject);
    procedure qryPktPereBeforeScroll(DataSet: TDataSet);
    procedure popShwSortTabNClick(Sender: TObject);
    procedure popShwSortFIOClick(Sender: TObject);
    procedure popShwSortObjTabNClick(Sender: TObject);
    procedure popShwSortObjFIOClick(Sender: TObject);
    procedure popShwDelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryShwPereAfterPost(DataSet: TDataSet);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbgrShwPereDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    n_KdSps : SmallInt;
    bIsVvodZadanija, bPktSaved : boolean;
    nMyNewNrPkt : integer;
    bBM : boolean;
    cDtBM : ShortString;
    procedure OpenQryPktPere;
    procedure OpenQryShwPere;
    procedure SetSpsSortMode;
    function MyNewOklTrf(nOldOklTrf, nProcOklTrf : double;
                                  nRoundCase : SmallInt) : double;
    function MyNewNrPktPere : integer;
    procedure OpenQrySvPere;
    procedure SaveNewRec;
    procedure AddVid8802(nTabN : integer; nKdSps : SmallInt;
                               dDtPrc, dZaMG : TDateTime; cNotes : ShortString);
    procedure SetDbgrShwPereEditMode;
  public
    { Public declarations }
  end;

procedure ShwPere(dDtProc : TDateTime; nKdSps : SmallInt);

const SECTION = 'z_ShPere';

var
  FormShwPere: TFormShwPere;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main, z_TUpi, z_VbObKt, z_GtDats, z_qPere;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwPere(dDtProc : TDateTime; nKdSps : SmallInt);
begin
  FormShwPere := TFormShwPere.Create(Application);
  with FormShwPere do begin
    Caption := 'Работа с перемещениями';
    d_DtPrc := dDtProc;
    n_KdSps := nKdSps;
    bIsVvodZadanija := false;
    bPktSaved := false;
    OpenQryPktPere;
    OpenQryShwPere;
    LabelShwPereCntRec.Caption := 'Записей ' + IntToStr(qryShwPere.RecordCount);
    sBtnAddPktPere.Enabled := DmMain.InCtrlMes;
    sBtnEdtPktPere.Enabled := DmMain.InCtrlMes and qryPktPere.Active and
                                (qryPktPere.RecordCount > 0) and
                                    (qryPktPereKdUsr.AsInteger = nAppKdUsr);
    sBtnDelPktPere.Enabled := sBtnEdtPktPere.Enabled;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.OpenQryPktPere;
begin
  with qryPktPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ZZ_PerePkt order by DtVPkt, NrPkt');
    // позже, когда наберется побольше записей, подумать об условии выборки
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.OpenQryShwPere;
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryShwPere do begin
    if Active then begin
      nSvNR := FieldByName('NR').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPktPere;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, p.* from Z_Pere p ' +
            ' Left outer join z_upi u on u.TabN = p.TabN ' +
            ' where p.NrPkt = :NrPkt');
    if popShwSortTabN.Checked then begin
      SQL.Add('order by p.TabN');
      LabelShwPereSort.Caption := 'Сортировка по Таб.номеру'; end
    else if popShwSortFIO.Checked then begin
      SQL.Add('order by u.Fam, u.Ima, u.Otch');
      LabelShwPereSort.Caption := 'Сортировка по Фамилии И.О.'; end
    else if popShwSortObjTabN.Checked then begin
      SQL.Add('order by p.KdObj, p.TabN');
      LabelShwPereSort.Caption := 'Сортировка: подразд., Таб.н-р'; end
    else if popShwSortObjFIO.Checked then begin
      SQL.Add('order by p.KdObj, u.Fam, u.Ima, u.Otch');
      LabelShwPereSort.Caption := 'Сортировка: подразд., Фамилия И.О.'; end
    else begin
      SQL.Add('order by NR');
      LabelShwPereSort.Caption := '';
    end;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
  end;
end;                                 
//------------------------------------------------------------------------------
procedure TFormShwPere.FormCreate(Sender: TObject);
var nSortMode, nShwSortMode : SmallInt;
begin
  LabelCntRec.Caption := '';
  LabelSort.Caption := '';
  LabelShwPereCntRec.Caption := '';
  LabelShwPereSort.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 350);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 400);
    dbgrPktPere.Width := ReadInteger(SECTION, 'grPktW', 225);
    nSortMode := ReadInteger(SECTION, 'nSort', 3);
    nShwSortMode := ReadInteger(SECTION, 'nShwSort', 1);
    Free;
  end;
  if nSortMode = 1 then begin
    popSpsSortTabN.Checked := true;
    popSpsSortFamIO.Checked := false;
    popSpsSortKdObjTabN.Checked := false;
    popSpsSortKdObjFamIO.Checked := false; end
  else if nSortMode = 2 then begin
    popSpsSortTabN.Checked := false;
    popSpsSortFamIO.Checked := true;
    popSpsSortKdObjTabN.Checked := false;
    popSpsSortKdObjFamIO.Checked := false; end
  else if nSortMode = 3 then begin
    popSpsSortTabN.Checked := false;
    popSpsSortFamIO.Checked := false;
    popSpsSortKdObjTabN.Checked := true;
    popSpsSortKdObjFamIO.Checked := false; end
  else begin
    popSpsSortTabN.Checked := false;
    popSpsSortFamIO.Checked := false;
    popSpsSortKdObjTabN.Checked := false;
    popSpsSortKdObjFamIO.Checked := true;
  end;
  if nShwSortMode = 1 then begin
    popShwSortTabN.Checked := true;
    popShwSortFIO.Checked := false;
    popShwSortObjTabN.Checked := false;
    popShwSortObjFIO.Checked := false; end
  else if nShwSortMode = 2 then begin
    popShwSortTabN.Checked := false;
    popShwSortFIO.Checked := true;
    popShwSortObjTabN.Checked := false;
    popShwSortObjFIO.Checked := false; end
  else if nShwSortMode = 3 then begin
    popShwSortTabN.Checked := false;
    popShwSortFIO.Checked := false;
    popShwSortObjTabN.Checked := true;
    popShwSortObjFIO.Checked := false; end
  else begin
    popShwSortTabN.Checked := false;
    popShwSortFIO.Checked := false;
    popShwSortObjTabN.Checked := false;
    popShwSortObjFIO.Checked := true;
  end;
  if FileExists(cDirVids + 'MsPe_01.vid') then
    dbgrPktPere.Columns.LoadFromFile(cDirVids + 'MsPe_01.vid');
  if FileExists(cDirVids + 'MP_Sh04.vid') then
    dbgrShwPere.Columns.LoadFromFile(cDirVids + 'MP_Sh04.vid');
  if FileExists(cDirVids + 'MsPere08.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'MsPere08.vid');
  ts1.TabVisible := false;   // bFlagDbg;
  ts2.TabVisible := false;   // bFlagDbg;
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryPktPere.Active then
    dbgrPktPere.Columns.SaveToFile(cDirVids + 'MsPe_01.vid');
  if qryShwPere.Active then
    dbgrShwPere.Columns.SaveToFile(cDirVids + 'MP_Sh04.vid');
  if cdsSps.Active then
    dbgrSps.Columns.SaveToFile(cDirVids + 'MsPere08.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if popSpsSortTabN.Checked then
      WriteInteger(SECTION, 'nSort', 1)
    else if popSpsSortFamIO.Checked then
      WriteInteger(SECTION, 'nSort', 2)
    else if popSpsSortKdObjTabN.Checked then
      WriteInteger(SECTION, 'nSort', 3)
    else
      WriteInteger(SECTION, 'nSort', 4);
    if popShwSortTabN.Checked then
      WriteInteger(SECTION, 'nShwSort', 1)
    else if popShwSortFIO.Checked then
      WriteInteger(SECTION, 'nShwSort', 2)
    else if popShwSortObjTabN.Checked then
      WriteInteger(SECTION, 'nShwSort', 3)
    else
      WriteInteger(SECTION, 'nShwSort', 4);
    WriteInteger(SECTION, 'grPktW', dbgrPktPere.Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.sBtnCreSpsClick(Sender: TObject);
var mLstObj, mLstKatP : TStrings;
    i : integer;
    dDtPrm, dDtUvln, dStartDtPere : TDateTime;
    cSQL, cDopSQL, cNmObj, cShKatP : string;
begin
  if not Get_Dates(dDtPrm, dDtUvln, dStartDtPere) {z_GtDats} then
    Exit;

  // Костыль !!!
  if (dDtPrm = 0) then
    dDtPrm := Date;
  if (dDtUvln = 0) then
    dDtUvln := Date + 30;
//  if (dStartDtPere = 0) then
//    dStartDtPere := dDtPrm;

  mLstObj := LbxObj.Items;
  mLstKatP := LbxKatP.Items;
  mLstObj.Clear;
  mLstKatP.Clear;
  if VbObjKat('Выбор подразделений и персонала для ведомости',
                     n_KdSps, mLstObj, mLstKatP) {z_VbObKt} then begin

    with cdsSps do begin
      if Active then Close;
      IndexDefs.Clear;
      IndexName := '';
      CreateDataSet;
      Open;
    end;
    sBtnCreSps.Enabled := false;
    bIsVvodZadanija := false;
    cdsSps.DisableControls;
    Application.ProcessMessages;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      cSQL :=
          'Select p.TABN, u.Fam, u.Ima, u.Otch, p.Dt_Priem, p.dt_Uvoln, ' +
          ' wp.*, pere.IS_PERE from Z_PrmUv p ' +
          ' Left Outer Join z_Upi u on (u.TabN = p.TabN) ' +
//          ' Left Outer Join GetWrkPereOnDate(p.TabN, :dDtPrc) wp on 1 = 1 ' +
          ' Left Outer Join GetWrkPereOnDate(p.TabN, :dDtPrm) wp on 1 = 1 ' +
          ' left join z_pere pere on pere.NR = wp.NR ' +
          ' where (p.dt_Priem <= :dDtPrm) and ' +
          ' ((p.Dt_Uvoln is Null) or (p.Dt_Uvoln >= :dDtUvln)) ';
      if (mLstObj.Count > 0) then begin
        cDopSQL := ' and (wp.KdObj in (';
        for i := 0 to mLstObj.Count-1 do begin
          cDopSQL := cDopSQL + mLstObj[i];
          if i < mLstObj.Count-1 then
            cDopSQL := cDopSQL + ',';
        end;
        cDopSQL := cDopSQL + ')) ';
        cSQL := cSQL + cDopSQL;
      end;
      if (mLstKatP.Count > 0) then begin
        cDopSQL := ' and (wp.KdKatP in (';
        for i := 0 to mLstKatP.Count-1 do begin
          cDopSQL := cDopSQL + mLstKatP[i];
          if i < mLstKatP.Count-1 then
            cDopSQL := cDopSQL + ',';
        end;
        cDopSQL := cDopSQL + ')) ';
        cSQL := cSQL + cDopSQL;
      end;
      SQL.Add(cSQL);
      SQL.Add(' order by u.Fam, u.Ima, u.Otch');
//      ParamByName('dDtPrc').AsDateTime := dStartDtPere;  //d_DtPrc;
      ParamByName('dDtPrm').AsDateTime := dDtPrm;
      ParamByName('dDtUvln').AsDateTime := dDtUvln;
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      if bFlagDbg then
        SQL.SaveToFile(cDirTemp + 'SpsPere.sql');
      Open;
      while not Eof do begin
        cdsSps.Append;
        // в cdsSps приходится переписать все данные из qryTmp,
        // чтобы, в случае последующего сохранения, не искать их вновь
        cdsSpsTabN.AsInteger      := FieldByName('TabN').AsInteger;
        cdsSpsFamIO.AsString      := MyFamIO(FieldByName('Fam').AsString,
                                          FieldByName('Ima').AsString,
                                            FieldByName('Otch').AsString);
        cdsSpsDt_Beg.AsDateTime   := FieldByName('Dt_Beg').AsDateTime;
        cdsSpsOklTrf.AsFloat      := FieldByName('OklTrf').AsFloat;
        cdsSpsKdObj.AsInteger     := FieldByName('KdObj').AsInteger;
        cdsSpsShObj.AsString      :=
                      DmMain.KdObj2ShObj(cdsSpsKdObj.AsInteger, cNmObj);
        cdsSpsNmObj.AsString      := cNmObj;
        cdsSpsKdKatP.AsInteger    := FieldByName('KdKatP').AsInteger;
        cdsSpsNmKatP.AsString     :=
                   DmMain.KdKatP2NmKatP(cdsSpsKdKatP.AsInteger, cShKatP);
        cdsSpsShKatP.AsString     := cShKatP;
        cdsSpsKdSps.AsString      := FieldByName('KdSps').AsString;
        cdsSpsPrcWrkTime.AsString := FieldByName('PrcWrkTime').AsString;
        cdsSpsSO.AsString         := FieldByName('SO').AsString;
        cdsSpsAvans.AsString      := FieldByName('Avans').AsString;
        cdsSpsSp_Av.AsString      := FieldByName('Sp_Av').AsString;
        cdsSpsKdDolgn.AsString    := FieldByName('KdDolgn').AsString;
        cdsSpsDolgnost.AsString   := FieldByName('Dolgnost').AsString;
        cdsSpsKdSpZ.AsString      := FieldByName('KdSpZ').AsString;
        cdsSpsPr_Pens.AsString    := FieldByName('Pr_Pens').AsString;
        cdsSpsNPD.AsString        := FieldByName('NPD').AsString;
        cdsSpsSovm.AsString       := FieldByName('Sovm').AsString;
        cdsSpsPdNlg.AsString      := FieldByName('PdNlg').AsString;
        cdsSpsProcLg.AsString     := FieldByName('ProcLg').AsString;
        cdsSpsKolMin.AsString     := FieldByName('KolMin').AsString;
        cdsSpsPrfs.AsString       := FieldByName('Prfs').AsString;
        cdsSpsNotes.AsString      := FieldByName('Notes').AsString;
        cdsSpsInv.AsString        := FieldByName('Inv').AsString;
        cdsSpsRang.AsString       := FieldByName('Rang').AsString;
        cdsSpsRazr.AsString       := FieldByName('Razr').AsString;
        cdsSpsDt_End.AsString     := FieldByName('Dt_End').AsString;
        cdsSpsOldKdObj.AsString   := FieldByName('OldKdObj').AsString;
        cdsSpsPrDekr.AsString     := FieldByName('PrDekr').AsString;
        cdsSpsCmbOkl.AsString     := FieldByName('CmbOkl').AsString;

        cdsSpsKdTemu.AsString     := FieldByName('KdTemu').AsString;
        cdsSpsOldKdOk.AsString    := FieldByName('OldKdOk').AsString;
        cdsSpsNewKdOk.AsString    := FieldByName('NewKdOk').AsString;

        cdsSpsNrPkt.AsString      := qryPktPere.FieldByName('NrPkt').AsString;
        cdsSpsDtVPkt.AsString     := qryPktPere.FieldByName('DtVPkt').AsString;

        cdsSpsIS_PERE.AsString    := FieldByName('IS_PERE').AsString;

        cdsSps.Post;
        Next;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    with cdsSps do begin
      AddIndex('OnTabN', 'TabN', []);
      AddIndex('OnFamIO', 'FamIO', [ixCaseInsensitive]);
      AddIndex('OnKdObjTabN', 'KdObj;TabN', []);
      AddIndex('OnKdObjFamIO', 'KdObj;FamIO', [ixCaseInsensitive]);
      SetSpsSortMode;
      First;
      EnableControls;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    end;
    sBtnZadanie.Enabled := true;
  end;
  Screen.Cursor := crDefault;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.SetSpsSortMode;
begin
  if popSpsSortTabN.Checked then begin
    LabelSort.Caption := 'Сортировка по Таб.номеру';
    cdsSps.IndexName := 'OnTabN'; end
  else if popSpsSortFamIO.Checked then begin
    LabelSort.Caption := 'Сортировка по Фамилии И.О.';
    cdsSps.IndexName := 'OnFamIO'; end
  else if popSpsSortKdObjTabN.Checked then begin
    LabelSort.Caption := 'Сортировка: КодПодразд; Таб.н-р';
    cdsSps.IndexName := 'OnKdObjTabN'; end
  else begin
    LabelSort.Caption := 'Сортировка: КодПодразд; Фамилия И.О.';
    cdsSps.IndexName := 'OnKdObjFamIO';
  end
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popSpsSortTabNClick(Sender: TObject);
begin
  if not popSpsSortTabN.Checked then begin
    popSpsSortTabN.Checked := true;
    popSpsSortFamIO.Checked := false;
    popSpsSortKdObjTabN.Checked := false;
    popSpsSortKdObjFamIO.Checked := false;
    SetSpsSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popSpsSortFamIOClick(Sender: TObject);
begin
  if not popSpsSortFamIO.Checked then begin
    popSpsSortTabN.Checked := false;
    popSpsSortFamIO.Checked := true;
    popSpsSortKdObjTabN.Checked := false;
    popSpsSortKdObjFamIO.Checked := false;
    SetSpsSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popSpsSortKdObjTabNClick(Sender: TObject);
begin
  if not popSpsSortKdObjTabN.Checked then begin
    popSpsSortTabN.Checked := false;
    popSpsSortFamIO.Checked := false;
    popSpsSortKdObjTabN.Checked := true;
    popSpsSortKdObjFamIO.Checked := false;
    SetSpsSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popSpsSortKdObjFamIOClick(Sender: TObject);
begin
  if not popSpsSortKdObjFamIO.Checked then begin
    popSpsSortTabN.Checked := false;
    popSpsSortFamIO.Checked := false;
    popSpsSortKdObjTabN.Checked := false;
    popSpsSortKdObjFamIO.Checked := true;
    SetSpsSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.sBtnZadanieClick(Sender: TObject);
var dNwDtBeg, dDtBM, dDtPrikaza : TDateTime;
    nNwKdObj, nNwKdKatP, nOklTrfCase, nRoundCase : SmallInt;
    nNwOklTrf, nProcOklTrf : double;
    cNrPrikaza : ShortString;
    {bBM,} bOldKdObj, bOldKdKatP, bAdd8802, bTrKn: boolean;
    nSvNR : integer;
begin
  bIsVvodZadanija := false;
  bBM := false;
  if GetQryPere(dNwDtBeg, dDtBM, dDtPrikaza, nNwKdObj, nNwKdKatP,   {z_qPere}
                         nOklTrfCase, nRoundCase, nProcOklTrf, nNwOklTrf,
                    cNrPrikaza, cDtBM, bBM, bOldKdObj, bOldKdKatP, bAdd8802, bTrKn) then begin
    with cdsSps do begin
      nSvNR := cdsSpsNR.AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        Edit;
        if bBM then
          cdsSpsBM.AsString := 'Y'
        else
          cdsSpsBM.AsString := ' ';

        if bTrKn then
          cdsSpsIS_PERE.AsString := 'Y'
        else
          cdsSpsIS_PERE.AsString := ' ';

        cdsSpsNwDtBeg.AsDateTime := dNwDtBeg;
        if dDtPrikaza <> 0 then
          cdsSpsDtPrikaza.AsDateTime := dDtPrikaza;
        cdsSpsNrPrikaza.AsString := cNrPrikaza;
        cdsSpsDtBM.AsString := cDtBM;
        if bBM then
          LabelBM.Caption := 'Базовые перемещения'
        else
          LabelBM.Caption := '';
        if bOldKdObj then
          cdsSpsNwKdObj.AsInteger := cdsSpsKdObj.AsInteger
        else if nNwKdObj <> 0 then
          cdsSpsNwKdObj.AsInteger := nNwKdObj;    // иначе останется пустым
        if bOldKdKatP then
          cdsSpsNwKdKatP.AsInteger := cdsSpsKdKatP.AsInteger
        else if nNwKdKatP <> 0 then
          cdsSpsNwKdKatP.AsInteger := nNwKdKatP;  // иначе останется пустым
        if nOklTrfCase = 1 {оставить старые оклады} then
          cdsSpsNwOklTrf.AsFloat := cdsSpsOklTrf.AsFloat
        else if nOklTrfCase = 2 {оставить оклады пустыми} then
          cdsSpsNwOklTrf.AsString := ''
        else if nOklTrfCase = 3 {оклады - фикс.суммы} then
          cdsSpsNwOklTrf.AsFloat := nNwOklTrf
        else if nOklTrfCase = 4 {изменить на заданный процент} then begin
          nNwOklTrf := MyNewOklTrf(cdsSpsOklTrf.AsFloat,
                                                    nProcOklTrf, nRoundCase);
          cdsSpsNwOklTrf.AsFloat := nNwOklTrf;
        end;
        Post;
        bIsVvodZadanija := true;
        Next;
      end;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
      EnableControls;
    end;
    sBtnSavePere.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
function TFormShwPere.MyNewOklTrf(nOldOklTrf, nProcOklTrf : double;
                                  nRoundCase : SmallInt) : double;
begin
  Result := nOldOklTrf + nOldOklTrf * nProcOklTrf / 100;
  if nRoundCase = 1 {округлять до целых "по правилам"} then
    Result := Round(Result)
  else if nRoundCase = 2 {округлять до 2-х зн. "по правилам"} then
    Result := RoundTo(Result, -2)
  else if nRoundCase = 3 {обрезать дробные до целых} then
    Result := Round(Result - 0.5)
  else if nRoundCase = 4 {добавлять до след. целого} then
    Result := Round(Result + 0.5);
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.qryPktPereCalcFields(DataSet: TDataSet);
var nKdKatUsr : integer; cNmUsr, cPswUsr, cVkl : string;
begin
  if Form_Dm.GetUsrInfo(qryPktPereKdUsr.AsInteger, nKdKatUsr, cNmUsr,
                                                    cPswUsr, cVkl) then
    qryPktPereNmUsr.AsString := cNmUsr;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popPktPerePopup(Sender: TObject);
begin
  popPktPereAdd.Enabled := DmMain.InCtrlMes and qryPktPere.Active;
  popPktPereDel.Enabled := popPktPereAdd.Enabled and
                                  (qryPktPereKdUsr.AsInteger = nAppKdUsr);
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.sBtnSavePereClick(Sender: TObject);
var bIsChanges : boolean; nSvNR, nSvNrPkt : integer;
    nCntRec, nCntSaved, nCntChangedRec : SmallInt;
    cMsg : ShortString;
begin
  bIsChanges := false;
  with cdsSps do begin
    nSvNR := cdsSpsNR.AsInteger;
    DisableControls;
    First;
    nCntChangedRec := 0;
    while not Eof do begin
      if (cdsSpsIS_PERE.AsString = 'Y') or
       not cdsSpsNwKdObj.IsNull and not cdsSpsNwKdKatP.IsNull and not cdsSpsNwOklTrf.IsNull
          and (
            (cdsSpsNwKdObj.AsInteger <> cdsSpsKdObj.AsInteger)
            or (cdsSpsNwKdKatP.AsInteger <> cdsSpsKdKatP.AsInteger)
            or (cdsSpsNwOklTrf.AsFloat <> cdsSpsOklTrf.AsFloat)
          ) then begin
        bIsChanges := true;
        Inc(nCntChangedRec);
        //Break;
      end;
      Next;
    end;
    EnableControls;
    if not bIsChanges then begin
      ShowMessage('Нет записей, пригодных к сохранению');
      Locate('NR', nSvNR, []); end
    else begin
      if nCntChangedRec <> cdsSps.RecordCount then begin
        cMsg := 'Всего записей: ' + IntToStr(cdsSps.RecordCount) +
               ', будет сохранено записей: ' + IntToStr(nCntChangedRec) +
               '.' + #13#10 +
               'По остальным не обнаружено изменений.  Продолжить сохранение?:';
        if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
      end;
      OpenQrySvPere;
      First;
      nCntRec := 0;
      nCntSaved := 0;
      // определить NrPkt для нового пакета (сейчас там стоит -1)
      nMyNewNrPkt := MyNewNrPktPere;
      while not Eof do begin
        Inc(nCntRec);
        if (cdsSpsIS_PERE.AsString = 'Y')
            or not cdsSpsNwKdObj.IsNull and not cdsSpsNwKdKatP.IsNull and
            not cdsSpsNwOklTrf.IsNull and
            (
              (cdsSpsNwKdObj.AsInteger <> cdsSpsKdObj.AsInteger) or
              (cdsSpsNwKdKatP.AsInteger <> cdsSpsKdKatP.AsInteger) or
              (cdsSpsNwOklTrf.AsFloat <> cdsSpsOklTrf.AsFloat)
            ) and
            not cdsSpsSaved.AsBoolean then begin
          Inc(nCntSaved);
          Edit;
          cdsSpsSaved.AsBoolean := true;
          Post;
          bPktSaved := true;
          SaveNewRec;  // Сохранить в БД
          //============================
        end;
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
      ShowMessage('Из ' + IntToStr(nCntRec) + ' записей сохранено ' +
                                                    IntToStr(nCntSaved));
      sBtnSavePere.Enabled := false;
      sBtnZadanie.Enabled := false;
      if qrySvPere.UpdatesPending then begin
        Form_Dm.DbMain.ApplyUpdates([qrySvPere]);
        qryPktPere.Edit;
        qryPktPereNrPkt.AsInteger := nMyNewNrPkt; // чтобы присвоился только
        qryPktPere.Post;                          // в момент сохранения
        nSvNrPkt := nMyNewNrPkt;
        Form_DM.DbMain.ApplyUpdates([qryPktPere]);
        qryPktPere.Close;
        qryPktPere.Open;
        qryPktPere.Locate('NrPkt', nSvNrPkt, []);
      end;
      qrySvPere.Close;
    end;
  end;

end;
//------------------------------------------------------------------------------
procedure TFormShwPere.sBtnGoBackClick(Sender: TObject);
begin
  if bIsVvodZadanija and not bPktSaved and
         (MessageDlg('Работа не записана на диск. Возвращаться "Назад"?:',
                                  mtWarning, [mbYes, mbNo], 0) <> mrYes) then
    Exit;
  if not bPktSaved then
    qryPktPere.Delete;  // без Apply
  nMyNewNrPkt := -1;
  bIsVvodZadanija := false;
  sBtnCreSps.Enabled := true;
  sBtnZadanie.Enabled := false;
  sBtnSavePere.Enabled := false;
  LabelCntRec.Caption := '';
  LabelSort.Caption := '';
  if cdsSps.Active then
    cdsSps.Close;
  Caption := 'Работа с перемещенииями';
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.OpenQrySvPere;
begin
  with qrySvPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from Z_Pere');
    Open;
    CachedUpdates := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.SaveNewRec;
var cLogMsg : ShortString;
begin
  with qryIs8802 do begin
    if Active then Close;
    SQL.Clear;  // Есть ли в отклонениях запись с кодом 8802 (пересчёт)
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Otkl where DtProc = :dDtPrc and ' +
            ' TabN = :nTabN and VidN = "8802" and ZaMesGod <= :dZaMG');
    Prepare;
  end;
  with qryAdd8802 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' PdN, Notes, PrPV) values (:nKdSps, :dDtPrc, :dZaMG, :nTabN, ' +
            ' "8802", 1, :cNotes, 1)');
    Prepare;
  end;


  with qrySvPere do begin
    Append;
    FieldByName('BM').AsString         := cdsSpsBM.AsString;
    FieldByName('KdSps').AsString      := cdsSpsKdSps.AsString;
    FieldByName('TabN').AsString       := cdsSpsTabN.AsString;
    FieldByName('Dt_Beg').AsString     := cdsSpsNwDtBeg.AsString;
    FieldByName('KdObj').AsString      := cdsSpsNwKdObj.AsString;
    FieldByName('KdKatP').AsString     := cdsSpsNwKdKatP.AsString;
    FieldByName('PrcWrkTime').AsString := cdsSpsPrcWrkTime.AsString;
    FieldByName('SO').AsString         := cdsSpsSO.AsString;
    FieldByName('OklTrf').AsString     := cdsSpsNwOklTrf.AsString;
    FieldByName('Avans').AsString      := cdsSpsAvans.AsString;
    FieldByName('SP_AV').AsString      := cdsSpsSp_Av.AsString;
    FieldByName('KdDolgn').AsString    := cdsSpsKdDolgn.AsString;
    FieldByName('Dolgnost').AsString   := cdsSpsDolgnost.AsString;
    FieldByName('KdSpZ').AsString      := cdsSpsKdSpZ.AsString;
    FieldByName('Pr_Pens').AsString    := cdsSpsPr_Pens.AsString;
    FieldByName('NPD').AsString        := cdsSpsNPD.AsString;
    FieldByName('Sovm').AsString       := cdsSpsSovm.AsString;
    FieldByName('PdNlg').AsString      := cdsSpsPdNlg.AsString;
    FieldByName('ProcLg').AsString     := cdsSpsProcLg.AsString;
    FieldByName('KolMin').AsString     := cdsSpsKolMin.AsString;
    FieldByName('Prfs').AsString       := cdsSpsPrfs.AsString;
    FieldByName('Nr_Prikaza').AsString := cdsSpsNrPrikaza.AsString;
    FieldByName('Dt_Prikaza').AsString := cdsSpsDtPrikaza.AsString;
    FieldByName('Notes').AsString      := gc_AppNmUsr + ' ' + DateTimeToStr(Now);
    FieldByName('Inv').AsString        := cdsSpsInv.AsString;
    FieldByName('Rang').AsString       := cdsSpsRang.AsString;
    FieldByName('Razr').AsString       := cdsSpsRazr.AsString;
    FieldByName('DtBM').AsString := cdsSpsDtBM.AsString;

    if (cdsSpsIS_PERE.AsString <> '') and (cdsSpsIS_PERE.AsString <> ' ') then
      FieldByName('IS_PERE').AsString := 'Y';

    FieldByName('KdTemu').AsString     := cdsSpsKdTemu.AsString;
    if not cdsSpsNewKdOk.IsNull and
                                (cdsSpsNewKdOk.AsString > '') then
      FieldByName('OldKdOk').AsString    := cdsSpsNewKdOk.AsString
    else
      FieldByName('OldKdOk').AsString    := cdsSpsOldKdOk.AsString;

    if not cdsSpsNewKdOk.IsNull and
                                (cdsSpsNewKdOk.AsString > '') then
      FieldByName('NewKdOk').AsString    := cdsSpsNewKdOk.AsString
    else
      FieldByName('NewKdOk').AsString    := cdsSpsOldKdOk.AsString;

    FieldByName('Dt_End').AsString     := '';
    FieldByName('OldKdObj').AsString   := '';
    FieldByName('PrDekr').AsString     := '';
    FieldByName('CmbOkl').AsString     := '';
    FieldByName('NrPkt').AsInteger     := nMyNewNrPkt;
    FieldByName('DtVPkt').AsString     := cdsSpsDtVPkt.AsString;
    Post;
    cLogMsg := 'TabN = ' + cdsSpsTabN.AsString +
               ', DtBeg = ' + cdsSpsNwDtBeg.AsString +
               ', KdObj = ' + cdsSpsNwKdObj.AsString +
               ', KatP = ' + cdsSpsNwKdKatP.AsString +
               ', KdZpZ = ' + cdsSpsKdSpZ.AsString +
               ', OklTrf = ' + cdsSpsNwOklTrf.AsString +
               ', NrPkt = ' + IntToStr(nMyNewNrPkt) +
               ', DtVPkt = ' + cdsSpsDtVPkt.AsString;
    DmMain.AddLog(Now, cdsSpsTabN.AsInteger,
                        'Массов.перемещ.', gc_AppNmUsr, 'Z_Pere', cLogMsg);
    if FieldByName('Dt_Beg').AsDateTime < dCtrlDate then
      AddVid8802(FieldByName('TabN').AsInteger, FieldByName('KdSps').AsInteger,
                 dCtrlDate, FieldByName('Dt_Beg').AsDateTime, gc_AppNmUsr);
  end;
  with qryIs8802 do begin
    if Active then Close;
    if Prepared then UnPrepare;
  end;
  with qryAdd8802 do begin
    if Active then Close;
    if Prepared then UnPrepare;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.AddVid8802(nTabN : integer; nKdSps : SmallInt;
                               dDtPrc, dZaMG : TDateTime; cNotes : ShortString);
var bIsVid8802 : boolean;
begin
  // Проверить, нет ли уже записи с видом 8802 и нужными DtProc и ZaMesGod.
  with qryIs8802 do begin
    Close;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dZaMG').AsDateTime  := dZaMG;
    Open;
    bIsVid8802 := RecordCount > 0;
    Close;
  end;   // Если нет - добавить.
  if not bIsVid8802 then with qryAdd8802 do begin
    ParamByName('nKdSps').AsInteger  := nKdSps;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('dZaMG').AsDateTime  := dZaMG;
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('cNotes').AsString   := cNotes;
    ExecSQL;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popSpsDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbNo, mbYes], 0) = mrYes then
    cdsSps.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popPopup(Sender: TObject);
begin
  if pop.PopupComponent = dbgrSps then begin
    popSpsSort.Visible := true;
    popSpsDel.Visible  := true;
    popSpsSort.Enabled := cdsSps.Active and (cdsSps.RecordCount > 0);
    popSpsDel.Enabled  := popSpsSort.Enabled;
    popShwSort.Visible := false;
    //pop_ShwEdt.Visible  := false;
    popShwDel.Visible  := false; end
  else if pop.PopupComponent = dbgrShwPere then begin
    popShwSort.Visible := true;
    popShwDel.Visible  := true;
    //pop_ShwEdt.Visible  := true;
    popShwSort.Enabled := qryShwPere.Active and (qryShwPere.RecordCount > 0);
    popShwDel.Enabled  := popShwSort.Enabled and sBtnEdtPktPere.Down;
                                   // (qryPktPereKdUsr.AsInteger = nAppKdUsr);
    //pop_ShwEdt.Enabled  := popShwDel.Enabled;
    popSpsSort.Visible := false;
    popSpsDel.Visible  := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm: ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrSps.Canvas do begin
    if not (gdFocused in State) then begin
      if cdsSpsSaved.AsBoolean then
        Brush.Color := clInfoBk
      else
        Brush.Color := clWindow;
      if (cFldNm = 'BM') and (cdsSpsBM.AsString = 'Y') then
        Brush.Color := clFuchsia;
    end;
  end;
  dbgrSps.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
function TFormShwPere.MyNewNrPktPere : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(NRPKT) as MaxNR from ZZ_PEREPKT');
    Open;
    if (RecordCount > 0) and (not FieldByName('MaxNR').IsNull) then
      Result := FieldByName('MaxNR').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popPktPereAddClick(Sender: TObject);
begin
  with qryPktPere do begin
    Append;
    FieldByName('NrPkt').AsInteger   := -1;  // MyNewNrPktPere;
    FieldByName('DtVPkt').AsDateTime := Date;
    FieldByName('KdUsr').AsInteger   := nAppKdUsr;
    FieldByName('MyNotes').AsString  := gc_AppNmUsr;
    Post;   // Apply произойдет в случае сохранения пакета
  end;
  bPktSaved := false;
  Caption := 'Временная таблица для подготовки пакета перемещений';
  sBtnCreSps.Enabled := true;
  sBtnZadanie.Enabled := false;
  sBtnSavePere.Enabled := false;
  LabelCntRec.Caption := '';
  LabelSort.Caption := '';
  LabelBM.Caption := '';
  PageControl1.ActivePage := ts2;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.dbgrPktPereDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrPktPere.Canvas do begin
    if not (gdFocused in State) then begin
      if qryPktPereKdUsr.AsInteger = nAppKdUsr then begin
        Font.Color := clWindowText;
        Font.Style := [fsBold]; end
      else begin
        Font.Color := clNavy;
        Font.Style := [];
      end;
    end;
  end;
  dbgrPktPere.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.qryShwPereCalcFields(DataSet: TDataSet);
var cFamIO, cFam, cIma, cOtch, cPol, cID : string; dDOB : TDateTime;
begin
  if DmMain.GetUpiInfo(qryShwPereTabN.AsInteger, cFamIO,    {z_Dm}
                                        cFam, cIma, cOtch, cPol, cID, dDOB) then
    qryShwPereFamIO.AsString := cFamIO;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popPktPereDelClick(Sender: TObject);
var nSVNR : integer;  cLogMsg : ShortString;
begin
  if MessageDlg('Будут безвозвратно удалены все записи,' +
                 #13#10 + 'введенные этим пакетом.     Согласны?:', mtWarning,
                 [mbYes, mbNo], 0) = mrYes then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Delete from Z_Pere where NrPkt = :nNrPkt');
      ParamByName('nNrPkt').AsInteger := qryPktPereNrPkt.AsInteger;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    nSvNR := 0;
    cLogMsg := 'Удален пакет перемещений: NrPkt = ' + qryPktPereNrPkt.AsString +
               ', DtVPkt = ' + qryPktPereDtVPkt.AsString;
    DmMain.AddLog(Now, 0, 'Массов.перемещ.', gc_AppNmUsr, 'Z_Pere', cLogMsg);
    with qryPktPere do begin
      Delete;
      if not Eof then
        nSvNR := FieldByName('NR').AsInteger;
      Form_Dm.DbMain.ApplyUpdates([qryPktPere]);
      Close;
      Open;
      if nSvNR > 0 then
        Locate('NR', nSvNR, [])
      else
        Last;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.qryPktPereAfterScroll(DataSet: TDataSet);
begin
  sBtnAddPktPere.Enabled := DmMain.InCtrlMes;
  sBtnEdtPktPere.Enabled := DmMain.InCtrlMes and qryPktPere.Active and
                                (qryPktPere.RecordCount > 0) and
                                    (qryPktPereKdUsr.AsInteger = nAppKdUsr);
  sBtnDelPktPere.Enabled := sBtnEdtPktPere.Enabled;
  if qryShwPere.Active and (qryShwPere.RecordCount <> 0) then
    LabelShwPereCntRec.Caption := 'Записей ' + IntToStr(qryShwPere.RecordCount)
  else
    LabelShwPereCntRec.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.sBtnEdtPktPereClick(Sender: TObject);
begin
  SetDbgrShwPereEditMode;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.SetDbgrShwPereEditMode;
begin
  if (dgEditing in dbgrShwPere.Options) then begin
    dbgrShwPere.Options := dbgrShwPere.Options - [dgEditing];
    //qryShwPere.CachedUpdates := false;
    dbgrShwPere.Color := clWindow; end
  else begin
    dbgrShwPere.Options := dbgrShwPere.Options + [dgEditing];
    dbgrShwPere.Color := clInfoBk;
    //qryShwPere.CachedUpdates := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.qryPktPereBeforeScroll(DataSet: TDataSet);
begin
  if (dgEditing in dbgrShwPere.Options) then begin
    dbgrShwPere.Options := dbgrShwPere.Options - [dgEditing];
    //qryShwPere.CachedUpdates := false;
    dbgrShwPere.Color := clWindow;
    sBtnEdtPktPere.Down := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popShwSortTabNClick(Sender: TObject);
begin
  if not popShwSortTabN.Checked then begin
    popShwSortTabN.Checked := true;
    popShwSortFIO.Checked := false;
    popShwSortObjTabN.Checked := false;
    popShwSortObjFIO.Checked := false;
    OpenQryShwPere;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popShwSortFIOClick(Sender: TObject);
begin
  if not popShwSortFIO.Checked then begin
    popShwSortTabN.Checked := false;
    popShwSortFIO.Checked := true;
    popShwSortObjTabN.Checked := false;
    popShwSortObjFIO.Checked := false;
    OpenQryShwPere;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popShwSortObjTabNClick(Sender: TObject);
begin
  if not popShwSortObjTabN.Checked then begin
    popShwSortTabN.Checked := false;
    popShwSortFIO.Checked := false;
    popShwSortObjTabN.Checked := true;
    popShwSortObjFIO.Checked := false;
    OpenQryShwPere;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popShwSortObjFIOClick(Sender: TObject);
begin
  if not popShwSortObjFIO.Checked then begin
    popShwSortTabN.Checked := false;
    popShwSortFIO.Checked := false;
    popShwSortObjTabN.Checked := false;
    popShwSortObjFIO.Checked := true;
    OpenQryShwPere;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.popShwDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbNo, mbYes], 0) = mrYes then begin
    qryShwPere.Delete;
    Form_Dm.DbMain.ApplyUpdates([qryShwPere]);
    LabelShwPereCntRec.Caption := 'Записей ' + IntToStr(qryShwPere.RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.FormKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где нужно, пользуйтесь контекстными меню');
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.qryShwPereAfterPost(DataSet: TDataSet);
begin
  if sBtnEdtPktPere.Down then
    Form_Dm.DbMain.ApplyUpdates([qryShwPere]);
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormShwPere.dbgrShwPereDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrShwPere.Canvas do begin
    if not (gdFocused in State) then begin
      cFldNm := UpperCase(Column.FieldName);
      if (cFldNm = 'PRCWRKTIME') and (not Column.Field.IsNull) and
                                            (Column.Field.AsFloat <> 100) then
        Font.Color := clRed
      else begin                         {оклад из нескольких частей}
        if dbgrShwPere.DataSource.DataSet.FieldByName('CmbOkl').AsString = '1' then
          Font.Color := clBlue
        else
          Font.Color := clWindowText;
      end;
      if (cFldNm = 'BM') and
           (not Column.Field.IsNull and (Column.Field.AsString = 'Y')) then
        Brush.Color := clFuchsia;

      if (cFldNm = 'DTBM') and
           (not Column.Field.IsNull) then
        Brush.Color := clFuchsia;

      if cFldNm = 'SMCMBOKL' then
        Font.Color := clMaroon;
      if (cFldNm = 'SMCMBOKL') and
         (dbgrShwPere.DataSource.DataSet.FieldByName('NoIndx').AsString = '1') then
        Brush.Color := clLime;
    end;
  end;
  dbgrShwPere.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
