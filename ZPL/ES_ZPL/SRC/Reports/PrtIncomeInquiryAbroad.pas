unit PrtIncomeInquiryAbroad;

interface

uses
  DbTables, F6Report, TTF160_TLB;

type
  TPrtIncomeInq = class(TF6Report)
  private
    CellFormat: IF1CellFormat;

    DtBeg, DtEnd, DtDoc: TDateTime;
    NoDtDoc: Boolean;
    QryInquiry: TQuery;

    Ima, Otch, Fam, Gender, INN: ShortString;
    EmplIsSuppl: Boolean;
    EmplPos: ShortString;

    Msg: ShortString;

    procedure InitData(EmplId: Integer; DtBeg, DtEnd, DtDoc: TDateTime;
      NoDtDoc: Boolean; QryInquiry: TQuery);

    procedure Print;
    procedure PrintHeading;
    procedure PrintBody(out TotalSum: Double; out TotalStr: String);
    procedure PrintFooting(TotalSum: Double; TotalStr: String);

  protected
    procedure InitReport; override;
    procedure InitBook; override;

  public
    class procedure Run(EmplId: Integer; DtBeg, DtEnd, DtDoc: TDateTime;
      NoDtDoc: Boolean; QryInquiry: TQuery);
  end;

implementation

uses
  Controls, Graphics, Forms, SysUtils, Db, a_Const, a_Lib, a_Dm, PrintUtils,
  DateLib, QryLib, TextLib, OleCtrls;

//------------------------------------------------------------------------------
class procedure TPrtIncomeInq.Run(
  EmplId: Integer;
  DtBeg, DtEnd, DtDoc: TDateTime;
  NoDtDoc: Boolean;
  QryInquiry: TQuery);
var
  Inquiry: TPrtIncomeInq;
  Mark: TBookmark;
begin
  DtEnd := DateUtils.EndOfMonth(DtEnd);
  
  Inquiry := TPrtIncomeInq.Create;
  Inquiry.InitData(EmplId, DtBeg, DtEnd, DtDoc, NoDtDoc, QryInquiry);

  with Inquiry do begin
    with Screen, QryInquiry do begin
      Cursor := crHourGlass;

      DisableControls;
      Mark := GetBookmark;

      Print;

      GotoBookmark(Mark);
      FreeBookmark(Mark);
      EnableControls;

      Cursor := crDefault;
    end;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtIncomeInq.InitData(
  EmplId: Integer;
  DtBeg, DtEnd, DtDoc: TDateTime;
  NoDtDoc: Boolean;
  QryInquiry: TQuery);
var
  QryPeek: TQuery;
begin
  Self.DtBeg := DtBeg;
  Self.DtEnd := DtEnd;
  Self.DtDoc := DtDoc;
  Self.NoDtDoc := NoDtDoc;
  Self.QryInquiry := QryInquiry;

  QryPeek := TQuery.Create(nil);

  with QryPeek, QryUtils do begin
    InitQuery(QryPeek);

    if PeekUpi(QryPeek, EmplId) then begin
      Ima := FieldByName('Ima').AsString;
      Otch := FieldByName('Otch').AsString;
      Fam := FieldByName('Fam').AsString;
      Gender := AnsiUpperCase(FieldByName('Pol').AsString);
      INN := FieldByName('Id').AsString;
    end;

    InitQuery(QryPeek);

    if PeekAssign(QryPeek, EmplId, DtDoc, true, false) then begin
      EmplIsSuppl := FieldByName('Sovm').AsInteger = 1;
      EmplPos := FieldByName('Dolgnost').AsString;

      // Заплата, чтобы выбрать должность отдела кадров
      QryUtils.PeekAssign(QryPeek, EmplId, DtDoc, false, false);
      QryUtils.PeekPosition(
        QryPeek, QryPeek.FieldByName('NewKdOk').AsInteger, false);
      EmplPos := FieldByName('NameOk').AsString;
    end;
  end;

  QryPeek.Free;
end;

//------------------------------------------------------------------------------
procedure TPrtIncomeInq.InitReport;
begin
  inherited InitReport;

  MaxColNum := 7;
end;

//------------------------------------------------------------------------------
procedure TPrtIncomeInq.InitBook;
begin
  inherited InitBook;

  with Book do begin
    ColWidth[1] := Round(20 * ColUnit);  // Месяц
    ColWidth[2] := Round(12 * ColUnit);  // Доход
    ColWidth[3] := Round(12 * ColUnit);  // Подоходный
    ColWidth[4] := Round(12 * ColUnit);  // Военный сбор
    ColWidth[5] := Round(12 * ColUnit);  // Профсоюз
    ColWidth[6] := Round(12 * ColUnit);  // Алименты
    ColWidth[7] := Round(12 * ColUnit);  // К выдаче
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtIncomeInq.Print;
var
  TotalSum: Double;
  TotalString: String;
begin
  PrintHeading;
  PrintBody(TotalSum, TotalString);
  PrintFooting(TotalSum, TotalString);

  Write;
  Preview;
end;

//------------------------------------------------------------------------------
procedure TPrtIncomeInq.PrintHeading;
begin
  with Book do begin
    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'Власник підприємства, установи, організації ' +
      'або уповоноважений ним ';
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'орган (навчальний заклад)';
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    TextRC[CurRow, 3] := '  Міністерство освіти і науки України  ';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontUnderLine := true;
    FontBold := true;
    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'або фізична особа-підприємець';
    TextRC[CurRow, 3] := '___________________________________________';
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    CurRow := CurRow + 1;
    TextRC[CurRow, 4] := '(прізвище, ім''я та по батькові)';
    SetSelection(CurRow, 3, CurRow, 5);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignTop, 0);
    FontSize := 8;

    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'Місце знаходження ';
    TextRC[CurRow, 3] :=
      '  65044, м.Одеса, пр.Шевченка 1. тел. (048)705 83 80  ';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignTop, 0);
    FontUnderLine := true;
    FontBold := true;
    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'Ідентифікаційний код за ЄДРПОУ';
    TextRC[CurRow, 3] := '  43861328  ';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontUnderLine := true;
    FontBold := true;
    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'Або реєстраційний номер з РДПАУ';
    TextRC[CurRow, 3] := '___________________________________________';
    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'ДПІ     Приморського р-ну м.Одеси';

    CurRow := CurRow + 2;
    TextRC[CurRow, 3] := 'ДОВІДКА ПРО ДОХОДИ № __________' ;
    SetSelection(CurRow, 3, CurRow, 3);
    FontBold := true;

    CurRow := CurRow + 2;
    TextRC[CurRow, 1] := 'Видана гр.';
    TextRC[CurRow, 3] := '  ' + Fam + ' ' + Ima + ' ' + Otch + '  ';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);

    FontBold := true;
    FontUnderLine := true;
    CurRow := CurRow + 1;
    Msg := 'в тому, що ';
    if Gender = 'Ж' then
      Msg := Msg + 'вона'
    else if (Gender = 'М') or (Gender = 'Ч') then
      Msg := Msg + 'він'
    else
      Msg := Msg + 'він (вона)';
    Msg := Msg + ' дійсно працює в';
    TextRC[CurRow, 1] := Msg;

    CurRow := CurRow + 1;
    TextRC[CurRow, 3] := '  Національному університеті "Одеська політехніка"  ';
    SetSelection(CurRow, 3, CurRow, 3);
    FontBold := true;
    FontUnderLine := true;

    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'форма працевлаштування:';
    if EmplIsSuppl then
      Msg := '  За сумісництвом  '
    else
      Msg := '  Основне мiсце роботи  ';
    TextRC[CurRow, 3] := Msg;
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontBold := true;
    FontUnderLine := true;

    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'займає посаду:';
    TextRC[CurRow, 3] := '  ' + EmplPos + '  ';
    SetSelection(CurRow, 3, CurRow, 3);
    FontBold := true;
    FontUnderLine := true;

    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := 'Iндивiдуальний iдентифiкацiйний №:' ;
    SetSelection(CurRow, 1, CurRow, 1);
    FontSize := 9;
    TextRC[CurRow, 3] := '  ' + INN + '  ';
    SetSelection(CurRow, 3, CurRow, 3);
    FontBold := true;
    FontUnderLine := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtIncomeInq.PrintBody(
  out TotalSum: Double;
  out TotalStr: String);
var
  DtMnth: TDateTime;
  Date: TDate;
  TotalIncome,
  TotalTaxes,
  TotalMilit,
  TotalTradeUn,
  TotalAlimony,
  TotalToPay: Double;
  Kopecks: Integer;
begin
  TotalIncome := 0;
  TotalTaxes := 0;
  TotalMilit := 0;
  TotalTradeUn := 0;
  TotalAlimony := 0;
  TotalToPay := 0;
  TotalSum := 0;
  
  with Book do begin
    CurRow := CurRow + 2;
    TextRC[CurRow, 1] := 'Мiсяць року';
    TextRC[CurRow, 2] := 'Нарахована заробiтна плата (грн)';
    TextRC[CurRow, 3] := 'Утрим. податок з доходiв фiз. осiб (грн)';
    TextRC[CurRow, 4] := 'Утрим. вiйськ. збiр (грн)';
    TextRC[CurRow, 5] := 'Утрим. проф. внески (грн)';
    TextRC[CurRow, 6] := 'Утрим. аліменти та iншi види утримань ' +
      'з зароб. плати (грн)';
    TextRC[CurRow, 7] := 'Сума до видачі (грн)';
    RowHeight[CurRow] := Round(7 * ColUnit);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    FontSize := 9;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // В QryInquiry могут быть месяцы, когда заработков и информации не было,
    // а строка в справке все-равно должна быть.
    DtMnth := DtBeg;
    TotalSum := 0;

    while DtMnth <= DtEnd do begin
      Date := DateUtils.Decode(DtMnth);

      CurRow := CurRow + 1;
      TextRC[CurRow, 1] := UkrMes(Date.Mnth) + ' ' + IntToStr(Date.Year) + ' р.';
      SetSelection(CurRow, 1, CurRow, 3);
      SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignBottom, 0);

      with QryInquiry do begin
        if Locate('DtProc', DtMnth, []) then begin
          NumberRC[CurRow, 2] := FieldByName('SumIncome').AsFloat;
          NumberRC[CurRow, 3] := FieldByName('SumTaxes').AsFloat;
          NumberRC[CurRow, 4] := FieldByName('SumMilit').AsFloat;
          NumberRC[CurRow, 5] := FieldByName('SumTradeUn').AsFloat;
          NumberRC[CurRow, 6] := FieldByName('SumAlimony').AsFloat;
          NumberRC[CurRow, 7] := FieldByName('SumToPay').AsFloat;
          SetSelection(CurRow, 2, CurRow, MaxColNum);
          SetAlignment(F1HAlignGeneral, false, F1VAlignBottom, 0);
          FormatFixed2;

          TotalIncome := TotalIncome + FieldByName('SumIncome').AsFloat;
          TotalTaxes := TotalTaxes + FieldByName('SumTaxes').AsFloat;
          TotalMilit := TotalMilit + FieldByName('SumMilit').AsFloat;
          TotalTradeUn := TotalTradeUn + FieldByName('SumTradeUn').AsFloat;
          TotalAlimony := TotalAlimony + FieldByName('SumAlimony').AsFloat;
          TotalToPay := TotalToPay + FieldByName('SumToPay').AsFloat;
          TotalSum := TotalSum + FieldByName('SumIncome').AsFloat;
        end;
        SetSelection(CurRow, 1, CurRow, MaxColNum);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      end;

      DtMnth := DateUtils.NextMonth(DtMnth);
    end;

    CurRow := CurRow + 1;
    RowHeight[CurRow] := Round(1.5 * ColUnit);
    TextRC[CurRow, 1] := 'Усього: ';
    SetSelection(CurRow, 1, CurRow, 3);
    SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignCenter, 0);

    NumberRC[CurRow, 2] := TotalIncome;
    NumberRC[CurRow, 3] := TotalTaxes;
    NumberRC[CurRow, 4] := TotalMilit;
    NumberRC[CurRow, 5] := TotalTradeUn;
    NumberRC[CurRow, 6] := TotalAlimony;
    NumberRC[CurRow, 7] := TotalToPay;

    SetSelection(CurRow, 2, CurRow, MaxColNum);
    SetAlignment(F1HAlignGeneral, false, F1VAlignCenter, 0);
    FormatFixed2;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    CurRow := CurRow + 1;
    TotalStr := UkrSumPropis(TotalSum, 'w', Kopecks);
    TotalStr := AnsiUpperCase(Copy(TotalStr, 1, 1))
      + Copy(TotalStr, 2, Length(TotalStr)) + ' грн., ';
    TotalStr := TotalStr +
      TextUtils.PadLeft(IntToStr(Kopecks), '0', 2) + ' коп.';

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    CellFormat := CreateNewCellFormat;
    CellFormat.AlignHorizontal := F1HAlignCenter;
    CellFormat.AlignVertical := F1VAlignCenter;
    CellFormat.MergeCells := true;
    CellFormat.WordWrap := true;
    CellFormat.FontBold := true;
    SetCellFormat(CellFormat);
    TextRC[CurRow, 1] := TotalStr;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtIncomeInq.PrintFooting(TotalSum: Double; TotalStr: String);
var
  Date: TDate;
begin
  with Book do begin
    CurRow := CurRow + 2;
    Msg := 'Загальна сума доходу за перiод з ' + DateToStr(DtBeg)
      + ' по ' + DateToStr(DtEnd) + ' становить '
      + FloatToStrF(TotalSum, ffFixed, 18, 2) + ' грн.';
    TextRC[CurRow, 1] := Msg;
    CurRow := CurRow + 1;
    TextRC[CurRow, 1] := TotalStr;
    SetSelection(CurRow - 1, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;

    CurRow := CurRow + 2;
    TextRC[CurRow, 1] := 'Довідка видана для подання за місцем вимоги.';

    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontSize := 9;
    CurRow := CurRow + 2;

    TextRC[CurRow, 2] := 'Керiвник';
    TextRC[CurRow, 3] := '_____________';
    TextRC[CurRow, 4] := '__________________';
    CurRow := CurRow + 2;
    SetSelection(CurRow - 1, 1, CurRow, 1);
    CellFormat := CreateNewCellFormat;
    CellFormat.AlignHorizontal := F1HAlignCenter;
    CellFormat.AlignVertical := F1VAlignCenter;
    CellFormat.MergeCells := true;
    CellFormat.WordWrap := false;
    CellFormat.FontBold := false;
    SetCellFormat(CellFormat);
    TextRC[CurRow - 1, 1] := 'М.П.';
    TextRC[CurRow, 2] := 'Головний бухг.';
    TextRC[CurRow, 3] := '_____________';
    TextRC[CurRow, 4] := '__________________';
    CurRow := CurRow + 2;
    TextRC[CurRow, 2] := 'Бухгалтер';
    TextRC[CurRow, 3] := '_____________';
    TextRC[CurRow, 4] := Form_Dm.KdUsr2FioUsr(nAppKdUsr);

    CurRow := CurRow + 3;
    if NoDtDoc then
      Msg := '"_____" __________ 20___ р.'
    else begin
      Date := DateUtils.Decode(DtDoc);
      Msg := '" ' + TextUtils.PadLeft(IntToStr(Date.Day), '0', 2) + ' '
        + UkrMesRod(Date.Mnth) + ' '  + IntToStr(Date.Year) + ' р. "';
    end;
    TextRC[CurRow, 1] := Msg;
  end;
end;

end.
