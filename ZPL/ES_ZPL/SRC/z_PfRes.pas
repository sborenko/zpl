unit z_PfRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons, ExtCtrls,
  DBClient, Menus, ComCtrls;

type
  TFormPfRes = class(TForm)
    dsrcPfRes: TDataSource;
    PanelRes: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LabelSmTotal: TLabel;
    LabelSumTotal: TLabel;
    LabelSmMax: TLabel;
    LabelSumMax: TLabel;
    LabelSmIns: TLabel;
    LabelSumIns: TLabel;
    LabelSmSvPrg: TLabel;
    LabelSumSvPrg: TLabel;
    LabelSmEsvPrp: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label3: TLabel;
    LabelDSumTotal: TLabel;
    LabelDSumMax: TLabel;
    LabelDSumIns: TLabel;
    LabelDSumSvPrg: TLabel;
    sBtnClosePanel: TSpeedButton;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popOrdByID: TMenuItem;
    popOrdByTabN: TMenuItem;
    popOrdByFIO: TMenuItem;
    ClientDataSet1: TClientDataSet;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrPfRes: TDBGrid;
    Panel3: TPanel;
    LabelCntRec: TLabel;
    sBtnTts: TSpeedButton;
    LabelOrder: TLabel;
    bBtnCancel: TBitBtn;
    DBNav: TDBNavigator;
    rBtnAllRec: TRadioButton;
    rBtnBadRec: TRadioButton;
    Panel1: TPanel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    dbgrRes2: TDBGrid;
    dsrcRes2: TDataSource;
    procedure dbgrPfResDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure sBtnTtsClick(Sender: TObject);
    procedure sBtnClosePanelClick(Sender: TObject);
    procedure rBtnBadRecClick(Sender: TObject);
    procedure dbgrPfResDblClick(Sender: TObject);
    procedure popOrdByIDClick(Sender: TObject);
    procedure popOrdByTabNClick(Sender: TObject);
    procedure popOrdByFIOClick(Sender: TObject);
  private
    { Private declarations }
    nSvTabN, nSvFilterTabN : integer;
    cSvID : ShortString;
    nOrdCase : SmallInt;
    cds_PfRes : TClientDataSet;
    procedure SetFilterState;
    procedure SetPfResIndex;
  public
    { Public declarations }
  end;

const SECTION = 'z_PfRes';

procedure ShwPfRes(dDtPrc : TDateTime; nSmTotal, nSmMax, nSmIns, nSumTotal,
                     nSumMax, nSumIns, nRaznIns,nSmSvPrg, nSmEsvPrp : double;
                                                     cdsPfRes : TClientDataSet);

var
  FormPfRes: TFormPfRes;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwPfRes(dDtPrc : TDateTime; nSmTotal, nSmMax, nSmIns, nSumTotal,
                     nSumMax, nSumIns, nRaznIns,nSmSvPrg, nSmEsvPrp : double;
                                                     cdsPfRes : TClientDataSet);
var nY, nM, nd : word;
begin
  FormPfRes := TFormPfRes.Create(Application);
  with FormPfRes do begin
    cds_PfRes := cdsPfRes;
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Сверка данных в файле e04t06c.dbf с данными в Z_NU за ' +
                MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    dsrcPfRes.DataSet := cdsPfRes;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(cdsPfRes.RecordCount);
    LabelSmTotal.Caption := FloatToStrF(nSmTotal, ffCurrency, 18,2);
    LabelSumTotal.Caption := FloatToStrF(nSumTotal, ffCurrency, 18,2);
    LabelSmMax.Caption := FloatToStrF(nSmMax, ffCurrency, 18,2);
    LabelSumMax.Caption := FloatToStrF(nSumMax, ffCurrency, 18,2);
    LabelSmIns.Caption := FloatToStrF(nSmIns, ffCurrency, 18,2);
    LabelSumIns.Caption := FloatToStrF(nSumIns, ffCurrency, 18,2);
    LabelSmSvPrg.Caption := FloatToStrF(nSmSvPrg, ffCurrency, 18,2);
    LabelSmEsvPrp.Caption := FloatToStrF(nSmEsvPrp, ffCurrency, 18,2);
    LabelSumSvPrg.Caption := FloatToStrF(nSumTotal - nSumMax, ffCurrency, 18,2);
    LabelDSumTotal.Caption := FloatToStrF(nSmTotal - nSumTotal, ffCurrency, 18,2);
    LabelDSumMax.Caption := FloatToStrF(nSmMax - nSumMax, ffCurrency, 18,2);
    LabelDSumIns.Caption := FloatToStrF(nSmIns - nSumIns, ffCurrency, 18,2);
    LabelDSumSvPrg.Caption := FloatToStrF(nSmSvPrg - (nSumTotal - nSumMax),
                                                              ffCurrency, 18,2);
    if (nSvTabN > 0) and not cdsPfRes.Locate('TabN', nSvTabN, []) then begin
      if (cSvID > '') and not cdsPfRes.Locate('ID', cSvID, []) then
        cdsPfRes.Last;
    end;
    SetPfResIndex;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.dbgrPfResDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrPfRes.Canvas do begin
    if not (gdFocused in State) then begin
      cFldNm := UpperCase(Column.FieldName);
      if ((cFldNm = 'SM_TOTAL') or  (cFldNm = 'SM_MAX') or
          (cFldNm = 'SM_INS') or (cFldNm = 'SUM_TOTAL') or
          (cFldNm = 'SUM_MAX') or (cFldNm = 'SUM_INS') or
          (cFldNm = 'RAZN_INS') or (cFldNm = 'SM_SVPRG') or
          (cFldNm = 'SM_ESVPRP')) and (Column.Field.AsFloat < 0) then
        Font.Color := clRed;
    end;
    with dsrcPfRes.DataSet do begin
      if (FieldByName('Sm_Total').AsFloat <>
                                      FieldByName('Sum_Total').AsFloat) or
             (FieldByName('Sm_Max').AsFloat <>
                                      FieldByName('Sum_Max').AsFloat) or
             (FieldByName('Sm_Ins').AsFloat <>
                                      FieldByName('Sum_Ins').AsFloat) or
             (FieldByName('Razn_Ins').AsFloat <> 0) then
        Brush.Color := clYellow;
    end;
  end;
  dbgrPfRes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.FormCreate(Sender: TObject);
begin
  LabelCntRec.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left    := ReadInteger(SECTION, 'wL', 100);
    Top     := ReadInteger(SECTION, 'wT', 50);
    Height  := ReadInteger(SECTION, 'wH', 450);
    Width   := ReadInteger(SECTION, 'wW', 800);
    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    cSvID   := ReadString(SECTION, 'cSvID', '');
    nOrdCase := ReadInteger(SECTION, 'nOrdCase', 1);
    Free;
  end;
  popOrdByID.Checked := nOrdCase = 1;
  popOrdByTabN.Checked := nOrdCase = 2;
  popOrdByFIO.Checked := nOrdCase = 3;
  if FileExists(cDirVids + 'CrPfRes.vid') then
    dbgrPfRes.Columns.LoadFromFile(cDirVids + 'CrPfRes.vid');
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPfRes.Columns.SaveToFile(cDirVids + 'CrPfRes.vid');
  if popOrdByID.Checked then
    nOrdCase := 1
  else if popOrdByTabN.Checked then
    nOrdCase := 2
  else
    nOrdCase := 3;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nOrdCase', nOrdCase);
    with dsrcPfRes.DataSet do begin
      if RecordCount > 0 then begin
        WriteInteger(SECTION, 'nSvTabN', FieldByName('TabN').AsInteger);
        WriteString(SECTION, 'cSvID', FieldByName('ID').AsString);
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.FormResize(Sender: TObject);
begin
  PanelRes.Top  := Round((Height - PanelRes.Height) / 2) - 50;
  PanelRes.Left := Round((Width - PanelRes.Width) / 2) - 10;
end;

procedure TFormPfRes.sBtnTtsClick(Sender: TObject);
begin
  PanelRes.Visible := not PanelRes.Visible;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.sBtnClosePanelClick(Sender: TObject);
begin
  PanelRes.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.rBtnBadRecClick(Sender: TObject);
begin
  SetFilterState;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.SetFilterState;
var cFilter : ShortString;
begin
  cFilter := '(Sm_Total <> Sum_Total) or (Sm_Max <> Sum_Max) or ' +
                                                     '(Sm_Ins <> Sum_Ins)';
  with dsrcPfRes.DataSet do begin
    Filter := cFilter;
    if rBtnAllRec.Checked then begin
      nSvFilterTabN := FieldByName('TabN').AsInteger;
      Filtered := false;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
      if (nSvFilterTabN > 0) and
                        not Locate('TabN', nSvFilterTabN, []) then begin
        if (nSvTabN <> 0) and not Locate('TabN', nSvTabN, []) then
          Last;
      end; end
    else begin
      Filtered := true;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.dbgrPfResDblClick(Sender: TObject);
var nSm_Total, nSm_Max, nSm_Ins,
                        nSum_Total, nSum_Max, nSum_Ins, nRazn_Ins : double;
    cMsg : ShortString;
begin
  with dsrcPfRes.DataSet do begin
    nSm_Total  := FieldByName('Sm_Total').AsFloat;
    nSm_Max    := FieldByName('Sm_Max').AsFloat;
    nSm_Ins    := FieldByName('Sm_Ins').AsFloat;
    nSum_Total := FieldByName('Sum_Total').AsFloat;
    nSum_Max   := FieldByName('Sum_Max').AsFloat;
    nSum_Ins   := FieldByName('Sum_Ins').AsFloat;
    nRazn_Ins  := FieldByName('Razn_Ins').AsFloat;
    cMsg := 'Sm_Total = ' + FloatToStrF(nSm_Total, ffCurrency, 18, 2) + #13#10 +
            'Sum_Total = ' + FloatToStrF(nSum_Total, ffCurrency, 18, 2) + #13#10 +
            'Sm_Max = ' + FloatToStrF(nSm_Max, ffCurrency, 18, 2) + #13#10 +
            'Sum_Max = ' + FloatToStrF(nSum_Max, ffCurrency, 18, 2) + #13#10 +
            'Sm_Ins = ' + FloatToStrF(nSm_Ins, ffCurrency, 18, 2) + #13#10 +
            'Sum_Ins = ' + FloatToStrF(nSum_Ins, ffCurrency, 18, 2) + #13#10 +
            'Razn_Ins = ' + FloatToStrF(nRazn_Ins, ffCurrency, 18, 2) + #13#10 +
            'Razn_Total = ' + FloatToStrF(nSm_Total - nSum_Total, ffCurrency, 18, 2) + #13#10 +
            'Razn_Max = ' + FloatToStrF(nSm_Max - nSum_Max, ffCurrency, 18, 2) + #13#10 +
            'Razn_Ins2 = ' + FloatToStrF(nSm_Ins - nSum_Ins, ffCurrency, 18, 2);
    ShowMessage(cMsg);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.popOrdByIDClick(Sender: TObject);
begin
  if not popOrdByID.Checked then begin
    popOrdByID.Checked := true;
    popOrdByTabN.Checked := false;
    popOrdByFIO.Checked := false;
    SetPfResIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.popOrdByTabNClick(Sender: TObject);
begin
  if not popOrdByTabN.Checked then begin
    popOrdByID.Checked := false;
    popOrdByTabN.Checked := true;
    popOrdByFIO.Checked := false;
    SetPfResIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.popOrdByFIOClick(Sender: TObject);
begin
  if not popOrdByFIO.Checked then begin
    popOrdByID.Checked := false;
    popOrdByTabN.Checked := false;
    popOrdByFIO.Checked := true;
    SetPfResIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPfRes.SetPfResIndex;
var nSvNR : integer;
begin
  with cds_PfRes do begin
    nSvNR := FieldByName('NR').AsInteger;
    if popOrdByID.Checked then begin
      IndexName := 'OnID';
      LabelOrder.Caption := 'Сортировано по ИД'; end
    else if popOrdByTabN.Checked then begin
      IndexName := 'OnTabN';
      LabelOrder.Caption := 'Сортировано по Таб.н-ру'; end
    else if popOrdByFIO.Checked then begin
      IndexName := 'OnFIO';
      LabelOrder.Caption := 'Сортировано по ФИО';
    end;
    Locate('NR', nSvNR, []);
  end;
end;

end.
