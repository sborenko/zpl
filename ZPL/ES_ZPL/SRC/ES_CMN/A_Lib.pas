unit A_Lib;

interface

uses SysUtils, WinTypes, WinProcs,  Dialogs, DbiProcs,
       DB, DBTables, Graphics, StdCtrls, ShellApi, DateUtils, Registry;

type
  String1 = string[1];

  function RusDayOfWeek(dAnyDay : TDateTime) : word;
  function MyFndInvNR(cInvNR : ShortString) : ShortString;
  function MyGetComputerName : ShortString;
  function I3Add(i : integer) : ShortString;
  function MyI4Add(i : integer) : ShortString;
  function MyValidAppPic(var cNumApp : string) : boolean;
  function IsPole(cFldNm : string; dts : TDataSet) : boolean;
  function myIsField(cFieldName : string; Table1 : TDataSet) : boolean;
  function RandomFileName : ShortString;
  function WorkDisk(cDirExe : string) : string;
  function myEmptyMesGod(cText : string) : boolean;
  function myEmptyDate(cText : string) : boolean;
  function myDay(dAnyDate : TDateTime) : integer;
  function myMonth(dAnyDate : TDateTime) : integer;
  function myYear(dAnyDate : TDateTime) : integer;
  function myDateInMonth(dAnyDate, dRepDate : TDateTime) : boolean;
  function myFirstDOM(dAnyDate : TDateTime) : TDateTime;
  function myLastDOM(dAnyDate : TDateTime) : TDateTime;
  function myLastDayOM(dAnyDate : TDateTime) : word;
  function ShortLatNum2String(n : byte) : string;
  function myTimeToStr(mDateTime : TDateTime) : string;
  procedure Vozrast2(dtBirth, dtOn : TDateTime;
                     var cVozrast : string; var nVozrast : single);
	function Vozrast(dtBirth, dtOn : TDateTime) : single;
	function CyrToLat(Stroka : string) : string;
	function myUpper(Stroka : string) : string;
	function myLower(Stroka : string) : string;
	function getPhNameByAlias(sAlias : string) : string;
	function cColor2tColor(cClr : string) : TColor;
	function tColor2cColor(tClr : TColor) : string;
	function ListBoxScan(ListBox1 : TListBox;
																cString : string) : integer;
	function mesRus(n : byte) : string;
	function mesPredlogn(n : byte) : string;
  function UkrMes(n : byte) : string;
	function ShortMesRus(n : byte) : string;
  function mesLat(n : byte) : string;
	function mesRod(n : byte) : string;
  function MesPredl(n : byte) : string;
  function UkrMesPredl(n : byte) : string;
  function UkrMesRod(n : byte) : string;
  function rusDateRod(dDate : TDateTime) : string;
  function UkrDate(dDate : TDateTime) : string;
  function UkrDateRod(dDate : TDateTime) : string;
  procedure RusNumLine(n : real; var cCntCelue : string;
													  		 var cCntKopejki : string;
														  	 var cNmCelue : string;
															   var cNmKopejki : string;
                                 bFullNames : boolean );
  function RusNumChar(n : word; cSex : string; nGrp : byte) : string;
  procedure UkrNumLine(n : real; var cCntCelue : string;
													  		 var cCntKopejki : string;
														  	 var cNmCelue : string;
															   var cNmKopejki : string;
                                 bFullNames : boolean );
  function ukrNumChar(n : word; cSex : string; nGrp : byte) : string;
  procedure UkrValNumLine(nKdVal : integer; n : real; var cCntCelue : string;
															  var cCntKopejki : string;
															  var cNmCelue : string;
															  var cNmKopejki : string;
                                bFullNames : boolean);
  function MyDOW(dDate : TDateTime) : integer;
	function RusDOW(dDate : TDateTime) : string;
	function mAllTrim(s : string) : string;
  function myCopyFile(cFNmFr, cFNmTo : string) : boolean;
  function myShellExec(CmndLn,PrmLn,WDLn,cNmFileResult: string;
                           nCntWaitSec : longInt) : boolean;
  function myFileComplete(cFileName : string) : boolean;
  function MyFindFirst(cMask : string;
                              var cName : string) : boolean;
  function myMaskClearDir(cDirNm, cMask : string) : boolean;
  function TriPropis(n, nGrup : integer;
                                 cRod : string) : string;
  function UkrTriPropis(n, nGrup : integer;
                                 cRod : string) : string;
  function UkrSumPropis(n : extended; cRod : string;
                            var nKopeek : integer) : string;
  function UkrSumPropis_3(n : extended; cRod : string;
                            var nKopeek : integer) : string;
  function SumPropis(n : extended; cRod : string;
                            var nKopeek : integer) : string;
  function myRound(n : real; i : byte) : real;
  function MyRoundTo(n : real; i : byte) : real;
  function MyReplicate(cMsg : string; nCount : integer) : string;
  function MyPadR(cMsg : string; nLen : integer) : string;
  function myPadL(cMsg : string; nLen : Integer) : string;
  function myPadC(cMsg : string; nLen : Integer) : string;
  function MyFamIO(cFam, cIma, cOtch : string) : string;
  function MyLongFamIO(cFam, cIma, cOtch : string) : string;
  function MyLongFamIOZpt(cFam, cIma, cOtch : string) : string;
  function MyUppLowFamIO(cFam, cIma, cOtch : ShortString) : ShortString;
  function MyUppLowText(cText : ShortString) : ShortString;
  function MyNewUkr(cMsg : ShortString) : ShortString;
  function MyAnsiToOEM(cAnsi: string): string;
  function MyDos2Win(cMsg: string): string;
  function MyWin2Dos(cMsg: string): string;
  function StpFamIO(c_Fam, cIma, cOtch : ShortString;
                                        var cFam : ShortString) : ShortString;
  function StpFullFIO(cFam, cIma, cOtch : ShortString) : ShortString;
  function LatExists(cText : ShortString) : boolean;
  function Lat_I_ToUkr(Stroka : ShortString) : ShortString;


implementation

uses Math, a_Const, NumUtils;


function RusDayOfWeek(dAnyDay : TDateTime) : word;
var nEnglDOW : word;
begin
  nEnglDOW := DayOfWeek(dAnyDay);
  if nEnglDOW = 1 then
    Result := 7
  else
    Result := nEnglDOW - 1;
end;
//------------------------------------------------------------------------------
function Lat_I_ToUkr(Stroka : ShortString) : ShortString;
var i : integer; cLitera : char;
begin
	Result := '';
	for i := 1 to length(Stroka) do
		begin
			cLitera := Stroka[i];
			if cLitera = 'I' then           // Лат
				Result := Result + 'І'        // Укр
			else if cLitera = 'i' then        // Лат
				Result := Result + 'і'          // Укр
			else
				Result := Result + cLitera;
		end;
end;
//------------------------------------------------------------------------------
function LatExists(cText : ShortString) : boolean;
var i : SmallInt; cLitera : char;
begin
  Result := false;
  for i := 1 to Length(cText) do begin
    cLitera := cText[i];
    if (cLitera >= 'A') and (cLitera <= 'z') then begin
      Result := true;
      Break;
    end;
  end;
end;
//------------------------------------------------------------------------------
function StpFullFIO(cFam, cIma, cOtch : ShortString) : ShortString;
begin
  // Вернуть чисто Фамилию Имя Отчество
  Result := Trim(Trim(cFam) + ' ' + Trim(cIma) + ' ' + Trim(cOtch));
end;
//------------------------------------------------------------------------------
function StpFamIO(c_Fam, cIma, cOtch : ShortString;
                                        var cFam : ShortString) : ShortString;
var nPosProbel : SmallInt;
begin
  // в c_Fam - Фамилия И.О.(пока) В cFam вернуть чисто фамилию, в Result - FamIO
  Result := '';
  c_Fam := Trim(c_Fam);
  cIma  := Trim(cIma);
  if (cIma = '') then begin  // иностранец - все записано в поле FAM
    cFam := c_Fam;           // возвращаю нетронутую cFam
    Result := c_Fam; end
  else if cIma > '' then begin  // значит русский
    nPosProbel := Pos(' ', c_Fam);
    if nPosProbel > 0 then
      cFam := Copy(c_Fam, 1, nPosProbel-1)
    else
      cFam := c_Fam;
    Result := MyFamIO(cFam, cIma, cOtch);
  end;
end;
//------------------------------------------------------------------------------
function MyAnsiToOEM(cAnsi: string): string;
var cMsg : string;
    cAMsg, cOemMsg : array[0..255] of char;
begin
  cMsg := cAnsi;
  StrPCopy(cAMsg, cMsg);      // из String в Ansi PChar
  AnsiToOEM(cAMsg, cOemMsg);  // в OEM-кодировку (ДОС)
  Result := StrPas(cOemMsg);  // назад в String
end;
//------------------------------------------------------------------------------
function MyDos2Win(cMsg: string): string;
var i, n : SmallInt;
begin
  Result := '';
  for i := 1 to Length(cMsg) do begin
    n := Ord(cMsg[i]);
    if (n >= 192) and (n <= 239) then
      n := n - 64
    else if (n >= 240) and (n <= 255) then
      n := n - 16
    else if (n = 168) then   // Ё
      n := 240
    else if n = 184 then
      n := 241               // ё
    else if n = 170 then
      n := 242               // Є
    else if n = 186 then
      n := 243               // є
    else if n = 175 then
      n := 244               // Ї
    else if n = 191 then
      n := 245;              // ї
    Result := Result + Chr(n);
  end;
end;
// Порешать что-то с укр І
//------------------------------------------------------------------------------
function MyWin2Dos(cMsg: string): string;
var i, n : SmallInt;
begin
  Result := '';
  for i := 1 to Length(cMsg) do begin
    n := Ord(cMsg[i]);
    if (n >= 128) and (n <= 175) then
      n := n + 64
    else if (n >= 224) and (n <= 239) then
      n := n + 16
    else if (n = 240) then   // Ё
      n := 168
    else if n = 241 then
      n := 184               // ё
    else if n = 242 then
      n := 170               // Є
    else if n = 243 then
      n := 186               // є
    else if n = 244 then
      n := 175               // Ї
    else if n = 245 then
      n := 191;              // ї
    Result := Result + Chr(n);
  end;
end;
//------------------------------------------------------------------------------
function MyNewUkr(cMsg : ShortString) : ShortString;
var i : SmallInt; cLitera : String[1];
begin
  Result := '';
  cMsg := Trim(cMsg);
  for i := 1 to Length(cMsg) do begin
    cLitera := Copy(cMsg, i, 1);
    if cLitera = 'I' {Lat} then
      cLitera := 'І'; {Ukr}
    Result := Result + cLitera;
  end;
end;
//------------------------------------------------------------------------------
function MyFndInvNR(cInvNR : ShortString) : ShortString;
var i : SmallInt;  // задача - если Length(cInvNR) < 10,
begin              // добавить впереди пробелов до длины = 10
  Result := Trim(cInvNR);
  if Length(Result) < 10 then
    for i := 1 to (10 - Length(Result)) do
      Result := ' ' + Result;
end;
//------------------------------------------------------------------------------
function MyGetComputerName : ShortString;
var mReg : TRegistry;
begin
  Result := '';
  mReg := TRegistry.Create;
  TRY
    mReg.RootKey := HKEY_LOCAL_MACHINE;
    if mReg.OpenKey(
              '\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName',
                                                                   false) then
      {False because we do not want to create it if it doesn’t exist}
      Result := mReg.ReadString('ComputerName')
    else
      Result := 'Не разпознан';
    mReg.CloseKey;
  FINALLY
    mReg.Free;
    //inherited;
  END;
end;
//------------------------------------------------------------------------------
function I3Add(i : integer) : ShortString;
begin
  Result := '';
  if i < 10 then
    Result := Result + '00'
  else if i < 100 then
    Result := Result + '0';
  Result := Result + IntToStr(i);
end;
//------------------------------------------------------------------------------
function MyI4Add(i : integer) : ShortString;
var cRes :ShortString;
begin
  Result := '';
  cRes := '';
  if i < 10 then
    cRes := Result + '0000'
  else if i < 100 then
    cRes := Result + '000'
  else if i < 1000 then
    cRes := Result + '00'
  else
    cRes := Result + '0';
  cRes := cRes + IntToStr(i);
  Result := cRes;    //Result + IntToStr(i);
end;
//------------------------------------------------------------------------------
procedure RusNumLine(n : real; var cCntCelue : string;
															 var cCntKopejki : string;
															 var cNmCelue : string;
															 var cNmKopejki : string;
                               bFullNames : boolean);
  //.....................................................
  function PadegiGrn(nEdn : integer) : string;
  var iDec, iEdn : integer;
  begin
    iDec := nEdn mod 100;
    iEdn := nEdn mod 10;
    if ((iEdn = 1) and (iDec <> 11)) then
      Result := 'гривня'
    else if ((iDec >= 5) and (iDec <= 20)) then
      Result := 'гривень'
    else if ((iEdn > 1) and (iEdn < 5)) then
      Result := 'гривни'
    else
      Result := 'гривень';
  end;
  //.....................................................
  function PadegiKop(nKop : integer) : string;
  var iDec, iEdn : integer;
  begin
    iDec := nKop mod 100;
    iEdn := nKop mod 10;
    if ((iEdn = 1) and (iDec <> 11)) then
      Result := 'копейка'
    else if ((iDec >= 5) and (iDec <= 20)) then
      Result := 'копеек'
    else if ((iEdn > 1) and (iEdn < 5)) then
      Result := 'копейки'
    else
      Result := 'копеек';
  end;
  //.....................................................
  var nOst, rMlrd : extended;
	  	nKop, nMlrd, nMln, nTus, nEdn : word;
begin
	n     := abs(n);
	nOst  := n;
	rMlrd := int(nOst/1000000000);          {real}
	nMlrd := round(rMlrd);                  {integer}
	nOst  := nOst - rMlrd * 1000000000;
	nMln  := round(int(nOst/1000000));
	nOst  := nOst - nMln * 1000000;
	nTus  := round(int(nOst/1000));
	nOst  := nOst - nTus * 1000;
	nKop  := round((nOst - int(nOst)) * 100);
	nEdn  := round(int(nOst));
	cCntCelue := '';
	if nMlrd > 0 then
		cCntCelue := cCntCelue + RusNumChar(nMlrd,'m',4) + ' ';
	if nMln > 0 then
		cCntCelue := cCntCelue + RusNumChar(nMln,'m',3) + ' ';
	if nTus > 0 then
		cCntCelue := cCntCelue + RusNumChar(nTus,'w',2) + ' ';
	if nEdn > 0 then
		cCntCelue := cCntCelue + RusNumChar(nEdn,'w',1);
  cCntKopejki := IntToStr(nKop);
  if nKop < 10 then
    cCntKopejki := '0' + cCntKopejki;
  if not bFullNames then
    cNmCelue := 'грн.'
  else
    cNmCelue := PadegiGrn(nEdn);
  if not bFullNames then
    cNmKopejki := 'коп.'
  else
    cNmKopejki := PadegiKop(nKop);
end;
//------------------------------------------------------------------------------
function RusNumChar(n : word; cSex : string; nGrp : byte) : string;
var n100, n10, n1 : byte;
    c100, c10, c1, slovo : string;
begin
  Result := '';
  slovo := '';
  c100 := '';
  c10 := '';
  c1 := '';
  n100 := round(int(n/100));
  n := n - n100 * 100;
  n10 := round(int(n/10));
  n1 := n - n10 * 10;

  if      nGrp = 4 then slovo := 'миллиардов'
  else if nGrp = 3 then slovo := 'миллионов'
  else if nGrp = 2 then slovo := 'тысяч'
  else                  slovo := '';

  if      n100 = 0 then c100 := ''
  else if n100 = 1 then c100 := 'сто'
  else if n100 = 2 then c100 := 'двести'
  else if n100 = 3 then c100 := 'триста'
  else if n100 = 4 then c100 := 'четыреста'
  else if n100 = 5 then c100 := 'пятьсот'
  else if n100 = 6 then c100 := 'шестьсот'
  else if n100 = 7 then c100 := 'семьсот'
  else if n100 = 8 then c100 := 'восемьсот'
  else if n100 = 9 then c100 := 'девятьсот';

  if n10 = 0 then  c10 := ''
  else if n10 = 1 then begin
    if      n1 = 0 then c10 := 'десять'
    else if n1 = 1 then c10 := 'одиннадцать'
    else if n1 = 2 then c10 := 'двенадцать'
    else if n1 = 3 then c10 := 'тринадцать'
    else if n1 = 4 then c10 := 'четырнадцать'
    else if n1 = 5 then c10 := 'пятнадцать'
    else if n1 = 6 then c10 := 'шестнадцать'
    else if n1 = 7 then c10 := 'семнадцать'
    else if n1 = 8 then c10 := 'восемнадцать'
    else if n1 = 9 then c10 := 'девятнадцать' end
  else if n10 = 2 then  c10 := 'двадцать'
  else if n10 = 3 then  c10 := 'тридцать'
  else if n10 = 4 then  c10 := 'сорок'
  else if n10 = 5 then  c10 := 'пятьдесят'
  else if n10 = 6 then  c10 := 'шестьдесят'
  else if n10 = 7 then  c10 := 'семьдесят'
  else if n10 = 8 then  c10 := 'восемьдесят'
  else if n10 = 9 then  c10 := 'девяносто';
  if n10 <> 1 then begin
    if n1 = 0 then c1 := ''
    else if n1 = 1 then begin
      if cSex = 'm' then c1 := 'один'
      else c1 := 'одна' end
    else if n1 = 2 then begin
      if cSex = 'm' then c1 := 'два'
      else c1 := 'две' end
    else if n1 = 3 then c1 := 'три'
    else if n1 = 4 then c1 := 'четыре'
    else if n1 = 5 then c1 := 'пять'
    else if n1 = 6 then c1 := 'шесть'
    else if n1 = 7 then c1 := 'семь'
    else if n1 = 8 then c1 := 'восемь'
    else if n1 = 9 then c1 := 'девять';

    if nGrp = 4 then begin
      if n1 = 1 then slovo := 'миллиард'
      else if ((n1 > 1) and (n1 < 5)) then
                            slovo := 'миллиарда' end
    else if nGrp = 3 then begin
      if n1 = 1 then slovo := 'миллион'
      else if ((n1 > 1) and (n1 < 5)) then
                            slovo := 'миллиона' end
    else if nGrp = 2 then begin
      if n1 = 1 then slovo := 'тысяча'
      else if ((n1 > 1) and (n1 < 5)) then
                            slovo := 'тысячи'
    end;
  end;
  Result := Result + c100;
  if ((Result <> '') and (c10 <> '')) then
    Result := Result + ' ' + c10
  else
    Result := Result + c10;
  if ((Result <> '') and (c1 <> '')) then
    Result := Result + ' ' + c1
  else
    Result := Result + c1;
  if Result <> '' then
    Result := Result + ' ' + slovo;
end;
//------------------------------------------------------------------------------
procedure UkrNumLine(n : real; var cCntCelue : string;
															 var cCntKopejki : string;
															 var cNmCelue : string;
															 var cNmKopejki : string;
                               bFullNames : boolean);
  //.........................................................
  function PadegiGrn(nEdn : integer) : string;
  var iDec, iEdn : integer;
  begin
    iDec := nEdn mod 100;
    iEdn := nEdn mod 10;
    if ((iEdn = 1) and (iDec <> 11)) then
      Result := 'гривня'
    else if ((iDec >= 5) and (iDec <= 20)) then
      Result := 'гривень'
    else if ((iEdn > 1) and (iEdn < 5)) then
      Result := 'гривнi'
    else
      Result := 'гривень';
  end;
  //.........................................................
  function PadegiKop(nKop : integer) : string;
  var iDec, iEdn : integer;
  begin
    iDec := nKop mod 100;
    iEdn := nKop mod 10;
    if ((iEdn = 1) and (iDec <> 11)) then
      Result := 'копiйка'
    else if ((iDec >= 5) and (iDec <= 20)) then
      Result := 'копiйок'
    else if ((iEdn > 1) and (iEdn < 5)) then
      Result := 'копiйки'
    else
      Result := 'копiйок';
  end;
  //.........................................................
  var nOst, rMlrd : extended;
	  	nKop, nMlrd, nMln, nTus, nEdn : word;
begin
	n     := abs(n);
	nOst  := n;
	rMlrd := int(nOst/1000000000);          {real}
	nMlrd := round(rMlrd);                  {integer}
	nOst  := nOst - rMlrd * 1000000000;
	nMln  := round(int(nOst/1000000));
	nOst  := nOst - nMln * 1000000;
	nTus  := round(int(nOst/1000));
	nOst  := nOst - nTus * 1000;
	nKop  := round((nOst - int(nOst)) * 100);
	nEdn  := round(int(nOst));
	cCntCelue := '';
	if nMlrd > 0 then
		cCntCelue := cCntCelue + ukrNumChar(nMlrd,'m',4) + ' ';
	if nMln > 0 then
		cCntCelue := cCntCelue + ukrNumChar(nMln,'m',3) + ' ';
	if nTus > 0 then
		cCntCelue := cCntCelue + ukrNumChar(nTus,'w',2) + ' ';
	if nEdn > 0 then
		cCntCelue := cCntCelue + ukrNumChar(nEdn,'w',1);
  cCntKopejki := IntToStr(nKop);
  if nKop < 10 then
    cCntKopejki := '0' + cCntKopejki;
  if not bFullNames then
    cNmCelue := 'грн.'
  else
    cNmCelue := PadegiGrn(nEdn);
  if not bFullNames then
    cNmKopejki := 'коп.'
  else
    cNmKopejki := PadegiKop(nKop);
end;
//------------------------------------------------------------------------------
function ukrNumChar(n : word; cSex : string; nGrp : byte) : string;
var n100, n10, n1 : byte;
    c100, c10, c1, slovo : string;
begin
  Result := '';
  slovo := '';
  c100 := '';
  c10 := '';
  c1 := '';
  n100 := round(int(n/100));
  n := n - n100 * 100;
  n10 := round(int(n/10));
  n1 := n - n10 * 10;

  if      nGrp = 4 then slovo := 'мiлiардiв'
  else if nGrp = 3 then slovo := 'мiлiонiв'
  else if nGrp = 2 then slovo := 'тисяч'
  else                  slovo := '';

  if      n100 = 0 then c100 := ''
  else if n100 = 1 then c100 := 'сто'
  else if n100 = 2 then c100 := 'двiстi'
  else if n100 = 3 then c100 := 'триста'
  else if n100 = 4 then c100 := 'чотириста'
  else if n100 = 5 then c100 := 'п''ятсот'
  else if n100 = 6 then c100 := 'шiстсот'
  else if n100 = 7 then c100 := 'сiмсот'
  else if n100 = 8 then c100 := 'вiсiмсот'
  else if n100 = 9 then c100 := 'дев''ятьсот';

  if      n10 = 0 then  c10 := ''
  else if n10 = 1 then begin
    if      n1 = 0 then c10 := 'десять'
    else if n1 = 1 then c10 := 'одинадцять'
    else if n1 = 2 then c10 := 'дванадцять'
    else if n1 = 3 then c10 := 'тринадцять'
    else if n1 = 4 then c10 := 'чотирнадцять'
    else if n1 = 5 then c10 := 'п''ятнадцять'
    else if n1 = 6 then c10 := 'шiстнадцять'
    else if n1 = 7 then c10 := 'сiмнадцять'
    else if n1 = 8 then c10 := 'вiсiмнадцять'
    else if n1 = 9 then c10 := 'дев''ятнадцять' end
  else if n10 = 2 then  c10 := 'двадцять'
  else if n10 = 3 then  c10 := 'тридцять'
  else if n10 = 4 then  c10 := 'сорок'
  else if n10 = 5 then  c10 := 'п''ятдесят'
  else if n10 = 6 then  c10 := 'шiстдесят'
  else if n10 = 7 then  c10 := 'сiмдесят'
  else if n10 = 8 then  c10 := 'вiсiмдесят'
  else if n10 = 9 then  c10 := 'дев''яносто';
  if n10 <> 1 then begin
    if n1 = 0 then c1 := ''
    else if n1 = 1 then begin
      if cSex = 'm' then c1 := 'один'
      else c1 := 'одна' end
    else if n1 = 2 then begin
      if cSex = 'm' then c1 := 'два'
      else c1 := 'двi' end
    else if n1 = 3 then c1 := 'три'
    else if n1 = 4 then c1 := 'чотири'
    else if n1 = 5 then c1 := 'п''ять'
    else if n1 = 6 then c1 := 'шiсть'
    else if n1 = 7 then c1 := 'сiм'
    else if n1 = 8 then c1 := 'вiсiм'
    else if n1 = 9 then c1 := 'дев''ять';

    if nGrp = 4 then begin
      if n1 = 1 then slovo := 'мiлiард'
      else if ((n1 > 1) and (n1 < 5)) then
                            slovo := 'мiлiарда' end
    else if nGrp = 3 then begin
      if n1 = 1 then slovo := 'мiлiон'
      else if ((n1 > 1) and (n1 < 5)) then
                            slovo := 'мiлiона' end
    else if nGrp = 2 then begin
      if n1 = 1 then slovo := 'тисяча'
      else if ((n1 > 1) and (n1 < 5)) then
                            slovo := 'тисячi'
    end;
  end;
  Result := Result + c100;
  if ((Result <> '') and (c10 <> '')) then
    Result := Result + ' ' + c10
  else
    Result := Result + c10;
  if ((Result <> '') and (c1 <> '')) then
    Result := Result + ' ' + c1
  else
    Result := Result + c1;
  if Result <> '' then
    Result := Result + ' ' + slovo;
end;
//------------------------------------------------------------------------------
procedure UkrValNumLine(nKdVal : integer; n : real; var cCntCelue : string;
															  var cCntKopejki : string;
															  var cNmCelue : string;
															  var cNmKopejki : string;
                                bFullNames : boolean);
  //.........................................................
  function PadegiRub(nEdn : integer) : string;
  var iDec, iEdn : integer;
  begin
    iDec := nEdn mod 100;
    iEdn := nEdn mod 10;
    if nKdVal = 4 then begin
      if ((iEdn = 1) and (iDec <> 11)) then
        Result := 'долар США'
      else if ((iDec >= 5) and (iDec <= 20)) then
        Result := 'доларiв США'
      else if ((iEdn > 1) and (iEdn < 5)) then
        Result := 'долара США'
      else
        Result := 'доларiв США'; end
    else if nKdVal = 6 then begin
      if ((iEdn = 1) and (iDec <> 11)) then
        Result := 'ЕВРО'
      else if ((iDec >= 5) and (iDec <= 20)) then
        Result := 'ЕВРО'
      else if ((iEdn > 1) and (iEdn < 5)) then
        Result := 'ЕВРО'
      else
        Result := 'ЕВРО';
    end;
  end;
  //.........................................................
  function PadegiKop(nKop : integer) : string;
  var iDec, iEdn : integer;
  begin
    iDec := nKop mod 100;
    iEdn := nKop mod 10;
    if nKdVal = 4 then begin
      if ((iEdn = 1) and (iDec <> 11)) then
        Result := 'цент'
      else if ((iDec >= 5) and (iDec <= 20)) then
        Result := 'центiв'
      else if ((iEdn > 1) and (iEdn < 5)) then
        Result := 'цента'
      else
        Result := 'центiв'; end
    else if nKdVal = 6 then begin
      if ((iEdn = 1) and (iDec <> 11)) then
        Result := 'цент'
      else if ((iDec >= 5) and (iDec <= 20)) then
        Result := 'центiв'
      else if ((iEdn > 1) and (iEdn < 5)) then
        Result := 'цента'
      else
        Result := 'центiв';
    end;
  end;
  //.........................................................
  var nOst, rMlrd : extended;
	  	nKop, nMlrd, nMln, nTus, nEdn : word;
begin
	n     := abs(n);
	nOst  := n;
	rMlrd := int(nOst/1000000000);          {real}
	nMlrd := Round(rMlrd);                  {integer}
	nOst  := nOst - rMlrd * 1000000000;
	nMln  := Round(int(nOst/1000000));
	nOst  := nOst - nMln * 1000000;
	nTus  := Round(int(nOst/1000));
	nOst  := nOst - nTus * 1000;
	nKop  := Round((nOst - int(nOst)) * 100);
	nEdn  := Round(int(nOst));
	cCntCelue := '';
	if nMlrd > 0 then
		cCntCelue := cCntCelue + ukrNumChar(nMlrd,'m',4) + ' ';
	if nMln > 0 then
		cCntCelue := cCntCelue + ukrNumChar(nMln,'m',3) + ' ';
	if nTus > 0 then
		cCntCelue := cCntCelue + ukrNumChar(nTus,'w',2) + ' ';
	if nEdn > 0 then begin
    if (nKdVal = 3) then
		  cCntCelue := cCntCelue + ukrNumChar(nEdn,'w',1)
    else
      cCntCelue := cCntCelue + ukrNumChar(nEdn,'m',1);
  end;
  cCntKopejki := IntToStr(nKop);
  if nKop < 10 then
    cCntKopejki := '0' + cCntKopejki;
  if not bFullNames then
    cNmCelue := 'грн.'
  else
    cNmCelue := PadegiRub(nEdn);
  if not bFullNames then
    cNmKopejki := 'коп.'
  else
    cNmKopejki := PadegiKop(nKop);
end;
//------------------------------------------------------------------------------
function MyValidAppPic(var cNumApp : string) : boolean;
var i, nPosTire : word; cLeft, cRight, cChar : string;
begin
  Result := true;
  cNumApp := Trim(cNumApp);
  nPosTire := Pos('-', cNumApp);
  if nPosTire <> 0 then begin
    cLeft := Copy(cNumApp, 1, nPosTire-1);
    cRight := Copy(cNumApp, nPosTire+1, 1); end
  else begin
    cLeft := cNumApp;
    cRight := '';
  end;
  for i := 1 to Length(cLeft) do begin
    cChar := Copy(cLeft, i, 1);
    if (cChar < '0') or (cChar > '9') then begin
      ShowMessage('Не корректный символ "' + cChar +
                  '" в номере квартиры' + #13#10 +
                  'Шаблоны для номера квартиры: "999" или "999-а"');
      Result := false;
      Break;
    end;
  end;
  if Result and (cRight <> '') and
         (Pos(cRight, 'АБВГДЕабвгде') = 0) then begin
    ShowMessage('В правой части допускаются ' +
                             'только символы "АаБбВвГгДдЕе"');
    Result := false;
  end;
  if Result then begin
    cNumApp := MyPadL(cLeft, 3);
    if cRight <> '' then
      cNumApp := cNumApp + '-' + cRight;
  end;
end;
//------------------------------------------------------------------------------
function MyFamIO(cFam, cIma, cOtch : string) : string;
begin
  Result := Trim(cFam);
  if cIma <> '' then begin
    Result := Result + ' ' + Copy(Trim(cIma), 1, 1) + '.';
    if cOtch <> '' then
      Result := Result + Copy(Trim(cOtch), 1, 1) + '.';
  end;
end;
//------------------------------------------------------------------------------
function MyLongFamIOZpt(cFam, cIma, cOtch : string) : string;
begin
  Result := Trim(cFam);
  if cIma <> '' then begin
    Result := Result + ',' + Trim(cIma);
    if cOtch <> '' then
      Result := Result + ',' + Trim(cOtch);
  end;
end;
//------------------------------------------------------------------------------
function MyLongFamIO(cFam, cIma, cOtch : string) : string;
begin
  Result := Trim(cFam);
  if cIma <> '' then begin
    Result := Result + ' ' + Trim(cIma);
    if cOtch <> '' then
      Result := Result + ' ' + Trim(cOtch);
  end;
end;
//------------------------------------------------------------------------------
function MyUppLowFamIO(cFam, cIma, cOtch : ShortString) : ShortString;
var cFamIO, cChar : ShortString; i, nNextI : SmallInt;
begin
  Result := '';
  nNextI := 0;
  cFam  := Trim(cFam);
  cIma  := Trim(cIma);
  cOtch := Trim(cOtch);
  cFamIO := '';
  if cFam > '' then begin
    for i := 1 to Length(cFam) do begin
      cChar := cFam[i];
      if cChar = '-' then
        nNextI := i + 1;
      if (i = 1) or (i = nNextI) then
        cFamIO := cFamIO + cChar
      else
        cFamIO := cFamIO + AnsiLowerCase(cChar);
    end;
    //cFamIO := Copy(cFam, 1,1) + AnsiLowerCase(Copy(cFam, 2,20));
    if cIma > '' then begin
      cFamIO := cFamIO + ' ' +
                     Copy(cIma, 1,1) + AnsiLowerCase(Copy(cIma, 2,20));
      if cOtch > '' then
        cFamIO := cFamIO + ' ' +
                     Copy(cOtch, 1,1) + AnsiLowerCase(Copy(cOtch, 2,20));
    end;
  end;
  Result := cFamIO;
end;
//------------------------------------------------------------------------------
function MyUppLowText(cText : ShortString) : ShortString;
var i, nNextI : SmallInt; cChar : ShortString;
begin
  nNextI := 0;
  Result := '';
  cText := Trim(cText);
  for i := 1 to Length(cText) do begin
    cChar := cText[i];
    if cChar = '-' then
      nNextI := i + 1;
    if (i = 1) or (i = nNextI) then
      Result := Result + cChar
    else
      Result := Result + AnsiLowerCase(cChar);
  end;
end;
//------------------------------------------------------------------------------
function IsPole(cFldNm : string; dts : TDataSet) : boolean;
var i : SmallInt;
begin
  Result := false;
  cFldNm := UpperCase(cFldNm);
  for i := 0 to dts.FieldCount-1 do begin
    if UpperCase(dts.Fields[i].FieldName) = cFldNm then begin
      Result := true;
      Break;
    end;
  end;
end;
//------------------------------------------------------------------------------
function myIsField(cFieldName : string;
                                 Table1 : TDataSet) : boolean;
var i : integer;
begin
  Result := false;
  for i := 0 to Table1.FieldCount-1 do begin
    if UpperCase(cFieldName) =
           UpperCase(Table1.Fields[i].FieldName) then begin
      Result := true;
      break;
    end;
  end;
end;
//------------------------------------------------------------------------------
function RandomFileName : ShortString;
begin
  Result := IntToStr(MilliSecondOfTheHour(Now));
  while Length(Result) < 7 do
    Result := '0' + Result;
  Result := 'x' + Result;
end;
//------------------------------------------------------------------------------
function WorkDisk(cDirExe : string) : string;
var nPosSlash, i : byte;
begin
  Result := '';
  nPosSlash := 0;
  for i := 1 to Length(cDirExe) do begin
    if Copy(cDirExe,i,1) = '\' then begin
      nPosSlash := i;
      Break;
    end;
  end;
  if nPosSlash <> 0 then
    Result := Copy(cDirExe, 1, nPosSlash);
end;
//------------------------------------------------------------------------------
function MyReplicate(cMsg : string; nCount : integer) : string;
var i : integer;
begin
  Result := '';
  for i := 1 to nCount do
    Result := Result + cMsg;
end;
//------------------------------------------------------------------------------
function myPadR(cMsg : string; nLen : Integer) : string;
begin
  Result := Trim(cMsg);
  if Length(Result) > nLen then
    Result := copy(Result, 1, nLen);
  while (Length(Result) < nLen) do Result := Result + ' ';
end;
//------------------------------------------------------------------------------
function myPadL(cMsg : string; nLen : Integer) : string;
begin
  Result := Trim(cMsg);
  if Length(Result) > nLen then
    Result := copy(Result, 1, nLen);
  while (Length(Result) < nLen) do Result := ' ' + Result;
end;
//------------------------------------------------------------------------------
function myPadC(cMsg : string; nLen : Integer) : string;
var nCntSpace : integer;
    cTmp : string;
begin
  Result := cMsg;
  if Length(Result) > nLen then
    Result := copy(Result, 1, nLen);
  nCntSpace := (nLen - Length(Result)) div 2;
  cTmp := '';
  while length(cTmp) < nCntSpace do cTmp := cTmp + ' ';
  Result := cTmp + Result + cTmp;
  while (Length(Result) < nLen) do Result := Result + ' ';
end;
//------------------------------------------------------------------------------
function myEmptyMesGod(cText : string) : boolean;
begin
  Result := false;
  cText := Trim(cText);
  if (cText = '') or (cText = '-') or (cText = ':') or
               (cText = '/') or (cText = '.') then
    Result := true;
end;
//------------------------------------------------------------------------------
function myEmptyDate(cText : string) : boolean;
begin
  Result := false;
  cText := Trim(cText);
  if (cText = '') or (cText = '-  -') or
               (cText = '/  /') or (cText = '.  .') then
    Result := true;
end;
//------------------------------------------------------------------------------
function  myDay(dAnyDate : TDateTime) : integer;
var nYear, nMonth, nDay : Word;
begin
  DecodeDate(dAnyDate, nYear, nMonth, nDay);
  Result := nDay;
end;
//------------------------------------------------------------------------------
function  myMonth(dAnyDate : TDateTime) : integer;
var nYear, nMonth, nDay : Word;
begin
  DecodeDate(dAnyDate, nYear, nMonth, nDay);
  Result := nMonth;
end;
//------------------------------------------------------------------------------
function  myYear(dAnyDate : TDateTime) : integer;
var nYear, nMonth, nDay : Word;
begin
  DecodeDate(dAnyDate, nYear, nMonth, nDay);
  Result := nYear;
end;
//------------------------------------------------------------------------------
function  myDateInMonth(dAnyDate, dRepDate : TDateTime) : boolean;
var nAnyYear, nAnyMonth, nAnyDay,
    nRepYear, nRepMonth, nRepDay : Word;
begin
  // Находится ли dAnyDate в месяце с датой dRepDate
  DecodeDate(dAnyDate, nAnyYear, nAnyMonth, nAnyDay);
  DecodeDate(dRepDate, nRepYear, nRepMonth, nRepDay);
  if (nAnyYear <> nRepYear) or (nAnyMonth <> nRepMonth) then
    Result := false
  else
    Result := true;
end;
//------------------------------------------------------------------------------
function myFirstDOM(dAnyDate : TDateTime) : TDateTime;
var nYear, nMonth, nDay : Word;
begin
  DecodeDate(dAnyDate, nYear, nMonth, nDay);
  nDay := 1;
  Result := EncodeDate(nYear, nMonth, nDay);
end;
//------------------------------------------------------------------------------
function myLastDOM(dAnyDate : TDateTime) : TDateTime;
var nYear, nMonth, nDay, nCurMonth : Word;
begin
  DecodeDate(dAnyDate, nYear, nCurMonth, nDay);
  dAnyDate := EncodeDate(nYear, nCurMonth, 28);
  Result := dAnyDate;
  while true do begin
    Result := dAnyDate;
    dAnyDate := dAnyDate + 1;
    DecodeDate(dAnyDate, nYear, nMonth, nDay);
    if nMonth <> nCurMonth then
      Break;
  end;
end;
//------------------------------------------------------------------------------
function myLastDayOM(dAnyDate : TDateTime) : word;
var nYear, nMonth, nDay, nCurMonth : Word;
begin
  DecodeDate(dAnyDate, nYear, nCurMonth, nDay);
  dAnyDate := EncodeDate(nYear, nCurMonth, 28);
  Result := 28;
  while true do begin
    dAnyDate := dAnyDate + 1;
    DecodeDate(dAnyDate, nYear, nMonth, nDay);
    if nMonth = nCurMonth then
      Result := nDay
    else
      Break;
  end;
end;
//------------------------------------------------------------------------------
function myRound(n : real; i : byte) : real;
begin
  Result := StrToFloat(FloatToStrF(n, ffFixed, 18, i));
end;
//------------------------------------------------------------------------------
function MyRoundTo(n : real; i : byte) : real;
var
  nPosDot, nCifraInI, nCifraAfterI : SmallInt;
  cN, cCeloe, cDrobnoe, cResult : ShortString;
  cCifraInI : Char;     nOrd : SmallInt;
begin
  cResult := '';
  cN := FloatToStr(n);
  nPosDot := Pos('.', cN);
  if nPosDot > 0 then begin
    cCeloe := Copy(cN, 1, nPosDot-1);
    cDrobnoe := Copy(cN, nPosDot+1, 10);
    if cDrobnoe > '' then begin
      if Length(cDrobnoe) > i then begin
        nCifraInI := StrToInt(cDrobnoe[i]);
        nCifraAfterI := StrToInt(cDrobnoe[i+1]);
        if nCifraAfterI >= 5 then begin
           // пока опускаю случай, когда она равна 9
          nCifraInI := nCifraInI + 1;
        end;
        nOrd := Ord(nCifraInI)+1;
        cCifraInI := STROKANUMB[nOrd]; // IntToStr(nOrd);
        cDrobnoe[i] := cCifraInI; // Chr(Ord(cCifraInI));
        cResult := cCeloe + '.' + Copy(cDrobnoe, 1, 2); end
      else if Length(cDrobnoe) = i then begin
        {
        nCifraInI := StrToInt(cDrobnoe[i]);
        cCifraInI := Chr(nCifraInI);
        nCifraAfterI := 0;
        cDrobnoe[i] := Chr(Ord(cCifraInI));
        cResult := cCeloe + '.' + cDrobnoe;}
                                               end
      else if Length(cDrobnoe) < i then begin
        cResult := cCeloe + '.' + cDrobnoe;
      end;
    end;
  end;
  Result := StrToFloat(cResult);
end;
//------------------------------------------------------------------------------
function  ShortLatNum2String(n : byte) : string;
begin
  Result := '';
  if      n = 1  then Result := 'one'
  else if n = 2  then Result := 'two'
  else if n = 3  then Result := 'three'
  else if n = 4  then Result := 'four'
  else if n = 5  then Result := 'five'
  else if n = 6  then Result := 'six'
  else if n = 7  then Result := 'seven'
  else if n = 8  then Result := 'eight'
  else if n = 9  then Result := 'nine'
  else if n = 10 then Result := 'ten';
end;
//------------------------------------------------------------------------------
function  SumPropis(n : Extended; cRod : string;
                            var nKopeek : integer) : string;
{cRod может быть w, m и n}
var nL : integer; nOst, nRep : extended;
begin
  Result := '';
  nOst := n;
  nRep := 2599999999.99;
  if n > nRep then Exit;
  if n >= 1000000000 then begin
    nL := Trunc(n/1000000000);
    nOst := n - nL * 1000000000;
    Result := TriPropis(nL, 4, 'm');
  end;
  if (nOst >= 1000000) then begin
    nL := Trunc(nOst/1000000);
    nOst := nOst - nL * 1000000;
    if Result <> '' then Result := Result + ' ';
    Result := Result + TriPropis(nL, 3, 'm');
  end;
  if nOst >= 1000 then begin
    nL := Trunc(nOst/1000);
    nOst := nOst - nL * 1000;
    if Result <> '' then Result := Result + ' ';
    Result := Result + TriPropis(nL, 2, 'w');
  end;
  if nOst >= 1 then begin
    //nOst := Round(nOst); // Зачем ??? 26-06-2013 
    nL := Trunc(nOst/1);
    nOst := nOst - nL * 1;
    if Result <> '' then Result := Result + ' ';
    Result := Result + TriPropis(nL, 1, cRod);
  end;
  if nOst > 0 then nKopeek := round(nOst * 100);
end;

//------------------------------------------------------------------------------
// cRod может быть w, m и n
//------------------------------------------------------------------------------
function UkrSumPropis(
  n: Extended;
  cRod: string;
  var nKopeek: integer): string;
var nL : integer; nOst, nRep : extended;
Remain, Kopecks: double;
Hundreds: integer;
begin
  Result := '';
  nOst := n;
  nRep := 2599999999.99;
  if n > nRep then Exit;
  if n >= 1000000000 then begin
    nL := Trunc(n/1000000000);
    nOst := n - nL * 1000000000;
    Result := UkrTriPropis(nL, 4, 'm');
  end;
  if (nOst >= 1000000) then begin
    nL := Trunc(nOst/1000000);
    nOst := nOst - nL * 1000000;
    if Result <> '' then Result := Result + ' ';
    Result := Result + UkrTriPropis(nL, 3, 'm');
  end;
  if nOst >= 1000 then begin
    nL := Trunc(nOst/1000);
    nOst := nOst - nL * 1000;
    if Result <> '' then Result := Result + ' ';
    Result := Result + UkrTriPropis(nL, 2, 'w');
  end;

  // SB 04.02.2022 <<<
  Kopecks := 0;

  if nOst >= 0 then begin
    Remain := TNumUtils.RoundToKopeck(nOst);
    Hundreds := Floor(Remain);
    Kopecks := TNumUtils.RoundToKopeck(Remain - Hundreds);

    if Result <> '' then
      Result := Result + ' ';

    Result := Result + UkrTriPropis(Hundreds, 1, cRod);
  end;

  nKopeek := StrToInt(FloatToStr(Kopecks * 100));
  // >>> SB 04.02.2022
end; {UkrSumPropis}

//------------------------------------------------------------------------------
function UkrSumPropis_3(n : extended; cRod : string;
                            var nKopeek : integer) : string;
// Для количеств в УМЦ, где после запятой допускается 3 знака
{cRod может быть w, m и n}
var nL : integer; nOst, nRep : extended;
begin
  Result := '';
  nOst := n;
  nRep := 2599999999.99;
  if n > nRep then Exit;
  if n >= 1000000000 then begin
    nL := Trunc(n/1000000000);
    nOst := n - nL * 1000000000;
    Result := UkrTriPropis(nL, 4, 'm');
  end;
  if (nOst >= 1000000) then begin
    nL := Trunc(nOst/1000000);
    nOst := nOst - nL * 1000000;
    if Result <> '' then Result := Result + ' ';
    Result := Result + UkrTriPropis(nL, 3, 'm');
  end;
  if nOst >= 1000 then begin
    nL := Trunc(nOst/1000);
    nOst := nOst - nL * 1000;
    if Result <> '' then Result := Result + ' ';
    Result := Result + UkrTriPropis(nL, 2, 'w');
  end;
  if nOst >= 1 then begin
    nL := Trunc(nOst/1);
    nOst := nOst - nL * 1;
    if Result <> '' then Result := Result + ' ';
    Result := Result + UkrTriPropis(nL, 1, cRod);
  end;
  if nOst > 0 then
    nKopeek := Round(nOst * 1000);
end; {UkrSumPropis_3}
//------------------------------------------------------------------------------
function TriPropis(n, nGrup : integer; cRod : string) : string;
{cRod может быть w, m и n}
var nE, nD, nS : integer;
    cE, cD, cS : string;
begin
  Result := '';
  nD := 0;
  nS := 0;
  cE := '';
  cD := '';
  cS := '';
  if n >= 100 then
    nS := Trunc(n/100);
  nE := n - nS * 100;
  if nE >= 10 then
    nD := Trunc(nE/10);
  nE := nE - nD * 10;

  if      nS = 9 then
    cS := 'девятьсот'
  else if nS = 8 then
    cS := 'восемьсот'
  else if nS = 7 then
    cS := 'семьсот'
  else if nS = 6 then
    cS := 'шестьсот'
  else if nS = 5 then
    cS := 'пятьсот'
  else if nS = 4 then
    cS := 'четыреста'
  else if nS = 3 then
    cS := 'триста'
  else if nS = 2 then
    cS := 'двести'
  else if nS = 1 then
    cS := 'сто';
  if (nD >= 1) or (nE = 0) then begin
    if      nD = 9 then
      cD := 'девяносто'
    else if nD = 8 then
      cD := 'восемьдесят'
    else if nD = 7 then
      cD := 'семьдесят'
    else if nD = 6 then
      cD := 'шестьдесят'
    else if nD = 5 then
      cD := 'пятьдесят'
    else if nD = 4 then
      cD := 'сорок'
    else if nD = 3 then
      cD := 'тридцать'
    else if nD = 2 then
      cD := 'двадцать'
    else if nD = 1 then
      cD := 'десять';
  end;
  if (nD = 1) and (nE <> 0) then begin
    cD := '';
    if      nE = 9 then
      cE := 'девятнадцать'
    else if nE = 8 then
      cE := 'восемнадцать'
    else if nE = 7 then
      cE := 'семнадцать'
    else if nE = 6 then
      cE := 'шестнадцать'
    else if nE = 5 then
      cE := 'пятнадцать'
    else if nE = 4 then
      cE := 'четырнадцать'
    else if nE = 3 then
      cE := 'тринадцать'
    else if nE = 2 then
      cE := 'двенадцать'
    else if nE = 1 then
      cE := 'одиннадцать'; end
  else begin
    if      nE = 9 then
      cE := 'девять'
    else if nE = 8 then
      cE := 'восемь'
    else if nE = 7 then
      cE := 'семь'
    else if nE = 6 then
      cE := 'шесть'
    else if nE = 5 then
      cE := 'пять'
    else if nE = 4 then
      cE := 'четыре'
    else if nE = 3 then
      cE := 'три'
    else if nE = 2 then begin
      if (cRod = 'm') or (cRod = 'n') then
        cE := 'два'
      else
        cE := 'две'; end
    else if nE = 1 then begin
      if cRod = 'm' then
        cE := 'один'
      else if cRod = 'w' then
        cE := 'одна'
      else if cRod = 'n' then
        cE := 'одно';
    end;
  end;
  if cS <> '' then
    Result := cS + ' ';
  if cD <> '' then
    Result := Result + cD + ' ';
  if cE <> '' then
    Result := Result + cE;
  if nGrup = 2 then begin
    Result := Result + ' ';
    if (nD <> 1) and (nE <> 0) then begin
      if nE = 1 then
        Result := Result + 'тысяча'
      else if nE < 5 then
        Result := Result + 'тысячи'
      else
        Result := Result + 'тысяч'; end
    else
      Result := Result + 'тысяч'; end
  else if nGrup = 3 then begin
    Result := Result + ' ';
    if (nD <> 1) and (nE <> 0) then begin
      if nE = 1 then
        Result := Result + 'миллион'
      else if nE < 5 then
        Result := Result + 'миллиона'
      else
        Result := Result + 'миллионов'; end
    else
      Result := Result + 'миллионов'; end
  else if nGrup = 4 then begin
    Result := Result + ' ';
    if (nD <> 1) and (nE <> 0) then begin
      if nE = 1 then
        Result := Result + 'миллиард'
      else if nE < 5 then
        Result := Result + 'миллиарда'
      else
        Result := Result + 'миллиардов'; end
    else
      Result := Result + 'миллиардов';
  end;
end;
//------------------------------------------------------------------------------
function UkrTriPropis(n, nGrup : integer; cRod : string) : string;
{cRod может быть w, m и n}
var nE, nD, nS : integer;
    cE, cD, cS : string;
begin
  Result := '';
  nD := 0;
  nS := 0;
  cE := '';
  cD := '';
  cS := '';
  if n >= 100 then
    nS := Trunc(n/100);
  nE := n - nS * 100;
  if nE >= 10 then
    nD := Trunc(nE/10);
  nE := nE - nD * 10;
  
  if      nS = 9 then
    cS := 'дев''ятьсот'
  else if nS = 8 then
    cS := 'вісімсот'
  else if nS = 7 then
    cS := 'сімсот'
  else if nS = 6 then
    cS := 'шістсот'
  else if nS = 5 then
    cS := 'п''ятсот'
  else if nS = 4 then
    cS := 'чотириста'
  else if nS = 3 then
    cS := 'триста'
  else if nS = 2 then
    cS := 'двісті'
  else if nS = 1 then
    cS := 'сто';
  if (nD >= 1) or (nE = 0) then begin
    if      nD = 9 then
      cD := 'дев''яносто'
    else if nD = 8 then
      cD := 'вісімдесят'
    else if nD = 7 then
      cD := 'сімдесят'
    else if nD = 6 then
      cD := 'шістдесят'
    else if nD = 5 then
      cD := 'п''ятдесят'
    else if nD = 4 then
      cD := 'сорок'
    else if nD = 3 then
      cD := 'тридцять'
    else if nD = 2 then
      cD := 'двадцять'
    else if nD = 1 then
      cD := 'десять';
  end;
  if (nD = 1) and (nE <> 0) then begin
    cD := '';
    if      nE = 9 then
      cE := 'дев''ятнадцять'
    else if nE = 8 then
      cE := 'вісімнадцять'
    else if nE = 7 then
      cE := 'сімнадцять'
    else if nE = 6 then
      cE := 'шістнадцять'
    else if nE = 5 then
      cE := 'п''ятнадцять'
    else if nE = 4 then
      cE := 'чотирнадцять'
    else if nE = 3 then
      cE := 'тринадцять'
    else if nE = 2 then
      cE := 'дванадцять'
    else if nE = 1 then
      cE := 'одинадцять'; end
  else begin
    if      nE = 9 then
      cE := 'дев''ять'
    else if nE = 8 then
      cE := 'вісім'
    else if nE = 7 then
      cE := 'сім'
    else if nE = 6 then
      cE := 'шість'
    else if nE = 5 then
      cE := 'п''ять'
    else if nE = 4 then
      cE := 'чотири'
    else if nE = 3 then
      cE := 'три'
    else if nE = 2 then begin
      if (cRod = 'm') or (cRod = 'n') then
        cE := 'два'
      else
        cE := 'дві'; end
    else if nE = 1 then begin
      if cRod = 'm' then
        cE := 'один'
      else if cRod = 'w' then
        cE := 'одна'
      else if cRod = 'n' then
        cE := 'одно';
    end;
  end;
  if cS <> '' then
    Result := cS + ' ';
  if cD <> '' then
    Result := Result + cD + ' ';
  if cE <> '' then
    Result := Result + cE;
  if nGrup = 2 then begin
    Result := Result + ' ';
    if (nD <> 1) and (nE <> 0) then begin
      if nE = 1 then
        Result := Result + 'тисяча'
      else if nE < 5 then
        Result := Result + 'тисячі'
      else
        Result := Result + 'тисяч'; end
    else
      Result := Result + 'тисяч'; end
  else if nGrup = 3 then begin
    Result := Result + ' ';
    if (nD <> 1) and (nE <> 0) then begin
      if nE = 1 then
        Result := Result + 'міліон'
      else if nE < 5 then
        Result := Result + 'міліона'
      else
        Result := Result + 'міліонів'; end
    else
      Result := Result + 'міліонів'; end
  else if nGrup = 4 then begin
    Result := Result + ' ';
    if (nD <> 1) and (nE <> 0) then begin
      if nE = 1 then
        Result := Result + 'міліард'
      else if nE < 5 then
        Result := Result + 'міліарда'
      else
        Result := Result + 'міліардів'; end
    else
      Result := Result + 'міліардів';
  end;
end;
//------------------------------------------------------------------------------
procedure Vozrast2(dtBirth, dtOn : TDateTime;
              var cVozrast : string; var nVozrast : single);
//var nDays, nMonths, nYears : Word;
begin
{
  DateDiff(dtBirth, dtOn, nDays, nMonths, nYears);
  cVozrast := 'л.' + IntToStr(nYears) + ' м.' +
             IntToStr(nMonths)+' дн.' + IntToStr(nDays);
  nVozrast := nYears + nMonths/12 + nDays/365;
}
end;
//------------------------------------------------------------------------------
function myTimeToStr(mDateTime : TDateTime) : string;
begin
  Result := FormatDateTime('hh:nn:ss', mDateTime);
end;
//------------------------------------------------------------------------------
function myMaskClearDir(cDirNm, cMask : string) : boolean;
begin
  Result := false;
//  Result := DeleteFiles(cDirNm + cMask);
end;
//------------------------------------------------------------------------------
function MyFindFirst(cMask : string; var cName : string) : boolean;
var i : integer; SearchRec : TSearchRec;
begin
  Result := false;
  cName  := '';
  i := FindFirst(cMask, faAnyFile, SearchRec);
  if i > -1 then begin
    Result := true;
    cName  := SearchRec.Name;{только NAME.EXT без PATH'a!!!}
  end;
end;
//------------------------------------------------------------------------------
function myFileComplete(cFileName : string) : boolean;
begin
  Result := false;
//  Result := FileExists(cFileName) and
//                          (GetFileSize(cFileName) > 0);
end;
//------------------------------------------------------------------------------
function myShellExec(CmndLn,PrmLn,WDLn,cNmFileResult: string;
                           nCntWaitSec : longInt) : boolean;
//var bMore : boolean; nCntSec : longInt; cSvCmndLn : string;
begin
  Result    := false;
(*
  cSvCmndLn := CmndLn;
  CmndLn    := CmndLn + #0;
  PrmLn     := PrmLn + #0;
  WDLn      := WDLn + #0;
  if ShellExecute(0{Handle}, 'open', @CmndLn[1], @PrmLn[1],
                          @WDLn[1], SW_HIDE) < 32 then begin
    MessageDlg('Не удается выполнить ' +
                           cSvCmndLn, mtError, [mbOK], 0);
    exit;
  end;
  if (cNmFileResult <> '') and {задана проверка
                    исполнения} (nCntWaitSec > 0) then begin
    bMore := true;
    nCntSec := 0;
    while bMore and (nCntSec < nCntWaitSec) do begin
      Delay(1000);
      nCntSec := nCntSec + 1;
      if FileExists(cNmFileResult) and
               (GetFileSize(cNmFileResult) > 0) then begin
        Result := true;
        bMore := false;
      end;
    end; end
  else Result := true; {не задавалась проверка исполнения}
*)
end;
//------------------------------------------------------------------------------
function myCopyFile(cFNmFr, cFNmTo : string) : boolean;
var szBuffer : array[0..255] of char;
    nFileFr, nFileTo : integer;
    nNumBytes : integer;
begin
  Result := false;
  nFileFr := FileOpen(cFNmFr,0);
  if nFileFr < 0 then begin
    ShowMessage('Нет мочи открыть FileFrom');
    Exit;
  end;
  nFileTo := FileCreate(cFNmTo);
  if nFileTo < 0 then begin
    FileClose(nFileFr);
    ShowMessage('Нет мочи открыть FileTo');
    Exit;
  end;
  FileSeek(nFileFr,0,0);
  nNumBytes := FileRead(nFileFr,szBuffer,SizeOf(szBuffer));
  while nNumBytes > 0 do begin
    FileWrite(nFileTo, szBuffer, nNumBytes);
    nNumBytes := FileRead(nFileFr,szBuffer,SizeOf(szBuffer));
  end;
  if nNumBytes = -1 then
    Result := false
  else Result := true;
  FileClose(nFileFr);
  FileClose(nFileTo);
end;
//------------------------------------------------------------------------------
function mAllTrim(s : string) : string;
begin
	{обсечь пробелы слева и справа}
	while true do begin
		if copy(s,1,1) = ' ' then
			delete(s,1,1)
		else
			break;
	end;
	while true do begin
		if copy(s,length(s),1) = ' ' then
			delete(s,length(s),1)
		else
			break;
	end;
	Result := s;
end;
//------------------------------------------------------------------------------
function MyDOW(dDate : TDateTime) : integer;
var nDay : byte;
begin
	Result := 0;
	nDay := DayOfWeek(dDate);
	if      nDay = 1 then Result := 7
	else if nDay = 2 then Result := 1
	else if nDay = 3 then Result := 2
	else if nDay = 4 then Result := 3
	else if nDay = 5 then Result := 4
	else if nDay = 6 then Result := 5
	else if nDay = 7 then Result := 6;
end;
//------------------------------------------------------------------------------
function RusDOW(dDate : TDateTime) : string;
var nDay : byte;
begin
	Result := '';
	nDay := DayOfWeek(dDate);
	if      nDay = 1 then Result := 'воскресенье'
	else if nDay = 2 then Result := 'понедельник'
	else if nDay = 3 then Result := 'вторник'
	else if nDay = 4 then Result := 'среда'
	else if nDay = 5 then Result := 'четверг'
	else if nDay = 6 then Result := 'пятница'
	else if nDay = 7 then Result := 'суббота';
end;
//------------------------------------------------------------------------------
function MesRus(n : byte) : string;
begin
	Result := '';
	if      n =  1 then Result := 'январь'
	else if n =  2 then Result := 'февраль'
	else if n =  3 then Result := 'март'
	else if n =  4 then Result := 'апрель'
	else if n =  5 then Result := 'май'
	else if n =  6 then Result := 'июнь'
	else if n =  7 then Result := 'июль'
	else if n =  8 then Result := 'август'
	else if n =  9 then Result := 'сентябрь'
	else if n = 10 then Result := 'октябрь'
	else if n = 11 then Result := 'ноябрь'
	else if n = 12 then Result := 'декабрь';
end;
//------------------------------------------------------------------------------
function MesPredlogn(n : byte) : string;
begin
	Result := '';
	if      n =  1 then Result := 'январе'
	else if n =  2 then Result := 'феврале'
	else if n =  3 then Result := 'марте'
	else if n =  4 then Result := 'апреле'
	else if n =  5 then Result := 'мае'
	else if n =  6 then Result := 'июне'
	else if n =  7 then Result := 'июле'
	else if n =  8 then Result := 'августе'
	else if n =  9 then Result := 'сентябре'
	else if n = 10 then Result := 'октябре'
	else if n = 11 then Result := 'ноябре'
	else if n = 12 then Result := 'декабре';
end;
//------------------------------------------------------------------------------
function MesPredl(n : byte) : string;
begin
	Result := '';
	if      n =  1 then Result := 'январе'
	else if n =  2 then Result := 'феврале'
	else if n =  3 then Result := 'марте'
	else if n =  4 then Result := 'апреле'
	else if n =  5 then Result := 'мае'
	else if n =  6 then Result := 'июне'
	else if n =  7 then Result := 'июле'
	else if n =  8 then Result := 'августе'
	else if n =  9 then Result := 'сентябре'
	else if n = 10 then Result := 'октябре'
	else if n = 11 then Result := 'ноябре'
	else if n = 12 then Result := 'декабре';
end;
//------------------------------------------------------------------------------
function ShortMesRus(n : byte) : string;
begin
	Result := '';
	if      n =  1 then Result := 'янв'
	else if n =  2 then Result := 'фев'
	else if n =  3 then Result := 'мар'
	else if n =  4 then Result := 'апр'
	else if n =  5 then Result := 'май'
	else if n =  6 then Result := 'июн'
	else if n =  7 then Result := 'июл'
	else if n =  8 then Result := 'авг'
	else if n =  9 then Result := 'сен'
	else if n = 10 then Result := 'окт'
	else if n = 11 then Result := 'ноя'
	else if n = 12 then Result := 'дек';
end;
//------------------------------------------------------------------------------
function mesLat(n : byte) : string;
begin
	Result := '';
	if      n =  1 then Result := 'january'
	else if n =  2 then Result := 'febrary'
	else if n =  3 then Result := 'marth'
	else if n =  4 then Result := 'april'
	else if n =  5 then Result := 'may'
	else if n =  6 then Result := 'june'
	else if n =  7 then Result := 'jule'
	else if n =  8 then Result := 'august'
	else if n =  9 then Result := 'september'
	else if n = 10 then Result := 'october'
	else if n = 11 then Result := 'november'
	else if n = 12 then Result := 'december';
end;
//------------------------------------------------------------------------------
function mesRod(n : byte) : string;
begin
	Result := '';
	if      n =  1 then Result := 'января'
	else if n =  2 then Result := 'февраля'
	else if n =  3 then Result := 'марта'
	else if n =  4 then Result := 'апреля'
	else if n =  5 then Result := 'мая'
	else if n =  6 then Result := 'июня'
	else if n =  7 then Result := 'июля'
	else if n =  8 then Result := 'августа'
	else if n =  9 then Result := 'сентября'
	else if n = 10 then Result := 'октября'
	else if n = 11 then Result := 'ноября'
	else if n = 12 then Result := 'декабря';
end;
//------------------------------------------------------------------------------
function UkrMesPredl(n : byte) : string;
begin
	Result := '';
	if      n =  1 then Result := 'січні'
	else if n =  2 then Result := 'лютому'
	else if n =  3 then Result := 'березні'
	else if n =  4 then Result := 'квітні'
	else if n =  5 then Result := 'травні'
	else if n =  6 then Result := 'червні'
	else if n =  7 then Result := 'липні'
	else if n =  8 then Result := 'серпні'
	else if n =  9 then Result := 'вересні'
	else if n = 10 then Result := 'жовтні'
	else if n = 11 then Result := 'листопаді'
	else if n = 12 then Result := 'грудні';
end;
//------------------------------------------------------------------------------
function  rusDateRod(dDate : TDateTime) : string;
var Year, Month, Day : Word;
begin
  DecodeDate(dDate, Year, Month, Day);
  Result := IntToStr(Day) + ' ' + mesRod(Month) + ' ' +
                                   IntToStr(Year) + ' г.';
end;
//------------------------------------------------------------------------------
function  UkrDate(dDate : TDateTime) : string;
var Year, Month, Day : Word;
begin
  DecodeDate(dDate, Year, Month, Day);
  Result := '';
  if Day < 10 then
    Result := Result + '0';
  Result := Result + IntToStr(Day) + ' ' + UkrMesRod(Month) + ' ' +
                                   IntToStr(Year) + ' р.';
end;
//------------------------------------------------------------------------------
function  ukrDateRod(dDate : TDateTime) : string;
var Year, Month, Day : Word;
begin
  DecodeDate(dDate, Year, Month, Day);
  Result := IntToStr(Day) + ' ' + UkrMesRod(Month) + ' ' +
                                   IntToStr(Year) + ' р.';
end;
//------------------------------------------------------------------------------
function UkrMes(n : byte) : string;
begin
	Result := '';
	if      n =  1 then Result := 'сiчень'
	else if n =  2 then Result := 'лютий'
	else if n =  3 then Result := 'березень'
	else if n =  4 then Result := 'квiтень'
	else if n =  5 then Result := 'травень'
	else if n =  6 then Result := 'червень'
	else if n =  7 then Result := 'липень'
	else if n =  8 then Result := 'серпень'
	else if n =  9 then Result := 'вересень'
	else if n = 10 then Result := 'жовтень'
	else if n = 11 then Result := 'листопад'
	else if n = 12 then Result := 'грудень';
end;
//------------------------------------------------------------------------------
function UkrMesRod(n : byte) : string;
begin
	Result := '';
	if      n =  1 then Result := 'сiчня'
	else if n =  2 then Result := 'лютого'
	else if n =  3 then Result := 'березня'
	else if n =  4 then Result := 'квiтня'
	else if n =  5 then Result := 'травня'
	else if n =  6 then Result := 'червня'
	else if n =  7 then Result := 'липня'
	else if n =  8 then Result := 'серпня'
	else if n =  9 then Result := 'вересня'
	else if n = 10 then Result := 'жовтня'
	else if n = 11 then Result := 'листопада'
	else if n = 12 then Result := 'грудня';
end;
//------------------------------------------------------------------------------
function vozrast(dtBirth, dtOn : TDateTime) : single;
{ по заданной дате рождения вернуть возраст на дату dtOn}
var
	dt1,dt2 : TDateTime;
//	sResult : string;
	lMinus : boolean;
	year1, month1, day1, year2, month2, day2 : word;
	cntY, cntM, cntD : integer;
begin
	Result := 0;
	lMinus := false;
	if dtBirth = dtOn then
		exit;
	if dtBirth > dtOn then
		begin
			dt1 := dtOn;
			dt2 := dtBirth;
			lMinus := true
		end
	else
		begin
			dt1 := dtBirth;
			dt2 := dtOn
		end;
	DecodeDate(dt1, year1, month1, day1);
	DecodeDate(dt2, year2, month2, day2);
	cntY := year2 - year1;
	cntM := month2 - month1;
	cntD := day2 - day1;
	if cntD < 0 then begin
		cntD := cntD + 30;
		cntM := cntM - 1;
	end;
	if cntD < 0 then begin
		cntM := cntM + 12;
		cntY := cntY - 1;
	end;
	Result := cntY + cntM/12 + cntD/365;
	if lMinus then
		Result := Result * -1;
(*  sResult := Format('%8.2f', [Result]);
	showMessage('Result = ' + sResult);*)
end;
//------------------------------------------------------------------------------
function ListBoxScan(ListBox1 : TListBox;
                                cString : string) : integer;
var i : integer;
begin
	Result := -1;  {не нашли}
	for i := 0 to ListBox1.Items.Count-1 do
		if ListBox1.Items[i] = cString then begin
			Result := i;
			break;
		end;
end;
//------------------------------------------------------------------------------
function cColor2tColor(cClr : string) : TColor;
begin
	Result := clBlack;
	if      cClr = 'clAqua'     then Result := clAqua
	else if cClr = 'clBlack'    then Result := clBlack
	else if cClr = 'clBlue'     then Result := clBlue
	else if cClr = 'clDkGray'   then Result := clDkGray
	else if cClr = 'clFuchsia'  then Result := clFuchsia
	else if cClr = 'clGray'     then Result := clGray
	else if cClr = 'clGreen'    then Result := clGreen
	else if cClr = 'clLime'     then Result := clLime
	else if cClr = 'clLtGray'   then Result := clLtGray
	else if cClr = 'clMaroon'   then Result := clMaroon
	else if cClr = 'clNavy'     then Result := clNavy
	else if cClr = 'clOlive'    then Result := clOlive
	else if cClr = 'clPurple'   then Result := clPurple
	else if cClr = 'clRed'      then Result := clRed
	else if cClr = 'clSilver'   then Result := clSilver
	else if cClr = 'clTeal'     then Result := clTeal
	else if cClr = 'clWhite'    then Result := clWhite
	else if cClr = 'clYellow'   then Result := clYellow
	else if cClr = 'clMyFirst'  then Result := clInfoBk
	{else if cClr = 'clMySecond' then Result := clMySecond};
end;
//------------------------------------------------------------------------------
function tColor2cColor(tClr : TColor) : string;
begin
	Result := 'clBlack';
	if      tClr = clAqua     then Result := 'clAqua'
	else if tClr = clBlack    then Result := 'clBlack'
	else if tClr = clBlue     then Result := 'clBlue'
	else if tClr = clDkGray   then Result := 'clDkGray'
	else if tClr = clFuchsia  then Result := 'clFuchsia'
	else if tClr = clGray     then Result := 'clGray'
	else if tClr = clGreen    then Result := 'clGreen'
	else if tClr = clLime     then Result := 'clLime'
	else if tClr = clLtGray   then Result := 'clLtGray'
	else if tClr = clMaroon   then Result := 'clMaroon'
	else if tClr = clNavy     then Result := 'clNavy'
	else if tClr = clOlive    then Result := 'clOlive'
	else if tClr = clPurple   then Result := 'clPurple'
	else if tClr = clRed      then Result := 'clRed'
	else if tClr = clSilver   then Result := 'clSilver'
	else if tClr = clTeal     then Result := 'clTeal'
	else if tClr = clWhite    then Result := 'clWhite'
	else if tClr = clYellow   then Result := 'clYellow'
	{else if tClr = clMyFirst  then Result := 'clMyFirst'
	else if tClr = clMySecond then Result := 'clMySecond'};
end;
//------------------------------------------------------------------------------
function getPhNameByAlias(sAlias : string) : string;
var dataBase : TDataBase; pszDir : PChar;
begin
	Result := '';
	DataBase := TDataBase.Create(nil);
	pszDir := strAlloc(255);
	try
		DataBase.AliasName := sAlias;
		DataBase.DataBaseName := 'TEMP';
		DataBase.Connected := true;
		DbiGetDirectory(DataBase.Handle, true, pszDir);
		DataBase.Connected := false;
		Result := strPas(pszDir);
		if copy(Result,length(Result),1) <> '\' then
			Result := Result + '\';
	finally                                           
		Database.Free;
		StrDispose(pszDir);
	end;
end;
//------------------------------------------------------------------------------
function CyrToLat(Stroka : string) : string;
var i : integer; cLitera : char;
begin
	Result := '';
	for i := 1 to length(Stroka) do
		begin
			cLitera := Stroka[i];
			if cLitera = 'А' then
				Result := Result + 'A'
			else if cLitera = 'Б' then
				Result := Result + 'B'
			else if cLitera = 'Б' then
				Result := Result + 'B'
			else if cLitera = 'В' then
				Result := Result + 'V'
			else if cLitera = 'Г' then
				Result := Result + 'G'
			else if cLitera = 'Д' then
				Result := Result + 'D'
			else if cLitera = 'Е' then
				Result := Result + 'E'
			else if cLitera = 'Ж' then
				Result := Result + 'G'
			else if cLitera = 'З' then
				Result := Result + 'Z'
			else if cLitera = 'И' then
				Result := Result + 'I'
			else if cLitera = 'Й' then
				Result := Result + 'Y'
			else if cLitera = 'К' then
				Result := Result + 'K'
			else if cLitera = 'Л' then
				Result := Result + 'L'
			else if cLitera = 'М' then
				Result := Result + 'M'
			else if cLitera = 'Н' then
				Result := Result + 'N'
			else if cLitera = 'О' then
				Result := Result + 'O'
			else if cLitera = 'П' then
				Result := Result + 'P'
			else if cLitera = 'Р' then
				Result := Result + 'R'
			else if cLitera = 'С' then
				Result := Result + 'S'
			else if cLitera = 'Т' then
				Result := Result + 'T'
			else if cLitera = 'У' then
				Result := Result + 'U'
			else if cLitera = 'Ф' then
				Result := Result + 'F'
			else if cLitera = 'Х' then
				Result := Result + 'H'
			else if cLitera = 'Ц' then
				Result := Result + 'C'
			else if cLitera = 'Ч' then
				Result := Result + 'CH'
			else if cLitera = 'Ш' then
				Result := Result + 'SH'
			else if cLitera = 'Щ' then
				Result := Result + 'CHSH'
			else if cLitera = 'Ъ' then
				Result := Result + ''
			else if cLitera = 'Ы' then
				Result := Result + 'Y'
			else if cLitera = 'Ь' then
				Result := Result + ''
			else if cLitera = 'Э' then
				Result := Result + 'E'
			else if cLitera = 'Ю' then
				Result := Result + 'JU'
			else if cLitera = 'Я' then
				Result := Result + 'JA'
			else if cLitera = 'а' then
				Result := Result + 'a'
			else if cLitera = 'б' then
				Result := Result + 'b'
			else if cLitera = 'в' then
				Result := Result + 'v'
			else if cLitera = 'г' then
				Result := Result + 'g'
			else if cLitera = 'д' then
				Result := Result + 'd'
			else if cLitera = 'е' then
				Result := Result + 'e'
			else if cLitera = 'ж' then
				Result := Result + 'g'
			else if cLitera = 'з' then
				Result := Result + 'z'
			else if cLitera = 'и' then
				Result := Result + 'i'
			else if cLitera = 'й' then
				Result := Result + 'y'
			else if cLitera = 'к' then
				Result := Result + 'k'
			else if cLitera = 'л' then
				Result := Result + 'l'
			else if cLitera = 'м' then
				Result := Result + 'm'
			else if cLitera = 'н' then
				Result := Result + 'n'
			else if cLitera = 'о' then
				Result := Result + 'o'
			else if cLitera = 'п' then
				Result := Result + 'p'
			else if cLitera = 'р' then
				Result := Result + 'r'
			else if cLitera = 'с' then
				Result := Result + 's'
			else if cLitera = 'т' then
				Result := Result + 't'
			else if cLitera = 'у' then
				Result := Result + 'u'
			else if cLitera = 'ф' then
				Result := Result + 'f'
			else if cLitera = 'х' then
				Result := Result + 'h'
			else if cLitera = 'ц' then
				Result := Result + 'c'
			else if cLitera = 'ч' then
				Result := Result + 'ch'
			else if cLitera = 'ш' then
				Result := Result + 'sh'
			else if cLitera = 'щ' then
				Result := Result + 'chsh'
			else if cLitera = 'ъ' then
				Result := Result + ''
			else if cLitera = 'ы' then
				Result := Result + 'y'
			else if cLitera = 'ь' then
				Result := Result + ''
			else if cLitera = 'э' then
				Result := Result + 'e'
			else if cLitera = 'ю' then
				Result := Result + 'ju'
			else if cLitera = 'я' then
				Result := Result + 'ja'
			else
				Result := Result + cLitera;
		end;
end;
//------------------------------------------------------------------------------
function myUpper(Stroka : string) : string;
var i : integer; cLitera : char;
begin
	Result := '';
	for i := 1 to length(Stroka) do
		begin
			cLitera := Stroka[i];
			if cLitera = 'а' then
				Result := Result + 'А'
			else if cLitera = 'б' then
				Result := Result + 'Б'
			else if cLitera = 'в' then
				Result := Result + 'В'
			else if cLitera = 'г' then
				Result := Result + 'Г'
			else if cLitera = 'д' then
				Result := Result + 'Д'
			else if cLitera = 'е' then
				Result := Result + 'Е'
			else if cLitera = 'ж' then
				Result := Result + 'Ж'
			else if cLitera = 'з' then
				Result := Result + 'З'
			else if cLitera = 'и' then
				Result := Result + 'И'
			else if cLitera = 'й' then
				Result := Result + 'Й'
			else if cLitera = 'к' then
				Result := Result + 'К'
			else if cLitera = 'л' then
				Result := Result + 'Л'
			else if cLitera = 'м' then
				Result := Result + 'М'
			else if cLitera = 'н' then
				Result := Result + 'Н'
			else if cLitera = 'о' then
				Result := Result + 'О'
			else if cLitera = 'п' then
				Result := Result + 'П'
			else if cLitera = 'р' then
				Result := Result + 'Р'
			else if cLitera = 'с' then
				Result := Result + 'С'
			else if cLitera = 'т' then
				Result := Result + 'Т'
			else if cLitera = 'у' then
				Result := Result + 'У'
			else if cLitera = 'ф' then
				Result := Result + 'Ф'
			else if cLitera = 'х' then
				Result := Result + 'Х'
			else if cLitera = 'ц' then
				Result := Result + 'Ц'
			else if cLitera = 'ч' then
				Result := Result + 'Ч'
			else if cLitera = 'ш' then
				Result := Result + 'Ш'
			else if cLitera = 'щ' then
				Result := Result + 'Щ'
			else if cLitera = 'ъ' then
				Result := Result + 'Ъ'
			else if cLitera = 'ы' then
				Result := Result + 'Ы'
			else if cLitera = 'ь' then
				Result := Result + 'Ь'
			else if cLitera = 'э' then
				Result := Result + 'Э'
			else if cLitera = 'ю' then
				Result := Result + 'Ю'
			else if cLitera = 'я' then
				Result := Result + 'Я'
			else if cLitera = 'і' then
				Result := Result + 'І'
			else if cLitera = 'ї' then
				Result := Result + 'Ї'
			else if cLitera = 'є' then
				Result := Result + 'Є'
			else
				Result := Result + UpCase(cLitera);
		end;
end;
//------------------------------------------------------------------------------
function myLower(Stroka : string) : string;
var i : integer; cLitera : char;
begin
	Result := '';
	for i := 1 to Length(Stroka) do
		begin
			cLitera := Stroka[i];
			if cLitera = 'Q' then
				Result := Result + 'q'
			else if cLitera = 'W' then
				Result := Result + 'w'
			else if cLitera = 'E' then
				Result := Result + 'e'
			else if cLitera = 'R' then
				Result := Result + 'r'
			else if cLitera = 'T' then
				Result := Result + 't'
			else if cLitera = 'Y' then
				Result := Result + 'y'
			else if cLitera = 'U' then
				Result := Result + 'u'
			else if cLitera = 'I' then
				Result := Result + 'i'
			else if cLitera = 'O' then
				Result := Result + 'o'
			else if cLitera = 'P' then
				Result := Result + 'p'
			else if cLitera = 'A' then
				Result := Result + 'a'
			else if cLitera = 'S' then
				Result := Result + 's'
			else if cLitera = 'D' then
				Result := Result + 'd'
			else if cLitera = 'F' then
				Result := Result + 'f'
			else if cLitera = 'G' then
				Result := Result + 'g'
			else if cLitera = 'H' then
				Result := Result + 'h'
			else if cLitera = 'J' then
				Result := Result + 'j'
			else if cLitera = 'K' then
				Result := Result + 'k'
			else if cLitera = 'L' then
				Result := Result + 'l'
			else if cLitera = 'Z' then
				Result := Result + 'z'
			else if cLitera = 'X' then
				Result := Result + 'x'
			else if cLitera = 'C' then
				Result := Result + 'c'
			else if cLitera = 'V' then
				Result := Result + 'v'
			else if cLitera = 'B' then
				Result := Result + 'b'
			else if cLitera = 'N' then
				Result := Result + 'n'
			else if cLitera = 'M' then
				Result := Result + 'm'

			else if cLitera = 'А' then
				Result := Result + 'а'
			else if cLitera = 'Б' then
				Result := Result + 'б'
			else if cLitera = 'В' then
				Result := Result + 'в'
			else if cLitera = 'Г' then
				Result := Result + 'г'
			else if cLitera = 'Д' then
				Result := Result + 'д'
			else if cLitera = 'Е' then
				Result := Result + 'е'
			else if cLitera = 'Ж' then
				Result := Result + 'ж'
			else if cLitera = 'З' then
				Result := Result + 'з'
			else if cLitera = 'И' then
				Result := Result + 'и'
			else if cLitera = 'Й' then
				Result := Result + 'й'
			else if cLitera = 'К' then
				Result := Result + 'к'
			else if cLitera = 'Л' then
				Result := Result + 'л'
			else if cLitera = 'М' then
				Result := Result + 'м'
			else if cLitera = 'Н' then
				Result := Result + 'н'
			else if cLitera = 'О' then
				Result := Result + 'о'
			else if cLitera = 'П' then
				Result := Result + 'п'
			else if cLitera = 'Р' then
				Result := Result + 'р'
			else if cLitera = 'С' then
				Result := Result + 'с'
			else if cLitera = 'Т' then
				Result := Result + 'т'
			else if cLitera = 'У' then
				Result := Result + 'у'
			else if cLitera = 'Ф' then
				Result := Result + 'ф'
			else if cLitera = 'Х' then
				Result := Result + 'х'
			else if cLitera = 'Ц' then
				Result := Result + 'ц'
			else if cLitera = 'Ч' then
				Result := Result + 'ч'
			else if cLitera = 'Ш' then
				Result := Result + 'ш'
			else if cLitera = 'Щ' then
				Result := Result + 'щ'
			else if cLitera = 'Ъ' then
				Result := Result + 'ъ'
			else if cLitera = 'Ы' then
				Result := Result + 'ы'
			else if cLitera = 'Ь' then
				Result := Result + 'ь'
			else if cLitera = 'Э' then
				Result := Result + 'э'
			else if cLitera = 'Ю' then
				Result := Result + 'ю'
			else if cLitera = 'Я' then
				Result := Result + 'я'
			else if cLitera = 'І' then
				Result := Result + 'і'
			else if cLitera = 'Ї' then
				Result := Result + 'ї'
			else if cLitera = 'Є' then
				Result := Result + 'є'
			else
				Result := Result + cLitera;
		end;
end;

//------------------------------------------------------------------------------
procedure KorrUkrI(var cFam, cIma, cOtch : ShortString);
var i : SmallInt;
begin
  Exit; // В отчёте как раз украинские и нужны

//  cFam  := AnsiUpperCase(cFam);
//  cIma  := AnsiUpperCase(cIma);
//  cOtch := AnsiUpperCase(cOtch);
  // Для стыковки с программой Best_Zvit нужно в cFam, cIma и cOtch
  // заменить украинские І и і на латинские I и i, соответственно.
  for i := 1 to Length(cFam) do begin
    if cFam[i] = 'І' then     // украинское
      cFam[i] := 'I'          // латинское
    else if cFam[i] = 'і' then
      cFam[i] := 'i';
  end;
  for i := 1 to Length(cIma) do begin
    if cIma[i] = 'І' then
      cIma[i] := 'I'
    else if cIma[i] = 'і' then
      cIma[i] := 'i';
  end;
  for i := 1 to Length(cOtch) do begin
    if cOtch[i] = 'І' then
      cOtch[i] := 'I'
    else if cOtch[i] = 'і' then
      cOtch[i] := 'i';
  end;
end;

end.
