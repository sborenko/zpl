unit CommonVOtp;

interface

uses DBTables;

type
  TVOtpRec = record
    NR: integer;
    KdSps: integer;
    DtProc: TDateTime;
    TabN: integer;
    CurOklTrf: double;
    AlgRasch: integer;
    UseKoefOkl: string;
    NchMatPom: string;
    NchBudMes: string;
    RK: string;
    NrPrik: string;
    DtPrik: TDateTime;
    DtBeg: TDateTime;
    CntDays: integer;
    DtEnd: TDateTime;
    CntChas: double;
    VidN: string;
    ProcOpl: double;
    KdTemu: integer;
    KdObj: integer;
    KdKatp: integer;
    KdSpz: integer;
    Notes: string;
    SmSrDn: double;
    Spec_Nr: integer;
    SmOtp: double;
  end;

function NewVOtpStmt(recVOtp: TVOtpRec): string;
function EditVOtpStmt(recVOtp: TVOtpRec): string;
function DeleteVOtpStmt(NR: integer): string;

implementation

//------------------------------------------------------------------------------
function NewVOtpStmt(recVOtp: TVOtpRec): string;
begin
  Result := 'insert into z_VOtp () values ()'
end;

//------------------------------------------------------------------------------
function EditVOtpStmt(recVOtp: TVOtpRec): string;
begin
  Result := 'insert into z_VOtp () values ()'
end;

//------------------------------------------------------------------------------
function DeleteVOtpStmt(NR: integer): string;
begin
  Result := 'delete into z_VOtp () values ()'
end;

end.
