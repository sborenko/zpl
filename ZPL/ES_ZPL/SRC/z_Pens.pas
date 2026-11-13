unit z_Pens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, DBTables, DBCtrls;

type
  TFormPens = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dbgrP: TDBGrid;
    qryP: TQuery;
    LabelCntRec: TLabel;
    dsrcP: TDataSource;
    qryPTABN: TIntegerField;
    qryPFAM: TStringField;
    qryPIMA: TStringField;
    qryPOTCH: TStringField;
    qryPDT_BEG: TDateTimeField;
    qryPDOLGNOST: TStringField;
    qryPOKLTRF: TFloatField;
    qryPPR_PENS: TSmallintField;
    qryPFamIO: TStringField;
    qryPSOVM: TSmallintField;
    DBNavigator1: TDBNavigator;
    sBtnPrt: TSpeedButton;
    qryPCNT: TIntegerField;
    qryPSMM: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryPCalcFields(DataSet: TDataSet);
    procedure dbgrPDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    nY, nM, nD : word;
    nCntPens, nCntSovm : SmallInt;
    procedure CreOpenQryP(dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

procedure ShowPensCurMes(dDtPrc : TDateTime);

const SECTION = 'z_Pens';

var
  FormPens: TFormPens;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowPensCurMes(dDtPrc : TDateTime);
var cMsg : ShortString;
begin
  FormPens := TFormPens.Create(Application);
  with FormPens do begin
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Пенсионеры на конец ' +
                MesRod(nM) + ' ' + IntToStr(nY) + ' г. (по таблице z_Sps)';
    CreOpenQryP(dDtPrc);
    nCntSovm := 0;
    with qryP do begin
      DisableControls;
      First;
      while not Eof do begin
        if not qryPSovm.IsNull and (qryPSovm.AsInteger > 0) then
          Inc(nCntSovm);
        Next;
      end;
      First;
      EnableControls;
    end;
    nCntPens := qryP.RecordCount;
    cMsg := 'Всего пенсионеров: ' + IntToStr(nCntPens);
    if nCntSovm > 0 then
      cMsg := cMsg + ', в т.ч. совместителей: ' + IntToStr(nCntSovm);
    LabelCntRec.Caption := cMsg;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPens.CreOpenQryP(dDtPrc : TDateTime);
var dDtEndMes : TDateTime;
begin
  dDtEndMes := MyLastDOM(dDtPrc);
  with qryP do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
{
Select s.Tabn, u.Fam, u.Ima, u.Otch, p.DT_BEG, p.Dolgnost,
           p.OklTrf, p.PR_PENS, p.Sovm, count(s.NR) as CNT, sum(n.Summa) as SMM
 from z_sps s
       Left Outer Join ViNuMain n on n.TabN = s.TabN and
                                     n.DtProc = s.DtProc and n.VidN < '2700' and n.Sp_FZ = "1"
       Left outer join Get_Pere(s.TabN, '04/30/2009') p on 1 = 1
       Left Outer join z_Upi u on u.TabN = s.TabN
where s.dtProc = '03/01/2009'
group by s.TabN, u.Fam, u.Ima, u.Otch, p.Dt_Beg, p.Dolgnost, p.OklTrf,
              p.Pr_Pens, p.Sovm
having (Pr_Pens > 0)
}

    SQL.Add('Select s.Tabn, u.Fam, u.Ima, u.Otch, p.DT_BEG, p.Dolgnost, ' +
            ' p.OklTrf, p.PR_PENS, p.Sovm, count(s.NR) as CNT, ' +
            ' sum(n.Summa) as SMM from z_SPS s ' +
            ' Left Outer Join ViNuMain n on n.TabN = s.TabN and ' +
            ' n.DtProc = s.DtProc and n.VidN < "5000" and n.Sp_FZ = "1" ' +
            ' Left outer join Get_Pere(s.TabN, :dDtEndMes) p on 1 = 1 ' +
            ' Left Outer join z_Upi u on u.TabN = s.TabN ' +
            ' where s.dtProc = :dDtPrc ' +
            ' group by s.TabN, u.Fam, u.Ima, u.Otch, p.Dt_Beg, p.Dolgnost, ' +
            ' p.OklTrf, p.Pr_Pens, p.Sovm having (Pr_Pens > 0)');
    ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPens.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 580);
    Width  := ReadInteger(SECTION, 'wW', 685);
    Free;
  end;
  if FileExists(cDirVids + 'PiPns2.vid') then
    dbgrP.Columns.LoadFromFile(cDirVids + 'PiPns2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormPens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrP.Columns.SaveToFile(cDirVids + 'PiPns2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPens.qryPCalcFields(DataSet: TDataSet);
begin
  qryPFamIO.AsString := MyFamIO(qryPFam.AsString, qryPIma.AsString,
                                                        qryPOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormPens.dbgrPDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrP.Canvas do begin
    if not (gdFocused in State) then begin
      if not qryPSovm.IsNull and (qryPSovm.AsInteger > 0) then begin
        Font.Style := [];
        if qryPSovm.AsInteger > 1 then
          Font.Color := clBlue;
      end;
    end;
  end;
  dbgrP.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormPens.sBtnPrtClick(Sender: TObject);
var cCaption : ShortString;
begin
  cCaption := 'Пенсионеры на конец ' + MesRod(nM) + ' ' + IntToStr(nY) + ' г.';
  F6PrtPensSovm(qryP, cCaption, nCntPens, nCntSovm);   {z_CmnPrt}
end;

end.
