unit z_ENdbMs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls,
  DBClient;

type
  TFormENdbMs = class(TForm)
    Label2: TLabel;
    LabelSumProc: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    sBtnVidN: TSpeedButton;
    sBtnObj: TSpeedButton;
    sBtnKatP: TSpeedButton;
    sBtnSPZ: TSpeedButton;
    LabelPrcWrkTm: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    sBtnHlp: TSpeedButton;
    dbeSumProc: TDBEdit;
    dbeDt_Beg: TDBEdit;
    dbeDt_End: TDBEdit;
    dbeKdSpZ: TDBEdit;
    dbeShObj: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dbeVidN: TDBEdit;
    dbePrcWrkTm: TDBEdit;
    grBoxSposob: TGroupBox;
    rBtnSps1: TRadioButton;
    rBtnSps2: TRadioButton;
    rBtnSps3: TRadioButton;
    rBtnSps4: TRadioButton;
    dbeNotes: TDBEdit;
    LbxFilter: TListBox;
    bBtnNew: TBitBtn;
    dbeNrPrBeg: TDBEdit;
    dbeDtPrBeg: TDBEdit;
    dbeNrPrEnd: TDBEdit;
    dbeDtPrEnd: TDBEdit;
    dbeKdObj: TDBEdit;
    edSpZ: TEdit;
    PanelPS: TPanel;
    LabelPereschet: TLabel;
    LabelAlreadyExists: TLabel;
    ChBoxPS: TCheckBox;
    dbeKdKatP: TDBEdit;
    dbeShVidN: TDBEdit;
    dbeKatP: TDBEdit;
    chBoxSvSpsRsch: TCheckBox;
    qryTmp: TQuery;
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    cdsTmpVidN: TStringField;
    cdsTmpShVidN: TStringField;
    cdsTmpSpsbRasch: TSmallintField;
    cdsTmpKdObj: TSmallintField;
    cdsTmpGtBeg: TDateField;
    cdsTmpDtEnd: TDateField;
    cdsTmpSumProc: TFloatField;
    cdsTmpNrPrBeg: TStringField;
    cdsTmpDtPrBeg: TDateField;
    cdsTmpNrPrEnd: TStringField;
    cdsTmpDtPrEnd: TDateField;
    cdsTmpNotes: TStringField;
    cdsTmpKdKatP: TSmallintField;
    cdsTmpkdSpZ: TSmallintField;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetZadanieNdbMs : boolean;

const SECTION = 'Z_ENdbMs';

var                        // Проследить, использется ли эта цвцка апше tytyty
  FormENdbMs: TFormENdbMs;       // 10-11-2019 !!!!!!!

implementation

uses A_Const, a_DM, Z_DM, Z_Main, z_TVids, Z_TObj,
              Z_GtPers, A_SBU, A_ShwErr, A_Lib, {Z_ShNdVd,} z_HENadb;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetZadanieNdbMs : boolean;

begin
  Result := false;
  FormENdbMs := TFormENdbMs.Create(Application);
  with FormENdbMs do begin
(*
    n_KdSps := nKdSps;
    bNeedShowFormNdbVidu := false;
    bShowFormNdbVidu := false;
    bFormReady := false;
    dbeTabN.DataSource     := dsrcNadb;
    dbeVidN.DataSource     := dsrcNadb;
    dbeSumProc.DataSource  := dsrcNadb;
    dbeDt_Beg.DataSource   := dsrcNadb;
    dbeDt_End.DataSource   := dsrcNadb;
    dbeShVidN.DataSource   := dsrcNadb;
    dbeSPZ.DataSource      := dsrcNadb;
    dbeKdObj.DataSource    := dsrcNadb;
    dbeShObj.DataSource    := dsrcNadb;
    dbePrcWrkTm.DataSource := dsrcNadb;
    dbeKdKatP.DataSource   := dsrcNadb;
    dbeKatP.DataSource     := dsrcNadb;
    dbeNrPrBeg.DataSource  := dsrcNadb;
    dbeDtPrBeg.DataSource  := dsrcNadb;
    dbeNrPrEnd.DataSource  := dsrcNadb;
    dbeDtPrEnd.DataSource  := dsrcNadb;
    dbeNotes.DataSource    := dsrcNadb;
    if dsrcNadb.State = dsInsert then begin
      Caption := 'Новая надбавка (доплата)';
      bEditMode := false;
      edSpZ.Text := dbeSPZ.Field.AsString;
      nSpsRsch := nSvSpsRsch; end
    else begin
      Caption := 'Редактирование надбавки (доплаты)';
      bEditMode := true;
      edSpZ.Text := dbeSPZ.Field.AsString;
      with dsrcNadb.DataSet do begin
        nSpsRsch    := FieldByName('SpsRsch').AsInteger;
        nOldSpsRsch := nSpsRsch;
        nOldKdObj   := FieldByName('KdObj').AsInteger;
        nOldKdKatP  := FieldByName('KdKatP').AsInteger;
        nOldKdSpZ   := FieldByName('KdSpZ').AsInteger;
        nOldSumProc := FieldByName('SumProc').AsFloat;
        cOldVidN    := FieldByName('VidN').AsString;
        dOldDtBeg   := FieldByName('Dt_Beg').AsDateTime;
        nOldDtEnd   := FieldByName('Dt_End').AsDateTime;
      end;
    end;
    rBtnSps4.Enabled := false; // откроется только, если выберут ДгвВиды
    bBtnNew.Visible := not bEditMode;
    chBoxSvSpsRsch.Visible := not bEditMode;
    LabelFamIO.Caption := cFamIO;
    bSovmNdb := false;
    if (not dbeVidN.Field.IsNull) then
      bSovmNdb := NdbIsSovm(dbeVidN.Field.AsString);
{
    if bSovmNdb then begin
      dbePrcWrkTm.Enabled := true;
      dbePrcWrkTm.Color   := clWindow;
      LabelPrcWrkTm.Font.Color := clWindowText;
      rBtnSps1.Checked    := true;
      grBoxSposob.Enabled := true; end
    else begin
      dbePrcWrkTm.Enabled := false;
      dbePrcWrkTm.Color := clBtnFace;
      LabelPrcWrkTm.Font.Color := clGray;
      grBoxSposob.Enabled := true;
    end;
}
    MyDbeVidNExit;
    bFormReady := true;
    if bEditMode then begin
      if nSpsRsch = 4 then
        rBtnSps4.Checked := true
      else if nSpsRsch = 3 then
        rBtnSps3.Checked := true
      else if nSpsRsch = 2 then
        rBtnSps2.Checked := true
      else
        rBtnSps1.Checked := true; end
    else begin
      if chBoxSvSpsRsch.Checked and (nSvSpsRsch > 0) then begin
        if nSvSpsRsch = 4 then
          rBtnSps4.Checked := true
        else if nSvSpsRsch = 3 then
          rBtnSps3.Checked := true
        else if nSvSpsRsch = 2 then
          rBtnSps2.Checked := true
        else
          rBtnSps1.Checked := true; end
      else begin
        rBtnSps4.Checked := false;
        rBtnSps3.Checked := false;
        rBtnSps2.Checked := false;
        rBtnSps1.Checked := false;
      end;
    end;
    cVidN := dbeVidN.Field.AsString;
    if bEditMode and Form_Dm.VidIsTrS(cVidN) {труд.соглашения} then begin
      rBtnSps1.Checked := false;
      rBtnSps1.Enabled := false;
      rBtnSps2.Checked := false;
      rBtnSps2.Enabled := false;
      rBtnSps3.Checked := false;
      rBtnSps3.Enabled := false;
      rBtnSps4.Checked := true;
      rBtnSps4.Enabled := true;
    end;
    SetSposobRsch;
*)
    if ShowModal = mrOk then begin
{
      if PanelPS.Visible and ChBoxPS.Checked then begin
        nTabN := dbeDt_Beg.DataSource.DataSet.FieldByName('TabN').AsInteger;
        DecodeDate(dbeDt_Beg.Field.AsDateTime, nY, nM, nD);
        dMesPS := EncodeDate(nY, nM, 1); // Месяц пересчёта
        DmMain.AddPSToOtkl(cVid88, nTabN, dCtrlDate, dMesPS);
      end;
}
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormENdbMs.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormENdbMs.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
