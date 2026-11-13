unit z_ShEndV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, Provider,
  DBClient, DBTables, ComCtrls, Menus, DBCtrls;

type
  TFormShwEndVupl = class(TForm)
    qrySps: TQuery;
    cdsAll: TClientDataSet;
    dspTmp: TDataSetProvider;
    dsrcAll: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrAll: TDBGrid;
    LabelTtAll: TLabel;
    sBtnPg1: TSpeedButton;
    sBtnPg2: TSpeedButton;
    dbgrDTM: TDBGrid;
    LabelTt2724: TLabel;
    qryDsp: TQuery;
    pop: TPopupMenu;
    popSortAllByTabN: TMenuItem;
    popSortAllBySmm: TMenuItem;
    DBNavigator1: TDBNavigator;
    cdsDTM: TClientDataSet;
    dsrcDTM: TDataSource;
    sBtnPrt: TSpeedButton;
    popHead: TMenuItem;
    popSortDtmByTabN: TMenuItem;
    popSortDtmBySmm: TMenuItem;
    cdsAllTABN: TIntegerField;
    cdsAllFAM: TStringField;
    cdsAllIMA: TStringField;
    cdsAllOTCH: TStringField;
    cdsAllKDOBJ: TSmallintField;
    cdsAllSMM: TFloatField;
    cdsAllFamIO: TStringField;
    cdsDTMTABN: TIntegerField;
    cdsDTMFAM: TStringField;
    cdsDTMIMA: TStringField;
    cdsDTMOTCH: TStringField;
    cdsDTMKDOBJ: TSmallintField;
    cdsDTMSMM: TFloatField;
    cdsDTMFamIO: TStringField;
    sBtnNerasch: TSpeedButton;
    ts3: TTabSheet;
    dbrgNerasch: TDBGrid;
    dsrcNerasch: TDataSource;
    lblRecCount: TLabel;
    cdsNerasch: TClientDataSet;
    cdsNeraschTabN: TIntegerField;
    cdsNeraschKdObj: TSmallintField;
    cdsNeraschKdSps: TSmallintField;
    cdsNeraschFam: TStringField;
    cdsNeraschIma: TStringField;
    cdsNeraschOtch: TStringField;
    cdsNeraschFamIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPg1Click(Sender: TObject);
    procedure sBtnPg2Click(Sender: TObject);
    procedure cdsAllCalcFields(DataSet: TDataSet);
    procedure popSortAllByTabNClick(Sender: TObject);
    procedure popSortAllBySmmClick(Sender: TObject);
    procedure cdsDTMCalcFields(DataSet: TDataSet);
    procedure cdsNeraschCalcFields(DataSet: TDataSet);
    procedure dbgrAllDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrDTMDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPrtClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure popSortDtmByTabNClick(Sender: TObject);
    procedure popSortDtmBySmmClick(Sender: TObject);
    procedure sBtnNeraschClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    n_CntDlgPrp : SmallInt;
    procedure SetPage;
    procedure CreOpenCdsAll(dDtPrc : TDateTime);
    procedure SetAllSortState;
    procedure CreLabelAllTts;
    procedure CreOpenCdsDtm(dDtPrc : TDateTime);
    procedure CreOpenCdsNerasch(dDtPrc : TDateTime);
    procedure PrtCdsAll;
    procedure PrtCdsDtm;
    procedure PrtCdsNerasch;
    procedure SetDtmSortState;
  public
    { Public declarations }
  end;

procedure ShwEndVupl(dDtPrc : TDateTime;
                             var nCntDlgPrp : SmallInt; var nSmDlgPrp : double);
                  // nCntDlgPrp нужен, чтобы в z_CmDlg исправить ? на nCntDlgPrp

const SECTION = 'z_ShEndV';

var
  FormShwEndVupl: TFormShwEndVupl;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, z_TUpi, z_CmnPrt, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwEndVupl(dDtPrc : TDateTime;
                             var nCntDlgPrp : SmallInt; var nSmDlgPrp : double);
begin
  FormShwEndVupl := TFormShwEndVupl.Create(Application);
  with FormShwEndVupl do begin
    d_DtPrc := dDtPrc;
    CreOpenCdsAll(dDtPrc);
    CreLabelAllTts;
    ShowModal;
    nCntDlgPrp := n_CntDlgPrp;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.CreOpenCdsAll(dDtPrc: TDateTime);
begin
  with qryDsp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select n.TabN, u.Fam, u.Ima, u.Otch, s.KdObj, ' +
            ' Sum(n.Summa) as SMM ' +
            ' from Z_NU n Left Outer Join z_Upi u on u.TabN = n.TabN ' +
            ' Left Outer Join z_OneSpsKdObj(n.TabN, n.DtProc) s on 1=1 ' +
            ' where n.DtProc = :dDtPrc and n.VidN < "8000" ' +
            ' group by n.TabN, u.Fam, u.Ima, u.Otch, s.KdObj ' +
            ' having ((Sum(n.Summa) >= 0.005) or (Sum(n.Summa) <= -0.005))');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  dspTmp.DataSet := qryDsp;
  with cdsAll do begin
    if Active then Close;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    SetAllSortState;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.CreLabelAllTts;
var nSmTt, nSmPlus, nSmMinus : double; nCntRec : integer;
begin
  nSmPlus := 0;
  nSmMinus := 0;
  with cdsAll do begin
    nCntRec := 0;
    First;
    OnCalcFields := nil;
    First;
    while not Eof do begin
      if cdsAllSmm.AsFloat < 0 then
        nSmMinus := nSmMinus - cdsAllSmm.AsFloat
      else
        nSmPlus := nSmPlus + cdsAllSmm.AsFloat;
      Inc(nCntRec);
      Next;
    end;
    OnCalcFields := cdsAllCalcFields;
    First;
  end;
  nSmTt := nSmPlus - nSmMinus;
  LabelTtAll.Caption := 'Записей: ' + IntToStr(nCntRec) +
                        ',  Суммы: ' + FloatToStrF(nSmPlus, ffCurrency, 18, 2) +
                        ' - ' + FloatToStrF(nSmMinus, ffCurrency, 18, 2) +
                        ' = ' + FloatToStrF(nSmTt, ffCurrency, 18, 2);
  n_CntDlgPrp := nCntRec;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 450);
    popSortAllByTabN.Checked := ReadBool(SECTION, 'bAllTN', true);
    popSortAllBySmm.Checked := not popSortAllByTabN.Checked;
    popSortDtmByTabN.Checked := ReadBool(SECTION, 'bDtmTN', true);
    popSortDtmBySmm.Checked := not popSortDtmByTabN.Checked;
    Free;
  end;
  if FileExists(cDirVids + 'ShEndV03.vid') then
    dbgrAll.Columns.LoadFromFile(cDirVids + 'ShEndV03.vid');
  if FileExists(cDirVids + 'ShEndV04.vid') then
    dbgrDtm.Columns.LoadFromFile(cDirVids + 'ShEndV04.vid');
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  ts3.TabVisible := false;
  LabelTtAll.Caption := '';
  LabelTt2724.Caption := '';
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if cdsAll.Active then
    dbgrAll.Columns.SaveToFile(cDirVids + 'ShEndV03.vid');
  if cdsDtm.Active then
    dbgrDtm.Columns.SaveToFile(cDirVids + 'ShEndV04.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bAllTN', popSortAllByTabN.Checked);
    WriteBool(SECTION, 'bDtmTN', popSortDtmByTabN.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.sBtnPg1Click(Sender: TObject);
begin
  SetPage;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.sBtnPg2Click(Sender: TObject);
begin
  SetPage;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.sBtnNeraschClick(Sender: TObject);
begin
  SetPage;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.SetPage;
begin
  if sBtnPg1.Down then begin
    PageControl1.ActivePage := ts1;
    DBNavigator1.DataSource := dsrcAll;
  end else if sBtnPg2.Down then begin
    PageControl1.ActivePage := ts2;
    DBNavigator1.DataSource := dsrcDtm;
  end else begin
    PageControl1.ActivePage := ts3;
    DBNavigator1.DataSource := dsrcNerasch;
  end;

  if (PageControl1.ActivePage = ts2) and not cdsDTM.Active then
    CreOpenCdsDtm(d_DtPrc);

  if (PageControl1.ActivePage = ts3) and not cdsNerasch.Active then
    CreOpenCdsNerasch(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.CreOpenCdsDtm(dDtPrc : TDateTime);
var nSmTt, nSmPlus, nSmMinus : double;  nCntRec : integer;
begin
  with qryDsp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select n.TabN, u.Fam, u.Ima, u.Otch, n.KdObj, n.Summa as SMM ' +
            ' from z_NU n Left Outer Join z_Upi u on u.TabN = n.TabN ' +
            ' where n.dtProc = :dDtPrc and n.VidN = "2724" ');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  dspTmp.DataSet := qryDsp;
  with cdsDTM do begin
    if Active then Close;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    First;
    OnCalcFields := nil;
    First;
    nSmPlus := 0;
    nSmMinus := 0;
    nCntRec := RecordCount;
    while not Eof do begin
      if cdsDtmSmm.AsFloat < 0 then
        nSmMinus := nSmMinus - cdsDtmSmm.AsFloat
      else
        nSmPlus := nSmPlus + cdsDtmSmm.AsFloat;
      Next;
    end;
    OnCalcFields := cdsDTMCalcFields;
    SetDtmSortState;
    First;
  end;
  nSmTt := nSmPlus - nSmMinus;
  LabelTt2724.Caption := 'Записей: ' + IntToStr(nCntRec) +
                        ',  Суммы: ' + FloatToStrF(nSmPlus, ffCurrency, 18, 2) +
                        ' - ' + FloatToStrF(nSmMinus, ffCurrency, 18, 2) +
                        ' = ' + FloatToStrF(nSmTt, ffCurrency, 18, 2);
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.CreOpenCdsNerasch(dDtPrc : TDateTime);
var
  nCntRec: integer;
begin
  with qryDsp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select n.TabN, u.Fam, u.Ima, u.Otch, n.KdObj, n.KdSps ' +
            ' from z_sps n Left Outer Join z_Upi u on u.TabN = n.TabN ' +
            ' where n.dtProc = :dDtPrc and nch is null');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  dspTmp.DataSet := qryDsp;
  with cdsNerasch do begin
    if Active then Close;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    First;
    OnCalcFields := nil;
    First;
    nCntRec := RecordCount;
    OnCalcFields := cdsNeraschCalcFields;
    First;
  end;
  lblRecCount.Caption := 'Записей: ' + IntToStr(nCntRec);
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.cdsAllCalcFields(DataSet: TDataSet);
//var cShObj : ShortString; nKdObj : SmallInt;
begin
  cdsAllFamIO.AsString := MyFamIO(cdsAllFam.AsString, cdsAllIma.AsString,
                                                          cdsAllOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.popSortAllByTabNClick(Sender: TObject);
begin
  if not popSortAllByTabN.Checked then begin
    popSortAllByTabN.Checked := true;
    popSortAllBySmm.Checked := false;
    SetAllSortState;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.SetAllSortState;
begin
  if popSortAllBySmm.Checked then
    cdsAll.IndexName := 'OnSmm'
  else
    cdsAll.IndexName := 'OnTabN';
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.popSortAllBySmmClick(Sender: TObject);
begin
  if not popSortAllBySmm.Checked then begin
    popSortAllBySmm.Checked := true;
    popSortAllByTabN.Checked := false;
    SetAllSortState;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.popSortDtmByTabNClick(Sender: TObject);
begin
  if not popSortDtmByTabN.Checked then begin
    popSortDtmByTabN.Checked := true;
    popSortDtmBySmm.Checked := false;
    SetDtmSortState;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.SetDtmSortState;
begin
  if popSortDtmBySmm.Checked then
    cdsDtm.IndexName := 'OnSmm'
  else
    cdsDtm.IndexName := 'OnTabN';
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.popSortDtmBySmmClick(Sender: TObject);
begin
  if not popSortDtmBySmm.Checked then begin
    popSortDtmBySmm.Checked := true;
    popSortDtmByTabN.Checked := false;
    SetDtmSortState;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.cdsDTMCalcFields(DataSet: TDataSet);
//var cNmObj : string;
begin
  cdsDtmFamIO.AsString := MyFamIO(cdsDtmFam.AsString, cdsDtmIma.AsString,
                                                          cdsDtmOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.cdsNeraschCalcFields(DataSet: TDataSet);
//var cNmObj : string;
begin
  cdsNeraschFamIO.AsString := MyFamIO(cdsNeraschFam.AsString,
    cdsNeraschIma.AsString, cdsNeraschOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.dbgrAllDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with dbgrAll.Canvas do begin
    if not (gdFocused in State) then begin
      if UpperCase(Column.FieldName) = 'SMM' then begin
        if (cdsAllSMM.AsFloat < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
        Font.Style := [fsBold];
      end;
    end;
  end;
  dbgrAll.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.dbgrDTMDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with dbgrDTM.Canvas do begin
    if not (gdFocused in State) then begin
      if UpperCase(Column.FieldName) = 'SMM' then begin
        if (cdsDtmSMM.AsFloat < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
        Font.Style := [fsBold];
      end;
    end;
  end;
  dbgrDtm.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.sBtnPrtClick(Sender: TObject);
begin
  if PageControl1.ActivePage = ts1 then
    PrtCdsAll
  else if PageControl1.ActivePage = ts2 then
    PrtCdsDtm
  else {if PageControl1.ActivePage = ts2 then}
    PrtCdsNerasch;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.PrtCdsAll;
var nY, nM, nD : word; cTitle : string;
begin
  if cdsAll.RecordCount = 0 then
    ShowMessage('Нечего печатать по суммам к выплате')
  else begin
    DecodeDate(d_DtPrc, nY, nM, nD);
    cTitle := 'Суммы к выплате в ' + MesPredlogn(nM) +
                                           ' ' + IntToStr(nY) + ' г.';
    F6UniPrt(cTitle, cdsAll);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.PrtCdsDtm;
var nY, nM, nD : word; cTitle : string;
begin
  if cdsDtm.RecordCount = 0 then
    ShowMessage('Нечего печатать по долгам')
  else begin
    DecodeDate(d_DtPrc, nY, nM, nD);
    cTitle := 'Суммы по виду 2724 ВДолгТМ в ' + MesPredlogn(nM) +
                                           ' ' + IntToStr(nY) + ' г.';
    F6UniPrt(cTitle, cdsDtm);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.PrtCdsNerasch;
var nY, nM, nD : word; cTitle : string;
begin
  if cdsNerasch.RecordCount = 0 then
    ShowMessage('Нечего печатать по долгам')
  else begin
    DecodeDate(d_DtPrc, nY, nM, nD);
    cTitle := 'Список нерасчитанных сотрудников ' + MesPredlogn(nM) +
                                           ' ' + IntToStr(nY) + ' г.';
    F6UniPrt(cTitle, cdsNerasch);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwEndVupl.popPopup(Sender: TObject);
begin
  if pop.PopupComponent = dbgrAll then begin
    popHead.Caption := '== Таблица выплат ==';
    popSortAllByTabN.Visible := true;
    popSortAllBySmm.Visible := true;
    popSortDtmByTabN.Visible := false;
    popSortDtmBySmm.Visible := false; end
  else if pop.PopupComponent = dbgrDtm then begin
    popHead.Caption := '== Таблица ВДолгТМ ==';
    popSortDtmByTabN.Visible := true;
    popSortDtmBySmm.Visible := true;
    popSortAllByTabN.Visible := false;
    popSortAllBySmm.Visible := false;
  end;
end;

end.
