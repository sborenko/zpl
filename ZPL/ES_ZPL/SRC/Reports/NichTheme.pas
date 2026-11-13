unit NichTheme;

interface

uses
  Db, DbClient, F6Report;

type
  TRptNichTheme = class(TF6Report)
  private
    Source: TDataSet;
    Cds: TClientDataSet;

    AccountId: ShortString;
    ThemeId,
    EmplId: Integer;

    SumThemeInc, SumThemeDec: Double;
    RecNum,
    EmplRecCount: Integer;

    procedure InitData;
    procedure ClearData;
    procedure Print(Caption: ShortString; Source: TDataSet);
    procedure PrintHead;

    procedure ProcessAccount;
    procedure ProcessTheme;
    procedure ProcessEmployee;

  protected
    procedure InitReport; override;
    procedure InitBook; override;

  public
    class procedure Run(Caption: ShortString; Source: TDataSet);
  end;

implementation

uses
  SysUtils, Graphics, TTF160_TLB, a_Const, a_Dm, PrintUtils, CdsLib, PathLib;

//------------------------------------------------------------------------------
class procedure TRptNichTheme.Run(Caption: ShortString; Source: TDataSet);
var
  Report: TRptNichTheme;
begin
  Report := TRptNichTheme.Create;
  Report.Source := Source;

  with Report do begin
    InitData;

    Print(Caption, Source);
    Write;
    PreView;

    ClearData;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptNichTheme.InitReport;
begin
  inherited InitReport;

  MaxColNum := 10;
end;

//------------------------------------------------------------------------------
procedure TRptNichTheme.InitBook;
begin
  inherited InitBook;

  with Book do begin
    ShowGridLines := false;
    DefaultFontSize := 9;

    ColWidth[1] := Round(4 * ColUnit);
    ColWidth[2] := Round(6 * ColUnit);
    ColWidth[3] := Round(25 * ColUnit);
    ColWidth[4] := Round(9 * ColUnit);
    ColWidth[5] := Round(4 * ColUnit);
    ColWidth[6] := Round(6 * ColUnit);
    ColWidth[7] := Round(15 * ColUnit);
    ColWidth[8] := Round(6 * ColUnit);
    ColWidth[9] := Round(14 * ColUnit);
    ColWidth[10] := Round(12 * ColUnit);
  end;
end;

//------------------------------------------------------------------------------
procedure TRptNichTheme.InitData;
begin
  Self.Source := Source;

  Cds := TClientDataSet.Create(nil);

  with Cds, FieldDefs do begin
    Add('VidN', ftString, 4);
    Add('ShVidN', ftString, 15);
    Add('SmN', ftFloat);
    Add('SmU', ftFloat);

    CreateDataSet;

    AddIndex('OnVidN', 'VidN', []);
    IndexName := 'OnVidN';

    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptNichTheme.ClearData;
begin
  Cds.Free;
end;

//------------------------------------------------------------------------------
procedure TRptNichTheme.PrintHead;
begin
  with Book do begin
    Inc(CurRow);
    TextRC[CurRow, 1]  := '№ п/п';
    TextRC[CurRow, 2] := 'Таб. н-р';
    TextRC[CurRow, 3] := 'Фамилия И.О.';
    TextRC[CurRow, 4] := 'Оклад (Тариф)';
    TextRC[CurRow, 5] := 'Дн ей';
    TextRC[CurRow, 6] := 'Вид';
    TextRC[CurRow, 7] := 'Шифр вида';
    TextRC[CurRow, 8] := 'За месяц';
    TextRC[CurRow, 9] := 'Начисления';
    TextRC[CurRow, 10] := 'Удержанмя';

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TRptNichTheme.Print(Caption: ShortString; Source: TDataSet);
begin
  InitBook;
  InitReport;

  with Book do begin
    Inc(CurRow);
    TextRC[CurRow, 1] := Caption;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontSize := 10;
    FontBold := true;
    fontUnderLine := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

    RecNum := 0;

    with Source do begin
      First;

      while not Eof do begin
        AccountId := FieldByName('SchBU').AsString;
        ProcessAccount;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptNichTheme.ProcessAccount;
begin
  with Source, Book do begin
    Inc(CurRow, 2);
    TextRC[CurRow, 1] :=  AccountId + '  ' + FieldByName('NmSch').AsString;

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

    while (FieldByName('SchBU').AsString = AccountId) and not Eof do begin
      ThemeId := FieldByName('KdTemu').AsInteger;
      ProcessTheme;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TRptNichTheme.ProcessTheme;
var
  ThemeName: ShortString;
  Msg: ShortString;
begin
  SumThemeInc := 0;
  SumThemeDec := 0;

  with Book, Source do begin
    ThemeName := FieldByName('NmTemu').AsString;
    
    PrintHead;

    Cds.EmptyDataSet; // для каждой темы готовлю cdsTmp
    Cds.First;

    Inc(CurRow);
    TextRC[CurRow, 1] := IntToStr(ThemeId) + '  ' + FieldByName('NmTemu').AsString;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontItalic := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

    while (FieldByName('SchBU').AsString = AccountId)
        and (FieldByName('KdTemu').AsInteger = ThemeId)
        and not Eof do begin
      EmplId := FieldByName('TabN').AsInteger;
      ProcessEmployee;
    end;

    Inc(CurRow);
    SetSelection(CurRow, 1, CurRow, 8);
    SetAlignment(F1HAlignCenterAcrossCells,false,F1VAlignBottom,0);
    NumberRc[CurRow, 9] := SumThemeInc;
    NumberRc[CurRow, 10] := SumThemeDec;
    SetSelection(CurRow, 9, CurRow, MaxColNum);
    FormatFixed2;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow);
    TextRC[CurRow, 6] := 'К выплате';
    SetSelection(CurRow, 6, CurRow, 8);
    SetAlignment(F1HAlignCenterAcrossCells,false,F1VAlignBottom,0);
    NumberRC[CurRow, 9] := SumThemeInc + SumThemeDec;
    SetSelection(CurRow, 9, CurRow, 10);
    FormatFixed2;
    SetSelection(CurRow, 9, CurRow, 10);
    SetAlignment(F1HAlignCenterAcrossCells,false,F1VAlignBottom,0);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    // Терерь вставить сюда данные из cdsTmp:
    if bFlagDbg then begin
      Msg := 'Tema' + IntToStr(ThemeId) + '.cds';
      Cds.SaveToFile(cDirTemp + Msg);
    end;

    SumThemeInc := 0;
    SumThemeDec := 0;
    Inc(CurRow, 2);
    TextRC[CurRow, 1] :=
      'Итоги по теме ' + ThemeName + ' по видам начислений и удержаний';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells,false,F1VAlignBottom,0);

    Cds.First;
    while not Cds.Eof do begin
      Inc(CurRow);
      TextRC[CurRow, 6] := Cds.FieldByName('VidN').AsString;
      TextRC[CurRow, 7] := Cds.FieldByName('ShVidN').AsString;

      NumberRC[CurRow, 9] := Cds.FieldByName('SmN').AsFloat;
      NumberRC[CurRow, 10] := Cds.FieldByName('SmU').AsFloat;

      SumThemeInc := SumThemeInc + Cds.FieldByName('SmN').AsFloat;
      if Cds.FieldByName('VidN').AsString < '8600' then
        SumThemeDec := SumThemeDec + Cds.FieldByName('SmU').AsFloat;

      SetSelection(CurRow, 9, CurRow, 10);
      FormatFixed2;

      SetSelection(CurRow, 1, CurRow, MaxColNum);
      if Cds.FieldByName('VidN').AsString > '8600' then begin
        FontItalic := true;
        FontColor := clBlue;
      end;
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      Cds.Next;
    end;

    Inc(CurRow);
    TextRC[CurRow, 6] := 'Итого';
    SetSelection(CurRow, 6, CurRow, 8);
    SetAlignment(F1HAlignCenterAcrossCells,false,F1VAlignBottom,0);
    NumberRC[CurRow, 9] := SumThemeInc;
    NumberRC[CurRow,10] := SumThemeDec;
    SetSelection(CurRow, 9, CurRow, 10);
    FormatFixed2;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow);
    TextRC[CurRow, 6] := 'К выплате';
    SetSelection(CurRow, 6, CurRow, 8);
    SetAlignment(F1HAlignCenterAcrossCells,false,F1VAlignBottom,0);
    NumberRC[CurRow, 9] := SumThemeInc + SumThemeDec;
    SetSelection(CurRow, 9, CurRow, 10);
    FormatFixed2;
    SetSelection(CurRow, 9, CurRow, 10);
    SetAlignment(F1HAlignCenterAcrossCells,false,F1VAlignBottom,0);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow, 2);
    TextRC[CurRow, MaxColNum] :=
      'Бухгалтер ____________ ' + Form_Dm.KdUsr2FioUsr(nAppKdUsr);
    SetSelection(CurRow, MaxColNum, CurRow, MaxColNum);
    SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);

    Inc(CurRow);
    AddRowPageBreak(CurRow);
  end;
end;

//------------------------------------------------------------------------------
procedure TRptNichTheme.ProcessEmployee;
var
  PayTypeId, PayTypeSh: ShortString;
  MnthYear: ShortString;
  Sum, SumInc, SumDec: Double;
begin
  EmplRecCount := 0;
  SumInc := 0;
  SumDec := 0;

  with Book, Source do begin
    while (FieldByName('SchBU').AsString = AccountId)
        and (FieldByName('KdTemu').AsInteger = ThemeId)
        and (FieldByName('TabN').AsInteger = EmplId)
        and not Eof do begin
      Inc(CurRow);
      Inc(EmplRecCount);

      if EmplRecCount = 1 then begin
        Inc(RecNum);
        NumberRC[CurRow, 1] := RecNum;
        NumberRC[CurRow, 2] := EmplId;
        TextRC[CurRow, 3] := FieldByName('FamIO').AsString;
      end;

      PayTypeId := FieldByName('VidN').AsString;
      PayTypeSh := FieldByName('ShVidN').AsString;
      MnthYear := FieldByName('ZaMesGod').AsString;
      Sum := FieldByName('Summa').AsFloat;

      TextRC[CurRow, 6] := PayTypeId;
      TextRC[CurRow, 7] := PayTypeSh;
      TextRC[CurRow, 8] := Copy(MnthYear, 4, 2) + '-' + Copy(MnthYear, 9, 2);
      if PayTypeId < '5000' then begin
        NumberRC[CurRow, 9] := Sum;
        SumInc := SumInc + Sum;
        SumThemeInc := SumThemeInc + Sum;
      end else begin
        NumberRC[CurRow, 10] := Sum;
        if PayTypeId < '8600' then begin
          SumDec := SumDec + Sum;
          SumThemeDec := SumThemeDec + Sum;
        end;
      end;
      SetSelection(CurRow, 9, CurRow, 10);
      FormatFixed2;

      SetSelection(CurRow, 1, CurRow, MaxColNum);
      if PayTypeId > '8600' then begin
        FontItalic := true;
        FontColor := clBlue;
      end;
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

      // прсле каждой записи подпитываю cdsTmp
      with Cds do begin
        EditKey;
        FieldByName('VidN').AsString := PayTypeId;

        if not GotoKey then begin
          Append;
          FieldByName('VidN').AsString := PayTypeId;
          FieldByName('ShVidN').AsString := PayTypeSh;
        end else
          Edit;

        if PayTypeId < '6000' then
          FieldByName('SmN').AsFloat := FieldByName('SmN').AsFloat + Sum
        else
          FieldByName('SmU').AsFloat := FieldByName('SmU').AsFloat + Sum;

        Post;
      end;

      Next;
    end;

    Inc(CurRow);
    TextRC[CurRow, 3] := 'Итого:';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignRight, true, F1VAlignCenter, 0);
    FontItalic := true;

    NumberRC[CurRow, 9] := SumInc;
    NumberRC[CurRow, 10] := SumDec;
    SetSelection(CurRow, 9, CurRow, 10);
    FormatFixed2;
    FontItalic := true;

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow);
    TextRC[CurRow, 3] := 'К выплате:';
    SetSelection(CurRow, 3, CurRow, 3);
    SetAlignment(F1HAlignRight, true, F1VAlignCenter, 0);
    FontItalic := true;
    
    NumberRC[CurRow, 9] := SumInc + SumDec;
    SetSelection(CurRow, 9, CurRow, 10);
    FormatFixed2;
    FontItalic := true;
    SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignCenter, 0);

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

end.
