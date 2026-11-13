unit z_SpsCmb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBClient,
  DBTables;

type
  TFormSpsCmbOkl = class(TForm)
    qryTmp: TQuery;
    cdsSps: TClientDataSet;
    dsrcSps: TDataSource;
    dbgrSps: TDBGrid;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    Splitter1: TSplitter;
    PanelRight: TPanel;
    dbgrPere: TDBGrid;
    dbgrNadb: TDBGrid;
    Splitter2: TSplitter;
    cdsSpsNR: TAutoIncField;
    cdsSpsTabN: TIntegerField;
    cdsSpsFamIO: TStringField;
    cdsSpsKdObj: TSmallintField;
    qryPrmUv: TQuery;
    qryPere: TQuery;
    qryNadb: TQuery;
    dsrcPere: TDataSource;
    dsrcNadb: TDataSource;
    qryPerePRCOKL: TFloatField;
    qryPereOKLTRF: TFloatField;
    qryPereKDSPZ: TSmallintField;
    qryPereSCHBU: TStringField;
    qryPereNOTES: TStringField;
    qryNadbKDSPS: TSmallintField;
    qryNadbVIDN: TStringField;
    qryNadbSHVIDN: TStringField;
    qryNadbSUMPROC: TFloatField;
    qryNadbSP: TStringField;
    qryNadbDT_BEG: TDateTimeField;
    qryNadbDT_END: TDateTimeField;
    qryNadbKDSPZ: TSmallintField;
    qryNadbSCHBU: TStringField;
    qryNadbNOTES: TStringField;
    qryNadbNRPKT: TIntegerField;
    qryNadbDTVPKT: TDateTimeField;
    cdsSpsOklTrf: TFloatField;
    cdsSpsSpec_NR: TIntegerField;
    qryCmbOkl: TQuery;
    sBtnPrt: TSpeedButton;
    cdsSpsDt_Beg: TDateField;
    qryPereKDoBJ: TSmallintField;
    qryNadbKdObj: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrSpsEnter(Sender: TObject);
    procedure dbgrSpsExit(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    d_DtBegMes, d_DtEndMes : TDateTime;
    procedure CreOpenCdsSps(dDtPrc : TDateTime);
    procedure AddRecToCdsSps(nTabN, nSpec_NR : integer; nKdObj : SmallInt;
                    dDt_Beg : TDateTime; nSmOkl : double; cFamIO : ShortString);
    function Uvolen(nTabN : integer) : boolean;
    function SumCmbOkl(nTabN, nSpec_NR : integer) : double;
  public
    { Public declarations }
  end;

procedure ShowSpsCmbOkl(dDtPrc : TDateTime);

const SECTION = 'z_SpsCmb';

var
  FormSpsCmbOkl: TFormSpsCmbOkl;

implementation

uses a_Const, a_DM, z_DM, z_Main, a_Lib, Z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowSpsCmbOkl(dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormSpsCmbOkl := TFormSpsCmbOkl.Create(Application);
  with FormSpsCmbOkl do begin
    d_DtBegMes := dDtPrc;
    d_DtEndMes := MyLastDoM(dDtPrc);
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Список сотрудников с "составными" окладами (окладами ' +
               'частями) на 01 ' + MesRod(nM) + ' ' + IntToStr(nY) + ' г.';
    CreOpenCdsSps(dDtPrc);
    with qryPere do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      DataSource := dsrcSps;
      SQL.Add('Select c.PrcOkl, c.OklTrf, c.KdSpZ, s.SchBU, c.KdObj, ' +
              ' c.Notes from z_CmbOkl c ' +
              ' Left outer join Kd_Sbu s on s.KdSch = c.KdSpZ ' +
              ' where c.TabN = :TabN and c.Spec_NR = :Spec_NR ' +
              ' order by s.SchBU');
      Open;
    end;
    with qryNadb do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      DataSource := dsrcSps;
      SQL.Add('Select n.KdSps, n.VidN, v.ShVidN, n.SumProc, n.SP, n.Dt_Beg, ' +
              ' n.Dt_End, n.KdSpZ, s.SchBU, n.KdObj, n.Notes, ' +
              ' n.NrPkt, n.DtVPkt from z_Nadb n ' +
              ' Left Outer Join z_KdVidN v on v.VidN = n.VidN ' +
              ' Left Outer Join Kd_Sbu s on s.KdSch = n.KdSpZ ' +
              ' where n.TabN = :TabN  and n.dt_Beg <= :d_DtEndMes and ' +
              ' (n.Dt_End is NULL or n.Dt_End > :d_DtEndMes) ' +
              ' order by n.VidN, s.SchBU, n.Dt_Beg');
      ParamByName('d_DtEndMes').AsDateTime := d_DtEndMes;
      Open;
    end;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsCmbOkl.AddRecToCdsSps(nTabN, nSpec_NR : integer;
                                        nKdObj : SmallInt; dDt_Beg : TDateTime;
                                         nSmOkl : double; cFamIO : ShortString);
begin
  with cdsSps do begin
    Append;
    cdsSpsTabN.AsInteger    := nTabN;
    cdsSpsKdObj.AsInteger   := nKdObj;
    cdsSpsSpec_NR.AsInteger := nSpec_NR;
    cdsSpsDt_Beg.AsDateTime := dDt_Beg;
    cdsSpsOklTrf.AsFloat    := nSmOkl;
    cdsSpsFamIO.AsString    := cFamIO;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsCmbOkl.CreOpenCdsSps(dDtPrc: TDateTime);
var cFamIO : ShortString; nTabN, nSpec_NR : integer;
    nKdObj : SmallInt; nSmOkl : double;
    dDt_Beg : TDateTime;
begin
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_PrmUv ' +
            ' where TabN = :nTabN and Dt_Priem <= :d_DtEndMes ' +
            ' order by Dt_Priem desc');
    ParamByName('d_DtEndMes').AsDateTime := d_DtEndMes; // не открываю
  end;
  with qryCmbOkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Sum(OklTrf) as SmOklTrf from z_CmbOkl ' +
            ' where TabN = :nTabN and Spec_NR = :nSpec_NR'); // не открываю
  end;
  with cdsSps do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct p.TabN, u.Fam, u.Ima, u.Otch, pr.Dt_Beg, ' +
            ' pr.KdObj, pr.OklTrf, pr.CmbOkl, pr.Spec_NR from z_Pere p ' +
            ' Left outer join z_Upi u on u.TabN = p.TabN ' +
            ' Left outer join GET_WRK_PERE (p.TabN, :d_DtEndMes) pr on 1=1 ' +
            ' where p.CmbOkl = "1" order by p.TabN');
    ParamByName('d_DtEndMes').AsDateTime := d_DtEndMes;
    Open;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      if (FieldByName('CmbOkl').AsString = '1') and not Uvolen(nTabN) then begin
        nSpec_NR := FieldByName('Spec_NR').AsInteger;
        nKdObj := FieldByName('KdObj').AsInteger;
        nSmOkl := SumCmbOkl(nTabN, nSpec_NR);
        cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                      FieldByName('Ima').AsString,
                                                  FieldByName('Otch').AsString);
        dDt_Beg := FieldByName('Dt_Beg').AsDateTime;
        AddRecToCdsSps(nTabN, nSpec_NR, nKdObj, dDt_Beg, nSmOkl, cFamIO);
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  cdsSps.First;
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryCmbOkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormSpsCmbOkl.SumCmbOkl(nTabN, nSpec_NR : integer) : double;
begin
  Result := 0;
  with qryCmbOkl do begin
    if Active then Close;
    {Select Sum(OklTrf) as SmOklTrf from z_CmbOkl
            where TabN = :nTabN and Spec_NR <= :nSpec_NR}
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('SmOklTrf').AsFloat;
    Close;
  end;    
end;
//------------------------------------------------------------------------------
function TFormSpsCmbOkl.Uvolen(nTabN: integer): boolean;
var bIsPriem : boolean;
begin
  Result := false;  // Считаю, что на дату начала месяца принят и не уволен
  bIsPriem := false;
  with qryPrmUv do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    bIsPriem := RecordCount > 0;
    if bIsPriem and (FieldByName('Dt_Priem').AsDateTime <= d_DtEndMes) then begin
      if FieldByName('Dt_Uvoln').IsNull or
                       (FieldByName('Dt_Uvoln').AsDateTime > d_DtEndMes) then
        Result := false   {принят на начало и не уволен на конец месяца}
      else if not FieldByName('Dt_Uvoln').IsNull and
                       (FieldByName('Dt_Uvoln').AsDateTime < d_DtBegMes) then
        Result := true;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsCmbOkl.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 700);
    dbgrSps.Width   := ReadInteger(SECTION, 'nGrSpsW', 295);
    dbgrNadb.Height := ReadInteger(SECTION, 'nGrNdbH', 200);
    Free;
  end;
  if FileExists(cDirVids + 'SpsCmb1.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'SpsCmb1.vid');
  if FileExists(cDirVids + 'SpsCmb02.vid') then
    dbgrPere.Columns.LoadFromFile(cDirVids + 'SpsCmb02.vid');
  if FileExists(cDirVids + 'SpsCmb03.vid') then
    dbgrNadb.Columns.LoadFromFile(cDirVids + 'SpsCmb03.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSpsCmbOkl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSps.Columns.SaveToFile(cDirVids + 'SpsCmb1.vid');
  dbgrPere.Columns.SaveToFile(cDirVids + 'SpsCmb02.vid');
  dbgrNadb.Columns.SaveToFile(cDirVids + 'SpsCmb03.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nGrSpsW', dbgrSps.Width);
    WriteInteger(SECTION, 'nGrNdbH', dbgrNadb.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsCmbOkl.dbgrSpsEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormSpsCmbOkl.dbgrSpsExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormSpsCmbOkl.sBtnPrtClick(Sender: TObject);
begin
  F6CmbOkl(d_DtBegMes, cdsSps, qryPere);     {Z_CmnPrt}
end;

end.
