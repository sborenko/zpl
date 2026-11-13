unit RptIndxExcl;

interface

uses
  Db, DbGrids, DbTables, F6Report;

type
  TRptIndxExcl = class(TF6Report)
  private
    Query: TQuery;

    PageNum,
    RecsPage,
    RecsRpt,
    PageRow: Integer;

    DtBeg, DtEnd: TDateTime;
    Ord: Integer;

    procedure StartReport;
    procedure EndReport;

    procedure InitData;
    procedure ReleaseData;

    procedure PrintPageHeader;
    procedure PrintPageFooter;
    procedure PrintRow;

    function EndOfPage: Boolean;
    function EndOfReport: Boolean;

  protected
    procedure InitReport; override;
    procedure InitBook; override;

    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;
  public
    class procedure Run(DtBeg, DtEnd: TDateTime);
  end;

implementation

uses
  Controls, DateLib, Graphics, Forms, QryLib, SysUtils, TTF160_TLB, z_Main;

const
  RPT_HEAD_HEIGHT = 3;
  RPT_FOOT_HEIGHT = 2;

  PAGE_HEAD_HEIGHT = 1;
  PAGE_FOOT_HEIGHT = 2;

  PAGE_HEIGHT = 62;
  ROW_HEIGHT = 1;

//------------------------------------------------------------------------------
class procedure TRptIndxExcl.Run(DtBeg, DtEnd: TDateTime);
var
  Report: TRptIndxExcl;
begin
  Report := TRptIndxExcl.Create;
  Report.DtBeg := DtBeg;
  Report.DtEnd := DtEnd;

  with Report do begin
    StartReport;
    InitData;

    Print;
    Write;
    Preview;

    ReleaseData;
    EndReport;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptIndxExcl.InitReport;
begin
  inherited InitReport;

  MaxColNum := 7;

  PageNum := 0;
  RecsRpt := 0;

  Ord := 0;
end;

//------------------------------------------------------------------------------
procedure TRptIndxExcl.InitBook;
begin
  inherited InitBook;

  with Book do begin
    ColWidth[1] := Round( 6 * ColUnit); // № п.п.
    ColWidth[2] := Round( 8 * ColUnit); // Таб.№
    ColWidth[3] := Round(20 * ColUnit); // ФИО
    ColWidth[4] := Round(20 * ColUnit); // Подр.
    ColWidth[5] := Round( 9 * ColUnit); // Кат.перс.
    ColWidth[6] := Round(10 * ColUnit); // Дата нач.
    ColWidth[7] := Round(25 * ColUnit); // Примеч.
  end;
end;

//------------------------------------------------------------------------------
procedure TRptIndxExcl.StartReport;
begin
  Screen.Cursor := crHourGlass;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptIndxExcl.EndReport;
begin
  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
procedure TRptIndxExcl.InitData;
begin
  Query := TQuery.Create(nil);
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Text :=
      'select e.TabN, e.DtBeg, e.DtEnd, e.Notes, ' +
        'u.Fam, u.Ima, u.Otch, o.NmObj, k.ShKatP ' +
      'from z_EmplIndxExcl e ' +
        'left join z_Upi u on u.TabN = e.TabN ' +
        'left join z_Pere p on p.TabN = u.TabN ' +
        'left join z_KdObj o on o.KdObj = p.KdObj ' +
        'left join z_KatPers k on k.KdKatP = p.KdKatP ' +
      'where (' +
          // событие началось в бесконечном прошлом
          'e.DtBeg is null or e.DtBeg = "30-DEC-1899" ' +
          // началось до или в момент окончания периода выборки
          'or DtBeg <= :DtEnd ' +
          // конец периода выборки - в бесконечном будущем
          'or :DtEnd = "30-DEC-1899"' +
        ') and (' +
          // событие занончилось в бесконечном будущем
          'DtEnd is null or DtEnd = "30-DEC-1899" ' +
          // событие зкончилось в момент или после начала периода выборки
          'or DtEnd >= :DtBeg ' +
          // начало периода выборки - в бесконечном прошлом
          'or :DtBeg = "30-DEC-1899"' +
        ') ' +
        'and p.Dt_Beg = (' +
          'select max(Dt_Beg) from z_Pere where TabN = p.TabN' +
        ') ' +
        'order by Fam, Ima, Otch';

    ParamByName('DtBeg').AsDateTime := DtBeg;
    ParamByName('DtEnd').AsDateTime := DtEnd;
    Open;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptIndxExcl.ReleaseData;
begin
  Query.Free;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptIndxExcl.PrintHeader;
var
  Txt: ShortString;
begin
  with Book do begin
    TextRC[CurRow, 1] := 'Список сотрудников, исключённых из индексации ЗП';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontBold := true;
    Inc(CurRow);

    TextRC[CurRow, 1] := 'в период с ';
    if DtBeg = 0 then
      Txt := '...'
    else
      Txt := DateToStr(DtBeg);
    TextRC[CurRow, 1] := TextRC[CurRow, 1] + Txt + ' по ';

    if DtEnd = 0 then
      Txt := '...'
    else
      Txt := DateToStr(DtEnd);
    TextRC[CurRow, 1] := TextRC[CurRow, 1] + Txt + '.';

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontBold := true;
    Inc(CurRow, 2);
  end;

  PageRow := RPT_HEAD_HEIGHT;

  PrintPageHeader;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptIndxExcl.PrintFooter;
begin
  with Book do begin
    if PageRow + RPT_FOOT_HEIGHT > PAGE_HEIGHT then
      AddRowPageBreak(CurRow);

    TextRC[CurRow, 1] := 'Страниц: ' + IntToStr(PageNum);
    TextRC[CurRow, MaxColNum] := 'Записей: ' + IntToStr(Ord);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontSize := 9;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;

  Inc(CurRow);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptIndxExcl.PrintPageHeader;
begin
  PageNum := PageNum + 1;
  RecsPage := 0;

  with Book do begin
    TextRC[CurRow, 1] := '№ п.п.';
    TextRC[CurRow, 2] := 'Таб.№';
    TextRC[CurRow, 3] := 'Фамилия И.О.';
    TextRC[CurRow, 4] := 'Подразделение';
    TextRC[CurRow, 5] := 'Кат.перс.';
    TextRC[CurRow, 6] := 'Дата нач.';
    TextRC[CurRow, 7] := 'Примечание';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontSize := 9;
    FontBold := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;

  Inc(CurRow);
  PageRow := PageRow + PAGE_HEAD_HEIGHT;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptIndxExcl.PrintPageFooter;
begin
  with Book do begin
//    TextRC[CurRow, 1] := 'Стр. ' + IntToStr(PageNum);
//    SetSelection(CurRow, 1, CurRow, MaxColNum);
//    FontSize := 9;
//    FontBold := true;
//    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;

//  Inc(CurRow, 2);
  RecsRpt := RecsRpt + RecsPage;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptIndxExcl.PrintBody;
begin
  while true do begin
    if EndOfReport then begin
      PrintPageFooter;
      exit;
    end;

    if EndOfPage then begin
      PrintPageFooter;
      Book.AddRowPageBreak(CurRow);
      PageRow := 0;
      PrintPageHeader;
    end;

    PrintRow;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptIndxExcl.PrintRow;
begin
  Inc(Ord);
  
  with Book, Query do begin
    TextRC[CurRow, 1] := IntToStr(Ord);
    TextRC[CurRow, 2] := FieldByName('TabN').AsString;
    TextRC[CurRow, 3] := FieldByName('Fam').AsString + ' ' +
      Copy(FieldByName('Ima').AsString, 1, 1) + '.' +
      Copy(FieldByName('Otch').AsString, 1, 1) + '.';
    TextRC[CurRow, 4] := FieldByName('NmObj').AsString;
    TextRC[CurRow, 5] := FieldByName('ShKatP').AsString;
    TextRC[CurRow, 6] := FieldByName('DtBeg').AsString;
    TextRC[CurRow, 7] := FieldByName('Notes').AsString;

    SetSelection(CurRow, 1, CurRow, MaxColNum);
//    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;

  Inc(CurRow);
  Inc(RecsPage);
  PageRow := PageRow + ROW_HEIGHT;
  Query.Next;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TRptIndxExcl.EndOfPage: Boolean;
begin
  // Т.е., следующая строка плюс итог по странице уже не поместятся.
  // Значит пора печатать итог по странице.
  Result := PageRow + ROW_HEIGHT + PAGE_FOOT_HEIGHT > PAGE_HEIGHT;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TRptIndxExcl.EndOfReport: Boolean;
begin
  Result := Query.Eof;
end;

end.
