unit Load;

interface

uses
  Db, Z_EBln, CustDateUtils, QryUtils;

procedure OpenVBlnList(Period: TPeriod);
procedure OpenOldRBln(SpecNr: integer);

implementation

//------------------------------------------------------------------------------
procedure OpenVBlnList(Period: TPeriod);
begin
  with FormEBln, QryVBln do begin
    TQryUtils.InitQuery(QryVBln);

    SQL.Add(
      'select * ' +
      'from z_VBln ' +
      'where DtProc >= :DtBeg ' +
        'and DtProc <= :DtEnd ' +
        'and AlgRasch = 12 ' +
//        'AND TABN = 49181 ' + // DEBUG
        'order by DtBeg');
    ParamByName('DtBeg').AsDateTime := Period.Start;
    ParamByName('DtEnd').AsDateTime := Period.Finish;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure OpenOldRBln(SpecNr: integer);
begin
  with FormEBln, QryRBlnOld do begin
    TQryUtils.InitQuery(QryRBlnOld);

    SQL.Add(
      'select r.*, Cast(-1 As SmallInt) As MyFoxFld ' +
      'from z_RBln r ' +
      'where r.Spec_Nr = :SpecNr ' +
      'order by r.ZaMesGod');
    ParamByName('SpecNr').AsInteger := SpecNr;
    Open;
  end;
end;

end.
