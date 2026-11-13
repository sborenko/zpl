unit Z_ShwDr8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBTables, Grids, DBGrids, Buttons, DBClient,
  SimpleDS, ExtCtrls, StdCtrls;

type
  TFormShwDr8 = class(TForm)
    qryNu: TQuery;
    dsrcNu: TDataSource;
    tblDr8: TTable;
    sdsTotals: TSimpleDataSet;
    dsrcTotals: TDataSource;
    dbgrTotals: TDBGrid;
    Splitter1: TSplitter;
    dbgrDr8: TDBGrid;
    dsrcDr8: TDataSource;
    Panel1: TPanel;
    sBtnPrt: TSpeedButton;
    bBtnCancel: TBitBtn;
    sBtnCopy: TSpeedButton;
    LabelCntOsn: TLabel;
    LabelCntSovm: TLabel;
    qryPereInf: TQuery;
    SaveDialog1: TSaveDialog;
    tblDr8NP: TFloatField;
    tblDr8PERIOD: TSmallintField;
    tblDr8RIK: TSmallintField;
    tblDr8KOD: TStringField;
    tblDr8TYP: TSmallintField;
    tblDr8TIN: TStringField;
    tblDr8S_NAR: TFloatField;
    tblDr8S_DOX: TFloatField;
    tblDr8S_TAXN: TFloatField;
    tblDr8S_TAXP: TFloatField;
    tblDr8OZN_DOX: TSmallintField;
    tblDr8D_PRIYN: TDateField;
    tblDr8D_ZVILN: TDateField;
    tblDr8OZN_PILG: TSmallintField;
    tblDr8OZNAKA: TSmallintField;
    tblDr8FamIO: TStringField;
    tblDr8TabN: TIntegerField;
    procedure tblDr8CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
    procedure sBtnCopyClick(Sender: TObject);
  private
    { Private declarations }
    c_FirmEDRPOU, c_FirmNm, c_IdRuk, c_PhRuk, c_FioRuk, c_IdBuh,
    c_PhBuh, c_BuhFIO, c_InspEDRPOU, c_InspDPI, c_InspNm : string;
    n_CntOsn, n_CntSovm : integer;
    function CreOpenTblDr8 : boolean;
    procedure OpenQryNU(mListPeriodu : TStringList);
    procedure CreOpenSds(mListPeriodu : TStringList);
    procedure SborItogov;
    function GetPereSovmInf(nTabN : integer; dOnDate : TDateTime) : boolean;
  public
    { Public declarations }
  end;

procedure CreShowDr8(mListPeriodu : TStringList;
                     cFirmEDRPOU, cFirmNm, cIdRuk, cPhRuk, cFioRuk, cIdBuh,
                     cPhBuh, cBuhFIO, cInspEDRPOU, cInspDPI, cInspNm : string);

const SECTION = 'Z_ShwDr8';

var
  FormShwDr8: TFormShwDr8;
  cNmPerioda : string;
  nKv, nGod, nMes1, nMes3 : word;

implementation

uses A_Const, Z_Main, Z_DM, Z_CmnPrt, A_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure CreShowDr8(mListPeriodu : TStringList;
                     cFirmEDRPOU, cFirmNm, cIdRuk, cPhRuk, cFioRuk, cIdBuh,
                     cPhBuh, cBuhFIO, cInspEDRPOU, cInspDPI, cInspNm : string);
begin
  FormShwDr8 := TFormShwDr8.Create(Application);
  with FormShwDr8 do begin
    c_FirmEDRPOU := cFirmEDRPOU;
    c_FirmNm     := cFirmNm;
    c_IdRuk      := cIdRuk;
    c_PhRuk      := cPhRuk;
    c_FioRuk     := cFioRuk;
    c_IdBuh      := cIdBuh;
    c_PhBuh      := cPhBuh;
    c_BuhFIO     := cBuhFIO;
    c_InspEDRPOU := cInspEDRPOU;
    c_InspDPI    := cInspDPI;
    c_InspNm     := cInspNm;
    n_CntOsn     := 0;
    n_CntSovm    := 0;
    cNmPerioda   := '';
    OpenQryNU(mListPeriodu);
    CreOpenSds(mListPeriodu);
    if CreOpenTblDr8 then begin
      SborItogov;
      Caption := 'Сведения ' + cNmPerioda;
      ShowModal;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwDr8.OpenQryNU(mListPeriodu : TStringList);
var cMsg, cDtZaMG : string; dDtZaMG : TDateTime; i : integer; nY, nM, nD : word;
begin
  cMsg := '';
  for i := 0 to mListPeriodu.Count - 1 do begin
    cDtZaMG := mListPeriodu[i];
    if i = 0 then begin
      dDtZaMG := StrToDate(cDtZaMG);
      DecodeDate(dDtZaMG, nY, nM, nD);
      nMes1 := nM;
      nGod := nY;
      cNmPerioda := 'за ';
      if nM = 1 then
        nKv := 1
      else if nM = 4 then
        nKv := 2
      else if nM = 7 then
        nKv := 3
      else
        nKv := 4;
      cNmPerioda := cNmPerioda + IntToStr(nKv) + '-й квартал ' +
                                              IntToStr(nY) + ' г.';
    end;
    if i = 2 then begin
      dDtZaMG := StrToDate(cDtZaMG);
      DecodeDate(dDtZaMG, nY, nMes3, nD); // последний месяц квартала
    end;
    cDtZaMG := Copy(cDtZaMG, 4, 2) + '/' + Copy(cDtZaMG, 1, 2) + '/' +
               Copy(cDtZaMG, 7, 4);
    cMsg := cMsg + '"' + cDtZaMG + '"';
    if i < (mListPeriodu.Count - 1) then
      cMsg := cMsg + ', ';
  end;
  cMsg := '(' + cMsg + ')';
  with qryNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_NU where DtProc in ' + cMsg +
            ' order by TabN, DtProc, VidN');
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'dr8_1.sql');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwDr8.CreOpenSds(mListPeriodu : TStringList);
var cTmp, cDtZaMG, cPole : string; i : integer;
begin
  with sdsTotals do begin
    with FieldDefs.AddFieldDef do begin
      DataType := ftAutoinc;
      Name := 'NR';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftInteger;
      Name := 'TabN';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftString;
      Size := 25;
      Name := 'FamIO';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftString;
      Size := 10;
      Name := 'ID';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftString;
      Size := 1;
      Name := 'Sovm';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftDate;
      Name := 'DtPr';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftDate;
      Name := 'DtUv';
    end;
    for i := 0 to mListPeriodu.Count - 1 do begin
      cDtZaMG := mListPeriodu[i];
      cTmp := 'p' + Copy(cDtZaMG, 4, 2) + Copy(cDtZaMG, 9, 2);
      cPole := cTmp + 'sD';
      with FieldDefs.AddFieldDef do begin
        DataType := ftFloat;
        Name := cPole;
      end;
      cPole := cTmp + 'sN';
      with FieldDefs.AddFieldDef do begin
        DataType := ftFloat;
        Name := cPole;
      end;
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftFloat;
      Name := 'TtsD';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftFloat;
      Name := 'TtsN';
    end;
    with IndexDefs.AddIndexDef do begin
      Fields := 'TabN';
      Name := 'OnTabN';
    end;
    CreateDataSet;
    IndexName := 'OnTabN';
    Open;
  end;
end;
//------------------------------------------------------------------------------
function TFormShwDr8.GetPereSovmInf(nTabN : integer;
                                            dOnDate : TDateTime) : boolean;
var nRes : integer;
begin
  with qryPereInf do begin
    Close;
    ParamByName('nTabn').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dOnDate;
    ParamByName('dDtEnd').AsDateTime := dOnDate;
    Open;
    nRes := FieldByName('Sovm').AsInteger;
    if nRes = 1 then
      Result :=  true
    else
      Result := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwDr8.SborItogov;
var cPoleDhd, cPoleNlg, cDtZaMG : string;
    nTabN, nPp : integer; dDtZaMG : TDateTime;
    cFamIO, cFam, cIma, cOtch, cPol, cID : string;
    dDtPr, dDtUv, dDOB, dDtFirstKv, dDtLastKv : TDateTime;
    nSmDhd, nSmNlg : double;
begin
  //     Пересмотреть - ушли из УПИ даты приема и увольнения
  dDtFirstKv := EncodeDate(nGod, nMes1, 1);
  dDtLastKv := MyLastDom(EncodeDate(nGod, nMes3, 27));
  with qryNu do begin
    First;
    dDtPr := EncodeDate(2000, 1, 1);  // пока, а надо заглядывать
    dDtUv := EncodeDate(2008, 12, 1); // по каждому ТабН в z_PrmUv
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      cFamIO := '';
      cFam := '';
      cIma := '';
      cOtch := '';
      cPol := '';
      cID := '';
      dDOB := 0;
      DmMain.GetUpiInfo(nTabN, cFamIO, cFam, cIma, cOtch, cPol, cId, dDOB);
      if not sdsTotals.Locate('TabN', nTabN, []) then begin
        sdsTotals.Append;
        sdsTotals.FieldByName('TabN').AsInteger := nTabN;
        sdsTotals.FieldByName('FamIO').AsString := cFamIO;
        if (dDtPr <> 0) and (dDtPr >= dDtFirstKv) and (dDtPr <= dDtLastKv) then
          sdsTotals.FieldByName('DtPr').AsDateTime := dDtPr;
        if (dDtUv <> 0) and (dDtUv >= dDtFirstKv) and (dDtUv <= dDtLastKv) then
          sdsTotals.FieldByName('DtUv').AsDateTime := dDtUv;
        if GetPereSovmInf(nTabN, dDtLastKv) then begin
          sdsTotals.FieldByName('Sovm').AsString := '1';
          n_CntSovm := n_CntSovm + 1; end
        else
          n_CntOsn := n_CntOsn + 1;
        sdsTotals.FieldByName('ID').AsString := cID; end
      else
        sdsTotals.Edit;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        dDtZaMG := FieldByName('DtProc').AsDateTime;
        cDtZaMG := DateToStr(dDtZaMG);
        cPoleDhd := 'p' + Copy(cDtZaMG, 4, 2) + Copy(cDtZaMG, 9, 2) + 'sD';
        cPoleNlg := 'p' + Copy(cDtZaMG, 4, 2) + Copy(cDtZaMG, 9, 2) + 'sN';
        while (FieldByName('TabN').AsInteger = nTabN) and
            (FieldByName('DtProc').AsDateTime = dDtZaMG) and not Eof do begin
          if FieldByName('VidN').AsString <= '6000' then begin
            sdsTotals.FieldByName(cPoleDhd).AsFloat :=
                         sdsTotals.FieldByName(cPoleDhd).AsFloat +
                                                 FieldByName('Summa').AsFloat;
            sdsTotals.FieldByName('TtsD').AsFloat :=
                         sdsTotals.FieldByName('TtsD').AsFloat +
                                              FieldByName('Summa').AsFloat; end
          else if FieldByName('VidN').AsString = '6001' then begin
            sdsTotals.FieldByName(cPoleNlg).AsFloat :=
                         sdsTotals.FieldByName(cPoleNlg).AsFloat -
                                                 FieldByName('Summa').AsFloat;
            sdsTotals.FieldByName('TtsN').AsFloat :=
                         sdsTotals.FieldByName('TtsN').AsFloat -
                                              FieldByName('Summa').AsFloat;
          end;
          Next;
        end;
      end;
    end;
    if (sdsTotals.State in [dsInsert, dsEdit]) then
      sdsTotals.Post;
  end;
  with sdsTotals do begin
    First;
    nPp := 0;
    nSmDhd := 0;
    nSmNlg := 0;
    while not Eof do begin
      Inc(nPp);
      tblDr8.Append;
      tblDr8.FieldByName('NP').AsInteger := nPp;
      tblDr8.FieldByName('Period').AsInteger := nKv;
      tblDr8.FieldByName('Rik').AsInteger := nGod;
      tblDr8.FieldByName('Kod').AsString := c_FirmEDRPOU;
      tblDr8.FieldByName('Typ').AsInteger := 0;
      tblDr8.FieldByName('Tin').AsString := FieldByName('ID').AsString;
      tblDr8.FieldByName('S_Dox').AsFloat := FieldByName('TtsD').AsFloat;
      tblDr8.FieldByName('S_TaxN').AsFloat := FieldByName('TtsN').AsFloat;
      nSmDhd := nSmDhd + FieldByName('TtsD').AsFloat;
      nSmNlg := nSmNlg + FieldByName('TtsN').AsFloat;
      tblDr8.FieldByName('Ozn_Dox').AsInteger := 1;
      tblDr8.FieldByName('D_Priyn').AsString := FieldByName('DtPr').AsString;
      tblDr8.FieldByName('D_Zviln').AsString := FieldByName('DtUv').AsString;
      tblDr8.FieldByName('Ozn_Pilg').AsInteger := 0;
      tblDr8.FieldByName('Oznaka').AsInteger := 0;
      tblDr8.Post;
      Next;
    end;
    First;
    // В tblDr8 добавить записи: итоговую(99999),
    tblDr8.Append;
    tblDr8.FieldByName('NP').AsInteger := 99999;
    tblDr8.FieldByName('Period').AsInteger := nKv;
    tblDr8.FieldByName('Rik').AsInteger := nGod;
    tblDr8.FieldByName('Kod').AsString := c_FirmEDRPOU;
    tblDr8.FieldByName('S_Dox').AsFloat := nSmDhd;
    tblDr8.FieldByName('S_TaxN').AsFloat := nSmNlg;
    tblDr8.Post;
    // о руководителе(99991)
    tblDr8.Append;
    tblDr8.FieldByName('NP').AsInteger := 99991;
    tblDr8.FieldByName('Period').AsInteger := nKv;
    tblDr8.FieldByName('Rik').AsInteger := nGod;
    tblDr8.FieldByName('Kod').AsString := c_FirmEDRPOU;
    tblDr8.FieldByName('Tin').AsString := c_IdRuk;
    tblDr8.FieldByName('S_Dox').AsString := c_PhRuk;
    tblDr8.Post;
    // и о бухгалтере(99992)
    tblDr8.Append;
    tblDr8.FieldByName('NP').AsInteger := 99992;
    tblDr8.FieldByName('Period').AsInteger := nKv;
    tblDr8.FieldByName('Rik').AsInteger := nGod;
    tblDr8.FieldByName('Kod').AsString := c_FirmEDRPOU;
    tblDr8.FieldByName('Tin').AsString := c_IdBuh;
    tblDr8.FieldByName('S_Dox').AsString := c_PhBuh;
    tblDr8.Post;
    tblDr8.OnCalcFields := tblDr8CalcFields;
    tblDr8.First;
  end;
  LabelCntOsn.Caption := 'Основных: ' + IntToStr(n_CntOsn);
  LabelCntSovm.Caption := 'Совместителей: ' + IntToStr(n_CntSovm);
end;
//------------------------------------------------------------------------------
function TFormShwDr8.CreOpenTblDr8 : boolean;
var bEx : boolean; cTblNameFrom, cTblDr8Name : string;
begin
  Result := false;
  bEx := false;
  cTblNameFrom := cDirDocs + 'da_Shbl.dbf';
  cTblDr8Name  := cDirInd + 'da06.dbf';
  if FileExists(cTblNameFrom) then begin
    CopyFile(PChar(cTblNameFrom), PChar(cTblDr8Name), bEx);
    Result := true; end
  else begin
    ShowMessage('Не найден файл шаблона ' + cTblNameFrom + '. Выходим!');
    Exit;
  end;
  with tblDr8 do begin
    if Active then Close;
    DataBaseName := cDirInd;
    TableName := 'da06.dbf';
    OnCalcFields := nil;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwDr8.tblDr8CalcFields(DataSet: TDataSet);
begin
  with tblDr8 do begin
    if FieldByName('NP').AsInteger = 99999 then
      FieldByName('FamIO').AsString := 'И Т О Г О:'
    else if FieldByName('NP').AsInteger = 99991 then
      FieldByName('FamIO').AsString := 'Руководитель:'
    else if FieldByName('NP').AsInteger = 99992 then
      FieldByName('FamIO').AsString := 'Гл.бухгалтер:'
    else if sdsTotals.Locate('ID', FieldByName('TIN').asString, []) then begin
      FieldByName('TabN').AsInteger := sdsTotals.FieldByName('TabN').AsInteger;
      FieldByName('FamIO').AsString := sdsTotals.FieldByName('FamIO').AsString;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwDr8.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 600);
    Free;
  end;
  if FileExists(cDirVids  + 'z_ShwDr8.vid') then
    dbgrDr8.Columns.LoadFromFile(cDirVids  + 'z_ShwDr8.vid');
  dbgrTotals.Visible := bFlagDbg;
  Splitter1.Visible  := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormShwDr8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrDr8.Columns.SaveToFile(cDirVids  + 'z_ShwDr8.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwDr8.sBtnPrtClick(Sender: TObject);
begin                                                                 {Z_CmnPrt}
  F6_PrtDr8(tblDr8, c_FirmEDRPOU, c_FirmNm, c_IdRuk, c_PhRuk, c_FioRuk, c_IdBuh,
                    c_PhBuh, c_BuhFIO, c_InspEDRPOU, c_InspDPI, c_InspNm,
                    nKv, nGod, n_CntOsn, n_CntSovm);
end;
//------------------------------------------------------------------------------
procedure TFormShwDr8.sBtnCopyClick(Sender: TObject);
var bEx : boolean; cTblNameFrom, cTblDr8Name : string;
begin
  SaveDialog1.Title := 'Копирование на дискету';
  if SaveDialog1.Execute then begin
    cTblDr8Name  := SaveDialog1.FileName;
    MessageDlg('Вывод в ' + cTblDr8Name, mtError, [mbOk], 0);
//    try
//    except
//      on EInOutError do
//        MessageDlg('File I/O error.', mtError, [mbOk], 0);
//    end;
    tblDr8.Close;
    bEx := false;
    cTblNameFrom := 'd:\my_Jobs\koop\Ind\da06.dbf';
//    cTblDr8Name  := 'a:\da06.dbf';
    if FileExists(cTblNameFrom) then
      CopyFile(PChar(cTblNameFrom), PChar(cTblDr8Name), bEx);
    tblDr8.Open;
  end;
end;

end.
