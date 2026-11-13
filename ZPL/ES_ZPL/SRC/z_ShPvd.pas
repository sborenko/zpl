unit z_ShPvd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, ExtCtrls, Grids, DBGrids, DBTables, Buttons, StdCtrls;

type
  TFormShPvd = class(TForm)
    qryPvd: TQuery;
    dsrcPvd: TDataSource;
    dbgrPvd: TDBGrid;
    Panel1: TPanel;
    qryPvdNR: TIntegerField;
    qryPvdKDSPS: TSmallintField;
    qryPvdTABN: TIntegerField;
    qryPvdVIDN: TStringField;
    qryPvdOLDKDVIDN: TSmallintField;
    qryPvdSUMDOLG: TFloatField;
    qryPvdSUMVZN: TFloatField;
    qryPvdSPSRSCH: TSmallintField;
    qryPvdSP: TStringField;
    qryPvdNOMDOK: TStringField;
    qryPvdDT_BEG: TDateTimeField;
    qryPvdDT_END: TDateTimeField;
    qryPvdKDSPZ: TSmallintField;
    qryPvdKDRSSCH: TIntegerField;
    qryPvdKOMU: TStringField;
    qryPvdADRES: TStringField;
    qryPvdKDPST: TIntegerField;
    qryPvdPOSTA: TStringField;
    qryPvdNOTES: TStringField;
    qryPvdNOMSBERBANK: TStringField;
    qryPvdLICSCHET: TStringField;
    qryPvdRSCHET: TStringField;
    qryPvdBANK: TStringField;
    qryPvdOKPOBANKA: TStringField;
    qryPvdPROC_PSB: TFloatField;
    qryPvdSPEC_NR: TIntegerField;
    qryPvdFAM: TStringField;
    qryPvdIMA: TStringField;
    qryPvdOTCH: TStringField;
    qryPvdFamIO: TStringField;
    bBtnCancel: TBitBtn;
    sBtnPrt: TSpeedButton;
    rBtnAll6611: TRadioButton;
    rBtnOnlyActual: TRadioButton;
    Label1: TLabel;
    procedure qryPvdCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rBtnOnlyActualClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    procedure OpenQryPvd(dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

procedure ShowPostPvd(dDtPrc : TDateTime);

const SECTION = 'z_ShPvd';

var
  FormShPvd: TFormShPvd;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowPostPvd(dDtPrc : TDateTime);
begin
  FormShPvd := TFormShPvd.Create(Application);
  with FormShPvd do begin
    d_DtPrc := dDtPrc;
    Caption := 'Получатели переводов (Вид 6611)';
    OpenQryPvd(dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShPvd.OpenQryPvd(dDtPrc: TDateTime);
var dDtBegMes, dDtEndMes : TDateTime; nSvTabN : integer;
begin
  dDtBegMes := dDtPrc;
  dDtEndMes := MyLastDOM(dDtPrc);
  nSvTabN := 0;
  with qryPvd do begin
    if Active then begin
      nSvTabN := FieldByName('TabN').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, ud.* from z_Uderg ud ' +
            ' Left Outer Join z_Upi u on u.TabN = ud.TabN ' +
            ' where (ud.VidN = "6611") ');
    if rBtnOnlyActual.Checked then
      SQL.Add(' and (ud.Dt_Beg <= :dDtEndMes) and ' +
              ' (ud.Dt_End is NULL or ud.Dt_End >= :dDtBegMes) ');

    SQL.Add(' order by ud.TabN, ud.Dt_Beg');
    if rBtnOnlyActual.Checked then begin
      ParamByName('dDtBegMes').AsDateTime := dDtBegMes;
      ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
    end;
    Open;
    if nSvTabN > 0 then
      Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShPvd.qryPvdCalcFields(DataSet: TDataSet);
begin
  qryPvdFamIO.AsString := MyFamIO(qryPvdFam.AsString, qryPvdIma.AsString,
                                                      qryPvdOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShPvd.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 775);
    rBtnAll6611.Checked := ReadBool(SECTION, 'bAll6611', true);
    rBtnOnlyActual.Checked := not rBtnAll6611.Checked;
    Free;
  end;
  sBtnPrt.Visible := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormShPvd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bAll6611', rBtnAll6611.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShPvd.rBtnOnlyActualClick(Sender: TObject);
begin
  OpenQryPvd(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormShPvd.sBtnPrtClick(Sender: TObject);
begin
  ShowMessage('Sorry...  Не готово' + #13#10 + '( Сделать срочно ! )');
end;

end.
