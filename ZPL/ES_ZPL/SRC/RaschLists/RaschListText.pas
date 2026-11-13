unit RaschListText;

interface

uses
  Db, RaschListCmn;

const
  RaschListPath = 'c:\T_E_M_P\RLists\';

type
  TRschLstTxt = class
  private
    FileName: ShortString;
    DsNu: TDataSet;
    DoubleCol: Boolean;

    F: TextFile;

    RaschListCmn: TRaschListCmn;

    RowsPrinted,
    FilesTotal: Integer;

    FileEnumIndx: Integer;

    procedure StartEnumData;
    function EnumData: Boolean;

    procedure OpenFile(FileNum: Integer; ForWrite: Boolean);
    procedure CloseCurFile;
    function EndOfData: Boolean;
    procedure WriteLine(Text: ShortString);
  public
    constructor Create(FileName: ShortString; DsNu: TDataSet;
      DoubleCol: Boolean);
    destructor Destroy; override;

    procedure Print(DtProc: TDateTime; EmplId: Integer;
      EmplName: ShortString);

    procedure Write(Text: ShortString);
    function ReadSkipEsc(out Line: ShortString): Boolean;

    procedure MergeLists(RaschList1, RaschList2: TRschLstTxt);

    procedure PrintRowProc(OrdNum: Integer; RowData: TRaschListRow);
    procedure PrintTotalsProc(SmNachTt, SmUdrgTt: Double);

    function FileNameWithIndx(FileIndx: Integer): ShortString;
    function PrintedFileNames: String;

    property RowCount: Integer read RowsPrinted;
  end;

implementation

uses
  SysUtils, a_Lib, DateLib, FileLib, TextLib;

const
  START_ESC = #18#27#80#27#15;
  END_ESC = #18;
  SEP = '    :    ';
  BLANK = '                                               ';
  MAX_FILE_LINES = 12500;

//------------------------------------------------------------------------------
constructor TRschLstTxt.Create(
  FileName: ShortString;
  DsNu: TDataSet;
  DoubleCol: Boolean);
begin
  inherited Create;

  Self.FileName := FileName;
  Self.DsNu := DsNu;
  Self.DoubleCol := DoubleCol;

  if not DirectoryExists(RaschListPath) then
    ForceDirectories(RaschListPath);

  RowsPrinted := 0;
  FilesTotal := 1;
  OpenFile(FilesTotal, true);

  RaschListCmn := TRaschListCmn.Create;
end;

//------------------------------------------------------------------------------
destructor TRschLstTxt.Destroy;
begin
  CloseCurFile;
  RaschListCmn.Free;
  inherited Destroy;
end;

function FormatHeadLine2(
  EmplName,
  Accnt: ShortString;
  Sum: Double
): ShortString;
const
  LEN = 47;
var
  LenRemain: Integer;
  Salary: ShortString;
  AccLen: Integer;
begin
  LenRemain := LEN - Length(EmplName);

  Salary := 'Окл. ' + FloatToStrF(Sum, ffFixed, 12, 2);
  LenRemain := LenRemain - Length(Salary);

  AccLen := Length(Accnt);
  if AccLen < LenRemain then
    // пробел перед суммой
    Accnt := Accnt + ' ';

  Accnt := TextUtils.PadLeft(Accnt, ' ', LenRemain);

  Result := EmplName + Accnt + Salary;
end;

//------------------------------------------------------------------------------
procedure TRschLstTxt.Print(
  DtProc: TDateTime;
  EmplId: Integer;
  EmplName: ShortString);
var
  Msg, Mnth: ShortString;
  Date: TDate;
  FileIndx: Integer;
begin
  if DoubleCol and (RowsPrinted > MAX_FILE_LINES)
      or (RowsPrinted > MAX_FILE_LINES * 2) then begin
    CloseFile(F);

    FileIndx := FilesTotal;

    Inc(FilesTotal);
    RowsPrinted := 0;

    if FileIndx = 1 then
      RenameFile(RaschListPath + FileName + '.txt',
        RaschListPath + FileNameWithIndx(FileIndx) + '.txt');

    OpenFile(FilesTotal, true);
  end;

  RaschListCmn.PopulateListTotals(EmplId, DtProc, false);

  WriteLn(F, START_ESC);
  Inc(RowsPrinted);

  Msg := '===============================================';
  WriteLine(Msg);
  Inc(RowsPrinted);

  Date := DateUtils.Decode(DtProc);
  Mnth := UkrMes(Date.Mnth);
  Mnth := AnsiUpperCase(Mnth[1]) + Copy(Mnth, 2, Length(Mnth));
  Msg := Format('%-11s%20s%16s',
    ['ТабНр ' + IntToStr(EmplId), Mnth + ' ' + IntToStr(Date.Year),
      'Пiдрозд ' + RaschListCmn.RaschListTotals.Dept]);
  WriteLine(Msg);
  Inc(RowsPrinted);

  with RaschListCmn.RaschListTotals do
//    Msg := Format('%-22s %10s %13s',
//       [EmplName, AccSh, 'Окл. ' + FloatToStrF(Salary, ffFixed, 12, 2)]);
    Msg := FormatHeadLine2(EmplName, AccSh, Salary);
  WriteLine(Msg);
  Inc(RowsPrinted);

  Msg := '-----------------------------------------------';
  WriteLine(Msg);
  Inc(RowsPrinted);

  Msg := 'Вид нарахування   Мiс Год.    Нарах.     Утрим.';
  WriteLine(Msg);
  Inc(RowsPrinted);

  Msg := '-----------------------------------------------';
  WriteLine(Msg);
  Inc(RowsPrinted);

  RaschListCmn.ProcessRows(DsNu, PrintRowProc, PrintTotalsProc);
end;

//------------------------------------------------------------------------------
procedure TRschLstTxt.Write(Text: ShortString);
begin
  WriteLn(F, Text);
  Inc(RowsPrinted);
end;

//------------------------------------------------------------------------------
procedure TRschLstTxt.CloseCurFile;
begin
  if FileUtils.FileIsOpen(F) then
    CloseFile(F);
end;

//------------------------------------------------------------------------------
function TRschLstTxt.ReadSkipEsc(out Line: ShortString): Boolean;
begin
  Result := false;

  while not EndOfData do begin
    ReadLn(F, Line);

    if (Line <> START_ESC) and (Line <> END_ESC) then begin
      Result := true;
      break;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TRschLstTxt.PrintRowProc(OrdNum: Integer; RowData: TRaschListRow);
var
  Mnth, Hours,
  SmNachVid, SmUdrgVid,
  Msg: ShortString;
begin
  Mnth := Copy(RowData.MnthYearStr, 1, 2);

  if RowData.Hours <> 0 then
    Hours := FloatToStrF(RowData.Hours, ffFixed, 8, 0)
  else
    Hours := '';

  if RowData.SmNachVid <> 0 then
    SmNachVid := FloatToStrF(RowData.SmNachVid, ffFixed, 11, 2)
  else
    SmNachVid := '';

  if RowData.SmUdrgVid <> 0 then
    SmUdrgVid := FloatToStrF(RowData.SmUdrgVid, ffFixed, 11, 2)
  else
    SmUdrgVid := '';

  Msg := Format('%4s %-12s %3s%4s%11s%11s',
    [RowData.PayTypeId, Copy(RowData.PayTypeSh, 1, 12), Mnth, Hours,
      SmNachVid, SmUdrgVid]);

  WriteLine(Msg);
  Inc(RowsPrinted);
end;

//------------------------------------------------------------------------------
procedure TRschLstTxt.PrintTotalsProc(SmNachTt, SmUdrgTt: Double);
var
  Msg: ShortString;
  SumToPay: Double;
begin
  Msg := '-----------------------------------------------';
  WriteLine(Msg);
  Inc(RowsPrinted);

  Msg := 'В с ь о г о :            ' +
    Format('%11.2f%11.2f', [SmNachTt, SmUdrgTt]);
  WriteLine(Msg);
  Inc(RowsPrinted);

  SumToPay := SmNachTt - SmUdrgTt;
  Msg := 'Д о  в и п л а т и :          ' +
    Format('%11.2f', [SumToPay]) + '      ';
  WriteLine(Msg);
  Inc(RowsPrinted);

  Msg := '===============================================';
  WriteLine(Msg);
  Inc(RowsPrinted);

  WriteLn(F, END_ESC);
  Inc(RowsPrinted);

  WriteLn(F);
  Inc(RowsPrinted);
end;

//------------------------------------------------------------------------------
function TRschLstTxt.EndOfData: Boolean;
begin
  Result := not FileUtils.FileIsOpen(F) or Eof(F) and not EnumData;
end;

//------------------------------------------------------------------------------
procedure TRschLstTxt.StartEnumData;
begin
  CloseCurFile;
  FileEnumIndx := 1;
  OpenFile(FileEnumIndx, false);
end;

//------------------------------------------------------------------------------
function TRschLstTxt.EnumData: Boolean;
begin
  Result := false;

  CloseCurFile;
  Inc(FileEnumIndx);

  while FileEnumIndx <= FilesTotal do begin
    OpenFile(FileEnumIndx, false);

    if Eof(F) then
      CloseCurFile
    else begin
      Result := true;
      break;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TRschLstTxt.OpenFile(FileNum: Integer; ForWrite: Boolean);
var
  FileNameExt: ShortString;
begin
  FileNameExt := FileNameWithIndx(FileNum);
  FileNameExt := FileNameExt + '.txt';

  FileNameExt := RaschListPath + FileNameExt;

  AssignFile(F, FileNameExt);
  if ForWrite then
    Rewrite(F)
  else
    Reset(F);
end;

//------------------------------------------------------------------------------
procedure TRschLstTxt.WriteLine(Text: ShortString);
begin
  if DoubleCol then
    Text := Text + SEP + Text;
  WriteLn(F, Text);
end;

//------------------------------------------------------------------------------
procedure TRschLstTxt.MergeLists(RaschList1, RaschList2: TRschLstTxt);
var
  Line1, Line2: ShortString;
  Read1, Read2: Boolean;
begin
  RaschList1.StartEnumData;
  RaschList2.StartEnumData;

  Write(START_ESC);

  while true do begin
    Read1 := RaschList1.ReadSkipEsc(Line1);
    Read2 := RaschList2.ReadSkipEsc(Line2);

    if not Read1 and not Read2 then
      break;

    if not Read1 or (Line1 = '') then
      Line1 := BLANK;

    if not Read2 or (Line2 = '') then
      Line2 := BLANK;

    Write(Line1 + SEP + Line2);
  end;

  Write(END_ESC);
  Write('');
end;

//------------------------------------------------------------------------------
function TRschLstTxt.FileNameWithIndx(FileIndx: Integer): ShortString;
begin
  if FilesTotal = 1 then
    Result := FileName
  else
    Result := FileName + '_' +
      TextUtils.PadLeft(IntToStr(FileIndx), '0', 2);
end;

//------------------------------------------------------------------------------
function TRschLstTxt.PrintedFileNames: String;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to FilesTotal do
    Result := TextUtils.ConcatStr(Result,  FileNameWithIndx(I), ', ');
end;

end.
