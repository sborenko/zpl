unit Z_MkDr8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, DB, ExtCtrls, Buttons, Grids, DBGrids, DBTables,
  IniFiles, StdCtrls, ComCtrls;

type
  TFormMkDr8 = class(TForm)
    qryLst: TQuery;
    dsrcLst: TDataSource;
    dbgrLst: TDBGrid;
    Panel1: TPanel;
    sBtnContinue: TSpeedButton;
    Splitter1: TSplitter;
    dbgrTmp: TDBGrid;
    qryLstDTPROC: TDateTimeField;
    qryLstNmDtProc: TStringField;
    lbxF8: TListBox;
    Label1: TLabel;
    sBtnF8: TSpeedButton;
    Label2: TLabel;
    qryTmp: TQuery;
    dsrcTmp: TDataSource;
    qryTmpFAM: TStringField;
    qryTmpIMA: TStringField;
    qryTmpOTCH: TStringField;
    qryTmpID: TStringField;
    qryTmpNR: TIntegerField;
    qryTmpDTPROC: TDateTimeField;
    qryTmpTABN: TIntegerField;
    qryTmpKDOBJ: TSmallintField;
    qryTmpKDVED: TSmallintField;
    qryTmpKDBRIG: TSmallintField;
    qryTmpKDKATP: TSmallintField;
    qryTmpDT_BEG: TDateTimeField;
    qryTmpDT_END: TDateTimeField;
    qryTmpKDVIDN: TSmallintField;
    qryTmpPDN: TSmallintField;
    qryTmpGODN: TSmallintField;
    qryTmpMESN: TSmallintField;
    qryTmpCHAS: TFloatField;
    qryTmpSUMMA: TFloatField;
    qryTmpSPZ: TStringField;
    qryTmpKTS: TStringField;
    qryTmpDTS: TStringField;
    qryTmpNOTES: TStringField;
    qryTmpPRR: TSmallintField;
    qryTmpPRPV: TSmallintField;
    qryTmpKTO: TSmallintField;
    qryTmpPRKR: TSmallintField;
    qryTmpZAMESGOD: TDateTimeField;
    qryTmpFamIO: TStringField;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryLstCalcFields(DataSet: TDataSet);
    procedure dbgrLstKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
    procedure dbgrLstDblClick(Sender: TObject);
    procedure dbgrLstDrawColumnCell(Sender: TObject;
                                const Rect: TRect; DataCol: Integer;
                              Column: TColumn; State: TGridDrawState);
    procedure sBtnContinueClick(Sender: TObject);
    procedure qryTmpCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    function MyCopyTable : boolean;
  public
    { Public declarations }
  end;

procedure MakeDr8;

const SECTION = 'Z_MkDr8';

var
  FormMkDr8: TFormMkDr8;

implementation

{$R *.dfm}

uses A_Const, A_Lib, Z_DM, Z_CmnPrt;

//--------------------------------------------------------------------
procedure MakeDr8;
begin
  FormMkDr8 := TFormMkDr8.Create(Application);
  with FormMkDr8 do begin
    ShowModal;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormMkDr8.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 360);
    Width  := ReadInteger(SECTION, 'wW', 500);
    dbgrLst.Width := ReadInteger(SECTION, 'GrLstW', 160);
    Free;
  end;
  if FileExists(cDirVids + 'Dr8GrLst.vid') then
    dbgrLst.Columns.LoadFromFile(cDirVids + 'Dr8GrLst.vid');
  if FileExists(cDirVids + 'Dr8GrTmp.vid') then
    dbgrTmp.Columns.LoadFromFile(cDirVids + 'Dr8GrTmp.vid');
  qryLst.Open;
  Label2.Caption := 'Выделенных периодов нет';
end;
//--------------------------------------------------------------------
procedure TFormMkDr8.FormClose(Sender: TObject;
                                          var Action: TCloseAction);
begin
  dbgrLst.Columns.SaveToFile(cDirVids + 'Dr8GrLst.vid');
  dbgrTmp.Columns.SaveToFile(cDirVids + 'Dr8GrTmp.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'GrLstW', dbgrLst.Width);
    Free;
  end;
  qryLst.Close;
end;
//--------------------------------------------------------------------
procedure TFormMkDr8.qryLstCalcFields(DataSet: TDataSet);
var nD, nM, nY : word;
begin
  DecodeDate(qryLstDTPROC.AsDateTime, nY, nM, nD);
  qryLstNmDtProc.AsString := MesRus(nM) + ' ' + IntToStr(nY);
end;
//--------------------------------------------------------------------
procedure TFormMkDr8.dbgrLstKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    dbgrLstDblClick(Self);
end;
//--------------------------------------------------------------------
procedure TFormMkDr8.dbgrLstDblClick(Sender: TObject);
var i : integer;
begin
  i := LbxF8.Items.IndexOf(qryLstDTPROC.AsString);
  if i >= 0 then
    LbxF8.Items.Delete(i)
  else
    LbxF8.Items.Add(qryLstDTPROC.AsString);
  if not qryLst.Eof then
    qryLst.Next
  else
    dbgrLst.Refresh;
  sBtnContinue.Enabled := LbxF8.Items.Count > 0;
  if LbxF8.Items.Count = 0 then
    Label2.Caption := 'Выделенных периодов нет'
  else
    Label2.Caption := 'Выделено периодов - ' +
                                        IntToStr(LbxF8.Items.Count);
end;
//--------------------------------------------------------------------
procedure TFormMkDr8.dbgrLstDrawColumnCell(Sender: TObject;
                 const Rect: TRect; DataCol: Integer; Column: TColumn;
                                               State: TGridDrawState);
begin
  with dbgrLst.Canvas do begin
    if LbxF8.Items.IndexOf(qryLstDTPROC.AsString) >= 0 then
      Font.Color := clRed
    else
      Font.Color := clWindowText;
  end;
  dbgrLst.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//--------------------------------------------------------------------
procedure TFormMkDr8.sBtnContinueClick(Sender: TObject);
begin
  qryTmp.Active := not qryTmp.Active;
end;
//--------------------------------------------------------------------
procedure TFormMkDr8.qryTmpCalcFields(DataSet: TDataSet);
begin
  qryTmpFamIO.AsString := MyFamIO(qryTmpFam.AsString,
                                  qryTmpIma.AsString,
                                  qryTmpOtch.AsString);
end;
//--------------------------------------------------------------------
function TFormMkDr8.MyCopyTable : boolean;
var F1, F2 : string;  b : LongBool;
begin
  Result := false;
  b := FALSE;
  F1 := cDirDocs + 'da00.dbf';
  if not FileExists(F1) then
    ShowMessage('Не найден файл ' + F1)
  else begin
    F2 := cDirInd + 'da05.dbf';
    CopyFile(PChar(F1), PChar(F2), b);
    Result := FileExists(F1);
  end;
end;
(*
M   (  Chr(27)+'M'  )
          DA432101.2
Вiдмiтка про одержання:                                       ЗАТВЕРДЖЕНО
(вхiдний N, дата, штамп ДПI)                                  Наказ Державноi податковоi
                                                              адмiнiстрацii Украiни
 03534535                                                     30.12.97 N473
----------                                                    (в редакцii наказу ДПА Украiни
(iдентифiкацiйний код за EДРПОУ або                           вiд 06.01.99 N 10)
реeстрацiйний (облiковий) номер платника податкiв)
                                                        Форма N8ДР
-----------------
(iдентифiкацiйний номер фiзичноi особи -
суб'eкта пiдприeмницькоi дiяльностi)
                                        Д О В I Д К А
            про суми виплачених доходiв i утриманих з них податкiв фiзичних осiб
                             Ф Х И им. А.В.БОГАТСКОГО АН УКРАИНЫ
                 ----------------------------------------------------------------------
                 (назва юридичноi особи чи прiзвище, iм'я, по батьковi фiзичноi особи -
                                   суб'eкта пiдприeмницькоi дiяльностi
20991607                            ФХИ им.А.В.Богатского
-----------                  ----------------------------------------------------------
(iдентифiкацiйний код        (назва органу державноi податковоi служби)
органу державноi податковоi
служби за EДРПОУ)
                                  за 2-й квартал 2001 года
                                  ------------------------
                                      (звiтний перiод)
Працювало у штатi            118
                            ------
Працювало за сумiсництвом     14                  ПОРЦIЯ N       (заповнюeться в органi
                            ------                         ----- державноi податковоi служби)

+-------------------------------------------------------------------------------------------+
:  N   : Iдентифi-: Сума виплаче-:Сума утримано-:Ознака:        Дата         : Ознака пiльги:
: з/п  : кацiйний : ного доходу  :го прибутково-:доходу:---------------------:щодо прибутко-:
:      :  номер   : (грн.коп.)   :го податку    :      :прийняття :звiльнення:вого податку  :
:      :          :              :(грн.коп.)    :      :на роботу :з роботи  :              :
:------+----------+--------------+--------------+------+----------+----------+--------------:
:  1   :     2    :      3       :      4       :   5  :     6    :     7    :      8       :
+-------------------------------------------------------------------------------------------+
     1  1310300672        293.62          29.74      1                               0
     2  1487200979        212.85          42.40      2                               0
     3  1464101474        277.00          40.81      1                               0
     4  2009002999        271.95       - 242.47      1                               0
     5  1950302135        252.00          22.83      1              20-11-2001       0
     6  1856601301        146.02           5.69      1                               0

   131  2731814319         74.25           5.67      1                               0
   132  2724120379         74.25           5.70      1                               0
---------------------------------------------------------------------------------------------
                       22 962.02       1 075.45
---------------------------------------------------------------------------------------------

     Кiлькiсть рядкiв: 132       Кiлькiсть фiзичних осiб: 132   Кiлькiсть аркушiв: 4

Керiвник       1487200979              _______  Андронати С.А.        651053
пiдприeмства   (iдентифiкацiйний номер (пiдпис) (прiзвище)            (тел.)  Дата подання
               керiвника пiдприeмства)


М.П.

Головний       1807101708              _______  Рябовал Т.В.          651053
бухгалтер      (iдентифiкацiйний номер (пiдпис) (прiзвище)            (тел.)
               головного бухгалтера)                          Наведена iнформацiя e вiрною
*)
//--------------------------------------------------------------------
procedure TFormMkDr8.SpeedButton1Click(Sender: TObject);
var F : TextFile;
    cFNm, cFamIO, cID, cMsg, cUnder : string;
    nTabN, nPp : integer;
    nSmm, nSmm188_3, nPdn : double;
begin
  Screen.Cursor := crHourGlass;
  if not MyCopyTable then
    ShowMessage('Не скопировалась таблица da05.dbf');

  cUnder := ':------+----------+--------------+--------------+------+----------+----------+--------------:';
  cFNm := cDirTemp + 'proba.txt';
  AssignFile(F, cFNm);
  Rewrite(F);
  with qryTmp do begin
    First;
    cMsg := Chr(27) + 'M';
    WriteLn(F, cMsg);
    cMsg := '+-------------------------------------------------------------------------------------------+';
    WriteLn(F, cMsg);
    cMsg := ':  N   : Iдентифi-: Сума виплаче-:Сума утримано-:Ознака:        Дата         : Ознака пiльги:';
    WriteLn(F, cMsg);
    cMsg := ': з/п  : кацiйний : ного доходу  :го прибутково-:доходу:---------------------:щодо прибутко-:';
    WriteLn(F, cMsg);
    cMsg := ':      :  номер   : (грн.коп.)   :го податку    :      :прийняття :звiльнення:вого податку  :';
    WriteLn(F, cMsg);
    cMsg := ':      :          :              :(грн.коп.)    :      :на роботу :з роботи  :              :';
    WriteLn(F, cMsg);
    cMsg := ':------+----------+--------------+--------------+------+----------+----------+--------------:';
    WriteLn(F, cMsg);
    cMsg := ':  1   :     2    :      3       :      4       :   5  :     6    :     7    :      8       :';
    WriteLn(F, cMsg);
    cMsg := '+-------------------------------------------------------------------------------------------+';
    WriteLn(F, cMsg);
    nPp := 0;
    while not Eof do begin
      nTabN := qryTmpTabN.AsInteger;
      nSmm := 0;
      nPdn := 0;
      nSmm188_3 := 0;
      cFamIO := qryTmpFamIO.AsString;
      cID := qryTmpID.AsString;
      while (qryTmpTabN.AsInteger = nTabN) and not Eof do begin
        if qryTmpKdVidN.AsInteger = 188 {Разная матпомощь} then
          nSmm188_3 := nSmm188_3 + qryTmpSumma.AsFloat
        else if qryTmpKdVidN.AsInteger < 601 then
          nSmm := nSmm + qryTmpSumma.AsFloat
        else if qryTmpKdVidN.AsInteger = 750 then
          nPdn := nPdn - qryTmpSumma.AsFloat;
        Next;
      end;
//      if
      Inc(nPp);
      cMsg := Format(':%6d:%10s:%14.2f:%14.2f:',
                                      [nPp, cID, nSmm, nPdn]);
      WriteLn(F, cMsg);


      if not Eof then
        WriteLn(F, cUnder)
      else begin
        cMsg := ':===========================================================================================:';
        WriteLn(F, cMsg);
      end;
    end;
  end;
  CloseFile(F);
  Screen.Cursor := crDefault;
end;

end.
