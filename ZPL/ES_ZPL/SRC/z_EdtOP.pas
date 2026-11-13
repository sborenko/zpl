unit z_EdtOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, Grids, DBGrids, StdCtrls, ExtCtrls, DBTables;

type
  TFormOP_042011 = class(TForm)
    qryOP: TQuery;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dsrcOP: TDataSource;
    dbgrOP: TDBGrid;
    qryOPNR: TIntegerField;
    qryOPDTPROC: TDateTimeField;
    qryOPZAMESGOD: TDateTimeField;
    qryOPTABN: TIntegerField;
    qryOPVIDN: TStringField;
    qryOPCHAS: TFloatField;
    qryOPSUMMA: TFloatField;
    qryOPDT_BEG: TDateTimeField;
    qryOPDT_END: TDateTimeField;
    qryOPKDSPS: TSmallintField;
    qryOPKDOBJ: TSmallintField;
    qryOPKDKATP: TSmallintField;
    qryOPKDSPZ: TSmallintField;
    qryOPOZN_PILG: TStringField;
    qryOPPDN: TSmallintField;
    qryOPNOTES: TStringField;
    qryOPPRR: TSmallintField;
    qryOPPRPV: TSmallintField;
    qryOPKTO: TSmallintField;
    qryOPPRKR: TSmallintField;
    qryOPMYNOTES: TStringField;
    qryOPSPECPS: TIntegerField;
    qryOPSPEC_NR: TIntegerField;
    qryOPOLDKDOBJ: TSmallintField;
    qryOPOLDKDVIDN: TSmallintField;
    qryOPDTVDPV: TDateTimeField;
    qryOPNRVDPV: TIntegerField;
    qryOPSTORN: TStringField;
    qryOPPLG: TSmallintField;
    qryOPKDBNK: TSmallintField;
    SpeedButton1: TSpeedButton;
    LabelCntRec: TLabel;
    qryTmp: TQuery;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryOP;
    procedure DoPravka;
  public
    { Public declarations }
  end;

procedure EdtOP_042011;

const SECTION = 'z_EdtOP';

var
  FormOP_042011: TFormOP_042011;

implementation

uses A_Const, A_DM, z_DM, Z_Main, A_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure EdtOP_042011;
begin
  FormOP_042011 := TFormOP_042011.Create(Application);
  with FormOP_042011 do begin
    Caption := 'Правка OZN_PILG в Z_NU за 04-2011';
    OpenQryOP;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOP_042011.DoPravka;
var nTabN : integer; dDtPrc, dZaMG : TDateTime; cOznPilg : ShortString;
begin
  dDtPrc := EncodeDate(2011, 4, 1);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Z_NU set Ozn_Pilg = :cOznPilg where TabN = :nTabN and ' +
            ' DtProc = :dDtPrc and ZaMesGod = :dZaMG');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  with qryOP do begin
    First;
    while not Eof do begin
      nTabN := qryOpTabN.AsInteger;
      dZaMG := qryOpZaMesGod.AsDateTime;
      while (qryOpTabN.AsInteger = nTabN) and
               (qryOpZaMesGod.AsDateTime = dZaMG) and not Eof do begin
        cOznPilg := qryOpOzn_Pilg.AsString;
        Next;
      end;
      cOznPilg := Trim(cOznPilg);
      if cOznPilg = ';' then
        cOznPilg := '2;';
      qryTmp.ParamByName('nTabN').AsInteger := nTabN;
      qryTmp.ParamByName('dZaMG').AsDateTime := dZaMG;
      qryTmp.ParamByName('cOznPilg').AsString := cOznPilg;
      qryTmp.ExecSQL;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOP_042011.OpenQryOP;
begin
  with qryOP do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := 'C_TEMP';
    SQL.Add('Select * from pn0411_Lg order by TabN, ZaMesGod');
    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOP_042011.SpeedButton1Click(Sender: TObject);
begin
  DoPravka;
end;

end.
