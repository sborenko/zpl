unit Compare;

interface

uses
  SysUtils, Db, Z_Ebln;

type
  TCompare = class
  private
    SickListInfoWritten: boolean;

    procedure CompareRowsets(
      LeftDs, RightDs: TDataSet; LeftIsPrimary: boolean);

    function RowsAreDiff(PrimaryRow, SecondRow: TDataSet): boolean;

    procedure WriteDiffer(LeftRow, RightRow: TDataSet);
    procedure WriteMissing(LeftRow, RightRow: TDataSet);

    function FieldsAreDiff(
      FieldName: ShortString; Row1, Row2: TDataSet): boolean;
    procedure WriteField(FieldName: ShortString;
      LeftRow, RightRow: TDataSet);

    procedure WriteNewSickList;
    procedure WriteMnthYear(Row: TDataSet);

    function ValuesAreEmpty(LeftStr, RightStr: ShortString): boolean;
  public
    class procedure CompareRBln(QryRBlnNew, QryRBlnOld: TDataSet);
  end;

implementation

uses
  Variants, TextUtils;

//------------------------------------------------------------------------------
class procedure TCompare.CompareRBln(QryRBlnNew, QryRBlnOld: TDataSet);
begin
  with TCompare.Create do begin
    SickListInfoWritten := false;

    CompareRowsets(QryRBlnNew, QryRBlnOld, true);
    CompareRowsets(QryRBlnNew, QryRBlnOld, false);

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TCompare.CompareRowsets(
  LeftDs, RightDs: TDataSet; LeftIsPrimary: boolean);
var
  PrimaryDs, SecondaryDs: TDataSet;
begin
  if LeftIsPrimary then begin
    PrimaryDs := LeftDs;
    SecondaryDs := RightDs;
  end else begin
    PrimaryDs := RightDs;
    SecondaryDs := LeftDs;
  end;

  with PrimaryDs do begin
    First;

    while not Eof do begin
      if SecondaryDs.Locate('ZaMesGod',
          PrimaryDs.FieldByName('ZaMesGod').AsDateTime, []) then begin
        if RowsAreDiff(PrimaryDs, SecondaryDs) then
          if LeftIsPrimary then
            // В случае отличающихся значений пишем только один раз
            WriteDiffer(LeftDs, RightDs);
      end else
        if LeftIsPrimary then
          WriteMissing(LeftDs, nil)
        else
          WriteMissing(nil, RightDs);

      Next;
    end; {while}
  end; {with}
end;

//------------------------------------------------------------------------------
function TCompare.RowsAreDiff(PrimaryRow, SecondRow: TDataSet): boolean;
begin
  with PrimaryRow do
    Result :=
      (FieldByName('ZaMesGod').AsDateTime <>
        SecondRow.FieldByName('ZaMesGod').AsDateTime) or
      (FieldByName('SmZarabotka').AsFloat <>
        SecondRow.FieldByName('SmZarabotka').AsFloat) or
      (FieldByName('KoefZp').AsFloat <>
        SecondRow.FieldByName('KoefZp').AsFloat) or
      (FieldByName('SumProc').AsFloat <>
        SecondRow.FieldByName('SumProc').AsFloat) or
      (FieldByName('SmVZachet').AsFloat <>
        SecondRow.FieldByName('SmVZachet').AsFloat) or
      (FieldByName('Sm_Svm').AsFloat <>
        SecondRow.FieldByName('Sm_Svm').AsFloat) or
      (FieldByName('SmVZachet_Svm').AsFloat <>
        SecondRow.FieldByName('SmVZachet_Svm').AsFloat) or
      (FieldByName('SmVZachet_Cmn').AsFloat <>
        SecondRow.FieldByName('SmVZachet_Cmn').AsFloat) or
      (FieldByName('CntDays').AsFloat <>
        SecondRow.FieldByName('CntDays').AsFloat) or
      (FieldByName('CntDays_Svm').AsFloat <>
        SecondRow.FieldByName('CntDays_Svm').AsFloat);
end;

//------------------------------------------------------------------------------
procedure TCompare.WriteDiffer(LeftRow, RightRow: TDataSet);
var
  Row: TDataSet;
begin
  if LeftRow = nil then
    Row := RightRow
  else
    Row := LeftRow;

  if not SickListInfoWritten then
    WriteNewSickList;

  WriteMnthYear(Row);

  if FieldsAreDiff('SmZarabotka', LeftRow, RightRow) then
    WriteField('SmZarabotka', LeftRow, RightRow);
  if FieldsAreDiff('KoefZp', LeftRow, RightRow) then
    WriteField('KoefZp', LeftRow, RightRow);
  if FieldsAreDiff('SumProc', LeftRow, RightRow) then
    WriteField('SumProc', LeftRow, RightRow);
  if FieldsAreDiff('SmVZachet', LeftRow, RightRow) then
    WriteField('SmVZachet', LeftRow, RightRow);
  if FieldsAreDiff('Sm_Svm', LeftRow, RightRow) then
    WriteField('Sm_Svm', LeftRow, RightRow);
  if FieldsAreDiff('SmVZachet_Svm', LeftRow, RightRow) then
    WriteField('SmVZachet_Svm', LeftRow, RightRow);
  if FieldsAreDiff('SmVZachet_Cmn', LeftRow, RightRow) then
    WriteField('SmVZachet_Cmn', LeftRow, RightRow);
  if FieldsAreDiff('CntDays', LeftRow, RightRow) then
    WriteField('CntDays', LeftRow, RightRow);
  if FieldsAreDiff('CntDays_Svm', LeftRow, RightRow) then
    WriteField('CntDays_Svm', LeftRow, RightRow);
end;

//------------------------------------------------------------------------------
procedure TCompare.WriteMissing(LeftRow, RightRow: TDataSet);
var
  Row: TDataSet;
begin
  if LeftRow = nil then
    Row := RightRow
  else
    Row := LeftRow;

  if not SickListInfoWritten then
    WriteNewSickList;

  WriteMnthYear(Row);

  WriteField('SmZarabotka', LeftRow, RightRow);
  WriteField('KoefZp', LeftRow, RightRow);
  WriteField('SumProc', LeftRow, RightRow);
  WriteField('SmVZachet', LeftRow, RightRow);
  WriteField('Sm_Svm', LeftRow, RightRow);
  WriteField('SmVZachet_Svm', LeftRow, RightRow);
  WriteField('SmVZachet_Cmn', LeftRow, RightRow);
  WriteField('CntDays', LeftRow, RightRow);
  WriteField('CntDays_Svm', LeftRow, RightRow);
end;

//------------------------------------------------------------------------------
function TCompare.FieldsAreDiff(
  FieldName: ShortString;
  Row1, Row2: TDataSet): boolean;
begin
  Result :=
    Row1.FieldByName(FieldName).AsVariant <>
    Row2.FieldByName(FieldName).AsVariant;
end;

//------------------------------------------------------------------------------
procedure TCompare.WriteField(FieldName: ShortString;
  LeftRow, RightRow: TDataSet);
var
  LeftStr, RightStr: ShortString;
begin
  with FormEBln do begin
    if LeftRow = nil then
      LeftStr := ''
    else
      LeftStr := VarToStr(LeftRow.FieldByName(FieldName).AsVariant);

    if RightRow = nil then
      RightStr := ''
    else
      RightStr := VarToStr(RightRow.FieldByName(FieldName).AsVariant);

    if not ValuesAreEmpty(LeftStr, RightStr) then begin
      Write(ResultFile, TTextUtils.PadRight('', ' ', 10));
      Write(ResultFile, TTextUtils.PadRight(FieldName + ': ', ' ', 20));
      Write(ResultFile, TTextUtils.PadRight('', ' ', 5));

      Write(ResultFile, TTextUtils.PadLeft(LeftStr, ' ', 12));
      Write(ResultFile, TTextUtils.PadRight('', ' ', 5));
      Write(ResultFile, TTextUtils.PadRight('', '*', 3));
      if RightStr <> '' then begin
        Write(ResultFile, TTextUtils.PadRight('', ' ', 5));
        Write(ResultFile, RightStr);
      end;
      WriteLn(ResultFile, '');
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TCompare.WriteNewSickList;
begin
  with FormEBln, QryVBln do begin
    Write(ResultFile,
      'Лист: ' + FieldByName('SerList').AsString +
      ' ' + FieldByName('NrList').AsString + '; ');
    Write(ResultFile,
      'Таб.№: ' + IntToStr(FieldByName('TabN').AsInteger) + '; ');
    Write(ResultFile,
      'Обработан: ' + DateToStr(FieldByName('DtProc').AsDateTime) + '; ');
    Write(ResultFile,
      'Начало: ' + DateToStr(FieldByName('DtBeg').AsDateTime) + '; ');
    Write(ResultFile,
      'Окончание: ' + DateToStr(FieldByName('DtEnd').AsDateTime) + '; ');
    WriteLn(ResultFile,
      'Спец.№: ' + IntToStr(FieldByName('Spec_Nr').AsInteger) + '; ');
  end;

  SickListInfoWritten := true;
end;

//------------------------------------------------------------------------------
procedure TCompare.WriteMnthYear(Row: TDataSet);
begin
  with FormEBln do begin
    Write(ResultFile, TTextUtils.PadRight('', ' ', 5));
    WriteLn(ResultFile, DateToStr(Row.FieldByName('ZaMesGod').AsDateTime));
  end;
end;

//------------------------------------------------------------------------------
function TCompare.ValuesAreEmpty(LeftStr, RightStr: ShortString): boolean;
begin
  LeftStr := Trim(LeftStr);
  RightStr := Trim(RightStr);

  Result := ((LeftStr = '') or (LeftStr = '0'))
    and ((RightStr = '') or (RightStr = '0'));
end;

end.
