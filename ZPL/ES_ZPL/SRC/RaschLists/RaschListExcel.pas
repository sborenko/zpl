unit RaschListExcel;

interface

uses
  Db, F6Report, TTF160_TLB, RaschListCmn;

type
  TRaschListExcel = class(TF6Report)
  private
    DsNu: TDataSet;

    EmplId: Integer;
    EmplName: ShortString;

    ListCmn: TRaschListCmn;

    procedure SetColsWidth(Offset: Word);
    procedure PrintListHeader(RaschListTotals: TRaschListTotals;
      HeaderRow, Offset: Integer);
    procedure PrintRow(OrdNum: Integer; RowData: TRaschListRow; Offset: Word);
    procedure PrintListFooter(SmNachTt, SmUdrgTt: Double;
      FooterRow, Offset: Integer);
    procedure DrawBorder(BodyStartRow, Offset: Integer);

  protected
    procedure InitBook; override;

  public
    constructor Create(DsNu: TDataSet);
    destructor Destroy; override;

    procedure Print(DtProc: TDateTime; EmplId: Integer; EmplName: ShortString;
      var StartRow: Integer; out RowsPrinted: Integer);

    procedure PrintRowProc(OrdNum: Integer; RowData: TRaschListRow);
    procedure PrintTotalsProc(SmNachTt, SmUdrgTt: Double);
  end;

implementation

uses
  Graphics, Math, SysUtils;

const
  ColNPp = 1;
  ColMesGod = 2;
  ColVidN = 3;
  ColShVidN = 4;
  ColHours = 5;
  ColSumNach = 6;
  ColSumUdrg = 7;
  ColSep1 = 8;
  ColSep2 = 9;

  List2Offset = 9;

//------------------------------------------------------------------------------
constructor TRaschListExcel.Create(DsNu: TDataSet);
begin
  inherited Create;

  Self.DsNu := DsNu;
  ListCmn := TRaschListCmn.Create;
end;

//------------------------------------------------------------------------------
destructor TRaschListExcel.Destroy;
begin
  ListCmn.Free;
  inherited Destroy;
end;

//------------------------------------------------------------------------------
procedure TRaschListExcel.InitBook;
begin
  inherited InitBook;

  // Ширины столбцов левого листа
  SetColsWidth(0);

  with Book do begin
    ColWidth[ColSep1] := Round(2 * ColUnit);
    ColWidth[ColSep2] := Round(2 * ColUnit);
    DefaultFontSize := 8;
  end;

  // Ширины столбцов правого листа
  SetColsWidth(List2Offset);
end;

//------------------------------------------------------------------------------
procedure TRaschListExcel.Print(
  DtProc: TDateTime;
  EmplId: Integer;
  EmplName: ShortString;
  var StartRow: Integer; out RowsPrinted: Integer);
var
  SavedRow, BodyStartRow: Integer;
begin
  Self.EmplId := EmplId;
  Self.EmplName := EmplName;

  ListCmn.PopulateListTotals(EmplId, DtProc, true);

  SavedRow := StartRow;
  // Заголовок левого листа
  PrintListHeader(ListCmn.RaschListTotals, StartRow, 0);
  // Заголовок правого листа
  PrintListHeader(ListCmn.RaschListTotals, SavedRow, List2Offset);
  Inc(CurRow);

  with DsNu do begin
    // Контент левого и правого листов
    BodyStartRow := CurRow;
    ListCmn.ProcessRows(DsNu, PrintRowProc, PrintTotalsProc);
  end;

  // Обрамление левого листа
  DrawBorder(BodyStartRow, 0);
  // Обрамление правого листа
  DrawBorder(BodyStartRow, List2Offset);

  // Линия отреза
  with Book do begin
    SetSelection(1, ColSep2 - 1, CurRow, ColSep2 - 1);
    SetBorder(-1,4,-1,-1,-1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;

  // Выходные параметры
  RowsPrinted := CurRow - StartRow + 1;
  StartRow := CurRow + 1;
end;

//------------------------------------------------------------------------------
procedure TRaschListExcel.SetColsWidth(Offset: Word);
begin
  with Book do begin
    ColWidth[ColNPp + Offset] := Round(4 * ColUnit);
    ColWidth[ColMesGod + Offset] := Round(5.5 * ColUnit);
    ColWidth[ColVidN + Offset] := Round(5 * ColUnit);
    ColWidth[ColShVidN + Offset] := Round(13 * ColUnit);
    ColWidth[ColHours + Offset] := Round(7 * ColUnit);
    ColWidth[ColSumNach + Offset] := Round(10 * ColUnit);
    ColWidth[ColSumUdrg + Offset] := Round(10 * ColUnit);
  end;
end;

//------------------------------------------------------------------------------
procedure TRaschListExcel.PrintListHeader(
  RaschListTotals: TRaschListTotals;
  HeaderRow, Offset: Integer);
begin
  CurRow := HeaderRow;

  with Book, RaschListTotals do begin
    TextRC[CurRow, ColNPp + Offset] :=
      'Розрахунковий листок за ' + ListCmn.RaschListTotals.MnthYear;
    SetSelection(CurRow, ColNPp + Offset, CurRow, ColSumUdrg + Offset);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

    Inc(CurRow);
    TextRC[CurRow, ColNPp + Offset] := 'Таб.Нр ' + IntToStr(EmplId);
    SetSelection(CurRow, ColNPp + Offset, CurRow, ColNPp + Offset);
    FontBold := true;
    TextRC[CurRow, ColSumUdrg + Offset] := Dept;
    SetSelection(CurRow, ColSumUdrg + Offset, CurRow, ColSumUdrg + Offset);
    FontUnderLine := true;
    SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0);

    Inc(CurRow);
    TextRC[CurRow, ColNPp + Offset] := EmplName;
    SetSelection(CurRow, ColNPp + Offset, CurRow, ColNPp + Offset);
    FontBold := true;
    TextRC[CurRow, ColSumUdrg + Offset] :=
      'Оклад ' + FloatToStrF(Salary, ffFixed, 18, 2);
    SetSelection(CurRow, ColSumUdrg + Offset, CurRow, ColSumUdrg + Offset);
    FontBold := true;
    SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0);

    Inc(CurRow);
    TextRC[CurRow, ColNPp + Offset] := '№ з/п';
    TextRC[CurRow, ColMesGod + Offset] := 'Мiс. Рiк';
    SetSelection(CurRow, ColNPp + Offset, CurRow, ColMesGod + Offset);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    TextRC[CurRow, ColVidN + Offset] := 'Вид нарахування (утримання)';
    SetSelection(CurRow, ColVidN + Offset, CurRow, ColShVidN + Offset);
    SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignCenter, 0);
    TextRC[CurRow, ColHours + Offset] := 'Годин';
    TextRC[CurRow, ColSumNach + Offset] := 'Нараховано';
    TextRC[CurRow, ColSumUdrg + Offset] := 'Утримано';
    SetSelection(CurRow, ColHours + Offset, CurRow, ColSumUdrg + Offset);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetSelection(CurRow, ColNPp + Offset, CurRow + 1, ColSumUdrg + Offset);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

{
//------------------------------------------------------------------------------
procedure TRaschListExcel.PrintRow(Offset: Word);
begin
  with Book do begin
    NumberRC[CurRow, ColNPp + Offset] := OrdNum;
    TextRC[CurRow, ColMesGod + Offset] := PayMnthYearStr;
    TextRC[CurRow, ColVidN + Offset] := PayTypeId;
    TextRC[CurRow, ColShVidN + Offset] := PayTypeSh;
    if Hours <> 0 then
      NumberRC[CurRow, ColHours + Offset] := Hours;
    if SmNachVid <> 0 then
      NumberRC[CurRow, ColSumNach + Offset] := SmNachVid;
    if SmUdrgVid <> 0 then
      NumberRC[CurRow, ColSumUdrg + Offset] := SmUdrgVid;
    SetSelection(CurRow, ColSumNach + Offset, CurRow, ColSumUdrg + Offset);
    FormatFixed2;
  end;
end;
}

(*
//------------------------------------------------------------------------------
procedure TRaschListExcel.PrintBody;
var
  MnthYear: TDateTime;
  PayTypeIsNonPay: Boolean;
  SmPrt: Double;
begin
  OrdNum := 0;

  SmNachTt := 0;
  SmUdrgTt := 0;
  SmVuplTt := 0;

  with Book, DsNu do begin
    while not Eof do begin
      PayTypeId := FieldByName('VidN').AsString;

      if PayTypeId < '8000' then begin
        MnthYear := FieldByName('ZaMesGod').AsDateTime;
        PayTypeSh := FieldByName('ShVidN').AsString;

        PayTypeIsNonPay := false;
        SmNachVid := 0;
        SmUdrgVid := 0;
        SmPrt := 0;
        Hours := 0;

        if PayTypeId < '6000' then begin
          // Начисления
          while (FieldByName('VidN').AsString = PayTypeId)
              and (FieldByName('ZaMesGod').AsDateTime = MnthYear)
              and not Eof do begin

            SmPrt := SmPrt + FieldByName('Summa').AsFloat;
            Hours := Hours  + FieldByName('Chas').AsFloat;

    {
            if (cPrtVid = '5002') or (cPrtVid = '5005') or (cPrtVid = '5008') then
              Hash500x(cPrtVid,
                TDateUtils.InitPeriod(
                  FieldByName('Dt_Beg').AsDateTime,
                  FieldByName('Dt_End').AsDateTime),
                FieldByName('Storn').AsString = 'Y');
    }

            Next;
          end;

          PayTypeIsNonPay := (PayTypeId >= '5000') and (PayTypeId < '6000');

          if SmPrt >= 0 then
            SmNachVid := RoundTo(SmNachVid + SmPrt, -2)
          else
            SmUdrgVid := RoundTo(SmUdrgVid - SmPrt, -2);

        end else if PayTypeId < '7500' then begin
          // Удержания
          while (FieldByName('VidN').AsString = PayTypeId)
              and (FieldByName('ZaMesGod').AsDateTime = MnthYear)
              and not Eof do begin

            SmPrt := SmPrt + FieldByName('Summa').AsFloat;
            Next;
          end;

          if SmPrt >= 0 then
            SmNachVid := RoundTo(SmNachVid + SmPrt, -2)
          else
            SmUdrgVid := RoundTo(SmUdrgVid - SmPrt, -2);

        end else begin
          // Выплаты расписывать каждую в своей строке
          if FieldByName('Summa').AsFloat >= 0 then
            SmNachVid := SmNachVid + FieldByName('Summa').AsFloat
          else
            SmUdrgVid := SmUdrgVid - FieldByName('Summa').AsFloat;

          Next;
        end;
      end else
        Next;

      if true {(nSmNachVid <> nSmUdrgVid)
          or bVidIsNeopl and (nChasuVid <> 0)
          or (FieldByName('ZaMesGod').AsDateTime <>
            FieldByName('DtProc').AsDateTime)} then begin
        SmNachTt := SmNachTt + SmNachVid;
        SmUdrgTt  := SmUdrgTt  + SmUdrgVid;

        PayMnthYearStr := DateToStr(MnthYear);
        PayMnthYearStr := Copy(PayMnthYearStr, 4, 3) +
          Copy(PayMnthYearStr, 9, 2);

        Inc(CurRow);
        Inc(OrdNum);

        PrintRow(0);
        PrintRow(List2Offset);
      end;
    end;
  end;

  // ProcessRL(QryNu, PrintRLRow, nil);
end;
*)

//------------------------------------------------------------------------------
procedure TRaschListExcel.PrintListFooter(
  SmNachTt, SmUdrgTt: Double; FooterRow, Offset: Integer);
var
  SumToPay: Double;
begin
  CurRow := FooterRow;

  with Book do begin
    TextRC[CurRow, ColMesGod + Offset] := ' Всього: ';
    SetSelection(CurRow, ColMesGod + Offset, CurRow, ColHours + Offset);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
    NumberRC[CurRow, ColSumNach + Offset] := SmNachTt;
    NumberRC[CurRow, ColSumUdrg + Offset] := SmUdrgTt;
    SetSelection(CurRow, ColSumNach + Offset, CurRow, ColSumUdrg + Offset);
    FormatFixed2;

    Inc(CurRow);
    TextRC[CurRow, ColMesGod + Offset] := ' Сума до виплати';
    SetSelection(CurRow, ColMesGod + Offset, CurRow, ColHours + Offset);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
    SumToPay := RoundTo(SmNachTt - SmUdrgTt, -2);
    if SumToPay <> 0 then begin
      TextRC[CurRow, ColSumNach + Offset] := FloatToStr(SumToPay)
    end else
      TextRC[CurRow, ColSumNach + Offset] := '-';
    SetSelection(CurRow, ColSumNach + Offset, CurRow, ColSumUdrg + Offset);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
    FormatFixed2;
    SetSelection(CurRow, 1 + Offset, CurRow, ColSumUdrg + Offset);
    FontBold := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TRaschListExcel.DrawBorder(BodyStartRow, Offset: Integer);
begin
  with Book do begin
    SetSelection(BodyStartRow, ColNPp + Offset, CurRow, ColSumUdrg + Offset);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TRaschListExcel.PrintRow(
  OrdNum: Integer;
  RowData: TRaschListRow;
  Offset: Word);
begin
  with Book, RowData do begin
    NumberRC[CurRow, ColNPp + Offset] := OrdNum;
    TextRC[CurRow, ColMesGod + Offset] := MnthYearStr;
    TextRC[CurRow, ColVidN + Offset] := PayTypeId;
    TextRC[CurRow, ColShVidN + Offset] := PayTypeSh;
    if Hours <> 0 then
      NumberRC[CurRow, ColHours + Offset] := Hours;
    if SmNachVid <> 0 then
      NumberRC[CurRow, ColSumNach + Offset] := SmNachVid;
    if SmUdrgVid <> 0 then
      NumberRC[CurRow, ColSumUdrg + Offset] := SmUdrgVid;
    SetSelection(CurRow, ColSumNach + Offset, CurRow, ColSumUdrg + Offset);
    FormatFixed2;
  end;
end;

//------------------------------------------------------------------------------
procedure TRaschListExcel.PrintRowProc(OrdNum: Integer; RowData: TRaschListRow);
begin
  PrintRow(OrdNum, RowData, 0);
  PrintRow(OrdNum, RowData, List2Offset);
  Inc(CurRow);
end;

//------------------------------------------------------------------------------
procedure TRaschListExcel.PrintTotalsProc(SmNachTt, SmUdrgTt: Double);
var
  FooterRow: Integer;
begin
  FooterRow := CurRow;
  PrintListFooter(SmNachTt, SmUdrgTt, FooterRow, 0);
  PrintListFooter(SmNachTt, SmUdrgTt, FooterRow, List2Offset);
end;

end.
