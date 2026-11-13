unit BlnReqCalc;

interface

uses
  F6Report;

type
  TBlnReqCalc = class(TF6Report)
  private
    Days2601, Days2602, Days2603, Days2604, Days2605: Integer;
    Smm2601, Smm2602, Smm2603, Smm2604, Smm2605, SmmPr2, SmmPr5: Double;

  protected
    procedure InitReport; override;
    procedure InitBook; override;

    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;
    
  public
    class procedure Run(DtPrc: TDateTime;
      Days2601, Days2602, Days2603, Days2604: Integer;
      Smm2601, Smm2602, Smm2603, Smm2604, SmmPr2, SmmPr5: Double;
      Days2605: Integer = 0; Smm2605: Double = 0);
  end;

implementation

uses
  TTF160_TLB, Forms, Controls, Graphics;

//------------------------------------------------------------------------------
class procedure TBlnReqCalc.Run(DtPrc: TDateTime;
  Days2601, Days2602, Days2603, Days2604: Integer;
  Smm2601, Smm2602, Smm2603, Smm2604, SmmPr2, SmmPr5: Double;
  Days2605: Integer = 0;
  Smm2605: Double = 0
);
var
  Report: TBlnReqCalc;
begin
  Screen.Cursor := crHourGlass;

  Report := TBlnReqCalc.Create;

  Report.Days2601 := Days2601;
  Report.Days2602 := Days2602;
  Report.Days2603 := Days2603;
  Report.Days2604 := Days2604;
  Report.Days2605 := Days2605;

  Report.Smm2601 := Smm2601;
  Report.Smm2602 := Smm2602;
  Report.Smm2603 := Smm2603;
  Report.Smm2604 := Smm2604;
  Report.Smm2605 := Smm2605;
  Report.SmmPr2  := SmmPr2;
  Report.SmmPr5  := SmmPr5;

  with Report do begin
    Print;
    Preview;
    Free;
  end;

  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
procedure TBlnReqCalc.InitReport;
begin
  inherited InitReport;

  MaxColNum := 5;
end;

//------------------------------------------------------------------------------
procedure TBlnReqCalc.InitBook;
begin
  inherited InitBook;
  
  with Book do begin
    ColWidth[1] := Round( 4 * ColUnit);
    ColWidth[2] := Round(35 * ColUnit);
    ColWidth[3] := Round(24 * ColUnit);
    ColWidth[4] := Round(16 * ColUnit);
    ColWidth[5] := Round(25 * ColUnit);
  end;
end;

//------------------------------------------------------------------------------
procedure TBlnReqCalc.PrintHeader;
var
  Msg: String;
begin
  with Book do begin
    TextRC[ 2, 4] := 'Додаток 1';
    TextRC[ 3, 4] := 'до Порядку фінансування страхувальників';
    TextRC[ 4, 4] := 'для надання страхових виплат за ';
    TextRC[ 5, 4] := 'загальнообов''язковим державним ';
    TextRC[ 6, 4] := 'соціальним страхуванням';
    TextRC[ 7, 4] := '(пунк 3)';
    SetSelection(2, 4, 7, 4);
    FontSize := 9;

    SetSelection(2, MaxColNum, 7, MaxColNum);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);

    CurRow := 9;
    TextRC[CurRow, 1] := 'Заява-розрахунок';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

    Inc(CurRow, 2);
    Msg := 'Прошу здійснити фінансування коштів для надання страхових ' +
      'виплат за загальнообов''язковим державним';
    TextRC[CurRow, 2] := Msg;
    Inc(CurRow, 1);
    Msg := 'соціальним страхуванням застрахованим особам за реквізитами ' +
      'страхувальника:';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow, 2);
    TextRC[CurRow, 2] := 'Найменування:';
    SetSelection(CurRow, 2, CurRow, 2);
    FontSize := 9;

    Msg := 'Національний університет "Одеська політехніка"';
    TextRC[CurRow, 3] := Msg;
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontBold := true;

    Inc(CurRow);
    Msg := 'Місцезнаходження:';
    TextRC[CurRow, 2] := Msg;
    SetSelection(CurRow, 2, CurRow, 2);
    FontSize := 9;
    Msg := '65044 Одеса проспект Шевченка, 1';
    TextRC[CurRow, 3] := Msg;
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontBold := true;

    Inc(CurRow);
    Msg := 'Номер телефону:';
    TextRC[CurRow, 2] := Msg;
    SetSelection(CurRow, 2, CurRow, 2);
    FontSize := 9;
    Msg := '+38(048) 705-83-80';
    TextRC[CurRow, 3] := Msg;
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontBold := true;

    Inc(CurRow);
    Msg := 'Код за ЄДРПОУ:';
    TextRC[CurRow, 2] := Msg;
    SetSelection(CurRow, 2, CurRow, 2);
    FontSize := 9;
    Msg := '43861328';
    TextRC[CurRow, 3] := Msg;
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontBold := true;

    Inc(CurRow);
    Msg := 'Номер окремого поточного рахуноку у банку або окремого рахунку в ' +
      'органі, що здійснює казначейське';
    TextRC[CurRow, 2] := Msg;
    Inc(CurRow);
    Msg := 'обслуговування бюджетних коштів:';
    TextRC[CurRow, 2] := Msg;
    SetSelection(CurRow - 1, 2, CurRow, 2);
    FontSize := 9;
    Msg := '37116074001204';
    TextRC[CurRow, 3] := Msg;
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontBold := true;

    Inc(CurRow);
    Msg := 'Найменування банку або органу, що здійснює казначейське';
    TextRC[CurRow, 2] := Msg;
    Inc(CurRow);
    Msg := 'обслуговування бюджетних коштів:';
    TextRC[CurRow, 2] := Msg;
    SetSelection(CurRow - 1, 2, CurRow, 2);
    FontSize := 9;
    Msg := 'ДКСУ в м.Київ';
    TextRC[CurRow, 3] := Msg;
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontBold := true;

    Inc(CurRow);
    Msg := 'Код ID НБУ:';
    TextRC[CurRow, 2] := Msg;
    SetSelection(CurRow, 2, CurRow, 2);
    FontSize := 9;
    Msg := '820172';
    TextRC[CurRow, 3] := Msg;
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
    FontBold := true;

    Inc(CurRow, 2);
    RowHeight[CurRow] := Round(3 * ColUnit);

    TextRC[CurRow, 1] := '№ з/п';
    TextRC[CurRow, 2] := 'Найменування виду виплат застрахованим особам';
    TextRC[CurRow, 3] := 'Кількість днів для пунктів 1, 1.1, 2, 2.1, 4,5 / '#10 +
      'кількість осіб для пунктів 3,6';
    TextRC[CurRow, 4] := 'Сума'#10 + '(в гривнях з копійками)';
    TextRC[CurRow, 5] := 'Примітка';

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow);
    TextRC[CurRow, 1] := '1';
    TextRC[CurRow, 2] := '2';
    TextRC[CurRow, 3] := '3';
    TextRC[CurRow, 4] := '4';
    TextRC[CurRow, 5] := '5';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow);
    NumberRC[CurRow, 1] := 1;
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 2] := 'Допомога по тимчасовій непрацездатності';
    SetSelection(CurRow, 2, CurRow, 2);
    SetAlignment(F1HAlignLeft, true, F1VAlignCenter, 0);
  end;
end;

//------------------------------------------------------------------------------
procedure TBlnReqCalc.PrintBody;
begin
  with Book do begin
    // ...
    if Days2604 <> 0 then
      NumberRC[CurRow, 3] := Days2604 + Days2601
    else
      TextRC[CurRow, 3] := '-';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 4, CurRow, 4);
    if Smm2604 <> 0 then begin
      NumberRC[CurRow, 4] := Smm2604 + Smm2601;
      FormatFixed2;
      SetAlignment(F1HAlignRight, true, F1VAlignCenter, 0);
    end else begin
      TextRC[CurRow, 4] := '-';
      SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    end;
    // ...
    TextRC[CurRow, 5] := 'Розділ I цього додатка';
    SetSelection(CurRow, 5, CurRow, 5);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Inc(CurRow);
    TextRC[CurRow, 1] := '1.1';
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 2] := 'У тому числі постраждалим внаслідок ЧАЕС';
    SetSelection(CurRow, 2, CurRow, 2);
    SetAlignment(F1HAlignLeft, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontItalic := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Inc(CurRow);
    NumberRC[CurRow, 1] := 2;
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 2] := 'Допомога по вагітності та пологах';
    SetSelection(CurRow, 2, CurRow, 2);
    SetAlignment(F1HAlignLeft, true, F1VAlignCenter, 0);
    // ...
    if Days2602 <> 0 then
      NumberRC[CurRow, 3] := Days2602
    else
      TextRC[CurRow, 3] := '-';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 4, CurRow, 4);
    if Smm2602 <> 0 then begin
      NumberRC[CurRow, 4] := Smm2602;
      FormatFixed2;
      SetAlignment(F1HAlignRight, true, F1VAlignCenter, 0);
    end else begin
      TextRC[CurRow, 4] := '-';
      SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    end;
    // ...
    TextRC[CurRow, 5] := 'Розділ II цього додатка';
    SetSelection(CurRow, 5, CurRow, 5);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Inc(CurRow);
    TextRC[CurRow, 1] := '2.1';
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 2] := 'У тому числі постраждалим внаслідок ЧАЕС';
    SetSelection(CurRow, 2, CurRow, 2);
    SetAlignment(F1HAlignLeft, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontItalic := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Inc(CurRow);
    TextRC[CurRow, 1] := '3';
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 2] := 'Допомога на поховання';
    SetSelection(CurRow, 2, CurRow, 2);
    SetAlignment(F1HAlignLeft, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 4, CurRow, 4);
    if SmmPr2 <> 0 then begin
      NumberRC[CurRow, 4] := SmmPr2;
      FormatFixed2;
      SetAlignment(F1HAlignRight, true, F1VAlignCenter, 0);
    end else begin
      TextRC[CurRow, 4] := '-';
      SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    end;
    // ...
    TextRC[CurRow, 5] := 'Розділ III цього додатка';
    SetSelection(CurRow, 5, CurRow, 5);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Inc(CurRow);
    TextRC[CurRow, 1] := '4';
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 2] := 'Допомога по тимчасовій непрацездатності внаслідок ' +
      'нещастного випадку або професійного захворювання';
    SetSelection(CurRow, 2, CurRow, 2);
    SetAlignment(F1HAlignLeft, true, F1VAlignCenter, 0);
    // ...
    if Days2605 <> 0 then
      NumberRC[CurRow, 3] := Days2605
    else
      TextRC[CurRow, 3] := '-';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 4, CurRow, 4);
    if Abs(Smm2605) > 0.001 then begin
      NumberRC[CurRow, 4] := Smm2605;
      FormatFixed2;
      SetAlignment(F1HAlignRight, true, F1VAlignCenter, 0);
    end else begin
      TextRC[CurRow, 4] := '-';
      SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    end;
    // ...
    TextRC[CurRow, 5] := 'Розділ IV цього додатка';
    SetSelection(CurRow, 5, CurRow, 5);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Inc(CurRow);
    TextRC[CurRow, 1] := '5';
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 2] := 'Виплата у разі переведення потерпілого на легшу, ' +
      'нижчеоплачувану роботу';
    SetSelection(CurRow, 2, CurRow, 2);
    SetAlignment(F1HAlignLeft, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 5] := 'Розділ V цього додатка';
    SetSelection(CurRow, 5, CurRow, 5);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Inc(CurRow);
    TextRC[CurRow, 1] := '6';
    SetSelection(CurRow, 1, CurRow, 1);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 2] := 'Відшкодування вартості поховання потерпілого та ' +
      'пов''язаних з цим ритуальних послуг';
    SetSelection(CurRow, 2, CurRow, 2);
    SetAlignment(F1HAlignLeft, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 4, CurRow, 4);
    if Smmpr5 <> 0 then begin
      NumberRC[CurRow, 4] := SmmPr5;
      FormatFixed2;
      SetAlignment(F1HAlignRight, true, F1VAlignCenter, 0);
    end else begin
      TextRC[CurRow, 4] := '-';
      SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    end;
    // ...
    TextRC[CurRow, 5] := 'Розділ VI цього додатка';
    SetSelection(CurRow, 5, CurRow, 5);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Inc(CurRow);
    TextRC[CurRow, 1] := 'ВСЬОГО';
    SetSelection(CurRow, 1, CurRow, 2);
    SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 3] := 'x';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    NumberRC[CurRow, 4] :=
      Smm2601 + Smm2602 + Smm2604 + Smm2605 + SmmPr2 + SmmPr5;
    SetSelection(CurRow, 4, CurRow, 4);
    FormatFixed2;
    SetAlignment(F1HAlignRight, true, F1VAlignCenter, 0);
    // ...
    TextRC[CurRow, 5] := 'x';
    SetSelection(CurRow, 5, CurRow, 5);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    // ...
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TBlnReqCalc.PrintFooter;
begin
  with Book do begin
    Inc(CurRow, 3);
    TextRC[CurRow, 2] := 'Примітка та розділи I-VI цього додатка ' +
      'заповнюються лише для тих видів виплат, на які замовляються кошти.';
    // ...
    Inc(CurRow, 4);
    TextRC[CurRow, 2] := 'Керівник/уповноважена особа _________________';
    TextRC[CurRow, 4] := 'підпис _________________';
    // ...
    Inc(CurRow, 3);
    TextRC[CurRow, 2] := 'Дата складання заяви-розрахунку';
  end;
end;

end.
