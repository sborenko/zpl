unit z_104Ndb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBTables, Grids, DBGrids, Buttons, StdCtrls;

type
  TFormAddNadb106 = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnGo: TSpeedButton;
    dbgrOldNu: TDBGrid;
    qryOld: TQuery;
    dsrcOldNu: TDataSource;
    qryNew: TQuery;
    qryOldNewTabN: TIntegerField;
    qryOldNewVidN: TStringField;
    qryOldNewKdSbu: TSmallintField;
    qryOldNewKdObj: TSmallintField;
    qryOldTabN: TFloatField;
    qryOldVidN: TSmallintField;
    qryOldSUMPROC: TFloatField;
    qryOldSP: TStringField;
    qryOldDT_BEG: TDateField;
    qryOldDT_END: TDateField;
    qryOldSZatr: TStringField;
    qryOldObj: TSmallintField;
    qryOldVED: TSmallintField;
    qryOldKAT: TSmallintField;
    qryOldDOLGNOST: TStringField;
    qryOldNR_PRIKAZA: TStringField;
    qryOldDT_PRIKAZA: TDateField;
    qryOldNR_PRIKEND: TStringField;
    qryOldDT_PRIKEND: TDateField;
    procedure sBtnGoClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryOld;
  public
    { Public declarations }
  end;

procedure AddNadb106;

var
  FormAddNadb106: TFormAddNadb106;

implementation

uses a_Const, a_DM, Z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddNadb106;
begin
  FormAddNadb106 := TFormAddNadb106.Create(Application);
  with FormAddNadb106 do begin
    OpenQryOld;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddNadb106.OpenQryOld;
begin
  with qryOld do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '__U_106';
    SQL.Add('Select u.NewTabN, v.NewVidN, s.NewKdSbu, o.NewKdObj, n.* ' +
            ' from nadb_106 n ' +
            ' Left outer join u106_2 u on u.TabN = n.TabN ' +
            ' Left outer join Vids_106 v on v.VidN = n.VidN ' +
            ' Left outer join SpZ_106 s on s.SZatr = n.SZatr ' +
            ' Left outer join op_106 o on o.Obj = n.Obj ' +
            ' order by n.TabN, n.Dt_Beg, n.VidN ');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddNadb106.sBtnGoClick(Sender: TObject);
var nTabN : integer;
begin
  with qryNew do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Nadb (KDSPS, SPSRSCH, TABN, VIDN, OLDKDVIDN, ' +
            ' SUMPROC, SP, DT_BEG, DT_END, OLDKDOBJ, KDOBJ, ' +
            ' KDSPZ, NOTES, NRPRBEG, DTPRBEG, NRPREND, DTPREND) values ' +
            ' (:nKdSps, :nSpsRsch, :nTabN, :cVidN, :nOldKdVidN, ' +
            ' :nSumProc, :cSP, :dDt_Beg, :dDt_End, :nOldKdObj, :nKdObj, ' +
            ' :nKdSpZ, :cNotes, :cNrPrBeg, :dDtPrBeg, :cNrPrEnd, :dDtPrEnd)');
    Prepare;
  end;
  with qryOld do begin
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        qryNew.Close;
        qryNew.ParamByName('nKdSps').AsInteger := 4; // править для 316
        if FieldByName('SP').AsString = '%' then begin
          qryNew.ParamByName('nSpsRsch').AsInteger := 1;
          qryNew.ParamByName('cSP').AsString := '%'; end
        else begin
          qryNew.ParamByName('nSpsRsch').AsInteger := 2;
          qryNew.ParamByName('cSP').AsString := 'Р';
        end;
        qryNew.ParamByName('nTabN').AsInteger := FieldByName('NewTabN').AsInteger;
        qryNew.ParamByName('cVidN').AsString := FieldByName('NewVidN').AsString;
        qryNew.ParamByName('nOldKdVidN').AsInteger := FieldByName('VidN').AsInteger;
        qryNew.ParamByName('nSumProc').AsFloat := FieldByName('SumProc').AsFloat;
        qryNew.ParamByName('dDt_Beg').AsDateTime := FieldByName('Dt_Beg').AsDateTime;
        qryNew.ParamByName('dDt_End').AsDateTime := FieldByName('Dt_End').AsDateTime;
        qryNew.ParamByName('nOldKdObj').AsInteger := FieldByName('Obj').AsInteger;
        qryNew.ParamByName('nKdObj').AsInteger := FieldByName('NewKdObj').AsInteger;
        qryNew.ParamByName('nKdSpZ').AsInteger := FieldByName('NewKdSbu').AsInteger;
        qryNew.ParamByName('cNotes').AsString := FieldByName('Dolgnost').AsString;
        qryNew.ParamByName('cNrPrBeg').AsString := FieldByName('Nr_Prikaza').AsString;
        qryNew.ParamByName('dDtPrBeg').AsDateTime := FieldByName('Dt_Prikaza').AsDateTime;
        qryNew.ParamByName('cNrPrEnd').AsString := FieldByName('Nr_PrikEnd').AsString;
        qryNew.ParamByName('dDtPrEnd').AsDateTime := FieldByName('Dt_PrikEnd').AsDateTime;
        qryNew.ExecSQL;
        Next;
      end;
    end;
  end;
  with qryNew do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
    if Prepared then
      UnPrepare;
    DataBaseName := CESMAIN;
    SQL.Add('Update z_Nadb set Dt_Beg = null where Dt_Beg = "12/30/1899"');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Update z_Nadb set Dt_End = null where Dt_End = "12/30/1899"');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Update z_Nadb set DtPrBeg = null where DtPrBeg = "12/30/1899"');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Update z_Nadb set DtPrEnd = null where DtPrEnd = "12/30/1899"');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

end.
