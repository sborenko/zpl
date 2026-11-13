unit z_104Nu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBTables, Grids, DBGrids, Buttons, StdCtrls;

type
  TFormAddNu104 = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnGo: TSpeedButton;
    dbgrOldNu: TDBGrid;
    qryOld: TQuery;
    dsrcOldNu: TDataSource;
    qryNew: TQuery;
    qryOldNR: TIntegerField;
    qryOldNewKdObj: TSmallintField;
    qryOldNewTabN: TIntegerField;
    qryOldNewVidN: TStringField;
    qryOldNewKdSbu: TSmallintField;
    qryOldTabN: TSmallintField;
    qryOldDtProc: TDateField;
    qryOldZaMesGod: TDateField;
    qryOldObj: TSmallintField;
    qryOldVed: TSmallintField;
    qryOldDt_Beg: TDateField;
    qryOldDt_End: TDateField;
    qryOldVidN: TSmallintField;
    qryOldPdn: TSmallintField;
    qryOldChas: TFloatField;
    qryOldSumma: TFloatField;
    qryOldSZatr: TStringField;
    qryOldOtkuda: TStringField;
    qryOldPrr: TSmallintField;
    qryOldPrPV: TSmallintField;
    procedure sBtnGoClick(Sender: TObject);
    procedure qryNewAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure OpenqryOld;
  public
    { Public declarations }
  end;

procedure AddNu104;

var
  FormAddNu104: TFormAddNu104;

implementation

uses a_Const, a_DM, Z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddNu104;
begin
  FormAddNu104 := TFormAddNu104.Create(Application);
  with FormAddNu104 do begin
    OpenqryOld;
    qryNew.Open;
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormAddNu104.OpenqryOld;
begin
  if not qryOld.Active then
    qryOld.Open;
end;
//------------------------------------------------------------------------------
procedure TFormAddNu104.sBtnGoClick(Sender: TObject);
var nTabN : integer;
begin
  with qryNew do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_NU (DTPROC, ZAMESGOD, TABN, VIDN, CHAS, SUMMA, ' +
            ' DT_BEG, DT_END, KDSPS, KDOBJ, KDKATP, KDSPZ, PDN, NOTES, ' +
            ' PRR, PRPV, MYNOTES, OLDKDOBJ, OLDKDVIDN) values ' +
            ' (:DTPROC, :ZAMESGOD, :TABN, :VIDN, :CHAS, :SUMMA, ' +
            ' :DT_BEG, :DT_END, :KDSPS, :KDOBJ, :KDKATP, :KDSPZ, :PDN, ' +
            ' :NOTES, :PRR, :PRPV, :MYNOTES, :OLDKDOBJ, :OLDKDVIDN)');
    Prepare;
  end;
  with qryOld do begin
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      if nTabN >= 1 then while (FieldByName('TabN').AsInteger = nTabN) and
                                                               not Eof do begin
        qryNew.Close;
        qryNew.ParamByName('DtProc').AsDateTime :=
                                         FieldByName('DtProc').AsDateTime;
        qryNew.ParamByName('ZaMesGod').AsDateTime :=
                                         FieldByName('ZaMesGod').AsDateTime;
        qryNew.ParamByName('TabN').AsInteger :=
                                         FieldByName('NewTabN').AsInteger;
        qryNew.ParamByName('VidN').AsString :=
                                         FieldByName('NewVidN').AsString;
        qryNew.ParamByName('Chas').AsFloat :=
                                         FieldByName('Chas').AsFloat;
        qryNew.ParamByName('Summa').AsFloat :=
                                         FieldByName('Summa').AsFloat;
        qryNew.ParamByName('Dt_Beg').AsDateTime :=
                                         FieldByName('Dt_Beg').AsDateTime;
        qryNew.ParamByName('Dt_End').AsDateTime :=
                                         FieldByName('Dt_End').AsDateTime;
        qryNew.ParamByName('KdSps').AsInteger := 6; // Äëÿ 316
        qryNew.ParamByName('KdObj').AsInteger :=
                                         FieldByName('NewKdObj').AsInteger;
        qryNew.ParamByName('KdKatP').AsInteger := 0;
        qryNew.ParamByName('KdSpZ').AsInteger :=
                                         FieldByName('NewKdSbu').AsInteger;
        qryNew.ParamByName('PdN').AsInteger :=
                                         FieldByName('PdN').AsInteger;
        qryNew.ParamByName('Notes').AsString :=
                                         FieldByName('Otkuda').AsString;
        qryNew.ParamByName('PRR').AsInteger :=
                                         FieldByName('PRR').AsInteger;
        qryNew.ParamByName('PrPV').AsInteger :=
                                         FieldByName('PrPV').AsInteger;
        qryNew.ParamByName('MyNotes').AsString := 'ÍÈ× ØÏÇ ' +
                                                FieldByName('SZatr').AsString;
        qryNew.ParamByName('OldKdObj').AsInteger :=
                                         FieldByName('Obj').AsInteger * 1000 +
                                                  FieldByName('Ved').AsInteger;
        qryNew.ParamByName('OldKdVidN').AsInteger :=
                                         FieldByName('VidN').AsInteger;
        qryNew.ExecSQL;
        Next; end
      else while (FieldByName('TabN').AsInteger = nTabN) and  not Eof do begin
        Next;
        Continue;
      end;
    end;
  end;
  with qryNew do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
    if Prepared then
      UnPrepare;
  end;

end;
//------------------------------------------------------------------------------
procedure TFormAddNu104.qryNewAfterPost(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryNew]);
end;

end.
