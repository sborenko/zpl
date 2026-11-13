unit RptSickLastMnth;

interface

uses
  DbTables, TTF160_TLB;

type

  TRptSickLastMnth = class
  private
    EmplId: Integer;
    EmplName: ShortString;
    QryVBln, QryRBln: TQuery;
    TblRBln: TTable;

    F6Book: TF6Book;
    PgSetup: F1PageSetup;
    WidthUnit: Integer;

    procedure PrepareF6Book;
    procedure Print;
  public
    class procedure Run(EmplId: Integer; EmplName: ShortString;
      QryVBln, QryRBln: TQuery; TblRBln: TTable);
  end;

implementation

uses
  a_Const, a_Dm, a_Lib, Controls, Forms, Graphics, PrintUtils, SysUtils;

//------------------------------------------------------------------------------
class procedure TRptSickLastMnth.Run(
  EmplId: Integer;
  EmplName: ShortString;
  QryVBln, QryRBln: TQuery;
  TblRBln: TTable);
var
  Report: TRptSickLastMnth;
begin
  Screen.Cursor := crHourGlass;

  Report := TRptSickLastMnth.Create;

  Report.EmplId := EmplId;
  Report.EmplName := EmplName;
  Report.QryVBln := QryVBln;
  Report.QryRBln := QryRBln;
  Report.TblRBln := TblRBln;

  with Report do begin
    PrepareF6Book;
    Print;

    F6Book.Free;
    Free;
  end;

  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
procedure TRptSickLastMnth.PrepareF6Book;
begin
  F6Book := TF6Book.Create(nil);

  with F6Book do begin
    PgSetup := CreateNewPageSetup;

    TPrintUtils.SetCustomParams(PgSetup);
    SetPageSetup(PgSetup);

    ShowGridLines    := false;
    ShowColHeading   := true;
    ShowRowHeading   := true;
    ShowZeroValues   := false;
    ShowTabs         := 0;
    PrintNoColor     := true;
    PrintGridLines   := false;
    PrintFooter      := '';
    PrintHeader      := '';
    PrintLandscape   := false;
    DefaultFontCharSet := F1RussianCharSet;
    DefaultFontSize := 10;

    WidthUnit := RowHeight[1];
  end;
end;

//------------------------------------------------------------------------------
procedure TRptSickLastMnth.Print;
var
  CellFormat: IF1CellFormat;

  cVidBln, cMsg: ShortString;
  iRow, iCol, nMaxCol, nStartRow: Integer;
  nY, nM, nD: Word;

  nSvNR, nPp: Integer;
  nSmZpKoef, nCntDays, nSmBlnTt: Double;

  ExFileName: String;
begin
  nMaxCol := 8;

  with F6Book do begin
    iRow := 1;
    iCol := 1;
    TextRC[iRow, 2] := 'Міністерство освіти і науки України';
    TextRC[iRow + 1, 2] := 'Національний університет';
    TextRC[iRow + 2, 2] := '"Одеська політехніка"';
    TextRC[iRow + 3, 2] := 'Ідент.код 43861328';
    TextRC[iRow + 4, 2] := 'пр.Шевченка, 1, м.Одеса, 65044';
    TextRC[iRow + 5, 2] := 'Україна';
    TextRC[iRow + 6, 2] := 'тел. +38 048 7058380';

    SetSelection(iRow, 2, iRow + 6, 3);
    FontSize := 9;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    SetSelection(iRow + 1, 2, iRow + 2, 3);
    FontBold := true;

    Inc(iRow, 7);
    TextRC[iRow, 1] := 'ДОВІДКА';
    TextRC[iRow + 1, 1] := 'про заробітну плату ' +
      '(дохід, грошове забезпечення) для розрахунку ';
    TextRC[iRow + 2, 1] := 'виплат за загальнообов''язковим державним ' +
      'соціальним страхуванням';

    SetSelection(iRow, 1, iRow + 3, nMaxCol);
    FontSize := 12;
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    Inc(iRow, 4);

{
    cVidBln := qryVBln.FieldByName('VidN').AsString;
    if cVidBln = '2602' then
      cMsg := 'Расчёт декретных'
    else
      cMsg := 'Расчёт больничных';

    TextRC[iRow, 1] := cMsg;
}

    cMsg := 'Таб.№  ' + IntToStr(EmplId) + '   ' + EmplName;
    TextRC[iRow, 1] := cMsg;
    SetSelection(iRow, 1, iRow, nMaxCol);
    FontSize := 12;
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    cMsg := '№ л/л ' + Trim(qryVBln.FieldByName('SerList').AsString) +  ' ' +
                             qryVBln.FieldByName('NrList').AsString + '. ';

//    if (cVidBln = '2602') then
//      cMsg := cMsg + 'Календ. днiв: '
//    else
//      cMsg := cMsg + 'Робочих днiв: ';
      cMsg := cMsg + 'Календ. днiв: ';


    cMsg := cMsg + qryVBln.FieldByName('CntDays').AsString +
      ', з ' + qryVBln.FieldByName('DtBeg').AsString +
      ' по ' + qryVBln.FieldByName('DtEnd').AsString + ' (вкл.)';

    Inc(iRow);
    TextRC[iRow, 1] := cMsg;
    SetSelection(iRow, 1, iRow, nMaxCol);
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    if qryVBln.FieldByName('ListCont').AsString = '1' then begin
      Inc(iRow);
      cMsg := '(Продовження листка № ' + qryVBln.FieldByName('PredNR').AsString +
              ' від ' + qryVBln.FieldByName('PredDt').AsString + ')';
      TextRC[iRow, 1] := cMsg;
      SetSelection(iRow, 1, iRow, nMaxCol);
      SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    end;
    cMsg := 'Процент оплати: ' + qryVBln.FieldByName('ProcOpl').AsString + ' %';
    Inc(iRow);
    TextRC[iRow, 1] := cMsg;
    DecodeDate(qryVBln.FieldByName('DtProc').AsDateTime, nY, nM, nD);
    TextRC[iRow, nMaxCol] := 'Включено в розрах зарплатнi за ' +
                              MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    SetSelection(iRow, nMaxCol, iRow, nMaxCol);
    SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0);
    FontUnderLine := true;

    ColWidth[1] := Round(5 * WidthUnit);
    ColWidth[2] := Round(5 * WidthUnit);
    ColWidth[3] := Round(14 * WidthUnit);
    ColWidth[4] := Round(18 * WidthUnit);
    ColWidth[5] := Round(11 * WidthUnit);
    ColWidth[6] := Round(8 * WidthUnit);
    ColWidth[7] := Round(8 * WidthUnit);
    ColWidth[8] := Round(12 * WidthUnit);

    Inc(iRow);
    cMsg := 'В залiк прийнятi види заробiткiв:';
    TextRC[iRow, iCol] := cMsg;
    SetSelection(iRow, 1, iRow, nMaxCol);
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    Inc(iRow);
    TextRC[iRow, 1] := '№ п/п';
    TextRC[iRow, 2] := 'Вид';
    SetSelection(iRow, 1, iRow, 2);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    TextRC[iRow, 3] := 'Найменування';
    SetSelection(iRow, 3, iRow, 4);
    SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignCenter, 0);
    TextRC[iRow, 5] := '%';
    SetSelection(iRow, 5, iRow, 5);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    TextRC[iRow, 6] := 'Сума(%)';
    SetSelection(iRow, 6, iRow, 7);
    SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignCenter, 0);
    TextRC[iRow, 8] := 'Сума в залiк';
    SetSelection(iRow, 8, iRow, 8);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetSelection(iRow, 1, iRow, nMaxCol);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    SetSelection(iRow, 1, iRow, nMaxCol);
    nStartRow := iRow + 1;
    // Из z_EOtkl при расчёте по окладу приходит qryRSrOkl, а при расчёте
    // по 6-ти месяцам - qry_RBln. Тут они называются одинаково qry_RBln,
    // хотя у них разные структуры. Сие надо помнить при доработках
    if QryRBln.RecordCount > 0 then
      with QryRBln do begin
        nSvNR := FieldByName('NR').AsInteger;
        DisableControls;
        First;
        nPp := 0;
        nSmZpKoef := 0;
        nCntDays := 0;

        while not Eof do begin
          Inc(iRow);
          Inc(nPp);
          NumberRC[iRow, 1] := nPp;
          TextRC[iRow, 2] := FieldByName('VidN').AsString;
          TextRC[iRow, 3] := FieldByName('NmPokaz').AsString;
          TextRC[iRow, 4] := FieldByName('ShVidN').AsString;
          TextRC[iRow, 5] := FieldByName('SP').AsString;
          SetSelection(iRow, 5, iRow, 5);
          SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);
          NumberRC[iRow, 6] := FieldByName('SumProc').AsFloat;
          SetSelection(iRow, 6, iRow, 7);
          SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
          NumberRC[iRow, 8] := FieldByName('SmVZachet_CMN').AsFloat; // 20.03.2023
          SetSelection(iRow, 6, iRow, 8);
          FormatFixed2;
          nSmZpKoef := nSmZpKoef + FieldByName('SmVZachet_CMN').AsFloat; // 20.03.2023
          nCntDays := nCntDays + FieldByName('CntDays').AsFloat; // 20.03.2023
          Next;
        end;

        Locate('NR', nSvNR, []);
        EnableControls;
        SetSelection(nStartRow, 1, iRow, nMaxCol);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
        Inc(iRow);
        TextRC[iRow, 4] := 'Итого:';
        NumberRC[iRow, 7] := nCntDays;
        SetSelection(iRow, 7, iRow, 7);
        FormatFixed2;
        NumberRC[iRow, 8] := nSmZpKoef;
        SetSelection(iRow, 8, iRow, 8);
        FormatFixed2;
      end
    else if qryVBln.FieldByName('ListCont').AsString = '1' then begin
      // это годится для обоих алгоритмов
      cMsg := 'В залiк прийнята сума середнего,';
      Inc(iRow);
      TextRC[iRow, 1] := cMsg;
      SetSelection(iRow, 1, iRow, nMaxCol);
      SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      cMsg := 'розрахована для листка № ' +
                qryVBln.FieldByName('PredNR').AsString + ' от ' +
                qryVBln.FieldByName('PredDt').AsString;
      Inc(iRow);
      TextRC[iRow, 1] := cMsg;
      SetSelection(iRow, 1, iRow, nMaxCol);
      SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    end;

    Inc(iRow);
    TextRC[iRow, 4] := 'Середньодневний заробiток:';
    NumberRC[iRow, 8] := qryVBln.FieldByName('SmSrDn').AsFloat;
    SetSelection(iRow, 8, iRow, 8);
    FormatFixed2;
    SetSelection(iRow-1, 1, iRow, nMaxCol);
    SetBorder(1,-1,-1,-1,-1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    Inc(iRow, 2);
    if cVidBln = '2602' then
      cMsg := 'Нарахування декретних'
    else
      cMsg := 'Нарахування лiкарняних';
    TextRC[iRow, 1] := cMsg;
    SetSelection(iRow, 1, iRow, nMaxCol);
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    Inc(iRow);
    TextRC[iRow, 1] := '№ з/п';
    TextRC[iRow, 2] := 'Вид';
    TextRC[iRow, 3] := 'Шифр виду';
    TextRC[iRow, 4] := 'Дата початку:';
    TextRC[iRow, 5] := 'Дата закiнчення:';
    if cVidBln = '2602' then
      TextRC[iRow, 7] := 'Календ. днiв'
    else
      TextRC[iRow, 7] := 'Роб. днiв';
    if cVidBln = '2602' then
      TextRC[iRow, 8] := 'Сума декретних'
    else
      TextRC[iRow, 8] := 'Сума лiкарняних';
    SetSelection(iRow, 1, iRow, nMaxCol);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetSelection(iRow, 5, iRow, 6);
    SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignCenter, 0);
    SetSelection(iRow, 1, iRow, nMaxCol);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    with tblRBln do begin
      First;
      nPp := 0;
      nCntDays := 0;
      nSmBlnTt := 0;
      while not Eof do begin
        Inc(iRow);
        Inc(nPp);
        NumberRC[iRow, 1] := nPp;
        TextRC[iRow, 2] := FieldByName('VidN').AsString;
        TextRC[iRow, 3] := FieldByName('ShVidN').AsString;
        TextRC[iRow, 4] := FieldByName('DtBeg').AsString;
        SetSelection(iRow, 4, iRow, 4);
        SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);
        TextRC[iRow, 5] := FieldByName('DtEnd').AsString;
        SetSelection(iRow, 5, iRow, 6);
        SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
        NumberRC[iRow, 7] := FieldByName('CntDays').AsFloat;
        SetSelection(iRow, 7, iRow, 7);
        FormatFixed;
        NumberRC[iRow, 8] := FieldByName('Smm').AsFloat;
        SetSelection(iRow, 8, iRow, 8);
        FormatFixed2;
        nCntDays := nCntDays + FieldByName('CntDays').AsFloat;
        nSmBlnTt := nSmBlnTt + FieldByName('Smm').AsFloat;
        SetSelection(iRow, 1, iRow, nMaxCol);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
        Next;
      end;
    end;
    if nPp > 1 then begin
      Inc(iRow);
      TextRC[iRow, 4] := 'Всього:';
      NumberRC[iRow, 7] := nCntDays;
      SetSelection(iRow, 7, iRow, 7);
      FormatFixed;
      NumberRC[iRow, 8] := nSmBlnTt;
      SetSelection(iRow, 8, iRow, 8);
      FormatFixed2;
      SetSelection(iRow-1, 1, iRow, nMaxCol);
      SetBorder(1,-1,-1,-1,-1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    end;
    Inc(iRow, 3);
    TextRC[iRow, 4] := 'Керiвник';
    TextRC[iRow, 5] := '______________ Сергій НЕСТЕРЕНКО';
    Inc(iRow, 2);
    SetSelection(iRow-1, 2, iRow, 2);
    CellFormat := CreateNewCellFormat;
    CellFormat.AlignHorizontal := F1HAlignCenter;
    CellFormat.AlignVertical := F1VAlignCenter;
    CellFormat.MergeCells := true;
    CellFormat.WordWrap   := false;
    SetCellFormat(CellFormat);
    TextRC[iRow-1, 2] := 'МП';
    SetSelection(iRow-1, 2, iRow, 2);
    FontName := 'MS Sans Serif';
    SetBorder(4, 0, 0, 0, 0, 0, clBlack,clBlack,clBlack,clBlack,clBlack);
    TextRC[iRow, 4] := 'Заст.головн.бухг.';
    TextRC[iRow, 5] := '______________ Оксана БОРМОТІНА'; // Ольга ЧАРАЄВА
    Inc(iRow, 2);
    TextRC[iRow, 4] := 'Бухгалтер';
    cMsg := '______________ ' + Form_Dm.KdUsr2FioUsr(nAppKdUsr);
    TextRC[iRow, 5] := cMsg;

    ExFileName := RandomFileName + '.xls';
    WriteEx(cDirTemp + ExFileName, F1FileExcel97);
    TPrintUtils.Preview(cDirTemp, ExFileName);
  end;
end;

end.
