unit z_Subs3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Math, IniFiles, Dialogs, DBTables, DB, DBClient, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls;

type
  TFormSubs3 = class(TForm)
    cdsSubs: TClientDataSet;
    qryTmp: TQuery;
    dbgrSubs: TDBGrid;
    dsrcSubs: TDataSource;
    cdsSubsdtPrc: TDateField;
    cdsSubsSmDhd: TFloatField;
    cdsSubsSmNeOblMP: TFloatField;
    cdsSubsSmOblMP: TFloatField;
    cdsSubsSmPdn: TFloatField;
    cdsSubsSmPdnOblMP: TFloatField;
    cdsSubsSmAlim: TFloatField;
    cdsSubsSmDeti: TFloatField;
    PanelButtons: TPanel;
    Label1: TLabel;
    bBtnPrtSubs3: TBitBtn;
    bBtnClose: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bBtnPrtSubs3Click(Sender: TObject);
  private
    { Private declarations }
    n_TabN : integer;
    d_DtBeg, d_DtEnd, d_DtPrtDoc : TDateTime;
    procedure CreOpenCdsSubs(nTabN : integer; dDtBeg, dDtEnd : TDateTime);
    procedure AddSmDhd(dDtProc : TDateTime; nSmm : double);
    procedure AddSmNeOblMP(dDtProc : TDateTime; nSmm : double);
    procedure AddSmOblMP(dDtProc : TDateTime; nSmm : double);
    procedure AddSmPdn(dDtProc : TDateTime; nSmm : double);
    procedure AddSmAlim(dDtProc :TDateTime; nSmm : double);


  public
    { Public declarations }
  end;

procedure  ShwSprSubs3(nTabN : integer; dDtBeg, dDtEnd, dDtPrtDoc : TDateTime);

const SECTION = 'z_Subs3';

var
  FormSubs3: TFormSubs3;

implementation

uses a_Const, a_DM, z_DM, Z_Main, z_GtQUpi, Z_ShVbFm, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure  ShwSprSubs3(nTabN : integer; dDtBeg, dDtEnd, dDtPrtDoc : TDateTime);
begin
  FormSubs3 := TFormSubs3.Create(Application);
  with FormSubs3 do begin
    n_TabN := nTabN;
    d_DtBeg := dDtBeg;
    d_DtEnd := dDtEnd;
    d_DtPrtDoc := dDtPrtDoc;
    CreOpenCdsSubs(nTabN, dDtBeg, dDtEnd);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSubs3.AddSmDhd(dDtProc: TDateTime; nSmm: double);
begin
  with cdsSubs do begin
    if not Locate('dtPrc', dDtProc, []) then begin
      Append;
      FieldByName('dtPrc').AsDateTime := dDtProc; end
    else
      Edit;
    FieldByName('SmDhd').AsFloat := FieldByName('SmDhd').AsFloat + nSmm;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSubs3.AddSmNeOblMP(dDtProc: TDateTime; nSmm: double);
begin
  with cdsSubs do begin
    if not Locate('dtPrc', dDtProc, []) then begin
      Append;
      FieldByName('dtPrc').AsDateTime := dDtProc; end
    else
      Edit;
    FieldByName('SmNeOblMP').AsFloat := FieldByName('SmNeOblMP').AsFloat + nSmm;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSubs3.AddSmOblMP(dDtProc: TDateTime; nSmm: double);
begin
  with cdsSubs do begin
    if not Locate('dtPrc', dDtProc, []) then begin
      Append;
      FieldByName('dtPrc').AsDateTime := dDtProc; end
    else
      Edit;
    FieldByName('SmOblMP').AsFloat := FieldByName('SmOblMP').AsFloat + nSmm;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSubs3.AddSmPdn(dDtProc: TDateTime; nSmm: double);
begin
  with cdsSubs do begin
    if not Locate('dtPrc', dDtProc, []) then begin
      Append;
      FieldByName('dtPrc').AsDateTime := dDtProc; end
    else
      Edit;
    FieldByName('SmPdn').AsFloat := FieldByName('SmPdn').AsFloat + nSmm;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSubs3.AddSmAlim(dDtProc: TDateTime; nSmm: double);
begin
  with cdsSubs do begin
    if not Locate('dtPrc', dDtProc, []) then begin
      Append;
      FieldByName('dtPrc').AsDateTime := dDtProc; end
    else
      Edit;
    FieldByName('SmAlim').AsFloat := FieldByName('SmAlim').AsFloat + nSmm;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSubs3.CreOpenCdsSubs(nTabN: integer; dDtBeg, dDtEnd: TDateTime);
var nSmDhd, nSmOblMP, nSmNeOblMP, nSmPdn, nSmPdnOblMP : double;
begin
  with cdsSubs do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;    //все виды дохода
    DataBaseName := CESMAIN;
    SQL.Add('Select dtProc, Round(Sum(Summa), 2) SMM from ViNuMain ' +
            ' where TabN = :nTabN and VidN < "5000" and ' +
            ' dtProc >= :dDtBeg and ' +
            ' dtProc <= :dDtEnd and Dhd = "1" group by dtProc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    while not Eof do begin
      AddSmDhd(FieldByName('DtProc').AsDateTime, FieldByName('Smm').AsFloat);
      Next;
    end;
    Close;
    SQL.Clear;     //вид 1801 НЕ облагаемая матпомощь
    SQL.Add('Select dtProc, Round(Sum(Summa), 2) SMM from ViNuMain ' +
            ' where TabN = :nTabN and VidN = "1801" and ' +
            ' dtProc >= :dDtBeg and ' +
            ' dtProc <= :dDtEnd group by dtProc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    while not Eof do begin
      AddSmNeOblMP(FieldByName('DtProc').AsDateTime, FieldByName('Smm').AsFloat);
      Next;
    end;
    Close;
    SQL.Clear;   //виды 1802,1803,1804,1805,1810 облагаемая матпомощь
    SQL.Add('Select dtProc, Round(Sum(Summa), 2) SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' VidN in("1802","1803","1804","1805","1810") and ' +
            ' dtProc >= :dDtBeg and ' +
            ' dtProc <= :dDtEnd group by dtProc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    while not Eof do begin
      AddSmOblMP(FieldByName('DtProc').AsDateTime, FieldByName('Smm').AsFloat);
      Next;
    end;
    Close;
    SQL.Clear;    //вид 6001 - подоходный налог общий
    SQL.Add('Select dtProc, Round(Sum(Summa), 2) SMM from ViNuMain ' +
            ' where TabN = :nTabN and VidN = "6001" and ' +
            ' dtProc >= :dDtBeg and ' +
            ' dtProc <= :dDtEnd group by dtProc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    while not Eof do begin
      AddSmPdn(FieldByName('DtProc').AsDateTime, FieldByName('Smm').AsFloat);
      Next;
    end;
    Close;
    SQL.Clear;   //вид 6601 алименты
    SQL.Add('Select dtProc, Round(Sum(Summa), 2) SMM from ViNuMain ' +
            ' where TabN = :nTabN and VidN = "6601" and ' +
            ' dtProc >= :dDtBeg and ' +
            ' dtProc <= :dDtEnd group by dtProc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    while not Eof do begin
      AddSmAlim(FieldByName('DtProc').AsDateTime, FieldByName('Smm').AsFloat);
      Next;
    end;
    Close;
  end;
  with cdsSubs do begin
    First;
    while not Eof do begin
      //nSmDhd, nSmOblMP, nSmNeOblMP, nSmPdn, nSmPdnOblMP : double;
      nSmDhd := FieldByName('SmDhd').AsFloat;
      nSmOblMP := FieldByName('SmOblMP').AsFloat;
      nSmNeOblMP := FieldByName('SmNeOblMP').AsFloat;
      nSmPdn := FieldByName('SmPdn').AsFloat;
      if (nSmPdn <> 0) and (nSmOblMP <> 0) then begin
        nSmPdnOblMP := RoundTo(nSmPdn / (nSmDhd - nSmNeOblMP) * nSmOblMP, -2);
        nSmPdn := nSmPdn - nSmPdnOblMP;
        if nSmPdnOblMP <> 0 then begin
          Edit;
          FieldByName('SmPdn').AsFloat := nSmPdn;
          FieldByName('SmPdnOblMP').AsFloat := nSmPdnOblMP;
          Post;
        end;
      end;
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSubs3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormSubs3.FormCreate(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormSubs3.bBtnPrtSubs3Click(Sender: TObject);
var nTabN : integer;  dDtBeg, dDtEnd : TDateTime;
begin
    F6PrtSprSubs3(n_TabN, d_DtBeg, d_DtEnd, d_DtPrtDoc, cdsSubs); {z_CmnPrt}
end;

end.
