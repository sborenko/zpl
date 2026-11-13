unit z_DpOtkl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB;

type
  TFormAddOtkl = class(TForm)
    Query1: TQuery;
    Query2: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    UpdateSQL1: TUpdateSQL;
    Query2NR: TIntegerField;
    Query2KDSPS: TSmallintField;
    Query2DTPROC: TDateTimeField;
    Query2ZAMESGOD: TDateTimeField;
    Query2TABN: TIntegerField;
    Query2VIDN: TStringField;
    Query2OLDKDVIDN: TSmallintField;
    Query2CHAS: TFloatField;
    Query2SUMMA: TFloatField;
    Query2OLDKDOBJ: TSmallintField;
    Query2KDOBJ: TSmallintField;
    Query2KDKATP: TSmallintField;
    Query2DT_BEG: TDateTimeField;
    Query2DT_END: TDateTimeField;
    Query2PDN: TSmallintField;
    Query2KDSPZ: TSmallintField;
    Query2NOTES: TStringField;
    Query2PRR: TSmallintField;
    Query2PRPV: TSmallintField;
    Query2KTO: TSmallintField;
    Query2PRKR: TSmallintField;
    Query2SPEC_NR: TIntegerField;
    Query2DTVDPV: TDateTimeField;
    Query2NRVDPV: TIntegerField;
    Query2MYNOTES: TStringField;
    Query2SPECPS: TIntegerField;
    Query2PBNK: TSmallintField;
    Query2STORN: TStringField;
    Query1NR: TFloatField;
    Query1TABN: TFloatField;
    Query1FAM: TStringField;
    Query1IMA: TStringField;
    Query1OTCH: TStringField;
    Query1DTPROC: TDateField;
    Query1SMM: TFloatField;
    Query1PRP: TFloatField;
    Query1PFIND: TFloatField;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    dDtPrc : TDateTime;
    procedure AddOtklToZOtkl;
  public
    { Public declarations }
  end;

procedure AddOtkl;

var
  FormAddOtkl: TFormAddOtkl;

implementation

uses a_Const, a_DM, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddOtkl;
begin
  FormAddOtkl := TFormAddOtkl.Create(Application);
  with FormAddOtkl do begin
    dDtPrc := EncodeDate(2007, 9, 1);
    Query1.Open;
    Query2.Open;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddOtkl.AddOtklToZOtkl;
begin
  Query2.Append;
  Query2KDSPS.AsInteger   := 1;
  Query2DTPROC.AsDateTime := dDtPrc;
  Query2ZAMESGOD.AsString := Query1DtProc.AsString;
  Query2TABN.AsString     := Query1TABN.AsString;
  Query2VIDN.AsString     := '6402';
  Query2CHAS.AsInteger    := 0;
  Query2SUMMA.AsFloat     := Query1PfInd.AsFloat;
  Query2KDOBJ.AsInteger   := 3901;
  Query2KDKATP.AsInteger  := 1;
  Query2PDN.AsInteger     := 0;
  Query2KDSPZ.AsInteger   := 1385;
  Query2NOTES.AsString    := 'Возвр.удерж';
  Query2PRPV.AsInteger    := 1;
  Query2MYNOTES.AsString  := 'Borenko';
  Query2.Post;
(*
  Query2KDSPS.AsString :=     Query1KDSPS.AsString;
  Query2DTPROC.AsString :=    Query1DTPROC.AsString;
  Query2ZAMESGOD.AsString :=  Query1ZAMESGOD.AsString;
  Query2TABN.AsString :=      Query1TABN.AsString;
  Query2VIDN.AsString :=      Query1VIDN.AsString;
  Query2CHAS.AsString :=      Query1CHAS.AsString;
  Query2SUMMA.AsString :=     Query1SUMMA.AsString;
  Query2KDOBJ.AsString :=     Query1KDOBJ.AsString;
  Query2KDKATP.AsString :=    Query1KDKATP.AsString;
  Query2DT_BEG.AsString :=    Query1DT_BEG.AsString;
  Query2DT_END.AsString :=    Query1DT_END.AsString;
  Query2PDN.AsString :=       Query1PDN.AsString;
  Query2KDSPZ.AsString :=     Query1KDSPZ.AsString;
  Query2NOTES.AsString :=     Query1NOTES.AsString;
  Query2PRR.AsString :=       Query1PRR.AsString;
  Query2PRPV.AsString :=      Query1PRPV.AsString;
  Query2KTO.AsString :=       Query1KTO.AsString;
  Query2PRKR.AsString :=      Query1PRKR.AsString;
  Query2SPEC_NR.AsString :=   Query1SPEC_NR.AsString;
  Query2DTVDPV.AsString :=    Query1DTVDPV.AsString;
  Query2NRVDPV.AsString :=    Query1NRVDPV.AsString;
  Query2MYNOTES.AsString :=   Query1MYNOTES.AsString;
  Query2SPECPS.AsString :=    Query1SPECPS.AsString;
  Query2PBNK.AsString :=      Query1PBNK.AsString;
  Query2STORN.AsString :=     Query1STORN.AsString;
  Query2.Post;
*)
end;
//------------------------------------------------------------------------------
procedure TFormAddOtkl.SpeedButton1Click(Sender: TObject);
begin
  if not Query2.Active then
    Query2.Open;
  with Query1 do begin
    if not Active then Open;
    First;
    while not Eof do begin
      AddOtklToZOtkl;
      Next;
    end;
  end;
  Form_Dm.DbMain.ApplyUpdates([query2]);
end;

end.
