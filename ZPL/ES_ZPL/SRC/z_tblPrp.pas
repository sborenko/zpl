unit z_tblPrp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, DBTables, Grids, DBGrids, ComCtrls, Buttons,
  StdCtrls, ExtCtrls, Provider, IniFiles, Menus;

type
  TFormTblPrp = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    PageControl: TPageControl;
    tsPF: TTabSheet;
    tsSS: TTabSheet;
    tsFZ: TTabSheet;
    dbgrPF: TDBGrid;
    dbgrTVP: TDBGrid;
    dbgrFZ: TDBGrid;
    qryCds: TQuery;
    cdsPF: TClientDataSet;
    cdsTVP: TClientDataSet;
    cdsNV: TClientDataSet;
    cdsFZ: TClientDataSet;
    dsrcPF: TDataSource;
    dsrcTVP: TDataSource;
    dsrcNV: TDataSource;
    dsrcFZ: TDataSource;
    dspCds: TDataSetProvider;
    cdsPFNR: TIntegerField;
    cdsPFDTBEG: TDateTimeField;
    cdsPFPRCINV: TFloatField;
    cdsPFPRCREST: TFloatField;
    cdsPFNOTES: TStringField;
    cdsTVPNR: TIntegerField;
    cdsTVPDTBEG: TDateTimeField;
    cdsTVPPRCINV: TFloatField;
    cdsTVPPRCREST: TFloatField;
    cdsTVPNOTES: TStringField;
    cdsNVNR: TIntegerField;
    cdsNVDTBEG: TDateTimeField;
    cdsNVPRCINV: TFloatField;
    cdsNVPRCREST: TFloatField;
    cdsNVNOTES: TStringField;
    cdsFZNR: TIntegerField;
    cdsFZDTBEG: TDateTimeField;
    cdsFZPRCINV: TFloatField;
    cdsFZPRCREST: TFloatField;
    cdsFZNOTES: TStringField;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    qryTmp: TQuery;
    Splitter1: TSplitter;
    dbgrNV: TDBGrid;
    LabelActivePage: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure cdsPFBeforeOpen(DataSet: TDataSet);
    procedure cdsTVPBeforeOpen(DataSet: TDataSet);
    procedure cdsNVBeforeOpen(DataSet: TDataSet);
    procedure cdsFZBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popPopup(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure cdsPFAfterPost(DataSet: TDataSet);
    procedure cdsTVPAfterPost(DataSet: TDataSet);
    procedure cdsNVAfterPost(DataSet: TDataSet);
    procedure cdsFZAfterPost(DataSet: TDataSet);
    procedure cdsPFBeforePost(DataSet: TDataSet);
    procedure cdsTVPBeforePost(DataSet: TDataSet);
    procedure cdsNVBeforePost(DataSet: TDataSet);
    procedure cdsFZBeforePost(DataSet: TDataSet);
    procedure PageControlChange(Sender: TObject);
  private
    { Private declarations }
    bInsert, bEdit : boolean;
    procedure SetLabelActivePageCaption;
  public
    { Public declarations }
  end;

procedure ShowTblPrp;

const SECTION = 'z_tblPrp';

var
  FormTblPrp: TFormTblPrp;

implementation

uses a_Const, a_Dm, a_Lib, z_Main, z_DM, z_ETbPrp;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowTblPrp;
begin
  FormTblPrp := TFormTblPrp.Create(Application);
  with FormTblPrp do begin
    Caption := 'Таблицы удержаний с предприятия';
    cdsPF.Open;
    cdsPF.Last;
    cdsTvp.Open;
    cdsTvp.Last;
    cdsNv.Open;
    cdsNv.Last;
    cdsFZ.Open;
    cdsFZ.Last;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.DateFieldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsPFBeforeOpen(DataSet: TDataSet);
begin
  with qryCds do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_TblPfPrp order by DtBeg');
  end;
  cdsPF.ProviderName := 'dspCds';
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsTVPBeforeOpen(DataSet: TDataSet);
begin
  with qryCds do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_TblTvpPrp order by DtBeg');
  end;
  cdsTVP.ProviderName := 'dspCds';
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsNVBeforeOpen(DataSet: TDataSet);
begin
  with qryCds do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_TblNvPrp order by DtBeg');
  end;
  cdsNV.ProviderName := 'dspCds';
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsFZBeforeOpen(DataSet: TDataSet);
begin
  with qryCds do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_TblFzPrp order by DtBeg');
  end;
  cdsFZ.ProviderName := 'dspCds';
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.FormCreate(Sender: TObject);
var nSvPg : word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 425);
    Width  := ReadInteger(SECTION, 'wW', 500);
    nSvPg  := ReadInteger(SECTION, 'nSvPg', 0);
    Free;
  end;
  if nSvPg = 0 then
    PageControl.ActivePage := tsPF
  else if nSvPg = 1 then
    PageControl.ActivePage := tsSS
  else
    PageControl.ActivePage := tsFZ;
  if FileExists(cDirVids + 'PrpPF.vid') then
    dbgrPF.Columns.LoadFromFile(cDirVids + 'PrpPF.vid');
  if FileExists(cDirVids + 'PrpTvp.vid') then
    dbgrTvp.Columns.LoadFromFile(cDirVids + 'PrpTvp.vid');
  if FileExists(cDirVids + 'PrpNV.vid') then
    dbgrNv.Columns.LoadFromFile(cDirVids + 'PrpNV.vid');
  if FileExists(cDirVids + 'PrpFZ.vid') then
    dbgrFz.Columns.LoadFromFile(cDirVids + 'PrpFZ.vid');
  SetLabelActivePageCaption;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.PageControlChange(Sender: TObject);
begin
  SetLabelActivePageCaption;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.SetLabelActivePageCaption;
begin
  if PageControl.ActivePage = tsPF then begin
    LabelActivePage.Caption := 'Таблица взносов в пенсионный фонд';
    if cdsPF.Active then
      cdsPF.Last; end
  else if PageControl.ActivePage = tsSS then begin
    LabelActivePage.Caption := 'Таблицы взносов в фонд социального страхования';
    if cdsTVP.Active then
      cdsTVP.Last;
    if cdsNV.Active then
      cdsNV.Last; end
  else if PageControl.ActivePage = tsFZ then begin
    LabelActivePage.Caption := 'Таблицы взносов в фонд занятости';
    if cdsFZ.Active then
      cdsFZ.Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.FormClose(Sender: TObject; var Action: TCloseAction);
var nSvPg : word;
begin
  dbgrPF.Columns.SaveToFile(cDirVids + 'PrpPF.vid');
  dbgrTvp.Columns.SaveToFile(cDirVids + 'PrpTvp.vid');
  dbgrNv.Columns.SaveToFile(cDirVids + 'PrpNV.vid');
  dbgrFz.Columns.SaveToFile(cDirVids + 'PrpFZ.vid');
  if PageControl.ActivePage = tsPF then
    nSvPg := 0
  else if PageControl.ActivePage = tsSS then
    nSvPg := 1
  else
    nSvPg := 2;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvPg', nSvPg);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.popPopup(Sender: TObject);
begin
  if pop.PopupComponent = dbgrPF then begin
    popHead.Caption := '== Пенсионный фонд ==';
    popEdt.Enabled := cdsPF.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled; end
  else if pop.PopupComponent = dbgrTvp then begin
    popHead.Caption := '==  Ф С С   Т В П  ==';
    popEdt.Enabled := cdsTvp.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled; end
  else if pop.PopupComponent = dbgrNv then begin
    popHead.Caption := '==   Ф С С   Н В   ==';
    popEdt.Enabled := cdsNv.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled; end
  else if pop.PopupComponent = dbgrFz then begin
    popHead.Caption := '== Фонд занятости ==';
    popEdt.Enabled := cdsFz.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.popEdtClick(Sender: TObject);
begin
  if pop.PopupComponent = dbgrPF then with cdsPF do begin
    Edit;
    if EdtAddTblPrp(1, cdsPF) {z_ETbPrp} then
      Post
    else
      Cancel; end
  else if pop.PopupComponent = dbgrTvp then with cdsTVP do begin
    Edit;
    if EdtAddTblPrp(2, cdsTVP) {z_ETbPrp} then
      Post
    else
      Cancel; end
  else if pop.PopupComponent = dbgrNv then with cdsNV do begin
    Edit;
    if EdtAddTblPrp(3, cdsNV) {z_ETbPrp} then
      Post
    else
      Cancel; end
  else if pop.PopupComponent = dbgrFz then with cdsFZ do begin
    Edit;
    if EdtAddTblPrp(4, cdsFZ) {z_ETbPrp} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.popAddClick(Sender: TObject);
begin
  if pop.PopupComponent = dbgrPF then with cdsPF do begin
    Append;
    if EdtAddTblPrp(1, cdsPF) {z_ETbPrp} then
      Post
    else
      Cancel; end
  else if pop.PopupComponent = dbgrTvp then with cdsTVP do begin
    Append;
    if EdtAddTblPrp(2, cdsTVP) {z_ETbPrp} then
      Post
    else
      Cancel; end
  else if pop.PopupComponent = dbgrNv then with cdsNV do begin
    Append;
    if EdtAddTblPrp(3, cdsNV) {z_ETbPrp} then
      Post
    else
      Cancel; end
  else if pop.PopupComponent = dbgrFz then with cdsFZ do begin
    Append;
    if EdtAddTblPrp(4, cdsFZ) {z_ETbPrp} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.popDelClick(Sender: TObject);
var cMsg : string;
begin
  cMsg := 'Запись удаляется безвозвратно. Согласны:?';
  if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    if pop.PopupComponent = dbgrPF then begin
      SQL.Add('Delete from Z_TblPfPrp where NR = :nNR');
      ParamByName('nNR').AsInteger := cdsPfNR.AsInteger; end
    else if pop.PopupComponent = dbgrTVP then begin
      SQL.Add('Delete from Z_TblTvpPrp where NR = :nNR');
      ParamByName('nNR').AsInteger := cdsTvpNR.AsInteger; end
    else if pop.PopupComponent = dbgrNV then begin
      SQL.Add('Delete from Z_TblNvPrp where NR = :nNR');
      ParamByName('nNR').AsInteger := cdsNvNR.AsInteger; end
    else if pop.PopupComponent = dbgrFZ then begin
      SQL.Add('Delete from Z_TblFzPrp where NR = :nNR');
      ParamByName('nNR').AsInteger := cdsFzNR.AsInteger;
    end;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  if pop.PopupComponent = dbgrPF then with cdsPF do begin
    Close;
    Open; end
  else if pop.PopupComponent = dbgrTVP then with cdsTVP do begin
    Close;
    Open; end
  else if pop.PopupComponent = dbgrNV then with cdsNV do begin
    Close;
    Open; end
  else if pop.PopupComponent = dbgrFZ then with cdsFZ do begin
    Close;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsPFBeforePost(DataSet: TDataSet);
begin
  if cdsPF.State = dsInsert then begin
    bInsert := true;
    bEdit := false; end
  else begin
    bInsert := false;
    bEdit := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsPFAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    if bInsert then begin
      SQL.Add('Insert into Z_TblPfPrp (DtBeg, PrcInv, PrcRest, Notes) ' +
              ' values (:dDtBeg, :nPrcInv, :nPrcRest, :cNotes)');
      ParamByName('dDtBeg').AsDateTime := cdsPFDtBeg.AsDateTime;
      ParamByName('nPrcInv').AsFloat := cdsPFPrcInv.AsFloat;
      ParamByName('nPrcRest').AsFloat := cdsPFPrcRest.AsFloat;
      ParamByName('cNotes').AsString := cdsPFNotes.AsString; end
    else if bEdit then begin
      nSvNR := cdsPFNR.AsInteger;
      SQL.Add('Update Z_TblPfPrp set DtBeg = :dDtBeg, PrcInv = :nPrcInv, ' +
              ' PrcRest = :nPrcRest, Notes = :cNotes ' +
              ' where NR = :nNR');
      ParamByName('dDtBeg').AsDateTime := cdsPFDtBeg.AsDateTime;
      ParamByName('nPrcInv').AsFloat := cdsPFPrcInv.AsFloat;
      ParamByName('nPrcRest').AsFloat := cdsPFPrcRest.AsFloat;
      ParamByName('cNotes').AsString := cdsPFNotes.AsString;
      ParamByName('nNR').AsInteger := cdsPFNR.AsInteger;
    end;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
    with cdsPF do begin
      Close;
      Open;
      if bEdit then
        Locate('NR', nSvNR, [])
      else
        Last;
    end;
    bInsert := false;
    bEdit := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsTVPBeforePost(DataSet: TDataSet);
begin
  if cdsTVP.State = dsInsert then begin
    bInsert := true;
    bEdit := false; end
  else begin
    bInsert := false;
    bEdit := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsTVPAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    if bInsert then begin
      SQL.Add('Insert into Z_TblTvpPrp (DtBeg, PrcInv, PrcRest, Notes) ' +
              ' values (:dDtBeg, :nPrcInv, :nPrcRest, :cNotes)');
      ParamByName('dDtBeg').AsDateTime := cdsTvpDtBeg.AsDateTime;
      ParamByName('nPrcInv').AsFloat := cdsTvpPrcInv.AsFloat;
      ParamByName('nPrcRest').AsFloat := cdsTvpPrcRest.AsFloat;
      ParamByName('cNotes').AsString := cdsTvpNotes.AsString; end
    else if bEdit then begin
      nSvNR := cdsTvpNR.AsInteger;
      SQL.Add('Update Z_TblTvpPrp set DtBeg = :dDtBeg, PrcInv = :nPrcInv, ' +
              ' PrcRest = :nPrcRest, Notes = :cNotes ' +
              ' where NR = :nNR');
      ParamByName('dDtBeg').AsDateTime := cdsTvpDtBeg.AsDateTime;
      ParamByName('nPrcInv').AsFloat := cdsTvpPrcInv.AsFloat;
      ParamByName('nPrcRest').AsFloat := cdsTvpPrcRest.AsFloat;
      ParamByName('cNotes').AsString := cdsTvpNotes.AsString;
      ParamByName('nNR').AsInteger := cdsTvpNR.AsInteger;
    end;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
    with cdsTvp do begin
      Close;
      Open;
      if bEdit then
        Locate('NR', nSvNR, [])
      else
        Last;
    end;
    bInsert := false;
    bEdit := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsNVBeforePost(DataSet: TDataSet);
begin
  if cdsNV.State = dsInsert then begin
    bInsert := true;
    bEdit := false; end
  else begin
    bInsert := false;
    bEdit := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsNVAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    if bInsert then begin
      SQL.Add('Insert into Z_TblNvPrp (DtBeg, PrcInv, PrcRest, Notes) ' +
              ' values (:dDtBeg, :nPrcInv, :nPrcRest, :cNotes)');
      ParamByName('dDtBeg').AsDateTime := cdsNVDtBeg.AsDateTime;
      ParamByName('nPrcInv').AsFloat := cdsNVPrcInv.AsFloat;
      ParamByName('nPrcRest').AsFloat := cdsNVPrcRest.AsFloat;
      ParamByName('cNotes').AsString := cdsNVNotes.AsString; end
    else if bEdit then begin
      nSvNR := cdsNVNR.AsInteger;
      SQL.Add('Update Z_TblNvPrp set DtBeg = :dDtBeg, PrcInv = :nPrcInv, ' +
              ' PrcRest = :nPrcRest, Notes = :cNotes ' +
              ' where NR = :nNR');
      ParamByName('dDtBeg').AsDateTime := cdsNVDtBeg.AsDateTime;
      ParamByName('nPrcInv').AsFloat := cdsNVPrcInv.AsFloat;
      ParamByName('nPrcRest').AsFloat := cdsNVPrcRest.AsFloat;
      ParamByName('cNotes').AsString := cdsNVNotes.AsString;
      ParamByName('nNR').AsInteger := cdsNVNR.AsInteger;
    end;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
    with cdsNV do begin
      Close;
      Open;
      if bEdit then
        Locate('NR', nSvNR, [])
      else
        Last;
    end;
    bInsert := false;
    bEdit := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsFZBeforePost(DataSet: TDataSet);
begin
  if cdsFZ.State = dsInsert then begin
    bInsert := true;
    bEdit := false; end
  else begin
    bInsert := false;
    bEdit := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPrp.cdsFZAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    if bInsert then begin
      SQL.Add('Insert into Z_TblFzPrp (DtBeg, PrcInv, PrcRest, Notes) ' +
              ' values (:dDtBeg, :nPrcInv, :nPrcRest, :cNotes)');
      ParamByName('dDtBeg').AsDateTime := cdsFZDtBeg.AsDateTime;
      ParamByName('nPrcInv').AsFloat := cdsFZPrcInv.AsFloat;
      ParamByName('nPrcRest').AsFloat := cdsFZPrcRest.AsFloat;
      ParamByName('cNotes').AsString := cdsFZNotes.AsString; end
    else if bEdit then begin
      nSvNR := cdsFZNR.AsInteger;
      SQL.Add('Update Z_TblFzPrp set DtBeg = :dDtBeg, PrcInv = :nPrcInv, ' +
              ' PrcRest = :nPrcRest, Notes = :cNotes ' +
              ' where NR = :nNR');
      ParamByName('dDtBeg').AsDateTime := cdsFZDtBeg.AsDateTime;
      ParamByName('nPrcInv').AsFloat := cdsFZPrcInv.AsFloat;
      ParamByName('nPrcRest').AsFloat := cdsFZPrcRest.AsFloat;
      ParamByName('cNotes').AsString := cdsFZNotes.AsString;
      ParamByName('nNR').AsInteger := cdsFZNR.AsInteger;
    end;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
    with cdsFZ do begin
      Close;
      Open;
      if bEdit then
        Locate('NR', nSvNR, [])
      else
        Last;
    end;
    bInsert := false;
    bEdit := false;
  end;
end;

end.
