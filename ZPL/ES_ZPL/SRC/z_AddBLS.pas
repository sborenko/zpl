unit z_AddBLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, AxCtrls, OleCtrls, TTF160_TLB,
  Mask, DBCtrls, DB, DBTables, DBClient, Grids, DBGrids, ComCtrls, Menus;

type
  TFormAddBLS = class(TForm)
    qryUpi: TQuery;
    dsrcUpi: TDataSource;
    PageControl: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    F6B: TF6Book;
    PanelBottom: TPanel;
    PanelKart: TPanel;
    PanelKrt: TPanel;
    Label2: TLabel;
    dbeID: TDBEdit;
    dbeFamIO: TDBEdit;
    dbeTabN: TDBEdit;
    dbeIsLS: TDBEdit;
    dbgrLS: TDBGrid;
    cdsLS: TClientDataSet;
    dsrcLS: TDataSource;
    PanelMsg1: TPanel;
    cdsLSNR: TAutoIncField;
    cdsLSTabN: TIntegerField;
    cdsLSFamIO: TStringField;
    cdsLSINN: TStringField;
    cdsLSLS: TStringField;
    cdsLSMyFld: TSmallintField;
    Panel2: TPanel;
    cdsBnk: TClientDataSet;
    dsrcBnk: TDataSource;
    cdsBnkKdBnk: TSmallintField;
    cdsBnkShBnk: TStringField;
    cdsBnkNmBnk: TStringField;
    qryAdd: TQuery;
    ts0: TTabSheet;
    Panel1: TPanel;
    sBtnGo2: TSpeedButton;
    bBtnCancel2: TBitBtn;
    dbgrPkt: TDBGrid;
    Splitter1: TSplitter;
    dbgrBLS: TDBGrid;
    qryPkt: TQuery;
    dsrcPkt: TDataSource;
    qryPktNRPKT: TIntegerField;
    qryPktKDUSR: TSmallintField;
    qryPktKDBNK: TSmallintField;
    qryPktDTBEG: TDateTimeField;
    qryPktCNT: TIntegerField;
    qryBLS: TQuery;
    dsrcBLS: TDataSource;
    qryBLSFAM: TStringField;
    qryBLSIMA: TStringField;
    qryBLSOTCH: TStringField;
    qryBLSNR: TIntegerField;
    qryBLSDTBEG: TDateTimeField;
    qryBLSLICSCH: TStringField;
    qryBLSKDBNK: TSmallintField;
    qryBLSNOTES: TStringField;
    qryBLSNRPKT: TIntegerField;
    qryBLSKDUSR: TSmallintField;
    qryBLSFamIO: TStringField;
    qryBLSID: TStringField;
    pop: TPopupMenu;
    popAddPkt: TMenuItem;
    popDelPkt: TMenuItem;
    Label3: TLabel;
    dbeKdBnk: TDBEdit;
    dbeShBnk: TDBEdit;
    sBtnBnk: TSpeedButton;
    Label1: TLabel;
    dtPicDtBeg: TDateTimePicker;
    PanelErr: TPanel;
    LabelErr: TLabel;
    sBtnOpenXls: TSpeedButton;
    BitBtn1: TBitBtn;
    sBtnGoBack2: TSpeedButton;
    qryUpiFAM: TStringField;
    qryUpiIMA: TStringField;
    qryUpiOTCH: TStringField;
    qryUpiID: TStringField;
    qryUpiNR: TIntegerField;
    qryUpiDTBEG: TDateTimeField;
    qryUpiLICSCH: TStringField;
    qryUpiKDBNK: TSmallintField;
    qryUpiNOTES: TStringField;
    qryUpiNRPKT: TIntegerField;
    qryUpiKDUSR: TSmallintField;
    qryUpiFamIO: TStringField;
    Label4: TLabel;
    LabelLS: TLabel;
    Label6: TLabel;
    dbeIsKdBnk: TDBEdit;
    LabelMsg2: TLabel;
    qryTmp: TQuery;
    Panel3: TPanel;
    bBtnCancel1: TBitBtn;
    DBNavigator1: TDBNavigator;
    LabelCntRec: TLabel;
    sBtnPrt: TSpeedButton;
    sBtnPrt01: TSpeedButton;
    qryPktNMUSR: TStringField;
    qryBLSTABN: TIntegerField;
    qryBLSSPB: TStringField;
    qryUpiTABN: TIntegerField;
    qryUpiSPB: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnGo2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure qryUpiCalcFields(DataSet: TDataSet);
    procedure sBtnBnkClick(Sender: TObject);
    procedure dbeKdBnkEnter(Sender: TObject);
    procedure dbeKdBnkExit(Sender: TObject);
    procedure dtPicDtBegEnter(Sender: TObject);
    procedure dtPicDtBegExit(Sender: TObject);
    procedure dbgrLSEnter(Sender: TObject);
    procedure dbgrLSExit(Sender: TObject);
    procedure cdsBnkKdBnkValidate(Sender: TField);
    procedure qryBLSCalcFields(DataSet: TDataSet);
    procedure popAddPktClick(Sender: TObject);
    procedure popDelPktClick(Sender: TObject);
    procedure dtPicDtBegChange(Sender: TObject);
    procedure sBtnOpenXlsClick(Sender: TObject);
    procedure sBtnGoBack2Click(Sender: TObject);
    procedure bBtnCancel2Click(Sender: TObject);
    procedure dbgrPktEnter(Sender: TObject);
    procedure dbgrPktExit(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure dbgrLSDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPrtClick(Sender: TObject);
    procedure dsrcPktDataChange(Sender: TObject; Field: TField);
    procedure sBtnPrt01Click(Sender: TObject);
  private
    { Private declarations }
    nColINN, nColLS, nColFIO : SmallInt;
    n_KdBnk : SmallInt;
    c_ShBnk, cNmBadId, cNmFileXls : ShortString;
    d_DtBeg : TDateTime;
    function MyMaxROW(mF6B : TF6Book) : integer;
    function GetNewPktNR : integer;
    procedure OpenQryPkt;
    procedure OpenQryBLS;
    procedure CreOpenCdsBnk;
    procedure CreOpenCdsLS(var bBadXlsFile : boolean);
  public
    { Public declarations }
  end;

procedure AddBnkLS;

const SECTION = 'z_AddBLS';

var
  FormAddBLS: TFormAddBLS;

implementation

uses a_Const, z_DM, z_Main, z_ShwBnk, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddBnkLS;
begin
  FormAddBLS := TFormAddBLS.Create(Application);
  with FormAddBLS do begin
    OpenQryPkt;
    OpenQryBLS;
    PageControl.ActivePage := ts0;
    Caption := 'Пакеты ввода лицевых счетов';
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.OpenQryPkt;
begin
  with qryPkt do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select usr.NmUsr, bls.NrPkt, bls.KdUsr, bls.KdBnk, bls.DtBeg, ' +
            ' count(bls.NR) as Cnt from z_BankiLS bls ' +
            ' Left Outer Join usrs usr on usr.KdUsr = bls.KdUsr ' +
            ' where not bls.NrPkt is NULL ' +
            ' group by usr.NmUsr,bls.NrPkt, bls.KdUsr, bls.KdBnk, bls.DtBeg');
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.OpenQryBLS;
begin
  with qryBLS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPkt;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, u.ID, bls.* from z_BankiLS bls ' +
            ' Left Outer Join z_Upi u on u.TabN = bls.TabN ' +
            ' where bls.NrPkt = :NrPkt order by u.Fam, u.Ima, u.Otch, u.ID');
    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.popAddPktClick(Sender: TObject);
begin
  CreOpenCdsBnk; // чтобы было удобно хранить и обрабатывать KdBnk, ShBnk, NmBnk
  PageControl.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.CreOpenCdsBnk;
begin
  with cdsBnk do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    FieldByName('KdBnk').AsInteger := n_KdBnk;
    FieldByName('ShBnk').AsString  := c_ShBnk;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.sBtnOpenXlsClick(Sender: TObject);
var i, iRow : integer; cTxt : ShortString; bBadXlsFile : boolean;
    dDtBeg : TDateTime;
const cErrMsg = 'Выбранный файл не годится для подключения. ' +
             'В 1-й строке должны быть латиницей указаны поля: ' +
             '"FIO", "INN", "LS". Со второй строки должны начинаться ' +
             'данные. Пустые строки не допускаются. ' +
             'Откройте другой файл или откажитесь (кнопка "Отказ").';
begin
  PanelErr.Visible := false;
  with FormZpMain.OpenDialog do begin
    Filter := 'Файлы MS Excel|*.xls';
    InitialDir := 'c:\T_E_M_P\ZPL';
    Title := 'Выберите файл с лицевыми счетами';
    if Execute then begin
      cNmFileXls := FileName;
      cNmBadID := ExtractFileName(FileName);
      cNmBadID := Copy(cNmBadID, 1, Length(cNmBadID)-4); // отсечь .xls
      F6B.ReadEx(FileName);
      nColINN := -1;
      nColLS  := -1;
      nColFIO := -1;
      with F6B do begin
        iRow := 1;
        for i := 1 to 20 do begin
          cTxt := TextRC[iRow, i];
          if Trim(cTxt) = 'FIO' then
            nColFIO := i
          else if Trim(cTxt) = 'LS' then
            nColLS := i
          else if Trim(cTxt) = 'INN' then
            nColINN := i;
        end;
        if (nColINN < 0) or (nColLS < 0) or (nColFIO < 0) then begin
          BackColor := clMoneyGreen;
          LabelErr.Caption := cErrMsg;
          PanelErr.Visible := true; end
        else begin
          dDtBeg := dtPicDtBeg.Date;
          CreOpenCdsLS(bBadXlsFile);
          with qryUpi do begin
            if Active then Close;
            SQL.Clear;
            DataBaseName := CESMAIN;
            DataSource := dsrcLS;
            SQL.Add('Select first 1 u.TabN, u.Fam, u.Ima, u.Otch, u.ID, ' +
                    ' bls.* from Z_UPI u ' +
                    ' Left outer join z_BankiLS bls on bls.TabN = u.TabN ' +
                    ' where u.ID = :INN order by u.NR desc, bls.DtBeg desc');
            Open;
          end;
          if not bBadXlsFile then begin
            cdsLS.First;
            LabelMsg2.Caption := 'Новые лицевые счета с ' + DateToStr(dDtBeg) +
                         ' в банке ' + cdsBnk.FieldByName('KdBnk').AsString +
                            ' (' + cdsBnk.FieldByName('ShBnk').AsString + ')';
            Panel2.Caption := ' Записей: ' + IntToStr(cdsLS.RecordCount);
            PageControl.ActivePage := ts2;
            sBtnGo2.Enabled := true;
            dbeIsLS.Hint := 'Лицевой счет на ' + DateToStr(dDtBeg);
            LabelLS.Caption := 'По состоянию на ' +
                                          DateToStr(dDtBeg) + ' ЛицСчет:';
            ActiveControl := dbgrLS; end
          else begin
            cdsLS.Close;
            BackColor := clSkyBlue;
            LabelErr.Caption := cErrMsg;
            PanelErr.Visible := true;
          end;
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.popDelPktClick(Sender: TObject);
var cMsg : ShortString; nNrPkt, nCntRec : integer;
begin
  nNrPkt := qryPktNrPkt.AsInteger;
  nCntRec := qryPktCnt.AsInteger;
  cMsg := 'Удалить пакет лицевых счетов № ' + IntToStr(nNrPkt) + ', Записей ' +
          IntToStr(nCntRec) + ' ?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Delete from z_BankiLS where NRPkt = :nNrPkt');
      ParamByName('nNrPkt').AsInteger := nNrPkt;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with qryPkt do begin
      DisableControls;
      Next;
      if Eof then
        nNrPkt := 0
      else
        nNrPkt := qryPktNrPkt.AsInteger;
      Close;
      Open;
      if nNrPkt = 0 then
        Last
      else
        Locate('NrPkt', nNrPkt, []);
      EnableControls;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormAddBLS.MyMaxROW(mF6B : TF6Book) : integer;
var iRow, nCntBadLine : integer;  bMore : boolean;
begin
  Result := 0;
  with mF6B do begin
    iRow := 0;
    nCntBadLine := 0;
    bMore := true;
    while bMore do begin
      Inc(iRow);
      if (TextRC[iRow, 1] = '') and (TextRC[iRow, 2] = '') and
            (TextRC[iRow, 3] = '') and (TextRC[iRow, 4] = '') and
               (TextRC[iRow, 5] = '') and (TextRC[iRow, 6] = '') then
        Inc(nCntBadLine)
      else
        Inc(Result);
      bMore := nCntBadLine < 10;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.CreOpenCdsLS(var bBadXlsFile : boolean);
var nCntBadLn : SmallInt; iRow, nMyMaxRow : integer;
    cINN, cLS, cFIO : ShortString; bMore : boolean;
begin
  bBadXlsFile := false;
  with cdsLS do begin
    if Active then Close;
    CreateDataSet;
    Open;
    IndexName := '';
  end;
  with F6B do begin
    nMyMaxRow := MyMaxROW(F6B);
    iRow := 1;
    bMore := true;
    nCntBadLn := 0;
    while bMore do begin
      Inc(iRow);
      cINN := Trim(TextRC[iRow, nColINN]);
      cLS  := Trim(TextRC[iRow, nColLS]);
      cFIO := Trim(TextRC[iRow, nColFIO]);
      if (cINN = '') or (cLS = '') {or (cFIO = '')} then begin
        Inc(nCntBadLn);
        if nCntBadLn > 300 then begin
          ShowMessage('Слишком много некондиционных строк');
          bBadXlsFile := true;
          bMore := false;
        end;
        if iRow > nMyMaxRow+10 then begin
          // ShowMessage('Добрались до конца Excel-файла');
          bBadXlsFile := false;
          bMore := false;
        end; end
      else begin
        cdsLS.Append;
        cdsLSFamIO.AsString := cFIO;
        cdsLSINN.AsString := cINN;
        cdsLSLS.AsString := cLS;
        cdsLS.Post;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 480);
    Width  := ReadInteger(SECTION, 'wW', 675);
    dbgrPkt.Width := ReadInteger(SECTION, 'dbgrPktW', 188);
    n_KdBnk := ReadInteger(SECTION, 'SvKdBnk', 101);
    c_ShBnk := ReadString(SECTION, 'SvShBnk', 'АКБ Имекс');
    d_DtBeg := ReadDate(SECTION, 'SvDtBeg', Date);
    dtPicDtBeg.Date := d_DtBeg;
    Free;
  end;
  if FileExists(cDirVids + 'PktLS01.vid') then
    dbgrPkt.Columns.LoadFromFile(cDirVids + 'PktLS01.vid');
  if FileExists(cDirVids + 'PktLS02.vid') then
    dbgrBLS.Columns.LoadFromFile(cDirVids + 'PktLS02.vid');
  if FileExists(cDirVids + 'PktLS04.vid') then
    dbgrLS.Columns.LoadFromFile(cDirVids + 'PktLS04.vid');
  ts0.TabVisible := false; // bFlagDbg;
  ts1.TabVisible := false; // bFlagDbg;
  ts2.TabVisible := false; // bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryPkt.Active then
    dbgrPkt.Columns.SaveToFile(cDirVids + 'PktLS01.vid');
  if qryBLS.Active then
    dbgrBLS.Columns.SaveToFile(cDirVids + 'PktLS02.vid');
  if cdsLS.Active then
    dbgrLS.Columns.SaveToFile(cDirVids + 'PktLS04.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'dbgrPktW', dbgrPkt.Width);
    WriteInteger(SECTION, 'SvKdBnk', n_KdBnk);
    WriteString(SECTION, 'SvShBnk', c_ShBnk);
    d_DtBeg := dtPicDtBeg.Date;
    WriteDate(SECTION, 'SvDtBeg', d_DtBeg);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormAddBLS.GetNewPktNR : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 Gen_ID(Nr_BLS_PKT, 1) as NewPktNR, ' +
            ' u.TabN from z_UPI u'); // Иначе не дает Gen_ID(Nr_BLS_PKT, 1)
    Open;                             // либо приходится городить процедуру
    Result := FieldByName('NewPktNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.sBtnGo2Click(Sender: TObject);
var nSvNR, nCntExec, nCntBadUpiID, nCntOkUpiLS, nUpiTabN,
                                                nUpiKdBnk, nNewKdBnk : integer;
    cMsg, cLn, cID, cLS, cFIO, cUpiLS, cUpiID, cNotes : ShortString;
    F : TextFile; nNewPktNR : integer;
begin
  nNewPktNR := GetNewPktNR;
  nNewKdBnk := cdsBnkKdBnk.AsInteger;
  cNotes := cNmBadID + '.xls';
  //cNmFileXls := cNmBadID + '.xls';
  with qryAdd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_BankiLS (TabN, DTBEG, LICSCH, KDBNK, NOTES, ' +
            ' NRPKT, KDUSR) values (:nTabN, :dDtBeg, :cLS, :nKdBnk, ' +
            ' :cNotes, :nNrPkt, :nKdUsr)');
    ParamByName('dDtBeg').AsDateTime := dtPicDtBeg.Date;
    ParamByName('nKdBnk').AsInteger  := nNewKdBnk;
    ParamByName('cNotes').AsString   := cNotes;
    ParamByName('nNrPkt').AsInteger  := nNewPktNR;
    ParamByName('nKdUsr').AsInteger  := nAppKdUsr;
  end;

  cNmBadID := 'C:\T_E_M_P\ZPL\' + cNmBadID + '.txt';
  AssignFile(F, cNmBadId);
  Rewrite(F);
  WriteLn(F, '                 Не найдены ИД в таблице "Стипендиаты"');
  cLn := '======================================================================';
  WriteLn(F, cLn);
  WriteLn(F, '  NN      ID           LS               FIO');
  WriteLn(F, cLn);
  sBtnGo2.Enabled := false;
  with cdsLS do begin
    nSvNR := cdsLSNR.AsInteger;
    First;
    Application.ProcessMessages;
    nCntExec     := 0;
    nCntBadUpiID := 0;
    nCntOkUpiLS  := 0;
    while not Eof do begin
      Edit;
      cLS  := FieldByName('LS').AsString;
      cFIO := FieldByName('FamIO').AsString;
      cID  := FieldByName('INN').AsString;
      cUpiLS := qryUpiLicSch.AsString;
      cUpiID := qryUpiID.AsString;
      nUpiKdBnk := qryUpiKdBnk.AsInteger;
      if (cUpiID = '') then begin
        cMsg := '';
        Inc(nCntBadUpiID);
        if nCntBadUpiID < 10 then
          cMsg := '   '
        else if nCntBadUpiID < 100 then
          cMsg := '  '
        else if nCntBadUpiID < 1000 then
          cMsg := ' ';
        cMsg := cMsg + IntToStr(nCntBadUpiID);
        cMsg := cMsg + '  ' + cID + ' | ' + cLS + ' | ' + cFIO;
        WriteLn(F, cMsg);
        cdsLsMyFld.AsInteger := 1; end
      else if (cUpiID = cID) and (cUpiLS = cLS) and
                                     (nUpiKdBnk = nNewKdBnk) then begin
        Inc(nCntOkUpiLS);
        cdsLsMyFld.AsInteger := 2;
        cdsLsTabN.AsInteger := dbeTabN.Field.AsInteger; end
      else begin
        nUpiTabN := qryUpiTabN.AsInteger;
        qryAdd.ParamByName('nTabN').AsInteger := nUpiTabN;
        qryAdd.ParamByName('cLS').AsString := cLS;
        qryAdd.ExecSQL;
        Inc(nCntExec);
        cdsLsMyFld.AsInteger := 3;
        cdsLsTabN.AsInteger := dbeTabN.Field.AsInteger;
      end;
      Post;
      Next;
      Application.ProcessMessages;
    end;
    sBtnPrt.Enabled := true;
    Locate('NR', nSvNR, []);
    WriteLn(F, cLn);
    CloseFile(F);
    ShowMessage('Введено счетов  в BankiLS:  ' + IntToStr(nCntExec) +
                ' (МАЛИНОВЫЕ)' + #13#10 + #13#10 +
                'Не найдено записей по ИД:  ' + IntToStr(nCntBadUpiID) +
                ' (СЕРЫЕ)' + #13#10 + '(См. файл ' + cNmBadID + ')' + #13#10 +
                #13#10 + 'Не потребовались исправления:  ' +
                IntToStr(nCntOkUpiLS) + ' СИНИЕ');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.sBtnPrtClick(Sender: TObject);
var nSvNR : integer;
begin
  with cdsLS do begin
    nSvNR := cdsLsNR.AsInteger;
    DisableControls;
    IndexName := 'OnMyFldFamIO';
    First;
//    F6PrtPktLS(n_KdBnk, c_ShBnk, cNmFileXls, d_DtBeg, cdsLS);
    IndexName := '';
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.FormResize(Sender: TObject);
begin
  PanelKrt.Left := Round((PanelBottom.Width - PanelKrt.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.qryUpiCalcFields(DataSet: TDataSet);
begin
  qryUpiFamIO.AsString := Trim(Trim(qryUpiFam.AsString) + ' ' +
                   Trim(qryUpiIma.AsString) + ' ' + Trim(qryUpiOtch.AsString));
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.sBtnBnkClick(Sender: TObject);
var nKdBnk : SmallInt; cShBnk, cNmBnk : ShortString;
begin
  with cdsBnk do begin
    nKdBnk := FieldByName('KdBnk').AsInteger;
    cShBnk := FieldByName('ShBnk').AsString;
    cNmBnk := FieldByName('NmBnk').AsString;
    if GetZplBank(nKdBnk, cShBnk, cNmBnk) {z_ShwBnk} then begin
      n_KdBnk := nKdBnk;
      c_ShBnk := cShBnk;
      FieldByName('KdBnk').AsInteger := nKdBnk;
      FieldByName('ShBnk').AsString  := cShBnk;
      FieldByName('NmBnk').AsString  := cNmBnk;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dbeKdBnkEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dbeKdBnkExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dtPicDtBegEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dtPicDtBegExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dbgrLSEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dbgrLSExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.cdsBnkKdBnkValidate(Sender: TField);
//var nKdBnk : SmallInt; cText, cShBnk, cNmBnk : ShortString;
begin
(*
  cText := Sender.Text;
  if cText = '' then begin
    cdsBnkShBnk.AsString := '';
    cdsBnkNmBnk.AsString := ''; end
  else begin
    nKdBnk := StrToInt(cText);
    if CheckBank(nKdBnk, cShBnk, cNmBnk) then begin
      cdsBnkShBnk.AsString := cShBnk;
      cdsBnkNmBnk.AsString := cNmBnk; end
    else
      Raise Exception.Create('Нет банка "' + cText + '" в справочнике "Банки"');
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.qryBLSCalcFields(DataSet: TDataSet);
begin
  qryBLSFamIO.AsString := MyFamIO(qryBLSFam.AsString, qryBLSIma.AsString,
                                                         qryBLSOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dtPicDtBegChange(Sender: TObject);
begin
  d_DtBeg := dtPicDtBeg.Date;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.sBtnGoBack2Click(Sender: TObject);
begin
  if not sBtnGo2.Enabled {состоялась запись в БД} or
        (sBtnGo2.Enabled and (MessageDlg('Данные не записаны в Базу Данных. ' +
             'Возвращаемся?:', mtWarning, [mbYes, mbNo], 0) = mrYes)) then begin
    cdsLS.Close;
    qryUpi.Close;
    F6B.ClearRange(1, 1, f6B.MaxRow, F6B.MaxCol, F1ClearAll);
    PageControl.ActivePage := ts1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.bBtnCancel2Click(Sender: TObject);
begin
  if not sBtnGo2.Enabled {состоялась запись в БД} or
         (sBtnGo2.Enabled and (MessageDlg('Данные не записаны в Базу Данных. ' +
                       'Выходим?:', mtWarning, [mbYes, mbNo], 0) = mrYes)) then
    ModalResult := mrCancel;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dbgrPktEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dbgrPktExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.Splitter1Moved(Sender: TObject);
begin
  dbNavigator1.Left := dbgrBLS.Left + 2;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.Panel3Resize(Sender: TObject);
begin
  dbNavigator1.Left := dbgrBLS.Left + 2;
  LabelCntRec.Left := dbNavigator1.Left + dbNavigator1.Width + 30;
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePage = ts0 then
    Caption := 'Пакеты ввода лицевых счетов'
  else if PageControl.ActivePage = ts1 then
    Caption := 'Выбор файла .xls для подключения'
  else
    Caption := 'Пакет для подключения';
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dbgrLSDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var nMyFld : SmallInt;
begin
  nMyFld := cdsLsMyFld.AsInteger;
  with dbgrLS.Canvas do begin
    if (nMyFld = 1) then begin       // плохой ИД (такой не найден в УПИ)
      Font.Color := clTeal;
      Brush.Color := clBtnFace; end
    else if (nMyFld = 2) then        // подключать не нужно (найден в УПИ
      Font.Color := clNavy           // и счет совпал)
    else if (nMyFld = 3) then begin
      Font.Color := ClMaroon;        // найден в УПИ, счет не совпал. Подключен!
      Brush.Color := clWindow;
    end;
  end;
  dbgrLS.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.dsrcPktDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcPkt.State = dsBrowse) and qryBLS.Active then
    LabelCntRec.Caption := 'Записей: ' + IntToStr(qryBls.RecordCount);
end;
//------------------------------------------------------------------------------
procedure TFormAddBLS.sBtnPrt01Click(Sender: TObject);
//var nNrPkt, nKdBnk : integer; dDtPkt : TDateTime;
begin
//  nNrPkt := qryPktNrPkt.AsInteger;
//  nKdBnk := qryPktKdBnk.AsInteger;
//  dDtPkt := qryPktDtBeg.AsDateTime;
//  F6PrtPktBLS(nNrPkt, nKdBnk, dDtPkt, qryBLS);
end;

end.
