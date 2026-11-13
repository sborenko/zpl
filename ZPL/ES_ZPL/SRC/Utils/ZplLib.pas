unit ZplLib;

interface

uses
  DbTables;

type
  ZplUtils = class
    class procedure GetSmByBnk(Query: TQuery; Accnt: ShortString;
      DtProc, Dt_2009_04: TDateTime; var SmBnk101, SmBnkOther: Double;
      UseParentAcc: Boolean = true);
  end;

implementation

uses
  Math, a_Const, QryLib;

//------------------------------------------------------------------------------
class procedure ZplUtils.GetSmByBnk(
  Query: TQuery;
  Accnt: ShortString;
  DtProc, Dt_2009_04: TDateTime;
  var SmBnk101, SmBnkOther: Double;
  UseParentAcc: Boolean = true
);
var
  AccFldNm, NmViNu: ShortString;
begin
  QryUtils.InitQuery(Query);

  if UseParentAcc then
    AccFldNm := 'PSch'
  else
    AccFldNm := 'SchBU';

  // Тут надо при обращении к месяцам до 01-04-2009 оставить как есть
  // а начиная с 04-2009 выбирать по полю KdBnk в таблице Z_NU !!!!!!!!!!!!!!
  with Query do
    if DtProc < Dt_2009_04 then begin
      SQL.Text :=
        'select bl.KdBnk, Sum(n.Summa) as SMM ' +
        'from ViNUMain n ' +
          'left join GETWRKBNKLS (n.TabN, n.DtProc) bl on 1 = 1 ' +
        'where n.DtProc = :DtProc ' +
          'and n.PSch = :PSch ' +
          'and n.KdSps = 1 ' +
          'and n.VidN = "7511" ' +
        'group by bl.KdBnk';

      ParamByName('DtProc').AsDateTime := DtProc;
      ParamByName('PSch').AsString := Accnt;
      Open;

      SmBnk101 := 0;
      SmBnkOther := 0;
      while not Eof do begin
        if FieldByName('KdBnk').AsInteger = 101 then
          SmBnk101 := SmBnk101 + RoundTo(FieldByName('SMM').AsFloat, -2)
        else
          SmBnkOther := SmBnkOther + RoundTo(FieldByName('SMM').AsFloat, -2);
        Next;
      end;

      QryUtils.ReleaseQuery(Query);
    end else begin
      if DtProc >= d_0117 then
        NmViNu := 'ViNuM_17'
      else
        NmViNu := 'ViNuMain';

      SQL.Text :=
        'select n.KdBnk, b.ShBnk, Sum(n.Summa) as SMM ' +
        'from ' + NmViNu + ' n ' +
          'left join z_Banki b on b.KdBnk = n.KdBnk ' +
        'where n.DtProc = :DtProc ' +
          'and n.' + AccFldNm + ' = :Accnt ' +
          'and n.KdSps = 1 ' +
          'and n.VidN = "7511" ' +
        'group by n.KdBnk, b.ShBnk';

      ParamByName('DtProc').AsDateTime := DtProc;
      ParamByName('Accnt').AsString := Accnt;
      Open;
    end;
end;

end.
