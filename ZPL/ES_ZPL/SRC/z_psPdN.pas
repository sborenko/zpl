unit z_psPdN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  Math, ComCtrls, DBCtrls, Menus;

type
  TFormPsPdn = class(TForm)
    qryNU: TQuery;
    dsrcNU: TDataSource;
    qryNUTABN: TIntegerField;
    qryNUZAMESGOD: TDateTimeField;
    qryNUVIDN: TStringField;
    qryNUSHVIDN: TStringField;
    qryNUSPDN: TStringField;
    qryNUSMM: TFloatField;
    dsrcPdn: TDataSource;
    qryTmp: TQuery;
    qryDet: TQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    dsrcDet: TDataSource;
    PageControl: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    PanelDlg: TPanel;
    Label2: TLabel;
    edGodZa: TEdit;
    UpDownGodZa: TUpDown;
    Label1: TLabel;
    edMesR: TEdit;
    UpDownMesR: TUpDown;
    edGodR: TEdit;
    UpDownGodR: TUpDown;
    sBtnForward00: TSpeedButton;
    bBtnCancel00: TBitBtn;
    dbgrPdn: TDBGrid;
    dbgrDet: TDBGrid;
    Panel2: TPanel;
    bBtnCancel02: TBitBtn;
    DBNavigator1: TDBNavigator;
    sBtnProverka: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    sBtnStayOnTop: TSpeedButton;
    qryPrmUv: TQuery;
    Label5: TLabel;
    sBtnSave: TSpeedButton;
    tblPdn: TTable;
    tblPdnNR: TIntegerField;
    tblPdnTABN: TIntegerField;
    tblPdnFAMIO: TStringField;
    tblPdnDTPROC: TDateTimeField;
    tblPdnZAMESGOD: TDateTimeField;
    tblPdnPOROGLG: TFloatField;
    tblPdnMINZP: TFloatField;
    tblPdnPRCLG: TFloatField;
    tblPdnPRCLGSOTR: TFloatField;
    tblPdnSMLGSOTR: TFloatField;
    tblPdnSMFORPDN: TFloatField;
    tblPdnSMPF: TFloatField;
    tblPdnSMSS: TFloatField;
    tblPdnSMFZ: TFloatField;
    tblPdnSMALIM: TFloatField;
    tblPdnSMPDN: TFloatField;
    tblPdnSMNEWPDN: TFloatField;
    tblPdnKDOBJ: TSmallintField;
    tblPdnKDSPZ: TSmallintField;
    tblPdnKDKATP: TSmallintField;
    tblPdnPDN: TSmallintField;
    tblPdnMETKA: TSmallintField;
    tblPdnSUMMA: TFloatField;
    LabelCntRec: TLabel;
    qryInSps: TQuery;
    dbgrNU: TDBGrid;
    sBtnCreTblPdn: TSpeedButton;
    sBtnPrt: TSpeedButton;
    PanelWait: TPanel;
    Label8: TLabel;
    pop: TPopupMenu;
    popDelRec: TMenuItem;
    popDetNU: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnCreTblPdnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sBtnForward00Click(Sender: TObject);
    procedure sBtnProverkaClick(Sender: TObject);
    procedure dbgrPdnDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure bBtnCancel00Click(Sender: TObject);
    procedure sBtnSaveClick(Sender: TObject);
    procedure FloatFldGetText(Sender: TField; var Text: String;
                                                         DisplayText: Boolean);
    procedure sBtnPrtClick(Sender: TObject);
    procedure dbgrPdnDblClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure popDelRecClick(Sender: TObject);
    procedure popDetNUClick(Sender: TObject);
    procedure tblPdnAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    nGodZa : SmallInt;         // Год, за который пересчитывать
    dDtPrc : TDateTime;        // Месяц, к которому нужно подключить результаты.
    dDtBeg, dDtEnd : TDateTime;  // Пересчитываемого года
    cTblPdnNm, cTblPdnDbNm : ShortString;

    nNewNrVdPv : SmallInt;     // Н-р, который присвоится ведомости подключения
    aPorogLg : array[1..12] of double; // массивы с - суммой порога Льг.
    aProcLg  : array[1..12] of double; //           - Процентом Льготы от МинЗпл
    aMinZp   : array[1..12] of double; //           - Суммой МинЗпл
    aPrcPdN  : array[1..12] of double; //           - % подоходного  за 12 мес.
    procedure CreateTablePdn(cTblPdnNm, cTblPdnDbNm : ShortString);
    procedure DelRecFromTblPdn;
    procedure SetFormStayOnTop;
    procedure ShowPanelWait;
    procedure PrepareQryPrmUv;
    procedure OpenQryNU(dDtBeg, dDtEnd : TDateTime);
    procedure FillTblPdn;
    procedure OpenQryDet;
    function IsUvolenOnEndMes(nTabN : integer; dDtEndMes : TDateTime) : boolean;
    procedure AddRecInTblPdn(nTabN : integer; cFamIO : ShortString;
                             dZaMG : TDateTime; bUvolen : boolean;
                             nKdObj, nKdKatP, nKdSpZ : SmallInt;
                    nPorogLg, nMinZp,nProcLg, nSmLgSotr, nProcLgSotr, nSmForPdn,
                      nSmPF, nSmSS, nSmFZ, nSmAlim, nSmPdN, nSmNewPdN : double);
    function GetProcLG(nTabN : integer; dZaMG : TDateTime;
                              var nKdObj, nKdKatP, nKdSpZ : SmallInt) : double;
    function IsInSps(nTabN : integer; dDtPrc : TDateTime;
                                              var nKdObj : SmallInt) : boolean;
    procedure AddRecInBD;
  public
    { Public declarations }
  end;

procedure ShwPdnPere;

const SECTION = 'z_psPdN';

var
  FormPsPdn: TFormPsPdn;
  bIsFormShwPsPdnNU : boolean;

implementation

uses a_Const, a_DM, z_Dm, z_Main, a_Lib, z_psPdnZ, z_PsPdNu, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwPdnPere;
begin
  if not bIsFormPsPdn then begin
    FormPsPdn := TFormPsPdn.Create(Application);
    with FormPsPdn do begin
      bIsFormShwPsPdnNU := false;
      Caption := 'Перерасчет подоходного за год';
      bIsFormPsPdn := true;
      Show;
    end; end
  else begin
    if FormPsPdn.WindowState = wsMinimized then
      FormPsPdn.WindowState := wsNormal;
    FormPsPdn.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.FormResize(Sender: TObject);
begin
  PanelDlg.Top := Round((Height - PanelDlg.Height) / 2) - 20;
  PanelDlg.Left := Round((Width - PanelDlg.Width - dbgrNu.Width) / 2) - 20;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 650);
    Width  := ReadInteger(SECTION, 'wW', 785);
    sBtnStayOnTop.Down := ReadBool(SECTION, 'bStOnTp', true);
    Free;
  end;
  PanelDlg.Top := Round((Height - PanelDlg.Height) / 2) - 40;
  PanelDlg.Left := Round((Width - PanelDlg.Width) / 2) - 15;
  if FileExists(cDirVids + 'PsPdn01.vid') then
    dbgrNU.Columns.LoadFromFile(cDirVids + 'PsPdn01.vid');
  if FileExists(cDirVids + 'PsPdn02.vid') then
    dbgrPdn.Columns.LoadFromFile(cDirVids + 'PsPdn02.vid');
  if FileExists(cDirVids + 'PsPdn04.vid') then
    dbgrDet.Columns.LoadFromFile(cDirVids + 'PsPdn04.vid');
  sBtnProverka.Visible := bFlagDbg;
  dbgrNu.Width := 5;
  ts1.TabVisible := bFlagDbg;
  ts2.TabVisible := bFlagDbg;
  PageControl.ActivePage := ts1;
  SetFormStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bIsFormShwPsPdnNU then
    FormShwPsPdnNU.Close;
  dbgrNU.Columns.SaveToFile(cDirVids + 'PsPdn01.vid');
  dbgrPdn.Columns.SaveToFile(cDirVids + 'PsPdn02.vid');
  dbgrDet.Columns.SaveToFile(cDirVids + 'PsPdn04.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bStOnTp', sBtnStayOnTop.Down);
    Free;
  end;
  bIsFormPsPdn := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.sBtnForward00Click(Sender: TObject);
var nWhatDo : word; bTableExists : boolean;
begin
  nGodZa := UpDownGodZa.Position;
  dDtBeg := EncodeDate(nGodZa,  1, 1);
  dDtEnd := EncodeDate(nGodZa, 12, 1);
  dDtPrc := EncodeDate(UpDownGodR.Position, UpDownMesR.Position, 1);
  cTblPdnNm := 'PDN_' + IntToStr(nGodZa);
  cTblPdnDbNm := CESMAIN;
  tblPdn.TableName := cTblPdnNm;
  tblPdn.DatabaseName := cTblPdnDbNm;
  bTableExists := tblPdn.Exists;
  nWhatDo := 0;
  PrepareQryPrmUv;
  if bTableExists then begin
    WhatPsPdnDo(nWhatDo);     {z_psPdnZ}
    Application.ProcessMessages;
    if nWhatDo = 1 then begin  // показать существующую таблицу
      tblPdn.Open;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(tblPdn.RecordCount);
      OpenQryDet;
      PageControl.ActivePage := ts2; end
    else if nWhatdo = 2 then begin
      dbgrNu.Width := 347;
      dbgrNu.Visible := true;
      PanelDlg.Left := Round((Width - PanelDlg.Width - dbgrNu.Width) / 2) - 20;
      ShowPanelWait;
      Application.ProcessMessages;
      DelRecFromTblPdn;
      tblPdn.Open;
      OpenQryNU(dDtBeg, dDtEnd);
      if bFlagDbg then
        sBtnCreTblPdn.Visible := true
      else
        FillTblPdn;
    end; end
  else begin
    dbgrNu.Width := 347;
    dbgrNu.Visible := true;
    PanelDlg.Left := Round((Width - PanelDlg.Width - dbgrNu.Width) / 2) - 20;
    ShowPanelWait;
    Application.ProcessMessages;
    CreateTablePdn(cTblPdnNm, cTblPdnDbNm);
    tblPdn.Open;
    OpenQryNU(dDtBeg, dDtEnd);
    if bFlagDbg then
      sBtnCreTblPdn.Visible := true
    else
      FillTblPdn;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.ShowPanelWait;
begin
  with PanelWait do begin
    Top := 6;
    Left := 6;
    Width := 310;
    Height := 99;
    Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.DelRecFromTblPdn;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cTblPdnDbNm;
    SQL.Add('Delete from ' + cTblPdnNm);
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.CreateTablePdn(cTblPdnNm, cTblPdnDbNm : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cTblPdnDbNm;
    SQL.Add('Create Generator NR_' + cTblPdnNm);
    ExecSQL;
    SQL.Clear;
    SQL.Add('Create table ' + cTblPdnNm + ' (');
    SQL.Add('NR integer,');
    SQL.Add('TabN integer,');
    SQL.Add('FamIO VarChar(35),');
    SQL.Add('DtProc TimeStamp,');
    SQL.Add('ZaMesGod TimeStamp,');
    SQL.Add('PorogLg double precision,');
    SQL.Add('MinZP double precision,');
    SQL.Add('PrcLg double precision,');
    SQL.Add('PrcLgSotr double precision,');
    SQL.Add('SmLgSotr double precision,');
    SQL.Add('SmForPdn double precision,');
    SQL.Add('SmPF double precision,');
    SQL.Add('SmSS double precision,');
    SQL.Add('SmFZ double precision,');
    SQL.Add('SmALIM double precision,');
    SQL.Add('SmPdN double precision,');
    SQL.Add('SmNewPdN double precision,');
    SQL.Add('Summa double precision,');
    SQL.Add('KdObj SmallInt,');
    SQL.Add('KdSpZ SmallInt,');
    SQL.Add('KdKatP SmallInt,');
    SQL.Add('PdN SmallInt,');
    SQL.Add('Metka SmallInt)');
    ExecSQL;
    SQL.Clear;
    SQL.Add('CREATE TRIGGER NR_' + cTblPdnNm + ' FOR ' + cTblPdnNm +
                                ' BEFORE INSERT POSITION 0 as begin');
    SQL.Add(' New.Nr = Gen_Id(Nr_' + cTblPdnNm + ', 1);');
    SQL.Add('end');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.PrepareQryPrmUv;
begin
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from GET_PRMUVSTATE_ONDATE (:nTabN, :dDtBeg)');
  end;
end;
//------------------------------------------------------------------------------
function TFormPsPdn.IsUvolenOnEndMes(nTabN : integer;
                                              dDtEndMes : TDateTime) : boolean;
begin
  Result := false;
  // Надо выяснять состояние на конец месяца
  with qryPrmUv do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtEndMes;
    Open;
    if (RecordCount > 0) and not FieldByName('Dt_Uvoln').IsNull and
                     (FieldByName('Dt_Uvoln').AsDateTime <= dDtEndMes) then
      Result := true;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.OpenQryNU(dDtBeg, dDtEnd: TDateTime);
begin
  with qryNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select n.TabN, n.ZaMesGod, n.VidN, v.ShVidN, v.SPdN, ' +
            ' Sum(n.Summa) as SMM from Z_NU n ' +
            ' Left Outer Join Z_KdVidN v on v.VidN = n.VidN ' +
            ' where n.ZaMesGod >= :dDtBeg and n.ZaMesGod <= :dDtEnd and ' +
            ' n.VidN < "7500" ');
    if bFlagDbg then
      SQL.Add(' and (TabN <= 1239 or ' +
              ' TabN in (7384,19803,26808,56772,3916,28476,6607,7313,5816))');
    SQL.Add(' group by n.TabN, n.ZaMesGod, n.VidN, v.ShVidN, v.SPdN ' +
            ' having Sum(n.Summa) > 0.001 or Sum(n.Summa) < -0.001');
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.OpenQryDet;
begin
  with qryDet do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPdn;
    SQL.Add('Select n.ZaMesGod, n.VidN, v.ShVidN, v.SPdN, ' +
            ' Sum(n.Summa) as SMM from Z_NU n ' +
            ' Left Outer Join Z_KdVidN v on v.VidN = n.VidN ' +
            ' where n.TabN = :TabN and n.ZaMesGod = :ZaMesGod and ' +
            ' n.VidN < "7500" ' +
            ' group by n.ZaMesGod, n.VidN, v.ShVidN, v.SPdN ' +
            ' having Sum(n.Summa) > 0.001 or Sum(n.Summa) < -0.001');
    Open;
  end;
end;
//------------------------------------------------------------------------------
function TFormPsPdn.GetProcLG(nTabN : integer; dZaMG : TDateTime;
                               var nKdObj, nKdKatP, nKdSpZ : SmallInt) : double;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dZaMG + 27;  // надо ли конец месяца ???
    Open;
    if RecordCount > 0 then
      Result  := FieldByName('ProcLG').AsFloat;
      nKdObj  := FieldByName('KdObj').AsInteger;
      nKdKatP := FieldByName('KdKatP').AsInteger;
      nKdSpZ  := FieldByName('KdSpZ').AsInteger;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.sBtnCreTblPdnClick(Sender: TObject);
begin
  FillTblPdn;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.FillTblPdn;
var nTabN : integer; dZaMG, dDtEndMes : TDateTime;
    cFamIO, cVidN : ShortString;
    nKdObj, nKdKatP, nKdSpZ : SmallInt;
    nSmForPdn, nSmPF, nSmSS, nSmFZ, nSmAlim, nSmPdn, nSmNewPdn : double;
    nPorogLg, nMinZp, nPrcPdN, nProcLG, nSmLg : double;
    nProcLgSotr, nSmLgSotr : double;
    n : SmallInt; nY, nM, nD : word;
    bUvolen : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SqL.Add('Select * from z_TPDN where dtBeg <= :dDtEnd order by dtBeg desc');
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    for n := 1 to 12 do begin
      dZaMG := EncodeDate(nGodZa, n, 1);
      First;
      while not Eof do begin
        if FieldByName('DtBeg').AsDateTime <= dZaMG then begin
          aPrcPdN[n] := FieldByName('PrcPdN').AsFloat;
          aPorogLg[n] := FieldByName('PorogLg').AsFloat;
          aProcLg[n] := FieldByName('ProcLg').AsFloat;
          aMinZp[n] :=  FieldByName('MinZp').AsFloat;
          Break;
        end;
        Next;
      end;
    end;
    Close;  // заполнил массивы, теперь буду использовать для инф. из перемещ.
    SQL.Clear;
    DataBaseName := CESMAIN;
    SqL.Add('Select first 1 * from z_Pere where TabN = :nTabN and ' +
            ' Dt_Beg <= :dDtBeg order by Dt_Beg desc');
  end;
  dsrcPdn.DataSet := nil;
  with qryNu do begin
    First;
    n := 0;
    while (n < 1200) and not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      cFamIO := DmMain.TabN2FamIO(nTabN);
      if bFlagDbg then
        Inc(n);
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        dZaMG := FieldByName('ZaMesGod').AsDateTime;
        DecodeDate(dZaMG, nY, nM, nD);
        nSmForPdn := 0;
        nSmPF := 0;
        nSmSS := 0;
        nSmFZ := 0;
        nSmAlim := 0;
        nSmPdn := 0;
        nProcLgSotr := GetProcLG(nTabN, dZaMG, nKdObj, nKdKatP, nKdSpZ);
                                  // процент у сотрудника и KdObj, KatP, KdSpZ
        nPorogLg := aPorogLg[nM];            // в таблице ПдН
        nMinZp   := aMinZp[nM];              // в таблице ПдН
        nPrcPdN  := aPrcPdN[nM];             // в таблице ПдН
        nProcLG  := aProcLg[nM];             // в таблице ПдН
        nSmLg    := nMinZp * nProcLg / 100;
        dDtEndMes := MyLastDOM(dZaMG);
        bUvolen := IsUvolenOnEndMes(nTabN, dDtEndMes);
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and
                (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
          cVidN := FieldByName('VidN').AsString;
          if (cVidN < '6000') and (FieldByName('SPdN').AsString = '1') then
            nSmForPdn := nSmForPdn + FieldByName('Smm').AsFloat
          else if (cVidN >= '6001') and (cVidN <= '6002') then
            nSmPdN := nSmPdn - FieldByName('Smm').AsFloat
          else if (cVidN >= '6301') and (cVidN <= '6304') then
            nSmSS := nSmSS - FieldByName('Smm').AsFloat
          else if (cVidN >= '6401') and (cVidN <= '6415') then
            nSmPF := nSmPF - FieldByName('Smm').AsFloat
          else if (cVidN >= '6501') and (cVidN <= '6502') then
            nSmFZ := nSmFZ - FieldByName('Smm').AsFloat
          else if (cVidN >= '6601') and (cVidN <= '6602') then
            nSmAlim := nSmAlim - FieldByName('Smm').AsFloat;
          Next;
        end;
        // Тут самый момент сделать пересчет и вписать сумму разницы
        nSmLgSotr := 0;
        nSmNewPdn := 0;
        if not bUvolen and (nSmForPdn < nPorogLg) then
          nSmLgSotr := nSmLg * nProcLgSotr / 100;
        if (nSmForPdn > 0) then begin
          nSmNewPdn := (nSmForPdN - nSmLgSotr - nSmPF - nSmSS - nSmFZ)
                                                                * nPrcPdN / 100;
          nSmNewPdn := RoundTo(nSmNewPdn, -2);
          if nSmNewPdn < 0 then
            nSmNewPdn := 0;
        end;
        if Abs(nSmNewPdn - nSmPdn) > 0.05 then
          AddRecInTblPdn(nTabN, cFamIO, dZaMG, bUvolen, nKdObj, nKdKatP, nKdSpZ,
                     nPorogLg, nMinZp, nProcLg, nSmLgSotr, nProcLgSotr,
                   nSmForPdn, nSmPF, nSmSS, nSmFZ, nSmAlim, nSmPdn, nSmNewPdN);
      end;
    end;
    Close;
  end;
  with qryTmp do begin
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  // Переключиться на ts2
  tblPdn.Close;
  dbgrPdn.DataSource := dsrcPdn;
  dsrcPdn.DataSet := tblPdn;
  tblPdn.Open;
  LabelCntRec.Caption := 'Записей: ' + IntToStr(tblPdn.RecordCount);
  dsrcDet.DataSet := qryDet;
  dbgrDet.DataSource := dsrcDet;
  OpenQryDet;
  PageControl.ActivePage := ts2;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.sBtnProverkaClick(Sender: TObject);
var nSmForPdn, nSmPF, nSmSS, nSmFZ, {nSmAlim,} nSmPdn, nSmNewPdn : double;
    nPorogLg, nPrcPdN, nMinZp, nProcLg : double;
    nProcLgSotr, nSmLgSotr : double;
    bUvolen : boolean;
    dDtEndMes : TDateTime;
begin
  with tblPdn do begin
    dDtEndMes := MyLastDOM(FieldByName('ZaMesGod').AsDateTime);
    bUvolen := IsUvolenOnEndMes(FieldByName('TabN').AsInteger, dDtEndMes);
    nSmForPdn := FieldByName('SmForPdN').AsFloat;
    nSmPF := FieldByName('SmPF').AsFloat;
    nSmSS := FieldByName('SmSS').AsFloat;
    nSmFZ := FieldByName('SmFZ').AsFloat;
    //nSmAlim := FieldByName('SmAlim').AsFloat;
    nSmPdN :=  FieldByName('SmPdN').AsFloat;
    nPorogLg := FieldByName('PorogLg').AsFloat;
    nProcLg  := FieldByName('PrcLg').AsFloat;
    nMinZp   := FieldByName('MinZp').AsFloat;
    nPrcPdN := 15.00;  // надо массивы создавать при нажатии sBtnForward00
    nProcLgSotr := FieldByName('PrcLg').AsFloat;      // чтобы были всегда
    nSmLgSotr := 0;
    if not bUvolen and (nSmForPdn < nPorogLg) then
      nSmLgSotr := nMinZp * nProcLg / 100 * nProcLgSotr / 100;
    nSmNewPdn := (nSmForPdN - nSmLgSotr - nSmPF - nSmSS - nSmFZ) * nPrcPdN / 100;
    nSmNewPdn := RoundTo(nSmNewPdn, -2);
    if nSmNewPdn < 0 then
      nSmNewPdn := 0;
    Edit;
    FieldByName('SmNewPdN').AsFloat := nSmNewPdn;
    FieldByName('Summa').AsFloat := RoundTo(nSmPdN - nSmNewPdN, -2);
    Post;
    if not Eof then
      Next;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.AddRecInTblPdn(nTabN : integer; cFamIO : ShortString;
                             dZaMG : TDateTime; bUvolen : boolean;
                             nKdObj, nKdKatP, nKdSpZ : SmallInt;
                   nPorogLg, nMinZp, nProcLg, nSmLgSotr, nProcLgSotr, nSmForPdn,
                      nSmPF, nSmSS, nSmFZ, nSmAlim, nSmPdN, nSmNewPdN : double);
begin
  with tblPdn do begin
    Append;
    FieldByName('TabN').AsInteger := nTabN;
    FieldByName('FamIO').AsString := cFamIO;
    FieldByName('ZaMesGod').AsDateTime := dZaMG;
    FieldByName('PorogLg').AsFloat := nPorogLg;
    FieldByName('MinZp').AsFloat := nMinZp;
    FieldByName('PrcLg').AsFloat := nProcLg;
    FieldByName('PrcLgSotr').AsFloat := nProcLgSotr;
    FieldByName('SmLgSotr').AsFloat := nSmLgSotr;
    FieldByName('SmForPdn').AsFloat := nSmForPdn;
    FieldByName('SmPF').AsFloat := nSmPF;
    FieldByName('SmSS').AsFloat := nSmSS;
    FieldByName('SmFZ').AsFloat := nSmFZ;
    FieldByName('SmAlim').AsFloat := nSmAlim;
    FieldByName('SmPdN').AsFloat := nSmPdN;
    FieldByName('SmNewPdN').AsFloat := nSmNewPdN;
    FieldByName('Summa').AsFloat := RoundTo(nSmPdN - nSmNewPdN, -2);
    FieldByName('KdObj').AsInteger := nKdObj;
    FieldByName('KdKatP').AsInteger := nKdKatP;
    FieldByName('KdSpZ').AsInteger := nKdSpZ;
    if bUvolen then
      FieldByName('Metka').AsInteger := 1;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.dbgrPdnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrPdn.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if tblPdn.FieldByName('Metka').AsInteger = 1 then
        Font.Color := clBlue;
      if (cFldNm = 'SUMMA') or (cFldNm = 'SMFORPDN')then begin
        if (Column.Field.AsFloat < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
        Font.Style := [fsBold];
      end;
    end;
  end;
  dbgrPdn.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.sBtnStayOnTopClick(Sender: TObject);
begin
  SetFormStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.SetFormStayOnTop;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.bBtnCancel00Click(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.sBtnSaveClick(Sender: TObject);
var cMsg, cMes : ShortString;
    nCntRecVzvr, nCntRecUdrg, nCntRecPodkl, nKdObj : SmallInt;
    nSmVzvr, nSmUdrg : double;
    bIsInSps : boolean; nTabN : integer;
begin
   with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count(NR) as Cnt, Sum(Summa) as Smm ' +
            ' from ' + cTblPdnNm + ' where DtProc is Null and Summa > 0');
    Open;
    nCntRecVzvr := FieldByName('Cnt').AsInteger;
    nSmVzvr := FieldByName('Smm').AsFloat;
    Close;
    SQL.Clear;
    SQL.Add('Select Count(NR) as Cnt, Sum(Summa) as Smm ' +
            ' from ' + cTblPdnNm + ' where DtProc is Null and Summa < 0');
    Open;
    nCntRecUdrg := FieldByName('Cnt').AsInteger;
    nSmUdrg := -FieldByName('Smm').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  cMes := Copy(DateToStr(dDtPrc), 4, 7);
  cMsg := 'Записей с удержаниями ' + IntToStr(nCntRecUdrg) +
          ' на сумму ' + FloatToStrF(nSmUdrg, ffFixed, 16, 2) + #13#10 +
          'Записей с возвратами ' + IntToStr(nCntRecVzvr) +
          ' на сумму ' + FloatToStrF(nSmVzvr, ffFixed, 16, 2) + #13#10;
  cMsg := cMsg + '(не подкллючаются отсутствующие с списке месяца ' +
                                                         cMes + ')' + #13#10;
  cMsg := cMsg + 'Подключить результаты в отклонения месяца ' + cMes + '?:';
  if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    if bIsFormShwPsPdnNU then
      FormShwPsPdnNU.Close;
    with qryInSps do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from Z_SPS where DtProc = :dDtPrc and TabN = :nTabN');
    end;
    // Отключить qryDet
    qryDet.DataSource := nil;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from GetNewVdPV');
      Open;
      nNewNrVdPv := FieldByName('NewVdPV').AsInteger;
      Close;
      SQL.Clear;
      SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
              ' Summa, KdObj, KdKatP, PdN, KdSpZ, Notes, PrPV, DtVdPV, ' +
              ' NrVdPV, MyNotes) values (:nKdSps, :dDtPrc, :dZaMesGod, ' +
              ' :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, :nPdN, :nKdSpZ, ' +
              ' :cNotes, :nPrPV, :dDtVdPV, :nNtVdPV, :cMyNotes)');
    end;
    // Надо еще добавить проверку - есть ли в списке. Нет - подключить !!!!
    with tblPdn do begin
      First;
      nCntRecPodkl := 0;
      while not Eof do begin
        nTabN := FieldByName('TabN').AsInteger;
        bIsInSps := IsInSps(nTabN, dDtPrc, nKdObj); // и в списке какого KdObj
        while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
          if bIsInSps and FieldByName('DtProc').IsNull and
                    (FieldByName('Summa').AsFloat <> 0) then begin
            AddRecInBD;
            Edit;
            FieldByName('DtProc').AsDateTime := dDtPrc;
            Post;
            Inc(nCntRecPodkl);
          end;
          Next;
        end;
      end;
      First;
    end;
    if nCntRecPodkl > 0 then with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Insert into Z_VdPV (DtProc, NrVdPV, DtVdPV, KdUsr, MyNotes) ' +
              ' values (:dDtPrc, :nNrVdPV, :dDtVdPV, :nKdUsr, :cMyNotes)');
      ParamByName('dDtPrc').AsDateTime := dDtPrc;
      ParamByName('nNrVdPV').AsInteger := nNewNrVdPV;
      ParamByName('dDtVdPV').AsDateTime := Date;
      ParamByName('nKdUsr').AsInteger := nAppKdUsr;
      ParamByName('cMyNotes').AsString := 'что-нибудь';
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with qryInSps do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    // Включить qryDet
    qryDet.DataSource := dsrcPdn;
    if nCntRecPodkl > 0 then
      ShowMessage('Подключено зависей: ' + IntToStr(nCntRecPodkl) +
                  '. Пакет отклонений № ' + IntToStr(-nNewNrVdPV))
    else
      ShowMessage('Не обнажужено записей для подключения');
  end;
end;
//------------------------------------------------------------------------------
function TFormPsPdn.IsInSps(nTabN : integer; dDtPrc : TDateTime;
                                              var nKdObj : SmallInt) : boolean;
begin
  Result := false;
  with qryInSps do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    if RecordCount > 0 then begin
      nKdObj := FieldByName('KdObj').AsInteger;
      Result := true;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.AddRecInBD;
begin
  with qryTmp do begin
    ParamByName('nKdSps').AsInteger := 1;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('dZaMesGod').AsDateTime := tblPdn.FieldByName('ZaMesGod').AsDateTime;
    ParamByName('nTabN').AsInteger := tblPdn.FieldByName('TabN').AsInteger;
    ParamByName('cVidN').AsString := '6002';
    ParamByName('nSumma').AsFloat := tblPdn.FieldByName('Summa').AsFloat;
    ParamByName('nKdObj').AsInteger := tblPdn.FieldByName('KdObj').AsInteger;
    ParamByName('nKdKatP').AsInteger := tblPdn.FieldByName('KdKatP').AsInteger;
    ParamByName('nPdN').AsInteger := 0;
    ParamByName('nKdSpZ').AsInteger := tblPdn.FieldByName('KdSpZ').AsInteger;
    ParamByName('cNotes').AsString := 'Пересч.ПН';
    ParamByName('nPrPV').AsInteger := 1;
    ParamByName('dDtVdPV').AsDateTime := Date;
    ParamByName('nNtVdPV').AsInteger := nNewNrVdPV;
    ParamByName('cMyNotes').AsString := 'MyPsPdn';
    ExecSQL;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.FloatFldGetText(Sender: TField;
                                       var Text: String; DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).isNull or
                            ((Sender as TField).AsFloat = 0)) then
    Text := ''
  else
    Text := FloatToStrF((Sender as TField).AsFloat, ffFixed, 18, 2);
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.sBtnPrtClick(Sender: TObject);
begin
  F6PrtPsPdn(tblPdn, nGodZa);
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.dbgrPdnDblClick(Sender: TObject);
begin
  if tblPdn.RecordCount > 0 then
    ShowPsPdnNU; {z_psPdNu}
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.popDetNUClick(Sender: TObject);
begin
  if tblPdn.RecordCount > 0 then
    ShowPsPdnNU; {z_psPdNu}
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.popPopup(Sender: TObject);
begin
  popDelRec.Enabled := tblPdn.RecordCount > 0;
  popDetNU.Enabled := popDelRec.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.popDelRecClick(Sender: TObject);
begin
  if MessageDlg('Удалить текущую запись?:', mtConfirmation,
                          [mbYes, mbNo], 0) = mrYes then
    tblPdn.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdn.tblPdnAfterDelete(DataSet: TDataSet);
begin
  LabelCntRec.Caption := 'Записей: ' + IntToStr(tblPdn.RecordCount);
end;

end.
