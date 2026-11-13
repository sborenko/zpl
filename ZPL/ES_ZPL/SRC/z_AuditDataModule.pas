unit z_AuditDataModule;

interface

uses
  SysUtils, Classes, DB, DBTables, Dialogs, A_CONST;

type
  String4 = string[4];

  TDmAudit = class(TDataModule)
    QryAudit: TQuery;
    QryAuditTOTALSUM: TFloatField;
    QryAuditRECCOUNT: TIntegerField;

    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }

    b_AuditIsEnabled,
    b_ShowDifferentOnly: boolean;
    n_AuditCallLevel: integer;

    n_TabN: integer;
    d_DtPrc: TDateTime;

    n_PreviousTotalSum,
    n_CurrentTotalSum: double;
    n_PreviousRecCount,
    n_CurrentRecCount: integer;

    n_EntriesProcessed: integer;
    n_IdenticalEntries: integer;

    file_Log: TextFile;

    procedure GetTotals(var totalSum: double; var recCount: integer);
    procedure LogResult;

  public
    { Public declarations }

    function AuditIsEnabled: boolean;

    procedure StartAudit;
    procedure EndAudit;

    procedure RunAuditForEmployee(nTabN: integer; dDtPrc: TDateTime);
    procedure AuditForEmployeeEnded;
  end;

var
  DmAudit: TDmAudit;

implementation

{$R *.dfm}

procedure TDmAudit.DataModuleCreate(Sender: TObject);
begin
  b_AuditIsEnabled := false;
  b_ShowDifferentOnly := true;
end;

function TDmAudit.AuditIsEnabled: boolean;
begin
  Result := b_AuditIsEnabled;
end;

procedure TDmAudit.StartAudit;
begin
  if n_AuditCallLevel = 0 then begin
    AssignFile(file_Log, 'Audit.log');
    Rewrite(file_Log);
    n_EntriesProcessed := 0;
    n_IdenticalEntries := 0;

    b_AuditIsEnabled := true;
  end;

  Inc(n_AuditCallLevel);
end;

procedure TDmAudit.EndAudit;
begin
  Dec(n_AuditCallLevel);

  if n_AuditCallLevel = 0 then begin
    WriteLn(file_Log, 'Total Entries Processed: ' +
        IntToStr(n_EntriesProcessed));
    WriteLn(file_Log, 'Identical Entries:       ' +
        IntToStr(n_IdenticalEntries));
    CloseFile(file_Log);

    b_AuditIsEnabled := false;
  end;
end;

procedure TDmAudit.RunAuditForEmployee(nTabN: integer; dDtPrc: TDateTime);
begin
  n_TabN := nTabN;
  d_DtPrc := dDtPrc;

  GetTotals(n_PreviousTotalSum, n_PreviousRecCount);
end;

procedure TDmAudit.AuditForEmployeeEnded;
begin
  GetTotals(n_CurrentTotalSum, n_CurrentRecCount);

  LogResult;
end;

procedure TDmAudit.GetTotals(var totalSum: double; var recCount: integer);
begin
  with QryAudit do begin
    DatabaseName := CESMAIN;

    ParamByName('TabN').AsInteger := n_TabN;
    ParamByName('DtProc').AsDateTime := d_DtPrc;

    Open;

    totalSum := FieldByName('TotalSum').AsFloat;
    recCount := FieldByName('RecCount').AsInteger;
    QryAudit.Close;
  end;
end;

procedure TDmAudit.LogResult;
var
  bIdentical: boolean;
begin
  Inc(n_EntriesProcessed);

  bIdentical := (n_CurrentTotalSum = n_PreviousTotalSum)
      and (Abs(n_CurrentRecCount - n_PreviousRecCount) < 0.10);

  if not bIdentical or not b_ShowDifferentOnly then
    Write(file_Log, 'TabN ' + IntToStr(n_TabN) + ': ' );

  if bIdentical then begin
    Inc(n_IdenticalEntries);

    if not b_ShowDifferentOnly then
      WriteLn(file_Log, 'Identical');
  end else begin
    WriteLn(file_Log, 'Different');

    if n_CurrentTotalSum <> n_PreviousTotalSum then begin
      WriteLn(file_Log, '     Previous Total Sum: ' +
          FloatToStr(n_PreviousTotalSum));
      WriteLn(file_Log, '     Current Total Sum : ' +
          FloatToStr(n_CurrentTotalSum));
    end;

    if n_CurrentRecCount <> n_PreviousRecCount then begin
      WriteLn(file_Log, '     Previous Rec Count: ' +
          FloatToStr(n_PreviousRecCount));
      WriteLn(file_Log, '     Current Rec Count : ' +
          FloatToStr(n_CurrentRecCount));
    end;
  end;
end;

end.
