unit z_MkArhG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, Buttons, StdCtrls, ExtCtrls, Grids,
  Math, DBGrids, ComCtrls, DBClient;

type
  TFormMkArhG = class(TForm)
    tblUni: TTable;
    qryTmp: TQuery;
    dsrcUni: TDataSource;
    PageControl1: TPageControl;
    ts01: TTabSheet;
    ts02: TTabSheet;
    Panel1: TPanel;
    sBtnPrt: TSpeedButton;
    bBtnCancel: TBitBtn;
    dbgrUni: TDBGrid;
    tblYears: TTable;
    dsrcYears: TDataSource;
    dbgrYear: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    sBtnGo01: TSpeedButton;
    bBtnCancel01: TBitBtn;
    LabelMsg2: TLabel;
    LabelMsg1: TLabel;
    qryVidN: TQuery;
    chBoxLine3: TCheckBox;
    cdsUni: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnGo01Click(Sender: TObject);
    procedure dbgrYearEnter(Sender: TObject);
    procedure dbgrYearExit(Sender: TObject);
    procedure PrtResults;
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    nSvGod : SmallInt;
    n_Case, n_KdObj : SmallInt;
    procedure CreOpenTblYears;
    procedure AddYearToTblYears(nY : word);
    function GetShVidN(cVidN : ShortString) : ShortString;
    procedure CreOpenTblUni(nGod : SmallInt);
    procedure AddRecDtPToTblUni(nTabN : integer;
                                     cVidN, cShVidN : ShortString;
                                       nSmm : double; dDtPrc : TDateTime);
    procedure AddRecZaMGToTblUni(nTabN : integer;
                                     cVidN, cShVidN : ShortString;
                                       nSmm : double; dDtZaMG : TDateTime);
    procedure PrtPorc500(nGod, nCntSotrTt : SmallInt);
    procedure CreOpenCdsUni;
  public
    { Public declarations }
  end;

procedure MakeArhivki(nCase, nKdObj : SmallInt);

const SECTION = 'z_MkArhG';

var
  FormMkArhG: TFormMkArhG;

implementation

uses a_Const, a_DM, z_DM, Z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure MakeArhivki(nCase, nKdObj : SmallInt);
var cMsg : ShortString;
begin
  FormMkArhG := TFormMkArhG.Create(Application);
  with FormMkArhG do begin
    n_Case  := nCase;   {nCase = 0 - в Txt-файл, nCase = 1 - в MS Excel}
    n_KdObj := nKdObj;  {nKdObj = 0 - все подразделения, nKdObj > 0 - текущее}
    cMsg := 'Вывод "архивок" за год';
    if nKdObj > 0 then
      cMsg := cMsg + '.  (Подразд. ' + IntToStr(nKdObj) + ')';
    Caption := cMsg;
    Label1.Visible := nKdObj = 0;
    CreOpenTblYears;
    if nSvGod > 0 then
      tblYears.Locate('Year', nSvGod, []);
    ActiveControl := dbgrYear;
    if n_Case > 0 then
      chBoxLine3.Visible := false;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.FormCreate(Sender: TObject);
begin
  LabelMsg1.Caption := '';
  LabelMsg2.Caption := '';
  LabelMsg1.Font.Color := clWindowText;
  ts01.TabVisible := false;
  ts02.TabVisible := false;
  PageControl1.ActivePage := ts01;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    nSvGod := ReadInteger(SECTION, 'nSvGd', 2007);
    chBoxLine3.Checked := ReadBool(SECTION, 'nLn3', true);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nSvGd', tblYears.FieldByName('Year').AsInteger);
    WriteBool(SECTION, 'nLn3', chBoxLine3.Checked);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormMkArhG.CreOpenTblYears;
var nY, dummyWord, i : word;
begin
  with tblYears do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then
      DeleteTable;
    CreateTable;
    Open;
  end;

  DecodeDate(Now, nY, dummyWord, dummyWord);

  for i := 1993 to nY do
    AddYearToTblYears(i);
end;

//------------------------------------------------------------------------------
procedure TFormMkArhG.AddYearToTblYears(nY : word);
begin
  with tblYears do begin
    if not Locate('Year', nY, []) then begin
      Append;
      FieldByName('Year').AsInteger := nY;
      Post;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormMkArhG.GetShVidN(cVidN : ShortString) : ShortString;
begin
  Result := '';
  if qryVidN.Locate('VidN', cVidN, []) then
    Result := qryVidN.FieldByName('ShVidN').AsString;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.sBtnGo01Click(Sender: TObject);
begin
  CreOpenTblUni(tblYears.FieldByName('Year').AsInteger);
end;

//------------------------------------------------------------------------------
procedure TFormMkArhG.CreOpenTblUni(nGod : SmallInt);
var dDtPrcB, dDtPrcE : TDateTime; nTabN : integer;
    cShVidN : ShortString;
    cMsg : ShortString; nPp : Integer;
    cFam, cIma, cOtch, cID : ShortString;
    dDtPrc : TDateTime;
    nKdObj, nDum1 : integer;
    nOklTrf, nAvans, nProcLG : double;
    cSpAv : string1; cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bDum1 : boolean;
    i, nCntSotrTt, nNPp, nCntRec, nDumSmInt : SmallInt;
begin
  sBtnGo01.Enabled := false;
  bBtnCancel01.Enabled := false;
  Application.ProcessMessages;
  with qryVidN do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdVidN order by AIndx');
    Open;
  end;
  dDtPrcB := EncodeDate(nGod, 1, 1);
  dDtPrcE := EncodeDate(nGod, 12, 1);
  with tblUni do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then
      DeleteTable;
    IndexName := '';
    CreateTable;
    Open;
    IndexName := 'OnTabNVidN';
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    {
    if n_KdObj > 0 then begin
      cLstTabN := '(';
      SQL.Add('Select distinct tabN from z_Sps ' +
              ' where DtProc >= :dDtPrcB and DtProc <= :dDtPrcE ' +
              ' and KdObj = :nKdObj');
      ParamByName('dDtPrcB').AsDateTime := dDtPrcB;
      ParamByName('dDtPrcE').AsDateTime := dDtPrcE;
      ParamByName('nKdObj').AsInteger := n_KdObj;
      Open;
      nCntRec := RecordCount;
      i := 0;
      while not Eof do begin
        cLstTabN := cLstTabn + FieldByName('TabN').AsString;
        Inc(i);
        if i < nCntRec then
          cLstTabN := cLstTabN + ',';
        Next;
      end;
      cLstTabN := cLstTabN + ')';
      Close;
      SQL.Clear;
    end;
    }
    
    LabelMsg1.Caption := 'Выбираются сведения для полей "В месяце"';
    LabelMsg1.Refresh;

    SQL.Text :=
      'select n.TabN, n.DtProc, n.VidN, ' +
        'Sum(Cast(n.Summa as Numeric(18,2))) as SMM ' +
      'from z_NU n';

    if n_KdObj > 0 then
      SQL.Add(
        'left join z_Sps s on s.TabN = n.TabN and s.DtProc = n.DtProc ');

    SQL.Add(
      'where n.DtProc between :DtPrcB and :DtPrcE ' +
        'and n.VidN < "8000" ' +
        'and n.TabN > 0 ');

    if n_KdObj > 0 then begin
      SQL.Add(
        'and s.KdObj = :KdObj ');

      ParamByName('KdObj').AsInteger := n_KdObj;
    end;

    SQL.Add(
      'group by n.TabN, n.DtProc, n.VidN ');

    ParamByName('DtPrcB').AsDateTime := dDtPrcB;
    ParamByName('DtPrcE').AsDateTime := dDtPrcE;
    Open;

    LabelMsg1.Caption := 'Ввод  сведений  в  поля  "В месяце"';
    LabelMsg1.Refresh;
    nPp := 0;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      Inc(nPp);
      cMsg := IntToStr(nPp) + '. TabN = ' + FieldByName('TabN').AsString;
      LabelMsg2.Caption := cMsg;
      LabelMsg2.Refresh;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        cShVidN := GetShVidN(FieldByName('VidN').AsString);
        AddRecDtPToTblUni(nTabN, FieldByName('VidN').AsString,
                        cShVidN, FieldByName('Smm').AsFloat,
                           FieldByName('DtProc').AsDateTime);
        Next;
      end;
    end;
    LabelMsg2.Caption := '';
    LabelMsg2.Refresh;
    Close;
    SQL.Clear;
    LabelMsg1.Caption := 'Выбираются сведения для полей "За месяц"';
    LabelMsg1.Refresh;
    SQL.Text :=
      'select n.TabN, n.ZaMesGod, n.VidN, ' +
        'Sum(Cast(n.Summa as Numeric(18,2))) as SMM ' +
      'from Z_NU n';

    if n_KdObj > 0 then
      SQL.Add(
        'left join z_Sps s on s.TabN = n.TabN and s.DtProc = n.DtProc ');

    SQL.Add(
      'where n.ZaMesGod between :DtPrcB and :DtPrcE ' +
        'and n.VidN < "8000" ' +
        'and n.TabN > 0');

    if n_KdObj > 0 then begin
      SQL.Add(
        'and s.KdObj = :KdObj');

      ParamByName('KdObj').AsInteger := n_KdObj;
    end;

    SQL.Add(
      'group by n.TabN, n.ZaMesGod, n.VidN');

    ParamByName('DtPrcB').AsDateTime := dDtPrcB;
    ParamByName('DtPrcE').AsDateTime := dDtPrcE;
    Open;

    LabelMsg1.Caption := 'Ввод  сведений  в  поля  "За месяц"';
    LabelMsg1.Refresh;
    nPp := 0;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      Inc(nPp);
      cMsg := IntToStr(nPp) + '. TabN = ' + FieldByName('TabN').AsString;
      LabelMsg2.Caption := cMsg;
      LabelMsg2.Refresh;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        cShVidN := GetShVidN(FieldByName('VidN').AsString);
        AddRecZaMGToTblUni(nTabN, FieldByName('VidN').AsString,
                        cShVidN, FieldByName('Smm').AsFloat,
                           FieldByName('ZaMesGod').AsDateTime);
        Next;
      end;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  LabelMsg2.Caption := '';
  LabelMsg2.Refresh;
  // Заполнить поля KdObj и Fam, Ima, Otch, ID, Dolgnost в tblUni
  // Это можно было сделать (и было сделано) и при печати, но затребовали
  // сортировку по KdObj, Fam, Ima, Otch. Пришлось вводить KdObj и Fam тут.
  with qryTmp do begin  // можно - уже освободилось после CreOpenTblUni()
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI where TabN = :nTabN');
  end;
  LabelMsg1.Caption := 'Заполняются поля Подразделение, ' +
                                  'Фамилия, Имя, Отчество, ИД на конец года';
  LabelMsg1.Refresh;
  nPp := 0;
  with tblUni do begin
    First;
    nCntSotrTt := 0;
    nNPp := 0;
    dDtPrc := EncodeDate(nGod, 12, 31); // получить данные на конец года
    while not Eof do begin
      // сейчас сортирована в tblUni по TabN;VidN
      nTabN := FieldByName('TabN').AsInteger;
      Inc(nCntSotrTt);
      Inc(nPp);
      cMsg := IntToStr(nPp) + '. TabN = ' + FieldByName('TabN').AsString;
      LabelMsg2.Caption := cMsg;
      LabelMsg2.Refresh;
      qryTmp.Close;
      qryTmp.ParamByName('nTabN').AsInteger := nTabN;
      qryTmp.Open;
      cFam := qryTmp.FieldByName('Fam').AsString;
      cIma := qryTmp.FieldByName('Ima').AsString;
      cOtch := qryTmp.FieldByName('Otch').AsString;
      cID := qryTmp.FieldByName('ID').AsString;
      DmMain.GetPereInf(nTabN, dDtPrc, nKdObj, nDum1, nDum1, nDum1,
                                  nDum1, nDum1, nDum1, nDum1,
                                  nOklTrf, nAvans, nProcLG, cSpAv,
                                  cDolgnost, cNrPrikaza, dDtPrikaza,
                                  bDum1, bDum1, bDum1, nDumSmInt);
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        Edit;
        FieldByName('Fam').AsString := cFam;
        FieldByName('Ima').AsString := cIma;
        FieldByName('Otch').AsString := cOtch;
        FieldByName('ID').AsString := cID;
        FieldByName('Dolgnost').AsString := cDolgnost;
        FieldByName('KdObj').AsInteger := nKdObj;
        Post;
        Next;
      end;
    end;
    IndexName := 'FioTabNVidN';
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      Inc(nNPp);
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        Edit;
        FieldByName('NPp').AsInteger := nNPp;
        Post;
        Next;
      end;
    end;
    First;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryVidN do begin
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if n_Case = 0 then
    PrtResults
  else begin
    if n_KdObj > 0 then
      F6PrtArhivki(nGod, tblUni) {z_CmnPrt}
    else begin
      if nCntSotrTt < 550 then
        F6PrtArhivki(nGod, tblUni) {z_CmnPrt}
      else
        // Печатать порциями по 500 сотрудников (иначе вылетает F6Book)
        PrtPorc500(nGod, nCntSotrTt);
    end;
  end;
  LabelMsg2.Caption := '';
  bBtnCancel01.Caption := 'Выход';
  bBtnCancel01.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.CreOpenCdsUni;
begin
  with cdsUni do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.PrtPorc500(nGod, nCntSotrTt : SmallInt);
var i, nCntSotr : SmallInt; nTabN : integer;
begin
  with tblUni do begin
    First;
    nCntSotr := 0;
    LabelMsg1.Caption := 'Печать порциями по 500 сотрудников. ' +
                                            'Ждите и следите за экраном';
    LabelMsg2.Caption :=  'Сотрудников: ' + IntToStr(nCntSotrTt);
    LabelMsg1.Refresh;
    LabelMsg2.Refresh;
    Application.ProcessMessages;
    while not Eof do begin
      Inc(nCntSotr);
      if nCntSotr = 1 then
        CreOpenCdsUni;
      nTabN := FieldByName('TabN').AsInteger;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        cdsUni.Append;
        for i := 0 to Fields.Count-1 do begin
          cdsUni.Fields[i].AsString := Fields[i].AsString;
        end;
        cdsUni.Post;
        Next;
      end;
      if nCntSotr >= 500 then begin
        nCntSotr := 0;
        F6PrtArhivki(nGod, cdsUni); {z_CmnPrt}
      end;
    end;
    if nCntSotr >= 0 then
      F6PrtArhivki(nGod, cdsUni); {z_CmnPrt}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.AddRecDtPToTblUni(nTabN : integer;
                                     cVidN, cShVidN : ShortString;
                                       nSmm : double; dDtPrc : TDateTime);
var nY, nM, nD : word; cPole, c_VidN : ShortString;
begin
  DecodeDate(dDtPrc, nY, nM, nD);
  cPole := 'Sm';
  if nM < 10 then
    cPole := cPole + '0';
  cPole := cPole + IntToStr(nM);
  with tblUni do begin
    // В строку вида
    if not Locate('TabN;VidN', VarArrayOf([nTabN, cVidN]), []) then begin
      Append;
      FieldByName('TabN').AsInteger := nTabN;
      FieldByName('VidN').AsString  := cVidN;
      FieldByName('ShVidN').AsString := cShVidN; end
    else
      Edit;
    FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
    Post;
    if cVidN < '6000' then begin
      // В строку "По видам начисления"
      c_VidN := '6000';
      if not Locate('TabN;VidN', VarArrayOf([nTabN, c_VidN]), []) then begin
        Append;
        FieldByName('TabN').AsInteger := nTabN;
        FieldByName('VidN').AsString  := c_VidN;
        FieldByName('ShVidN').AsString := 'Начисления'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;  end
    else if (cVidN > '6000') and (cVidN < '8000') then begin
      // В строку "По видам удержанияния"
      c_VidN := '8000';
      if not Locate('TabN;VidN', VarArrayOf([nTabN, c_VidN]), []) then begin
        Append;
        FieldByName('TabN').AsInteger := nTabN;
        FieldByName('VidN').AsString := c_VidN;
        FieldByName('ShVidN').AsString := 'Удержания'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;
    end;
    if cVidN < '8000' then begin
      // В строку "Остаток на руки"
      c_VidN := '9999';
      if not Locate('TabN;VidN', VarArrayOf([nTabN, c_VidN]), []) then begin
        Append;
        FieldByName('TabN').AsInteger := nTabN;
        FieldByName('VidN').AsString := c_VidN;
        FieldByName('ShVidN').AsString := 'На руки'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.AddRecZaMGToTblUni(nTabN : integer;
                                     cVidN, cShVidN : ShortString;
                                       nSmm : double; dDtZaMG : TDateTime);
var nY, nM, nD : word; cPole, c_VidN : ShortString;
begin
  DecodeDate(dDtZaMG, nY, nM, nD);
  cPole := 'SmZa';
  if nM < 10 then
    cPole := cPole + '0';
  cPole := cPole + IntToStr(nM);
  with tblUni do begin
    // В строку вида
    if not Locate('TabN;VidN', VarArrayOf([nTabN, cVidN]), []) then begin
      Append;
      FieldByName('TabN').AsInteger := nTabN;
      FieldByName('VidN').AsString  := cVidN;
      FieldByName('ShVidN').AsString := cShVidN; end
    else
      Edit;
    FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
    Post;
    if cVidN < '6000' then begin
      // В строку "По видам начисления"
      c_VidN := '6000';
      if not Locate('TabN;VidN', VarArrayOf([nTabN, c_VidN]), []) then begin
        Append;
        FieldByName('TabN').AsInteger := nTabN;
        FieldByName('VidN').AsString  := c_VidN;
        FieldByName('ShVidN').AsString := 'Начисления'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;  end
    else if (cVidN > '6000') and (cVidN < '8000') then begin
      // В строку "По видам удержанияния"
      c_VidN := '8000';
      if not Locate('TabN;VidN', VarArrayOf([nTabN, c_VidN]), []) then begin
        Append;
        FieldByName('TabN').AsInteger := nTabN;
        FieldByName('VidN').AsString := c_VidN;
        FieldByName('ShVidN').AsString := 'Удержания'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;
    end;
    if cVidN < '8000' then begin
      // В строку "Остаток на руки"
      c_VidN := '9999';
      if not Locate('TabN;VidN', VarArrayOf([nTabN, c_VidN]), []) then begin
        Append;
        FieldByName('TabN').AsInteger := nTabN;
        FieldByName('VidN').AsString := c_VidN;
        FieldByName('ShVidN').AsString := 'На руки'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.dbgrYearEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.dbgrYearExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.sBtnPrtClick(Sender: TObject);
var nY : SmallInt;
begin
  if n_Case = 0 then
    PrtResults
  else begin
    nY := tblYears.FieldByName('Year').AsInteger;
    F6PrtArhivki(nY, tblUni); {z_CmnPrt}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkArhG.PrtResults;
var F1 : TextFile;
    cDirNm, cTxtFileNm, cLine, cLine2, cLine3, cVidN,
                               cFam, cIma, cOtch, cId : ShortString;
    nTabN : integer; cMsg : string;
    i, nY, nM, nPp, n_Pp, nCntLine, nMaxCntLine : SmallInt;
    nSmm : double;
    bLine3 : boolean;
    dDtPrc : TDateTime;
    nKdObj, nDum1, nFirstTabNRec : integer;
    nOklTrf, nAvans, nProcLG : double;
    cSpAv : string1; cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bDum1 : boolean; nDumSmInt : SmallInt;
begin
  nMaxCntLine := 60;
  bLine3 := chBoxLine3.Checked;
  with qryTmp do begin  // можно - уже освободилось после CreOpenTblUni()
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI where TabN = :nTabN');
  end;
  cLine := '==============================================================' +
           '==============================================================' +
           '=================================';
  cLine2 := '-------------------------------------------------------------' +
            '-------------------------------------------------------------' +
            '-----------------------------------';
  cLine3 := '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .' +
            ' . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ' +
            '. . . . . . . . . . . . . . . . . .';
  nY := tblYears.FieldByName('Year').AsInteger;
  cDirNm := 'c:\T_e_m_p\';
  if not DirectoryExists(cDirNm) then
    ForceDirectories(cDirNm);

  cTxtFileNm := cDirNm + 'Arh' + IntToStr(n_KdObj) + '.txt';
  AssignFile(F1, cTxtFileNm);
  Rewrite(F1);
  LabelMsg1.Caption := 'Идет вывод в текстовый файл ' + cTxtFileNm;
  LabelMsg1.Refresh;
  with tblUni do begin
    First;
    n_Pp := 0;
    while not Eof do begin
      nCntLine := 0;
      cMsg := 'Архивна вiдомiсть по заробiтнiй платнi за ' +
                                                        IntToStr(nY) + ' г.';
      cMsg := myPadC(cMsg, 157);
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      nTabN := FieldByName('TabN').AsInteger;
      Inc(n_Pp);
      cMsg := IntToStr(n_Pp) + '. TabN = ' + FieldByName('TabN').AsString;
      LabelMsg2.Caption := cMsg;
      LabelMsg2.Refresh;
      cMsg := 'Пiдроздiл ' + FieldByName('KdObj').AsString + '.  Таб.№ ' +
                                FieldByName('TabN').AsString + '.  ' +
                                FieldByName('Fam').AsString + ' ' +
                                FieldByName('Ima').AsString + ' ' +
                                FieldByName('Otch').AsString + '.  ' +
                                FieldByName('Dolgnost').AsString;
      cMsg := myPadC(cMsg, 157);
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      cID := FieldByName('ID').AsString;
      if cID > '' then
        cMsg := MyPadR('Податковий №  ' + cID, 144) + '1-е пiврiчча'
      else
        cMsg := MyPadL('1-е пiврiчча', 157);
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      WriteLn(F1, cLine);
      Inc(nCntLine);
      cMsg := ' № : Вид:   Шифр видy   :' +
              '   Ciч.   :  За Ciч. :   Лют.   :  За Лют. :' +
              '   Бер.   :  За Бер. :   Квт.   :  За Квт. :' +
              '   Трв.   :  За Трв. :   Чрв.   :  За Чрв. :';
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      WriteLn(F1, cLine);
      Inc(nCntLine);
      cMsg := '            Оклад       :';
      for i := 1 to 6 do begin
        nM := i;
        dDtPrc := EncodeDate(nY, nM, 27); // получить оклады на конец мес
        dDtPrc := MyLastDom(dDtPrc);
        DmMain.GetPereInf(nTabN, dDtPrc, nKdObj, nDum1, nDum1, nDum1,
                                  nDum1, nDum1, nDum1, nDum1,
                                  nOklTrf, nAvans, nProcLG, cSpAv,
                                  cDolgnost, cNrPrikaza, dDtPrikaza,
                                  bDum1, bDum1, bDum1, nDumSmInt);
        if nOklTrf <> 0 then
          cMsg := cMsg + Format('     %10.2f      :', [nOklTrf])
        else
          cMsg := cMsg + '         0          :';
      end;
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      WriteLn(F1, cLine2);
      Inc(nCntLine);
      nPp := 0;               // на nFirstTabNRec вернусс для 2-го прохода
      nFirstTabNRec := FieldByName('NR').AsInteger;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        cVidN := FieldByName('VidN').AsString;
        if (cVidN <> '6000') and (cVidN <> '8000') and
                                          (cVidN <> '9999') then begin
          Inc(nPp);
          cMsg := Format('%3d %4s %-15s',
                         [nPp,
                          FieldByName('VidN').AsString,
                          FieldByName('ShVidN').AsString]); end
        else if (cVidN = '6000') or (cVidN = '8000') then
          cMsg := '  Всього' + Format(' %-15s',
                         [FieldByName('ShVidN').AsString])
        else if (cVidN = '9999')then
          cMsg := '        ' + Format(' %-15s',
                         [FieldByName('ShVidN').AsString]);
        nSmm := RoundTo(FieldByName('Sm01').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa01').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm02').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa02').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm03').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa03').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm04').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa04').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm05').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa05').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm06').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa06').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        WriteLn(F1, cMsg);
        Inc(nCntLine);
        if (cVidN = '6000') or (cVidN = '8000') then begin
          WriteLn(F1);
          Inc(nCntLine);
        end;
        Next;
      end;
      WriteLn(F1, cLine);
      Inc(nCntLine);
      if bLine3 then begin
        while nCntLine < nMaxCntLine do begin
          WriteLn(F1);
          Inc(nCntLine);
        end;
        WriteLn(F1, cLine3);
      end;
      WriteLn(F1);
      WriteLn(F1);
      WriteLn(F1);

      Locate('NR', nFirstTabNRec, []); // вернулся для 2-го прохода (2-е п/г)
      nCntLine := 0;
      cMsg := 'Архивна вiдомiсть по заробiтнiй платнi за ' +
                                                        IntToStr(nY) + ' р.';
      cMsg := myPadC(cMsg, 157);
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      cMsg := IntToStr(n_Pp) + '. TabN = ' + FieldByName('TabN').AsString;
      LabelMsg2.Caption := cMsg;
      LabelMsg2.Refresh;
      cMsg := 'Пiдроздiл ' + FieldByName('KdObj').AsString + '.  Таб.№ ' +
                                FieldByName('TabN').AsString + '.  ' +
                                FieldByName('Fam').AsString + ' ' +
                                FieldByName('Ima').AsString + ' ' +
                                FieldByName('Otch').AsString + '.  ' +
                                FieldByName('Dolgnost').AsString;
      cMsg := myPadC(cMsg, 157);
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      if cID > '' then
        cMsg := MyPadR('Податвовий №  ' + cID, 144) + '2-е пiврiчча'
      else
        cMsg := MyPadL('2-е пiврiчча', 157);
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      WriteLn(F1, cLine);
      Inc(nCntLine);
      cMsg := ' № : Вид:   Шифр видy   :' +
              '   Лип.   :  За Лип. :   Сер.   :  За Сер. :' +
              '   Вер.   :  За Вер. :   Жов.   :  За Жов. :' +
              '   Лис.   :  За Лис. :   Гру.   :  За Гру. :';
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      WriteLn(F1, cLine);
      Inc(nCntLine);
      cMsg := '            Оклад       :';
      for i := 7 to 12 do begin
        nM := i;
        dDtPrc := EncodeDate(nY, nM, 27); // получить оклады на конец мес
        dDtPrc := MyLastDom(dDtPrc);
        DmMain.GetPereInf(nTabN, dDtPrc, nKdObj, nDum1, nDum1, nDum1,
                                  nDum1, nDum1, nDum1, nDum1,
                                  nOklTrf, nAvans, nProcLG, cSpAv,
                                  cDolgnost, cNrPrikaza, dDtPrikaza,
                                  bDum1, bDum1, bDum1, nDumSmInt);
        if nOklTrf <> 0 then
          cMsg := cMsg + Format('     %10.2f      :', [nOklTrf])
        else
          cMsg := cMsg + '         0          :';
      end;
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      WriteLn(F1, cLine2);
      Inc(nCntLine);
      nPp := 0;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        cVidN := FieldByName('VidN').AsString;
        if (cVidN <> '6000') and (cVidN <> '8000') and
                                          (cVidN <> '9999') then begin
          Inc(nPp);
          cMsg := Format('%3d %4s %-15s',
                         [nPp,
                          FieldByName('VidN').AsString,
                          FieldByName('ShVidN').AsString]); end
        else if (cVidN = '6000') or (cVidN = '8000') then
          cMsg := '  Всього' + Format(' %-15s',
                         [FieldByName('ShVidN').AsString])
        else if (cVidN = '9999')then
          cMsg := '        ' + Format(' %-15s',
                         [FieldByName('ShVidN').AsString]);

        nSmm := RoundTo(FieldByName('Sm07').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa07').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm08').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa08').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm09').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa09').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm10').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa10').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm11').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa11').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('Sm12').AsFloat, -2);
        if nSmm <> 0 then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        nSmm := RoundTo(FieldByName('SmZa12').AsFloat, -2);
        if (cVidN <> '9999') and (nSmm <> 0) then
          cMsg := cMsg + Format(' %10.2f', [nSmm])
        else
          cMsg := cMsg + '           ';
        WriteLn(F1, cMsg);
        Inc(nCntLine);
        if (cVidN = '6000') or (cVidN = '8000') then begin
          WriteLn(F1);
          Inc(nCntLine);
        end;
        Next;
      end;
      WriteLn(F1, cLine);
      Inc(nCntLine);
      WriteLn(F1);
      Inc(nCntLine);
      cMsg := 'Прим.: В кожному мiсяцi можуть бути нарах. як за ' +
              'минулi мiсяцi (лiкарнянi, виправлення та iн.), так ' +
              'i за наступнi (вiдпустки, декрети та iн.).';
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      cMsg := '       Тому нарах. та утримання друкуються в два ' +
              'стовбцi: 1. Мiсяць, в якому виконувалися виплати, та 2. ' +
              'Мiсяць, за який робилися нарахування.';
      WriteLn(F1, cMsg);
      Inc(nCntLine);
      if bLine3 then begin
        while nCntLine < nMaxCntLine do begin
          WriteLn(F1);
          Inc(nCntLine);
        end;
        WriteLn(F1, cLine3);
      end;
      WriteLn(F1);
      WriteLn(F1);
      WriteLn(F1);
    end;
  end;
  CloseFile(F1);
  with qryTmp do begin  // можно - уже освободилось после CreOpenTblUni()
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryVidN do begin  // можно - уже освободилось после CreOpenTblUni()
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with tblUni do begin
    if Active then Close;
    if Exists and not bFlagDbg then
      DeleteTable;
  end;
  LabelMsg1.Caption := 'Далее работайте с текстовым файлом ' + cTxtFileNm;
  LabelMsg1.Font.Color := clMaroon;
  LabelMsg1.Refresh;
end;

end.
