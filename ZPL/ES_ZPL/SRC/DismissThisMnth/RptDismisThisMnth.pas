unit RptDismisThisMnth;

interface

uses
  Db, DbGrids, F6Report;

type
  TRptDismisThisMnth = class(TF6Report)
  private
    DataSet: TDataSet;
    Columns: TDBGridColumns;
    Mark: TBookmark;

    PageNum,
    RecsPage,
    RecsRpt,
    PageRow: Integer;

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
    procedure InitBook; override;

    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;

  public
    class procedure Run;
  end;

implementation

uses
  Controls, Forms, Graphics, SysUtils, TTF160_TLB, z_Main,
  FormDismisThisMnth, DModDismisThisMnth, DateLib;

const
  RPT_HEAD_HEIGHT = 3;
  RPT_FOOT_HEIGHT = 2;

  PAGE_HEAD_HEIGHT = 1;
  PAGE_FOOT_HEIGHT = 2;

  PAGE_HEIGHT = 62;
  ROW_HEIGHT = 1;

//------------------------------------------------------------------------------
class procedure TRptDismisThisMnth.Run;
begin
  with TRptDismisThisMnth.Create do begin
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
procedure TRptDismisThisMnth.StartReport;
begin
  Screen.Cursor := crHourGlass;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptDismisThisMnth.EndReport;
begin
  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
procedure TRptDismisThisMnth.InitData;
begin
  DataSet := DmDismThisMnth.GetDismisDataSet;
  Columns := FrmDismThisMnth.DbgrDismissed.Columns;

  with DataSet do begin
    DisableControls;
    Mark := GetBookmark;
    First;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptDismisThisMnth.ReleaseData;
begin
  with DataSet do begin
    GotoBookmark(Mark);
    FreeBookmark(Mark);
    EnableControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptDismisThisMnth.InitBook;
var
  ColumnsWidth: double;
  I, Indx: Integer;
begin
  inherited InitBook;

  MaxColNum := 0;
  ColumnsWidth := 0;

  PageNum := 0;
  RecsRpt := 0;

  // Общая ширина столбцов грида.
  for I := 0 to Columns.Count - 1 do
    if Columns[I].Visible then begin
      Inc(MaxColNum);
      ColumnsWidth := ColumnsWidth + Columns[I].Width;
    end;

  Indx := 1;
  // Пересчитываем в ширину столбцов отчёта.
  for I := 0 to Columns.Count - 1 do
    if Columns[I].Visible then begin
      Book.ColWidth[Indx] :=
        Round(ColumnsWidth / ColUnit * 15 * Columns[I].Width);
      Inc(Indx);
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptDismisThisMnth.PrintHeader;
begin
  with Book do begin
    TextRC[CurRow, 1] := 'Список сотрудников уволенных';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontBold := true;
    Inc(CurRow);

    TextRC[CurRow, 1] := 'за период с ' + DateToStr(dCtrlDate) +
      ' по ' + DateToStr(DateUtils.EndOfMonth(dCtrlDate)) + '.';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontBold := true;
    Inc(CurRow, 2);
  end;

  PageRow := RPT_HEAD_HEIGHT;

  PrintPageHeader;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptDismisThisMnth.PrintBody;
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
procedure TRptDismisThisMnth.PrintFooter;
begin
  with Book do begin
    if PageRow + RPT_FOOT_HEIGHT > PAGE_HEIGHT then
      AddRowPageBreak(CurRow);

    TextRC[CurRow, 1] := 'Страниц: ' + IntToStr(PageNum);
    TextRC[CurRow, MaxColNum] := 'Записей: ' + IntToStr(RecsRpt);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontSize := 9;
    FontBold := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;

  Inc(CurRow);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptDismisThisMnth.PrintPageHeader;
var
  I, Indx: Integer;
begin
  PageNum := PageNum + 1;
  RecsPage := 0;

  Indx := 1;
  for I := 0 to Columns.Count - 1 do
    if Columns[I].Visible then begin
      with Book do begin
        TextRC[CurRow, Indx] := Columns[I].Title.Caption;
        SetSelection(CurRow, 1, CurRow, MaxColNum);
        FontSize := 9;
        FontBold := true;
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      end;

      Inc(Indx);
    end;

  Inc(CurRow);
  PageRow := PageRow + PAGE_HEAD_HEIGHT;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptDismisThisMnth.PrintPageFooter;
begin
  with Book do begin
    TextRC[CurRow, 1] := 'Стр. ' + IntToStr(PageNum);
    TextRC[CurRow, MaxColNum] := 'Записей: ' + IntToStr(RecsPage);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontSize := 9;
    FontBold := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;

  Inc(CurRow, 2);
  RecsRpt := RecsRpt + RecsPage;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TRptDismisThisMnth.PrintRow;
var
  I, Indx: Integer;
  FldName: ShortString;
begin
  with Book do begin
    Indx := 1;

    for I := 0 to Columns.Count - 1 do
      if Columns[I].Visible then begin
        FldName := Columns[I].FieldName;
        TextRC[CurRow, Indx] := DataSet.FieldByName(FldName).AsString;

        Inc(Indx);
      end;

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;

  Inc(CurRow);
  Inc(RecsPage);
  PageRow := PageRow + ROW_HEIGHT;
  DataSet.Next;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TRptDismisThisMnth.EndOfPage: Boolean;
begin
  // Т.е., следующая строка плюс итог по странице уже не поместятся.
  // Значит пора печатать итог по странице.
  Result := PageRow + ROW_HEIGHT + PAGE_FOOT_HEIGHT > PAGE_HEIGHT;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TRptDismisThisMnth.EndOfReport: Boolean;
begin
  Result := DataSet.Eof;
end;

end.
