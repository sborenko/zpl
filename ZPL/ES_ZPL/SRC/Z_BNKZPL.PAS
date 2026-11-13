unit z_BnkZpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, DB, DBTables,
  IniFiles, StdCtrls, Buttons, Menus, Provider, DBClient;

type
  TFormBankiVedZp = class(TForm)
    Panel1: TPanel;
    qryBanki: TQuery;
    dsrcBanki: TDataSource;
    qryNu: TQuery;
    dsrcNu: TDataSource;
    PanelLeft: TPanel;
    dbgrBanki: TDBGrid;
    rBtnAll: TRadioButton;
    rBtnCurrent: TRadioButton;
    sBtnPrt: TSpeedButton;
    bBtnCancel: TBitBtn;
    ChBoxPrtZero: TCheckBox;
    Splitter1: TSplitter;
    PanelRight: TPanel;
    dbgrNu: TDBGrid;
    qryBankiNR: TIntegerField;
    qryBankiKDBNK: TSmallintField;
    qryBankiSHBNK: TStringField;
    qryBankiNMBNK: TStringField;
    qryBankiNOTES: TStringField;
    popMnu: TPopupMenu;
    popSortByFIO: TMenuItem;
    popSortByLS: TMenuItem;
    cdsNU: TClientDataSet;
    dspNU: TDataSetProvider;
    cdsNUTABN: TIntegerField;
    cdsNULICSCH: TStringField;
    cdsNUKDBNK: TSmallintField;
    cdsNUFAMIO: TStringField;
    cdsNUSUMNU: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rBtnAllClick(Sender: TObject);
    procedure rBtnCurrentClick(Sender: TObject);
    procedure dsrcBankiDataChange(Sender: TObject; Field: TField);
    procedure sBtnPrtClick(Sender: TObject);
    procedure popSortByFIOClick(Sender: TObject);
    procedure popSortByLSClick(Sender: TObject);
    procedure cdsNUBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    procedure SetBankiFilter;
    procedure OpenQryBanki;
    procedure OpenCdsNu(dDtProc : TDateTime);
//    procedure ShowLabelOtklNU;
  public
    { Public declarations }
  end;

procedure MkBankiVedZp(dDtProc : TDateTime);

const SECTION = 'Z_BnkZpl';

var
  FormBankiVedZp: TFormBankiVedZp;

implementation

uses A_Const, Z_DM, Z_Main, A_Lib, Z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure MkBankiVedZp(dDtProc : TDateTime);
begin
  FormBankiVedZp := TFormBankiVedZp.Create(Application);
  with FormBankiVedZp do begin
    d_DtProc := dDtProc;
    OpenQryBanki;
    OpenCdsNU(dDtProc);
    if qryBanki.RecordCount < 2 then begin
      rBtnAll.Checked := true;
      rBtnCurrent.Checked := false;
      with cdsNu do begin
        Filter := '';
        Filtered := false;
      end;
      rBtnAll.Visible := false;
      rBtnCurrent.Visible := false;
      dbgrBanki.Align := alClient;
      sBtnPrt.Enabled := qryBanki.RecordCount > 0; end
    else
      SetBankiFilter;
//    ShowLabelOtklNU;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.OpenQryBanki;
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
procedure TFormBankiVedZp.cdsNUBeforeOpen(DataSet: TDataSet);
begin

end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.OpenCdsNu(dDtProc : TDateTime);
var nTabN : integer; cFamIO, cFam, cIma, cOtch, cPol, cID : string;
    dDOB : TDateTime;
begin
  with qryNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    DataSource := dsrcBanki;
    SQL.Add('Select Ls.TabN, Ls.LicSch, Ls.KdBnk, ' +
            ' Cast(null as VarChar(35)) as FamIO, Sum(nu.Summa) as SumNU ' +
            ' from Z_BankiLS Ls ' +
            ' Left Outer Join Z_NU nu on (nu.TabN = Ls.TabN) and ' +
            ' (nu.DtProc = :dDtProc) ' +
            ' where (Ls.KdBnk = :KdBnk) ' +
            ' group by Ls.TabN, ls.LicSch, ls.KdBnk ' +
            ' having Sum(nu.Summa) > 0');
    ParamByName('dDtProc').AsDateTime := dDtProc;
  end;
  with cdsNU do begin
    if Active then Close;
    ProviderName := 'dspNU';
    Open;
    DisableControls;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      if DmMain.GetUpiInfo(nTabN, cFamIO, cFam, cIma, cOtch,
                                   cPol, cID, dDOB)  then begin
        Edit;
        FieldByName('FamIO').AsString := cFamIO;
        Post;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
  qryNu.Close;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.FormCreate(Sender: TObject);
begin
  Caption := 'Печать ведомостей зарплаты для банка';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 355);
    Width  := ReadInteger(SECTION, 'wW', 520);
    PanelLeft.Width := ReadInteger(SECTION, 'BnkW', 178);
    rBtnAll.Checked := ReadBool(SECTION, 'rBtnAll', true);
    ChBoxPrtZero.Checked := ReadBool(SECTION, 'PrtZero', false);
    popSortByFIO.Checked := ReadBool(SECTION, 'SortByFIO', false);
    Free;
  end;
  rBtnCurrent.Checked := not rBtnAll.Checked;
  popSortByLS.Checked := not popSortByFIO.Checked;
  if FileExists(cDirVids + 'MkBnkAvV.vid') then
    dbgrBanki.Columns.LoadFromFile(cDirVids + 'MkBnkAvV.vid');
  if FileExists(cDirVids + 'MkBVdNU.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'MkBVdNU.vid');
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.FormClose(Sender: TObject;
                                           var Action: TCloseAction);
begin
  dbgrBanki.Columns.SaveToFile(cDirVids + 'MkBnkAvV.vid');
  dbgrNu.Columns.SaveToFile(cDirVids + 'MkBVdNU.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'BnkW', PanelLeft.Width);
    WriteBool(SECTION, 'rBtnAll', rBtnAll.Checked);
    WriteBool(SECTION, 'PrtZero', ChBoxPrtZero.Checked);
    WriteBool(SECTION, 'SortByFIO', popSortByFIO.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.rBtnAllClick(Sender: TObject);
begin
  SetBankiFilter;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.rBtnCurrentClick(Sender: TObject);
begin
  SetBankiFilter;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.SetBankiFilter;
begin
  sBtnPrt.Enabled := rBtnCurrent.Checked;
  if not cdsNu.Active then Exit;
  with cdsNu do begin
    if rBtnAll.Checked then begin
      Filter := '';
      Filtered := false; end
    else begin
      Filter := 'KdBnk = ' + qryBanki.FieldByName('KdBnk').AsString;
      Filtered := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.dsrcBankiDataChange(Sender: TObject;
                                                      Field: TField);
begin
  if (dsrcBanki.State = dsBrowse) then begin
    if rBtnCurrent.Checked then begin
      cdsNu.Filter := 'KdBnk = ' + qryBanki.FieldByName('KdBnk').AsString;
      cdsNu.Filtered := true; end
    else
      cdsNu.Filtered := false;
    if cdsNU.Active then
      sBtnPrt.Enabled := rBtnCurrent.Checked and (cdsNU.RecordCount > 0);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.sBtnPrtClick(Sender: TObject);
var cNmBnk : string; bPrtZero : boolean;
begin
  cNmBnk := qryBanki.FieldByName('NmBnk').AsString;
  bPrtZero := ChBoxPrtZero.Checked;
  F6_PrtBankVedZp(cNmBnk, d_DtProc, cdsNu, bPrtZero);
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.popSortByFIOClick(Sender: TObject);
var nSvTabN : integer;
begin
  if not popSortByFIO.Checked then begin
    nSvTabN := cdsNu.FieldByName('TabN').AsInteger;
    popSortByFIO.Checked := true;
    popSortByLS.Checked := false;
    OpenCdsNu(d_DtProc);
    cdsNu.Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBankiVedZp.popSortByLSClick(Sender: TObject);
var nSvTabN : integer;
begin
  if not popSortByLS.Checked then begin
    nSvTabN := cdsNu.FieldByName('TabN').AsInteger;
    popSortByLS.Checked := true;
    popSortByFIO.Checked := false;
    OpenCdsNu(d_DtProc);
    cdsNU.Locate('TabN', nSvTabN, []);
  end;
end;

end.
