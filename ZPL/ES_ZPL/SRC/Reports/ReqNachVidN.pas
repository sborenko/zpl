unit ReqNachVidN;

interface

uses
  Db, F6Report;

type
  TReqNachVidN = class(TF6Report)
  private
    VidN, ShVidN, NmVidN: ShortString;
    DtBeg, DtEnd: TDateTime;
    CaseMnth: Integer;
    DsNach: TDataSet;

    SmTtl, SmBudg, SmSpec: Double;
    
    function GetReportPeriod: ShortString;

  protected
    procedure InitReport; override;
    procedure InitBook; override;

    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;

  public
    class procedure Run(VidN, ShVidN, NmVidN: ShortString;
      DtBeg, DtEnd: TDateTime; CaseMnth: Integer; DsNach: TDataSet);
  end;

implementation

uses
  Controls, Forms, Graphics, SysUtils, TTF160_TLB, a_Const, a_Dm, a_Lib,
  DateLib;

//------------------------------------------------------------------------------
class procedure TReqNachVidN.Run(
  VidN, ShVidN, NmVidN: ShortString;
  DtBeg, DtEnd: TDateTime;
  CaseMnth: Integer;
  DsNach: TDataSet
);
var
  Report: TReqNachVidN;
begin
  Screen.Cursor := crHourGlass;

  Report := TReqNachVidN.Create;

  Report.VidN := VidN;
  Report.ShVidN := ShVidN;
  Report.NmVidN := NmVidN;
  Report.DtBeg := DtBeg;
  Report.DtEnd := DtEnd;
  Report.CaseMnth := CaseMnth;
  Report.DsNach := DsNach;

  with Report do begin
    Print;
    Preview;
    Free;
  end;

  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
procedure TReqNachVidN.InitReport;
begin
  inherited InitReport;

  MaxColNum := 12;
end;

//------------------------------------------------------------------------------
procedure TReqNachVidN.InitBook;
begin
  inherited InitBook;

  with Book do begin
    ColWidth[ 1] := Round( 5 * ColUnit); // № п/п
    ColWidth[ 2] := Round( 7 * ColUnit); // Р.Мес
    ColWidth[ 3] := Round( 7 * ColUnit); // ЗаМес
    ColWidth[ 4] := Round( 6 * ColUnit); // ТабНр
    ColWidth[ 5] := Round(25 * ColUnit); // ФамИО
    ColWidth[ 6] := Round( 6 * ColUnit); // Код подр.
    ColWidth[ 7] := Round( 6 * ColUnit); // Код кат.перс.
    ColWidth[ 8] := Round(12 * ColUnit); // Сумма
    ColWidth[ 9] := Round( 7 * ColUnit); // СчБУ
    ColWidth[10] := Round(10 * ColUnit); // ДтНач.
    ColWidth[11] := Round(10 * ColUnit); // ДтОконч.
    ColWidth[12] := Round( 6 * ColUnit); // Часы
  end;
end;

//------------------------------------------------------------------------------
procedure TReqNachVidN.PrintHeader;
var
  Msg: ShortString;
begin
  with Book do begin
    CurRow := 1;
    TextRC[CurRow, 1] :=
      'Нарахування по виду ' + VidN + ' (' + NmVidN + ')';

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    Inc(CurRow);
    TextRC[CurRow, 1] := GetReportPeriod;

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    Inc(CurRow);
    TextRC[CurRow, 1]  := '№ з/п';
    TextRC[CurRow, 2]  := 'Розр. міс.';
    TextRC[CurRow, 3]  := 'За місяць';
    TextRC[CurRow, 4]  := 'Таб.№';
    TextRC[CurRow, 5]  := 'Прізвище І.Б.';
    TextRC[CurRow, 6]  := 'Код підр.';
    TextRC[CurRow, 7]  := 'Кат. перс.';
    TextRC[CurRow, 8]  := 'Сума';
    TextRC[CurRow, 9]  := 'Рах.БУ';
    TextRC[CurRow, 10] := 'Дата поч.';
    TextRC[CurRow, 11] := 'Дата зак.';
    TextRC[CurRow,12]  := 'Год.';

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TReqNachVidN.PrintBody;
var
  NPP: Integer;
  Msg: ShortString;
begin
  with Book do begin
    NPP := 0;

    with DsNach do begin
      DisableControls;
      First;

      while not Eof do begin
        Inc(NPP);
        Inc(CurRow);

        NumberRC[CurRow, 1] := NPP;
        TextRC[CurRow, 2] := Copy(FieldByName('DtProc').AsString, 4, 7);
        TextRC[CurRow, 3] := Copy(FieldByName('ZaMesGod').AsString, 4, 7);
        NumberRC[CurRow, 4] := FieldByName('TabN').AsInteger;
        TextRC[CurRow, 5] := FieldByName('FamIO').AsString;

        NumberRC[CurRow, 6] := FieldByName('KdObj').AsInteger;
        NumberRC[CurRow, 7] := FieldByName('KdKatP').AsInteger;

        if not FieldByName('Summa').IsNull then
          NumberRC[CurRow, 8] := FieldByName('Summa').AsFloat;

        SetSelection(CurRow, 8, CurRow, 8);
        FormatFixed2;
        FontBold := true;
        
        TextRC[CurRow, 9] := FieldByName('SchBU').AsString;

        if not FieldByName('Dt_Beg').IsNull then
          TextRC[CurRow, 10] := FieldByName('Dt_Beg').AsString;

        if not FieldByName('Dt_End').IsNull then
          TextRC[CurRow, 11] := FieldByName('Dt_End').AsString;

        if not FieldByName('Chas').IsNull then
          NumberRC[CurRow, 12] := FieldByName('Chas').AsFloat;

        SmTtl := SmTtl + FieldByName('Summa').AsFloat;

        if FieldByName('PSch').AsString = '801' then
          SmBudg := SmBudg + FieldByName('Summa').AsFloat
        else
          SmSpec := SmSpec + FieldByName('Summa').AsFloat;

        SetSelection(CurRow, 1, CurRow, MaxColNum);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
        Next;
      end;

      First;
      EnableControls;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TReqNachVidN.PrintFooter;
begin
  with Book do begin
    Inc(CurRow, 2);

    TextRC[CurRow, 5] := 'Всього:';
    NumberRC[CurRow, 8] := SmTtl;
    SetSelection(CurRow, 8, CurRow, 8);
    FontBold := true;
    FormatFixed2;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;

    Inc(CurRow);
    TextRC[CurRow, 5] := 'в т.ч.';

    Inc(CurRow);
    TextRC[CurRow, 5] := '- з коштів бюджету:';
    NumberRC[CurRow, 8] := SmBudg;
    SetSelection(CurRow, 8, CurRow, 8);
    FontBold := true;
    FormatFixed2;

    Inc(CurRow);
    TextRC[CurRow, 5] := '- з спецкоштів:';
    NumberRC[CurRow, 8] := SmSpec;
    SetSelection(CurRow, 8, CurRow, 8);
    FontBold := true;
    FormatFixed2;

    Inc(CurRow, 2);
    TextRC[CurRow, MaxColNum] :=
      'Бухгалтер ____________ ' + Form_Dm.KdUsr2FioUsr(nAppKdUsr);
    SetSelection(CurRow, MaxColNum, CurRow, MaxColNum);
    SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);
  end;
end;

//------------------------------------------------------------------------------
// Период, за который формируется отчёт
//------------------------------------------------------------------------------
function TReqNachVidN.GetReportPeriod: ShortString;
var
  DateBeg, DateEnd: TDate;
begin
  if CaseMnth = 1 then
    Result := 'в '
  else
    Result := 'за ';

  DateEnd := DateUtils.Decode(DtEnd);

  if DtBeg <> DtEnd then begin
    DateBeg := DateUtils.Decode(DtBeg);

    Result := Result + 'період з ' + UkrMesRod(DateBeg.Mnth);

    if DateBeg.Year <> DateEnd.Year then
      Result := Result + ' ' + IntToStr(DateBeg.Year) + ' р.';

    Result := Result + ' по ' + UkrMes(DateEnd.Mnth);
  end else
    if CaseMnth = 1 then
      Result := Result + UkrMesPredl(DateEnd.Mnth)
    else
      Result := Result + UkrMes(DateEnd.Mnth);

  Result := Result + ' ' + IntToStr(DateEnd.Year) + ' р.';
end;

end.
