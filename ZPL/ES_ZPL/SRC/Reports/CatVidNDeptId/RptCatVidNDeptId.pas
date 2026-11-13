unit RptCatVidNDeptId;

interface

uses
  DBClient, TTF160_TLB, F6Report;

type

  TRptCatVidNDeptId = class(TF6Report)
  private
    RptYear: Integer;
    CdsReport: TClientDataSet;

    CellFmt: IF1CellFormat;

    procedure PrintRow;
    procedure NumberRCCust(ColNum: Integer; Sum: Double);

  protected
    procedure InitReport; override;
    procedure InitBook; override;

    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;

  public
    class procedure Run(RptYear: Integer; CdsReport: TClientDataSet);
  end;

implementation

uses
  Math, a_Const, a_DM, Graphics, SysUtils, Windows, DModCatVidNDeptId,
  DateLib;

//------------------------------------------------------------------------------
class procedure TRptCatVidNDeptId.Run(
  RptYear: Integer;
  CdsReport: TClientDataSet
);
var
  Report: TRptCatVidNDeptId;
begin
  Report := TRptCatVidNDeptId.Create;

  Report.RptYear   := RptYear;
  Report.CdsReport := CdsReport;

  with Report do begin
    Print;
    Preview;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptCatVidNDeptId.InitReport;
begin
  inherited InitReport;

  MaxColNum := 9;
end;

//------------------------------------------------------------------------------
procedure TRptCatVidNDeptId.InitBook;
begin
  inherited InitBook;

  with Book do begin
    ColWidth[1] := Round(10 * ColUnit); // № каф.
    ColWidth[2] := Round(50 * ColUnit); // Кафедра
    ColWidth[3] := Round(15 * ColUnit); // Суммы: год
    ColWidth[4] := Round(15 * ColUnit); // I
    ColWidth[5] := Round(15 * ColUnit); // II
    ColWidth[6] := Round(15 * ColUnit); // III
    ColWidth[7] := Round(15 * ColUnit); // IV
    ColWidth[8] := Round(15 * ColUnit); // V
    ColWidth[9] := Round(15 * ColUnit); // ЕСВ
  end;
end;

//------------------------------------------------------------------------------
procedure TRptCatVidNDeptId.PrintHeader;
var
  GrpId: Integer;
begin
  with Book do begin
    Inc(CurRow, 1);

    TextRC[CurRow, 1] :=
      'Інформація щодо фонду оплати праці працівників ' +
      'закладу вищої освіти (за загальним фондом)';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontBold := true;

    Inc(CurRow, 3);

    TextRC[CurRow, 2] := 'Найменування';
    TextRC[CurRow, 3] := IntToStr(RptYear);

    CurCol := 4;

    for GrpId := 1 to GRP_CNT do begin
      TextRC[CurRow, CurCol] := DateUtils.MnthToRome(GrpId);
      Inc(CurCol);
    end;

    TextRC[CurRow, CurCol] := 'Нарах. ЄСВ';

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);
    FontSize := 9;
    FontBold := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TRptCatVidNDeptId.PrintBody;
var
  DeptId: Integer;
  CellsToMerge: Integer;
begin
  with CdsReport, Book do begin
    First;

    while not Eof do begin
      PrintRow;

      DeptId := CdsReport.FieldByName('DeptId').AsInteger;

      if DeptId < 10 then begin
        SetSelection(CurRow, 1, CurRow, MaxColNum);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
        FontBold := true;

        TextRC[CurRow, 1] := CdsReport.FieldByName('DeptNm').AsString;

        if CdsReport.FieldByName('DeptNm').AsString = 'Всього:' then
          CellsToMerge := 2
        else
          CellsToMerge := MaxColNum;

        SetSelection(CurRow, 1, CurRow, CellsToMerge);
        CellFmt := CreateNewCellFormat;
        CellFmt.MergeCells := true;
        CellFmt.FontSize := 9;
        CellFmt.FontBold := true;
        SetCellFormat(CellFmt);

        // Политех
        if DeptId = 0 then
          CellFmt.AlignHorizontal := F1HAlignCenter
        else
          CellFmt.AlignHorizontal := F1HAlignLeft;

        if CdsReport.FieldByName('DeptNm').AsString = 'Всього:' then
          Inc(CurRow);
      end;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptCatVidNDeptId.PrintRow;
var
  GrpId: Integer;
  SumFldNm: ShortString;
  GrpSm, GrpTtl, ESV: Double;
begin
  with Book do begin
    Inc(CurRow);
    TextRC[CurRow, 1] := CdsReport.FieldByName('DeptId').AsString;
    TextRC[CurRow, 2] := CdsReport.FieldByName('DeptNm').AsString;

      GrpTtl := 0;
      ESV := 0;

      CurCol := 4;

      for GrpId := 1 to GRP_CNT do begin
        SumFldNm := TDmCatVidNDeptId.GetSumFldNm(GrpId);

        GrpSm := CdsReport.FieldByName(SumFldNm).AsFloat;
        // Накапливаем
        Esv := Esv + RoundTo(GrpSm * 0.22, -2);

        // В тысячах с сотнями после запятой
        GrpSm := GrpSm / 1000;
        GrpSm := RoundTo(GrpSm, -1);

        GrpTtl := GrpTtl + GrpSm;

        NumberRCCust(CurCol, GrpSm);
        Inc(CurCol);
      end;

      // В тысячах с сотнями после запятой
      ESV := ESV / 1000;
      ESV := RoundTo(ESV, -1);

      NumberRCCust(3, RoundTo(GrpTtl + ESV, -1));
      NumberRCCust(CurCol, ESV);
  end;
end;

//------------------------------------------------------------------------------
procedure TRptCatVidNDeptId.NumberRCCust(ColNum: Integer; Sum: Double);
var
  SumStr: ShortString;
  FmtSetts: TFormatSettings;
begin
  Sum := RoundTo(Sum, -1);

  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FmtSetts);
  FmtSetts.DecimalSeparator := ',';
  FmtSetts.CurrencyDecimals := 1;
  SumStr := FloatToStrF(Sum, ffNumber, 18, 1, FmtSetts);

  if Sum <> 0 then
    with Book do begin
      TextRC[CurRow, ColNum] := Trim(SumStr);
      SetSelection(CurRow, ColNum, CurRow, ColNum);
      SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0);
    end;
end;

//------------------------------------------------------------------------------
procedure TRptCatVidNDeptId.PrintFooter;
begin
  with Book do begin
    Inc(CurRow, 2);

    TextRC[CurRow, 4] :=
      'Бухгалтер' +  '__________________ ' + Form_Dm.KdUsr2FioUsr(nAppKdUsr);
  end;
end;

end.
