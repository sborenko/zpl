unit z_104Otk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBTables, Grids, DBGrids, Buttons, StdCtrls;

type
  TFormAddOtkl104 = class(TForm)
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
    qryOldDtProc: TDateField;
    qryOldZaMesGod: TDateField;
    qryOldObj: TSmallintField;
    qryOldDt_Beg: TDateField;
    qryOldDt_End: TDateField;
    qryOldVidN: TSmallintField;
    qryOldPdn: TSmallintField;
    qryOldChas: TFloatField;
    qryOldSumma: TFloatField;
    qryOldSZatr: TStringField;
    qryOldOtkuda: TStringField;
    qryOldPrPV: TSmallintField;
    qryOldTabN: TFloatField;
    qryOldVed: TSmallintField;
    procedure sBtnGoClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryOld;
  public
    { Public declarations }
  end;

procedure AddOtkl104;

var
  FormAddOtkl104: TFormAddOtkl104;

implementation

uses a_Const, a_DM, Z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddOtkl104;
begin
  FormAddOtkl104 := TFormAddOtkl104.Create(Application);
  with FormAddOtkl104 do begin
    OpenQryOld;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddOtkl104.OpenQryOld;
begin
  with qryOld do begin
    if not Active then Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddOtkl104.sBtnGoClick(Sender: TObject);
var nTabN : integer;
begin
  with qryNew do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Otkl (DTPROC, ZAMESGOD, TABN, VIDN, CHAS, SUMMA, ' +
            ' DT_BEG, DT_END, KDSPS, KDOBJ, KDKATP, KDSPZ, PDN, NOTES, ' +
            ' PRPV, MYNOTES, OLDKDOBJ, OLDKDVIDN) values ' +
            ' (:DTPROC, :ZAMESGOD, :TABN, :VIDN, :CHAS, :SUMMA, ' +
            ' :DT_BEG, :DT_END, :KDSPS, :KDOBJ, :KDKATP, :KDSPZ, :PDN, ' +
            ' :NOTES, :PRPV, :MYNOTES, :OLDKDOBJ, :OLDKDVIDN)');
    Prepare;
  end;
  with qryOld do begin
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        qryNew.Close;
        qryNew.ParamByName('DtProc').AsDateTime :=
                                           FieldByName('DtProc').AsDateTime;
        qryNew.ParamByName('ZaMesGod').AsDateTime :=
                                           FieldByName('ZaMesGod').AsDateTime;
        qryNew.ParamByName('TabN').AsInteger :=
                                           FieldByName('NewTabN').AsInteger;
        qryNew.ParamByName('VidN').AsString := FieldByName('NewVidN').AsString;
        qryNew.ParamByName('Chas').AsFloat := FieldByName('Chas').AsFloat;
        qryNew.ParamByName('Summa').AsFloat := FieldByName('Summa').AsFloat;
        qryNew.ParamByName('Dt_Beg').AsDateTime :=
                                           FieldByName('Dt_Beg').AsDateTime;
        qryNew.ParamByName('Dt_End').AsDateTime :=
                                           FieldByName('Dt_End').AsDateTime;
        qryNew.ParamByName('KdSps').AsInteger := 6; // äëÿ ÍÈ× 316
        qryNew.ParamByName('KdObj').AsInteger :=
                                           FieldByName('NewKdObj').AsInteger;
        qryNew.ParamByName('KdKatP').AsInteger := 0;
        qryNew.ParamByName('KdSpZ').AsInteger :=
                                           FieldByName('NewKdSbu').AsInteger;
        qryNew.ParamByName('PdN').AsInteger := FieldByName('PdN').AsInteger;
        qryNew.ParamByName('Notes').AsString := FieldByName('Otkuda').AsString;
        qryNew.ParamByName('PrPV').AsInteger := FieldByName('PrPV').AsInteger;
        qryNew.ParamByName('MyNotes').AsString := 'ÍÈ× ØÏÇ ' +
                             FieldByName('SZatr').AsString;  // äëÿ ÍÈ× 316
        qryNew.ParamByName('OldKdObj').AsInteger :=
                                          FieldByName('Obj').AsInteger * 1000 +
                                                   FieldByName('Ved').AsInteger;
        qryNew.ParamByName('OldKdVidN').AsInteger :=
                                          FieldByName('VidN').AsInteger;
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
  end;
end;

end.
