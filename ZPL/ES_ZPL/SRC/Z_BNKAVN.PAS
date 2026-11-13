unit Z_BnkAvn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, DB, DBTables,
  IniFiles, StdCtrls, Buttons, Menus;

type
  TFormBankiVedAvns = class(TForm)
    Panel1: TPanel;
    qryBanki: TQuery;
    dsrcBanki: TDataSource;
    qryAvns: TQuery;
    dsrcAvns: TDataSource;
    PanelLeft: TPanel;
    dbgrBanki: TDBGrid;
    rBtnAll: TRadioButton;
    rBtnCurrent: TRadioButton;
    sBtnPrt: TSpeedButton;
    bBtnCancel: TBitBtn;
    qryAvnsFamIO: TStringField;
    ChBoxPrtZero: TCheckBox;
    qryAvnsFamImaOtch: TStringField;
    qryAvnsNR: TIntegerField;
    qryAvnsTABN: TIntegerField;
    qryAvnsFAM: TStringField;
    qryAvnsIMA: TStringField;
    qryAvnsOTCH: TStringField;
    qryAvnsID: TStringField;
    qryAvnsDTBEG: TDateTimeField;
    qryAvnsLICSCH: TStringField;
    qryAvnsKDBNK: TSmallintField;
    qryAvnsNOTES: TStringField;
    qryAvnsSUMOTKL: TFloatField;
    qryAvnsSUMNU: TFloatField;
    Splitter1: TSplitter;
    PanelRight: TPanel;
    dbgrAvns: TDBGrid;
    PanelRB: TPanel;
    LabelOtkl: TLabel;
    LabelNU: TLabel;
    qryBankiNR: TIntegerField;
    qryBankiKDBNK: TSmallintField;
    qryBankiSHBNK: TStringField;
    qryBankiNMBNK: TStringField;
    qryBankiNOTES: TStringField;
    rBtnByOtkl: TRadioButton;
    rBtnByNu: TRadioButton;
    popMnu: TPopupMenu;
    popSortByFIO: TMenuItem;
    popSortByLS: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rBtnAllClick(Sender: TObject);
    procedure rBtnCurrentClick(Sender: TObject);
    procedure dsrcBankiDataChange(Sender: TObject; Field: TField);
    procedure sBtnPrtClick(Sender: TObject);
    procedure qryAvnsCalcFields(DataSet: TDataSet);
    procedure popSortByFIOClick(Sender: TObject);
    procedure popSortByLSClick(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    procedure SetBankiFilter;
    procedure OpenQryBanki;
    procedure OpenQryAvns(dDtProc : TDateTime);
    procedure ShowLabelOtklNU;
  public
    { Public declarations }
  end;

procedure MkBankiVedAvns(dDtProc : TDateTime);

const SECTION = 'Z_BnkAvn';

var
  FormBankiVedAvns: TFormBankiVedAvns;

implementation

uses A_Const, Z_DM, Z_Main, A_Lib, Z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure MkBankiVedAvns(dDtProc : TDateTime);
begin
  FormBankiVedAvns := TFormBankiVedAvns.Create(Application);
  with FormBankiVedAvns do begin
    d_DtProc := dDtProc;
    OpenQryBanki;
    OpenQryAvns(dDtProc);
    if qryBanki.RecordCount < 2 then begin
      rBtnAll.Checked := true;
      rBtnCurrent.Checked := false;
      with qryAvns do begin
        Filter := '';
        Filtered := false;
      end;
      rBtnAll.Visible := false;
      rBtnCurrent.Visible := false;
      dbgrBanki.Align := alClient;
      sBtnPrt.Enabled := qryBanki.RecordCount > 0; end
    else
      SetBankiFilter;
    ShowLabelOtklNU;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.OpenQryBanki;
begin
  with qryBanki do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_Banki ');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.ShowLabelOtklNU;
var nSmByOtkl, nSmByNU : double;
    nSvNR, nCntRecOtkl, nCntRecNU : integer;
begin
  if not qryAvns.Active then
    Exit;
  nSmByOtkl := 0;
  nSmByNU := 0;
  nCntRecOtkl := 0;
  nCntRecNU := 0;
  with qryAvns do begin
    DisableControls;
    nSvNR := FieldByName('NR').AsInteger;
    First;
    while not Eof do begin
      nSmByOtkl := nSmByOtkl + FieldByName('SumOtkl').AsFloat;
      nSmByNU := nSmByNU + FieldByName('SumNU').AsFloat;
      if not FieldByName('SumOtkl').IsNull then
        nCntRecOtkl := nCntRecOtkl + 1;
      if not FieldByName('SumNU').IsNull then
        nCntRecNU := nCntRecNU + 1;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
    LabelOtkl.Caption := 'В отклонениях: Записей ' + IntToStr(nCntRecOtkl) +
                         ' на сумму ' + FloatToStrF(nSmByOtkl, ffFixed, 18, 2);
    LabelNU.Caption := 'В начислениях: Записей ' + IntToStr(nCntRecNU) +
                       ' на сумму ' + FloatToStrF(nSmByNU, ffFixed, 18, 2);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.OpenQryAvns(dDtProc : TDateTime);
begin
  with qryAvns do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_AVANSOTKLNU (:DDtProc) ');
    if popSortByFIO.Checked then
      SQL.Add(' order by Fam, Ima, Otch')
    else
      SQL.Add(' order by LicSch');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.FormCreate(Sender: TObject);
begin
  Caption := 'Печать ведомостей аванса для банка';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 355);
    Width  := ReadInteger(SECTION, 'wW', 520);
    PanelLeft.Width := ReadInteger(SECTION, 'BnkW', 178);
    rBtnAll.Checked := ReadBool(SECTION, 'rBtnAll', true);
    rBtnByOtkl.Checked := ReadBool(SECTION, 'rBtnByOtkl', true);
    ChBoxPrtZero.Checked := ReadBool(SECTION, 'PrtZero', false);
    popSortByFIO.Checked := ReadBool(SECTION, 'SortByFIO', false);
    Free;
  end;
  rBtnCurrent.Checked := not rBtnAll.Checked;
  rBtnByNu.Checked := not rBtnByOtkl.Checked;
  popSortByLS.Checked := not popSortByFIO.Checked;
  if FileExists(cDirVids + 'MkBnkAvV.vid') then
    dbgrBanki.Columns.LoadFromFile(cDirVids + 'MkBnkAvV.vid');
  if FileExists(cDirVids + 'MkAvBVed.vid') then
    dbgrAvns.Columns.LoadFromFile(cDirVids + 'MkAvBVed.vid');
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.FormClose(Sender: TObject;
                                           var Action: TCloseAction);
begin
  dbgrBanki.Columns.SaveToFile(cDirVids + 'MkBnkAvV.vid');
  dbgrAvns.Columns.SaveToFile(cDirVids + 'MkAvBVed.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'BnkW', PanelLeft.Width);
    WriteBool(SECTION, 'rBtnAll', rBtnAll.Checked);
    WriteBool(SECTION, 'rBtnByOtkl', rBtnByOtkl.Checked);
    WriteBool(SECTION, 'PrtZero', ChBoxPrtZero.Checked);
    WriteBool(SECTION, 'SortByFIO', popSortByFIO.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.rBtnAllClick(Sender: TObject);
begin
  SetBankiFilter;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.rBtnCurrentClick(Sender: TObject);
begin
  SetBankiFilter;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.SetBankiFilter;
begin
  sBtnPrt.Enabled := rBtnCurrent.Checked;
  if not qryAvns.Active then Exit;
  with qryAvns do begin
    if rBtnAll.Checked then begin
      Filter := '';
      Filtered := false; end
    else begin
      Filter := 'KdBnk = ' + qryBanki.FieldByName('KdBnk').AsString;
      Filtered := true;
    end;
  end;
  ShowLabelOtklNU;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.dsrcBankiDataChange(Sender: TObject;
                                                      Field: TField);
begin
  if (dsrcBanki.State = dsBrowse) then begin
    if rBtnCurrent.Checked then begin
      qryAvns.Filter := 'KdBnk = ' +
                           qryBanki.FieldByName('KdBnk').AsString;
      qryAvns.Filtered := true; end
    else
      qryAvns.Filtered := false;
    ShowLabelOtklNU;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.sBtnPrtClick(Sender: TObject);
var cNmBnk : string; bPrtZero : boolean; nCaseOtklNu : word;
begin
  cNmBnk := qryBanki.FieldByName('NmBnk').AsString;
  bPrtZero := ChBoxPrtZero.Checked;
  if rBtnByOtkl.Checked then
    nCaseOtklNu := 1
  else
    nCaseOtklNu := 2;
  F6_PrtBankVedAvn(cNmBnk, d_DtProc, qryAvns, nCaseOtklNu, bPrtZero);
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.qryAvnsCalcFields(DataSet: TDataSet);
var cFamImaOtch : string;
begin
  with qryAvns do begin
    FieldByName('FamIO').AsString :=
                     MyFamIO(FieldByName('Fam').AsString,
                              FieldByName('Ima').AsString,
                              FieldByName('Otch').AsString);
    cFamImaOtch := FieldByName('Fam').AsString;
    if not FieldByName('Ima').isNull and
                    (FieldByName('Ima').AsString <> '') then begin
      cFamImaOtch := cFamImaOtch + ' ' + FieldByName('Ima').AsString;
      if not FieldByName('Otch').isNull and
                    (FieldByName('Otch').AsString <> '') then
        cFamImaOtch := cFamImaOtch + ' ' + FieldByName('Otch').AsString;
    end;
    FieldByName('FamImaOtch').AsString := cFamImaOtch;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.popSortByFIOClick(Sender: TObject);
var nSvNR : integer;
begin
  if not popSortByFIO.Checked then begin
    nSvNR := qryAvns.FieldByName('NR').AsInteger;
    popSortByFIO.Checked := true;
    popSortByLS.Checked := false;
    OpenQryAvns(d_DtProc);
    qryAvns.Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedAvns.popSortByLSClick(Sender: TObject);
var nSvNR : integer;
begin
  if not popSortByLS.Checked then begin
    nSvNR := qryAvns.FieldByName('NR').AsInteger;
    popSortByLS.Checked := true;
    popSortByFIO.Checked := false;
    OpenQryAvns(d_DtProc);
    qryAvns.Locate('NR', nSvNR, []);
  end;
end;

end.
