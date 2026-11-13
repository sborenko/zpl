unit z_ShANdb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, ExtCtrls, Grids, DBGrids, DB, DBTables, StdCtrls,
  Buttons, Menus, ComCtrls;

type
  TFormShwANadb = class(TForm)
    Panel1: TPanel;
    qryNdb: TQuery;
    dsrcNdb: TDataSource;
    dbgrNdb: TDBGrid;
    bBtnCancel: TBitBtn;
    LabelCntRec: TLabel;
    qryNdbFAM: TStringField;
    qryNdbIMA: TStringField;
    qryNdbOTCH: TStringField;
    qryNdbSHVIDN: TStringField;
    qryNdbNR: TIntegerField;
    qryNdbKDSPS: TSmallintField;
    qryNdbSPSRSCH: TSmallintField;
    qryNdbTABN: TIntegerField;
    qryNdbVIDN: TStringField;
    qryNdbOLDKDVIDN: TSmallintField;
    qryNdbSUMPROC: TFloatField;
    qryNdbSP: TStringField;
    qryNdbPRCSOVM: TFloatField;
    qryNdbDT_BEG: TDateTimeField;
    qryNdbDT_END: TDateTimeField;
    qryNdbOLDKDOBJ: TSmallintField;
    qryNdbKDOBJ: TSmallintField;
    qryNdbKDKATP: TSmallintField;
    qryNdbPRCHS: TStringField;
    qryNdbPRSMM: TStringField;
    qryNdbKDSPZ: TSmallintField;
    qryNdbSPEC_NR: TIntegerField;
    qryNdbNOTES: TStringField;
    qryNdbNRPRBEG: TStringField;
    qryNdbDTPRBEG: TDateTimeField;
    qryNdbNRPREND: TStringField;
    qryNdbDTPREND: TDateTimeField;
    qryNdbNRPKT: TIntegerField;
    qryNdbDTVPKT: TDateTimeField;
    qryNdbFamIO: TStringField;
    pop: TPopupMenu;
    popOrder: TMenuItem;
    popOrderByTabN: TMenuItem;
    popOrderByFIO: TMenuItem;
    popOrderByObjFIO: TMenuItem;
    popOrderByDtUvoln: TMenuItem;
    popOrderByKatPFIO: TMenuItem;
    popEdtNdb: TMenuItem;
    sBtnPrt: TSpeedButton;
    popReOpen: TMenuItem;
    popPrt: TMenuItem;
    updNdb: TUpdateSQL;
    qryNdbSPZ: TStringField;
    qryNdbSHOBJ: TStringField;
    qryNdbNMKATP: TStringField;
    LabelOrder: TLabel;
    DateTimePick: TDateTimePicker;
    Label1: TLabel;
    sBtnF7: TSpeedButton;
    popPrmUv: TMenuItem;
    dbgrPrmUv: TDBGrid;
    qryPrmUv: TQuery;
    dsrcPrmUv: TDataSource;
    qryPrmUvTABN: TIntegerField;
    qryPrmUvDT_PRIEM: TDateTimeField;
    qryPrmUvDT_UVOLN: TDateTimeField;
    qryPrmUvNOTES: TStringField;
    qryNdbISWRK: TSmallintField;
    qryNdbDT_PRIEM: TDateTimeField;
    qryNdbDT_UVOLN: TDateTimeField;
    qryNdbPRC_WT: TFloatField;
    qryNdbGRP: TSmallintField;
    qryNdbSPOV_MERGE: TStringField;
    procedure qryNdbCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popOrderByTabNClick(Sender: TObject);
    procedure popOrderByFIOClick(Sender: TObject);
    procedure sBrnReOpenClick(Sender: TObject);
    procedure popEdtNdbClick(Sender: TObject);
    procedure popOrderByObjFIOClick(Sender: TObject);
    procedure DbGridEnter(Sender: TObject);
    procedure DbGridExit(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure sBtnF7Click(Sender: TObject);
    procedure dbgrNdbKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure popPrmUvClick(Sender: TObject);
    procedure qryNdbAfterScroll(DataSet: TDataSet);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure popOrderByDtUvolnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure popOrderByKatPFIOClick(Sender: TObject);
  private
    { Private declarations }
    n_Mes, n_God : SmallInt;
    m_LstVids : TStringList;
    d_SvDtEnd : TDateTime;
    n_SvTabN : integer;
    procedure OpenQryNdb(nMes, nGod : SmallInt; mLstVids : TStringList);
    procedure OpenQryPrmUv;
    procedure Edt_Ndb;
    procedure SetPrmUvState;
    procedure CheckAndRunSortMenu(itemToCheck: TMenuItem);
  public
    { Public declarations }
  end;

procedure ShwActualNdb(nMes, nGod : SmallInt; mLstVids : TStringList);

const SECTION = 'z_ShANdb';

var
  FormShwANadb: TFormShwANadb;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, Z_ENadb, z_CmnPrt, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwActualNdb(nMes, nGod : SmallInt; mLstVids : TStringList);
begin
  FormShwANadb := TFormShwANadb.Create(Application);
  with FormShwANadb do begin
    n_Mes := nMes;
    n_God := nGod;
    m_LstVids := mLstVids;
    Caption := 'Надбавки и доплаты, актуальные в ' +
                                 MesPredl(nMes) + ' ' + IntToStr(nGod) +
                                 ' г. (по выбранным видам)';
    DateTimePick.Date := d_SvDtEnd;
    OpenQryNdb(nMes, nGod, mLstVids);
    if n_SvTabN > 0 then
      qryNdb.Locate('TabN', n_SvTabN, []);
    OpenQryPrmUv;
    SetPrmUvState;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.OpenQryNdb(nMes, nGod: SmallInt; mLstVids: TStringList);
var nSvNR : integer; i : SmallInt;
    cVids : string; dDtBegM, dDtEndM : TDateTime;
begin
  Screen.Cursor := crSQLWait;
  Application.ProcessMessages;
  dDtBegM := EncodeDate(nGod, nMes, 1);
  dDtEndM := MyLastDOM(dDtBegM);
  cVids := '(';
  for i := 0 to mLstVids.Count-1 do begin
    cVids := cVids + mLstVids[i];
    if i < mLstVids.Count-1 then
      cVids := cVids + ',';
  end;
  cVids := cVids + ')';
  nSvNR := 0;
  with qryNdb do begin
    if Active then begin
      nSvNR := qryNdbNR.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, v.ShVidN, s.SchBU as SPZ, ' +
            ' kp.ShKatP as NmKatP, ko.ShObj, n.*, w.* from z_Nadb n ' +
            ' Left outer join z_Upi u on u.TabN = n.TabN ' +
            ' Left outer join z_KdVidN v on v.VidN = n.VidN ' +
            ' Left Outer Join Kd_Sbu s on s.KdSch = n.KdSpZ ' +
            ' Left Outer Join Z_KatPers kp on kp.KdKatP = n.KdKatP ' +
            ' Left Outer Join z_KdObj ko on ko.KdObj = n.KdObj ' +
            ' Left Outer Join Z_ISWRK (n.TabN, :dDtBegM) w on 1=1 ' +
            ' where n.Dt_Beg <= :dDtEndM and ' +
            ' (n.Dt_End is Null or n.Dt_End >= :dDtBegM) and ' +
            ' VidN in ' + cVids );
    if popOrderByTabN.Checked then begin
      LabelOrder.Caption := 'Сортировка по табельному номеру';
      SQL.Add('order by n.TabN, n.VidN'); end
    else if popOrderByFIO.Checked then begin
      LabelOrder.Caption := 'Сортировка по Фамилии И.О.';
      SQL.Add('order by u.Fam, u.Ima, u.Otch, n.TabN, n.VidN'); end
    else if popOrderByObjFIO.Checked then begin
      LabelOrder.Caption := 'Сортировка: Подразделение, Кат.перс., Фамилия И.О.';
      SQL.Add('order by n.KdObj, n.KdKatP, u.Fam, u.Ima, u.Otch, n.TabN, n.VidN'); end
    else if popOrderByDtUvoln.Checked then begin
      LabelOrder.Caption := 'Сортировка: Дате Увольнения, Фамилия И.О.';
      SQL.Add('order by w.Dt_Uvoln, u.Fam, u.Ima, u.Otch, n.TabN, n.VidN');
    end else if popOrderByKatPFIO.Checked then begin
      LabelOrder.Caption := 'Сортировка: Кат. персонала, Подразд., Фамилия И.О.';
      SQL.Add('order by n.KdKatP, n.KdObj, u.Fam, u.Ima, u.Otch, n.VidN');
    end;
    ParamByName('dDtBegM').AsDateTime := dDtBegM;
    ParamByName('dDtEndM').AsDateTime := dDtEndM;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'ShANdb.sql');
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    Screen.Cursor := crSQLWait;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.qryNdbCalcFields(DataSet: TDataSet);
begin
  qryNdbFamIO.AsString := MyFamIO(qryNdbFam.AsString, qryNdbIma.AsString,
                                                          qryNdbOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.FormCreate(Sender: TObject);
var nSortCase : SmallInt;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 800);
    d_SvDtEnd := ReadDate(SECTION, 'dSvDtEnd', Date);
    n_SvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    nSortCase := ReadInteger(SECTION, 'nSortCase', 0);
    popPrmUv.Checked := ReadBool(SECTION, 'bPrmUv', true);
    Free;
  end;
  popOrderByTabN.Checked := nSortCase = 0;
  popOrderByFIO.Checked := nSortCase = 1;
  popOrderByObjFIO.Checked := nSortCase = 2;
  popOrderByDtUvoln.Checked := nSortCase = 3;
  popOrderByKatPFIO.Checked := nSortCase = 4;
  if FileExists(cDirVids + 'ShANdb03.vid') then
    dbgrNdb.Columns.LoadFromFile(cDirVids + 'ShANdb03.vid');
  if FileExists(cDirVids + 'ShAPrUv2.vid') then
    dbgrPrmUv.Columns.LoadFromFile(cDirVids + 'ShAPrUv2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrNdb.Columns.SaveToFile(cDirVids + 'ShANdb03.vid');
  dbgrPrmUv.Columns.SaveToFile(cDirVids + 'ShAPrUv2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteDate(SECTION, 'dSvDtEnd', dateTimePick.Date);
    WriteInteger(SECTION, 'nSvTabN', qryNdbTabN.AsInteger);
    WriteBool(SECTION, 'bPrmUv', popPrmUv.Checked);
    if popOrderByTabN.Checked then
      WriteInteger(SECTION, 'nSortCase', 0)
    else if popOrderByFIO.Checked then
      WriteInteger(SECTION, 'nSortCase', 1)
    else if popOrderByObjFIO.Checked then
      WriteInteger(SECTION, 'nSortCase', 2)
    else if popOrderByDtUvoln.Checked then
      WriteInteger(SECTION, 'nSortCase', 3)
    else {popOrderByKatPFIO.Checked}
      WriteInteger(SECTION, 'nSortCase', 4);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShwANadb.popOrderByTabNClick(Sender: TObject);
begin
  if not popOrderByTabN.Checked then begin
    CheckAndRunSortMenu(popOrderByTabN)
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShwANadb.popOrderByFIOClick(Sender: TObject);
begin
  if not popOrderByFIO.Checked then begin
    CheckAndRunSortMenu(popOrderByFIO)
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShwANadb.popOrderByObjFIOClick(Sender: TObject);
begin
  if not popOrderByObjFIO.Checked then begin
    CheckAndRunSortMenu(popOrderByObjFIO)
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShwANadb.popOrderByKatPFIOClick(Sender: TObject);
begin
  if not popOrderByKatPFIO.Checked then begin
    CheckAndRunSortMenu(popOrderByKatPFIO);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShwANadb.popOrderByDtUvolnClick(Sender: TObject);
begin
  if not popOrderByDtUvoln.Checked then begin
    CheckAndRunSortMenu(popOrderByDtUvoln)
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShwANadb.sBrnReOpenClick(Sender: TObject);
begin
  OpenQryNdb(n_Mes, n_God, m_LstVids);
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.popEdtNdbClick(Sender: TObject);
begin
  if qryNdb.RecordCount > 0 then
    Edt_Ndb; // Сделал unvisible. Что-то колерничает  10-12-2019
end;                   
//------------------------------------------------------------------------------
procedure TFormShwANadb.sBtnF7Click(Sender: TObject);
var cLogMsg : string; cOldDtEnd : ShortString; nTabN : integer;
begin
  if (qryNdb.RecordCount > 0) and
                    (qryNdbDt_End.AsDateTime <> DateTimePick.Date) then
                                                          with qryNdb do begin
    cOldDtEnd := qryNdbDt_End.AsString;
    nTabN := qryNdbTabN.AsInteger;
    Edit;
    qryNdbDt_End.AsDateTime := DateTimePick.Date;
    cLogMsg := '';
    if FieldByName('Dt_End').AsString <> cOldDtEnd then
      cLogMsg := cLogMsg + '  ДтОконч ' + cOldDtEnd + ' => ' +
                                               FieldByName('Dt_End').AsString;
    if cLogMsg > '' then begin
      cLogMsg := 'ТабН = ' + FieldByName('TabN').AsString + ' Надбавка ' +
                 FieldByName('VidN').AsString + ' ' +
                 FieldByName('ShVidN').AsString + ' ' + cLogMsg;
      DmMain.AddLog(Now, nTabN, 'Ред.надбавки', gc_AppNmUsr, 'Z_Nadb', cLogMsg);
    end;
    Post;
    if UpdatesPending then
      Form_Dm.DbMain.ApplyUpdates([qryNdb]);
    if not Eof then
      Next
    else;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.dbgrNdbKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_F7) and (Shift = []) then
    sBtnF7.Click;;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.Edt_Ndb;
var cMsg, cLogMsg : string;
    nTabN : integer;
    bUpdated : boolean;
    cOldVidN, cOldSpsRsch, cOldSumProc, cOldSP, cOldDtBeg,
          cOldDtEnd, cOldKdObj, cOldKdKatP, cOldKdSpZ, cOldNrPrBeg,
                cOldDtPrBeg, cOldNrPrEnd, cOldDtPrEnd, cOldNotes : ShortString;
begin
  nTabN := 0;
  if not DmMain.InCtrlMes then
    Exit;
  with qryNdb do begin
    if (FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается редактировать "чужие" надбавки');
      Exit;
    end;
    // Вставить проверку на дату начала и ПроКуКаРеКать!!! ... Или не надо ???
    if (FieldByName('Dt_Beg').AsDateTime < dCtrlDate) or
           (not MyEmptyDate(FieldByName('Dt_End').AsString) and
             (FieldByName('Dt_End').AsDateTime < dCtrlDate)) then
      cMsg := '';
    if (cMsg = '') or
             (MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes) then begin
      cOldVidN    := FieldByName('VidN').AsString;
      cOldSpsRsch := FieldByName('SpsRsch').AsString;
      cOldSumProc := FieldByName('SumProc').AsString;
      cOldSP      := FieldByName('SP').AsString;
      cOldDtBeg   := FieldByName('Dt_Beg').AsString;
      cOldDtEnd   := FieldByName('Dt_End').AsString;
      cOldKdObj   := FieldByName('KdObj').AsString;
      cOldKdKatP  := FieldByName('KdKatP').AsString;
      cOldKdSpZ   := FieldByName('KdSpZ').AsString;
      cOldNrPrBeg := FieldByName('NrPrBeg').AsString;
      cOldDtPrBeg := FieldByName('DtPrBeg').AsString;
      cOldNrPrEnd := FieldByName('NrPrEnd').AsString;
      cOldDtPrEnd := FieldByName('DtPrEnd').AsString;
      cOldNotes   := FieldByName('Notes').AsString;
      Edit;
      if TFormENadb.Run(nTabN, gl_nAppKdSpsUsr,
                     FieldByName('FamIO').AsString,
                             dsrcNdb, bUpdated) {Z_ENadb} then begin
        Application.ProcessMessages;
        nTabN := FieldByName('TabN').AsInteger;
        cLogMsg := '';
        if FieldByName('VidN').AsString <> cOldVidN then
          cLogMsg := cLogMsg + ' ВидН ' + cOldVidN + ' => ' +
                                                 FieldByName('VidN').AsString;
        if FieldByName('SpsRsch').AsString <> cOldSpsRsch then
          cLogMsg := cLogMsg + '  СпсбРасч ' + cOldSpsRsch + ' => ' +
                                              FieldByName('SpsRsch').AsString;
        if FieldByName('SumProc').AsString <> cOldSumProc then
          cLogMsg := cLogMsg + '  Сумма(Прц) ' + cOldSumProc + ' => ' +
                                              FieldByName('SumProc').AsString;
        if FieldByName('SP').AsString <> cOldSP then
          cLogMsg := cLogMsg + '  См_% ' + cOldSP + ' => ' +
                                                   FieldByName('SP').AsString;
        if FieldByName('Dt_Beg').AsString <> cOldDtBeg then
          cLogMsg := cLogMsg + '  ДтНач ' + cOldDtBeg + ' => ' +
                                               FieldByName('Dt_Beg').AsString;
        if FieldByName('Dt_End').AsString <> cOldDtEnd then
          cLogMsg := cLogMsg + '  ДтОконч ' + cOldDtEnd + ' => ' +
                                               FieldByName('Dt_End').AsString;
        if FieldByName('KdObj').AsString <> cOldKdObj then
          cLogMsg := cLogMsg + '  КдПдр ' + cOldKdObj + ' => ' +
                                                FieldByName('KdObj').AsString;
        if FieldByName('KdKatP').AsString <> cOldKdKatP then
          cLogMsg := cLogMsg + '  КдКтгр ' + cOldKdKatP + ' => ' +
                                               FieldByName('KdKatP').AsString;
        if FieldByName('KdSpZ').AsString <> cOldKdSpZ then
          cLogMsg := cLogMsg + '  КдСчБУ ' + cOldKdSpZ + ' => ' +
                                                FieldByName('KdSpZ').AsString;
        if FieldByName('NrPrBeg').AsString <> cOldNrPrBeg then
          cLogMsg := cLogMsg + '  №_ПрНач ' + cOldNrPrBeg + ' => ' +
                                              FieldByName('NrPrBeg').AsString;
        if FieldByName('DtPrBeg').AsString <> cOldDtPrBeg then
          cLogMsg := cLogMsg + '  ДтПрНач ' + cOldDtPrBeg + ' => ' +
                                              FieldByName('DtPrBeg').AsString;
        if FieldByName('NrPrEnd').AsString <> cOldNrPrEnd then
          cLogMsg := cLogMsg + '  №_ПрКнц ' + cOldNrPrEnd + ' => ' +
                                              FieldByName('NrPrEnd').AsString;
        if FieldByName('DtPrEnd').AsString <> cOldDtPrEnd then
          cLogMsg := cLogMsg + '  ДтПрКнц ' + cOldDtPrEnd + ' => ' +
                                              FieldByName('DtPrEnd').AsString;
        if FieldByName('Notes').AsString <> cOldNotes then
          cLogMsg := cLogMsg + '  Примеч: ' + cOldNotes + ' => ' +
                                              FieldByName('Notes').AsString;
        Post;
        if UpdatesPending then
          Form_Dm.DbMain.ApplyUpdates([qryNdb]);
        if cLogMsg > '' then begin
          cLogMsg := 'ТабН = ' + FieldByName('TabN').AsString + ' ' + cLogMsg;
          DmMain.AddLog(Now, nTabN,
                            'Ред.надбавки', gc_AppNmUsr, 'Z_Nadb', cLogMsg); end
        else
          Cancel; end
      else
        Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.DbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.DbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.sBtnPrtClick(Sender: TObject);
begin
  F6PrtActNdb(n_Mes, n_God, m_LstVids, qryNdb);
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.OpenQryPrmUv;
begin
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcNdb;
    SQL.Add('Select TabN, Dt_Priem, Dt_Uvoln, Notes from z_PrmUv ' +
            ' where TabN = :TabN order by DT_Priem, Dt_Uvoln');
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.SetPrmUvState;
begin
  dbgrPrmUv.Visible := popPrmUv.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.popPrmUvClick(Sender: TObject);
begin
  popPrmUv.Checked := not popPrmUv.Checked;
  SetPrmUvState;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.qryNdbAfterScroll(DataSet: TDataSet);
begin
  if qryPrmUv.Active then
    qryPrmUv.Last;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.DateFieldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormShwANadb.FormKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где  нужно,  пользуйтесь  контекстными  меню');
end;

//------------------------------------------------------------------------------
procedure TFormShwANadb.CheckAndRunSortMenu(itemToCheck: TMenuItem);
begin
    popOrderByTabN.Checked    := false;
    popOrderByFIO.Checked     := false;
    popOrderByObjFIO.Checked  := false;
    popOrderByDtUvoln.Checked := false;
    popOrderByKatPFIO.Checked := false;

    itemToCheck.Checked := true;

    OpenQryNdb(n_Mes, n_God, m_LstVids);
end;

end.
