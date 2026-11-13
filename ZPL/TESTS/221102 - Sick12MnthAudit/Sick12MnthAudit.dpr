program Sick12MnthAudit;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  Load in 'Load.pas',
  Calc in 'Calc.pas',
  Compare in 'Compare.pas',
  Z_EBln in 'Z_EBln.pas',
  A_Const in '..\..\ZP\ES_CMN\A_Const.pas',
  CustDateUtils in '..\..\LIB\CustDateUtils.pas',
  DebugUtils in '..\..\LIB\DebugUtils.pas',
  QryUtils in '..\..\LIB\QryUtils.pas',
  TextUtils in '..\..\LIB\TextUtils.pas',
  CalcBy12Mnth in '..\..\ZP\ES_ZPL\SickLists\CalcBy12Mnth.pas',
  VidNUtils in '..\..\ZP\ES_ZPL\Utils\VidNUtils.pas';

const
  TEST_MNTH_NUM = 2;

var
  TestPeriod: TPeriod;
begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);

  with TDateUtils do
    TestPeriod := InitPeriod(PrevMonth(Now, TEST_MNTH_NUM), EndOfMonth(Now));

  TFormEBln.RunTest(TestPeriod);
end.

