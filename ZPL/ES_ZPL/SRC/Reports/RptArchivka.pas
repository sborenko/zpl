unit RptArchivka;

interface

uses
  DB, F6Report;

type
  TRptArhivka = class(TF6Report)
  private
    TabN: Integer;
    RptYear, RptBegMnth, RptEndMnth: Word;
    SplitHalf: Boolean;
    CdsBoth: TDataSet;
    CaseNich: Word;

    FIO: ShortString;

    Sect1BegMnth, Sect1EndMnth, Sect2BegMnth, Sect2EndMnth,
    Sect1FirstCol, Sect1ColCnt, Sect2FirstCol, Sect2ColCnt: Word;

    constructor Create(TabN: Integer; RptYear, RptBegMnth, RptEndMnth: Word;
      SplitHalf: Boolean; CdsBoth: TDataSet; CaseNich: Word); reintroduce;

    procedure LoadUpi(out INN, Fam, Ima, Otch: ShortString);
    procedure LoadPere(Mnth: Word; out DeptId: Integer;
      out OklTrf: Double; out Position: String);

    procedure PrintHeadSect(SectNum: Word;
      INN, FamIO: ShortString; DeptId: Integer; Position: String);
    procedure PrintRowSect(SectNum: Word);

    function GetSectFirstCol(SectNum: Word): Word;
    function GetSectLastCol(SectNum: Word): Word;

    function GetSectFirstMnth(SectNum: Word): Word;
    function GetSectLastMnth(SectNum: Word): Word;

    procedure InitSectBook(SectNum: Word);

  protected
    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;

    procedure InitReport; override;
    procedure InitBook; override;
  public
    class procedure Run(TabN: Integer; RptYear, RptBegMnth, RptEndMnth: Word;
      SplitHalf: Boolean; CdsBoth: TDataSet; NichMode: Word);

    class procedure RunAndWrite(TabN: Integer;
      RptYear, RptBegMnth, RptEndMnth: Word; SplitHalf: Boolean;
      CdsBoth: TDataSet; NichMode: Word; PathToFiles: String);
  end;

implementation

uses
  Controls, DBTables, Graphics, Math, SysUtils, TTF160_TLB, a_Const,
  a_Dm, a_Lib, z_Dm, DateLib, QryLib, TextLib;

//------------------------------------------------------------------------------
class procedure TRptArhivka.Run(
  TabN: Integer;
  RptYear, RptBegMnth, RptEndMnth: Word;
  SplitHalf: Boolean;
  CdsBoth: TDataSet;
  NichMode: Word
);
begin
  with TRptArhivka.Create(TabN, RptYear, RptBegMnth, RptEndMnth, SplitHalf,
    CdsBoth, NichMode) do
  begin
    Print;
    Preview;
    Free;
  end;
end;

//------------------------------------------------------------------------------
class procedure TRptArhivka.RunAndWrite(TabN: Integer;
  RptYear, RptBegMnth, RptEndMnth: Word; SplitHalf: Boolean;
  CdsBoth: TDataSet; NichMode: Word; PathToFiles: String);
begin
  with TRptArhivka.Create(TabN, RptYear, RptBegMnth, RptEndMnth, SplitHalf,
    CdsBoth, NichMode) do
  begin
    Print;
    Write(PathToFiles, FIO + ' ' + IntToStr(TabN));
    Free;
  end;
end;

//------------------------------------------------------------------------------
constructor TRptArhivka.Create(
  TabN: Integer;
  RptYear, RptBegMnth, RptEndMnth: Word;
  SplitHalf: Boolean;
  CdsBoth: TDataSet;
  CaseNich: Word
);
begin
  Self.TabN := TabN;
  Self.RptYear := RptYear;
  Self.RptBegMnth := RptBegMnth;
  Self.RptEndMnth := RptEndMnth;
  Self.SplitHalf := SplitHalf;
  Self.CdsBoth := CdsBoth;
  Self.CaseNich := CaseNich;

  inherited Create;
end;

//------------------------------------------------------------------------------
procedure TRptArhivka.LoadUpi(out INN, Fam, Ima, Otch: ShortString);
begin
  with QryUtils.CreateQuery do begin
    SQL.Text :=
      'select * ' +
      'from Z_UPI ' +
      'where TabN = :TabN';

    ParamByName('TabN').AsInteger := TabN;
    Open;

    INN  := FieldByName('ID').AsString;
    Fam  := FieldByName('Fam').AsString;
    Ima  := FieldByName('Ima').AsString;
    Otch := FieldByName('Otch').AsString;

    Free;
  end;
end;

//------------------------------------------------------------------------------
// Перемещение на конец месяца
//------------------------------------------------------------------------------
procedure TRptArhivka.LoadPere(
  Mnth: Word;
  out DeptId: Integer;
  out OklTrf: Double;
  out Position: String
);
var
  Date: TDateTime;
  KdObj, DumInt: Integer;
  DumDbl: Double;
  DumStr1: String1;
  DumStr: String;
  DumDate: TDateTime;
  DumBool: Boolean;
  DumSmInt : SmallInt;
begin
  Date := EncodeDate(RptYear, Mnth, 1);
  Date := DateUtils.EndOfMonth(Date);

  DmMain.GetPereInf(TabN, Date, KdObj, DumInt, DumInt, DumInt,
    DumInt, DumInt, DumInt, DumInt, OklTrf, DumDbl, DumDbl, DumStr1,
    Position, DumStr, DumDate, DumBool, DumBool, DumBool, DumSmInt
  );
end;

//------------------------------------------------------------------------------
procedure TRptArhivka.InitReport;
begin
  inherited InitReport;

  // Используем разделение на полугодия
  if SplitHalf then begin
    // Есть месяцы первого полугодия
    if RptBegMnth < 7 then begin
      Sect1BegMnth := RptBegMnth;
      Sect1EndMnth := 6;
    end;

    // Есть месяцы второго полугодия
    if RptEndMnth > 6 then begin
      if Sect1BegMnth = 0 then begin
        // Если первого полугодия нет, первую секцию заполняем вторым полугодием
        Sect1BegMnth := 7;
        Sect1EndMnth := RptEndMnth;
      end else begin
        // Если первое полугодие есть, вторым полугодием заполняем вторую секцию
        Sect2BegMnth := 7;
        Sect2EndMnth := RptEndMnth;
      end;
    end;
  end else begin
    // Печатаем без разделения на полугодия
    Sect1BegMnth := RptBegMnth;
    Sect1EndMnth := RptEndMnth;
  end;

  // Столбцы первой секции
  if Sect1BegMnth > 0 then begin
    Sect1FirstCol := 2;
    Sect1ColCnt := 2 + (Sect1EndMnth - Sect1BegMnth + 1) * 2;
  end;

  // Столбцы второй секции
  if Sect2BegMnth > 0 then begin
    Sect2FirstCol := 2 + Sect1ColCnt;
    Sect2ColCnt := 2 + (Sect2EndMnth - Sect2BegMnth + 1) * 2;
  end;

  // Общее количество столбцов
  MaxColNum := 1 + Sect1ColCnt + Sect2ColCnt;
end;

//------------------------------------------------------------------------------
procedure TRptArhivka.InitBook;
begin
  inherited InitBook;

  with Book do begin
    ShowGridLines  := false;
    PrintLandScape := true;
    DefaultFontSize := 8;

    ColWidth[1] := Round( 4 * ColUnit);
  end;

  if Sect1BegMnth > 0 then
    InitSectBook(1);

  if Sect2BegMnth > 0 then
    InitSectBook(2);
end;

//------------------------------------------------------------------------------
procedure TRptArhivka.InitSectBook(SectNum: Word);
var
  SectFirstCol: Word;
begin
  if SectNum = 1 then
    SectFirstCol := Sect1FirstCol
  else
    SectFirstCol := Sect2FirstCol;

  with Book do begin
    ColWidth[SectFirstCol]     := Round( 5 * ColUnit);
    ColWidth[SectFirstCol + 1] := Round(13 * ColUnit);
  end;
end;

//------------------------------------------------------------------------------
function TRptArhivka.GetSectFirstCol(SectNum: Word): Word;
begin
  if SectNum = 1 then
    Result := Sect1FirstCol
  else
    Result := Sect2FirstCol;
end;

//------------------------------------------------------------------------------
function TRptArhivka.GetSectLastCol(SectNum: Word): Word;
begin
  if SectNum = 1 then
    Result := Sect1FirstCol + Sect1ColCnt - 1
  else
    Result := Sect2FirstCol + Sect2ColCnt - 1;
end;

//------------------------------------------------------------------------------
function TRptArhivka.GetSectFirstMnth(SectNum: Word): Word;
begin
  if SectNum = 1 then
    Result := Sect1BegMnth
  else
    Result := Sect2BegMnth;
end;

//------------------------------------------------------------------------------
function TRptArhivka.GetSectLastMnth(SectNum: Word): Word;
begin
  if SectNum = 1 then
    Result := Sect1EndMnth
  else
    Result := Sect2EndMnth;
end;

//------------------------------------------------------------------------------
procedure TRptArhivka.PrintHeader;
var
  INN, Fam, Ima, Otch, FamIO: ShortString;
  DeptId: Integer;
  DumDbl: Double;
  Position: String;
  SvRowNum: Integer;
begin
  LoadUPI(INN, Fam, Ima, Otch);

  FamIO := Fam + ' ' + Ima + ' ' +  Otch;
  FIO := Fam + ' ' + Copy(Ima, 1, 1) + '.' +  Copy(Otch, 1, 1) + '.';

  LoadPere(RptEndMnth, DeptId, DumDbl, Position);

  SvRowNum := CurRow;

  with Book do begin
    // Заголовок первого полугодия
    if Sect1BegMnth > 0 then
      PrintHeadSect(1, INN, FamIO, DeptId, Position);

    // pagebreak на 2 полугодие
    if SplitHalf and (Sect2BegMnth > 0) then
      AddColPageBreak(CurCol);

    // Заголовок второго полугодия
    if Sect2BegMnth > 0 then begin
      CurRow := SvRowNum;

      PrintHeadSect(2, INN, FamIO, DeptId, Position);
    end;

    SetSelection(CurRow - 1, 1, CurRow, MaxColNum);
    FontBold := true;
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    SetColWidthAuto(CurRow, 1, CurRow, MaxColNum, false);
  end;
end;

//------------------------------------------------------------------------------
procedure TRptArhivka.PrintHeadSect(
  SectNum: Word;
  INN, FamIO: ShortString;
  DeptId: Integer;
  Position: String
);
var
  SectFirstCol, SectLastCol, Mnth: Word;
  OklTrf: Double;
  MnthNm: ShortString;
begin
  SectFirstCol := GetSectFirstCol(SectNum);
  SectLastCol  := GetSectLastCol(SectNum);

  with Book do begin
    Inc(CurRow);
    TextRC[CurRow, SectFirstCol] :=
      'Архивна вiдомiсть по заробiтнiй платнi за ' + IntToStr(RptYear) + ' р.';

    Inc(CurRow);
    TextRC[CurRow, SectFirstCol] := 'Пiдрозд. ' + IntToStr(DeptId) + '.  ' +
      'Таб.№ ' + IntToStr(TabN) + ' '  + FamIO + '.  ' + Position;

    SetSelection(CurRow - 1, SectFirstCol, CurRow, SectLastCol);
    FontSize := 10;
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignCenter, 0);

    Inc(CurRow);
    TextRC[CurRow, SectFirstCol] := 'Податковий №: ' + INN;

    if SplitHalf then
      TextRC[CurRow, SectLastCol] := IntToStr(SectNum) + '-е пiврiчча';

    SetSelection(CurRow, SectLastCol, CurRow, SectLastCol);
    SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);

    Inc(CurRow);
    if SectNum = 1 then
      TextRC[CurRow, 1] := '№ з/п';

    TextRC[CurRow, SectFirstCol] := 'Вид';
    TextRC[CurRow, SectFirstCol + 1] := 'Шифр вида';

    CurCol := SectFirstCol + 1;

    for Mnth := GetSectFirstMnth(SectNum) to GetSectLastMnth(SectNum) do begin
      MnthNm := UkrMes(Mnth);

      Inc(CurCol);
      TextRC[CurRow, CurCol] :=
        AnsiUpperCase(Copy(MnthNm, 1, 1)) + Copy(MnthNm, 2, Length(MnthNm));

      Inc(CurCol);
      TextRC[CurRow, CurCol] := 'За' + ' ' + UkrMes(Mnth);
    end;

    Inc(CurRow);
    TextRC[CurRow, SectFirstCol] := 'О к л а д';
    SetSelection(CurRow, SectFirstCol, CurRow, SectFirstCol + 2);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

    CurCol := SectFirstCol + 2;

    for Mnth := GetSectFirstMnth(SectNum) to GetSectLastMnth(SectNum) do begin
      // данные на конец мес
      LoadPere(Mnth, DeptId, OklTrf, Position);

      if OklTrf <> 0 then begin
        NumberRC[CurRow, CurCol] := OklTrf;
        SetSelection(CurRow, CurCol + 1, CurRow, CurCol + 2);
        SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
      end;

      Inc(CurCol, 2);
    end;

    SetSelection(CurRow, SectFirstCol + 2, CurRow, SectLastCol);
    FormatFixed2;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptArhivka.PrintBody;
var
  NPP, SvRowNum: Integer;
begin
  with Book, CdsBoth do begin
    DisableControls;

    First;
    NPP := 0;
    
    while not Eof do begin
      Inc(CurRow);

      // Номер по порядку для значащих видов
      if (FieldByName('VidN').AsString <> '6000')
        and (FieldByName('VidN').AsString <> '8000')
        and (FieldByName('VidN').AsString <> '9999') then
      begin
        Inc(NPP);
        NumberRC[CurRow, 1] := NPP;
      end;

      SvRowNum := CurRow;

      // Первое полугодие
      if Sect1BegMnth > 0 then
        PrintRowSect(1);

      // Второе полугодие
      if Sect2BegMnth > 0 then begin
        CurRow := SvRowNum;
        PrintRowSect(2);
      end;

      // Рисуем рамку
      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

      // Переходную строку рисуем жирной
      if (FieldByName('VidN').AsString = '6000')
        or (FieldByName('VidN').AsString = '8000')
        or (FieldByName('VidN').AsString = '9999')
      then
        FontBold := true;

      Next;
    end;

    First;
    EnableControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptArhivka.PrintRowSect(SectNum: Word);
var
  SectFirstCol, SectLastCol: Integer;
  Mnth: Word;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure PrintMnth(FldNm: ShortString);
  var
    VidN: ShortString;
    Value: Double;
  begin
    with Book, CdsBoth do begin
      FldNm := FldNm + TextUtils.PadLeft(IntToStr(Mnth), '0', 2);

      VidN := FieldByName('VidN').AsString;

      Value := RoundTo(FieldByName(FldNm).AsFloat, -2);

      if Value <> 0 then
        if (VidN = '5005') or (VidN = '5008') then begin
          SetSelection(CurRow, CurCol, CurRow + 1, CurCol);

          TextRC[CurRow, CurCol] := FieldByName(FldNm).AsString + ' час';
        end else begin
          if (VidN = '9999') and (Value < 0) then Value := 0;

          if Value <> 0 then NumberRC[CurRow, CurCol] := Value;
        end;
    end;
  end;

begin
  SectFirstCol := GetSectFirstCol(SectNum);
  SectLastCol  := GetSectLastCol(SectNum);

  with Book, CdsBoth do begin
    TextRC[CurRow, SectFirstCol]     := FieldByName('VidN').AsString;
    TextRC[CurRow, SectFirstCol + 1] := FieldByName('ShVidN').AsString;

    // Если вид не является совместительским по определению, но является
    // совместительским по нач./удерж. (например совместительская часть
    // больничного), отмечаем его "совместителем" в скобках
    if (FieldByName('NSovm').AsString = 'Y')
      and (FieldByName('VSovm').AsString <> '1')
    then
      TextRC[CurRow, SectFirstCol + 1] :=
        TextRC[CurRow, SectFirstCol + 1] + '(сумісн)';

    SetSelection(CurRow, SectFirstCol, CurRow, SectFirstCol + 1);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

    // непонятно зачем запрещается печать итогов при ZaMG, комментируем:
    // if (FieldByName('VidN').AsString <> '9999') then begin
      CurCol := SectFirstCol + 1;

      for Mnth := GetSectFirstMnth(SectNum) to GetSectLastMnth(SectNum) do begin
        Inc(CurCol);
        PrintMnth('Sm');

        Inc(CurCol);
        PrintMnth('SmZa');
      end;

      SetSelection(CurRow, SectFirstCol + 2, CurRow, SectLastCol);
      FormatFixed2;
      SetColWidthAuto(CurRow, SectFirstCol, CurRow, SectLastCol, false);
    // end;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptArhivka.PrintFooter;
var
  Msg: ShortString;
begin
  with Book do begin
    Inc(CurRow, 2);

    TextRC[CurRow, 1] := 'Прим.: В кожному мiсяцi можуть бути нарах. як за ' +
      'минулi мiсяцi (лiкарнянi, виправлення та iн.), так i за наступнi ' +
      '(вiдпустки, декрети та iншi).';
    Inc(CurRow);
    TextRC[CurRow, 1] := 'Тому нарах. та утримання друкуються ' +
      'в два стовбцi: 1. Мiсяць, в якому виконувалися виплати, та 2. ' +
      'Мiсяць, за який робилися нарахування.';
    SetSelection(CurRow - 1, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontSize := 8;

    if CaseNich = 1 then
      Msg := '(Без начислений по НИЧ)'
    else if CaseNich = 2 then
      Msg := '(Только по начислениям НИЧ)';

    if (CaseNich = 1) or (CaseNich = 2) then begin
      Inc(CurRow);
      TextRC[CurRow, 1] := Msg;
      SetSelection(CurRow, 1, CurRow, 1);
      FontSize := 8;
    end;

    Inc(CurRow, 3);
    TextRC[CurRow, MaxColNum] := 'Бухгалтер  __________________________ ' +
      Form_Dm.KdUsr2FioUsr(nAppKdUsr);

    SetSelection(CurRow, MaxColNum, CurRow, MaxColNum);
    SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0);
  end;
end;

end.
