unit a_KliRs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, ExtCtrls, Grids, DBGrids, DB, DBTables, Buttons, StdCtrls,
  Menus;

type
  TFormKliRS = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    SpeedButton1: TSpeedButton;
    qryKli: TQuery;
    qryRS: TQuery;
    dsrcKli: TDataSource;
    dsrcRS: TDataSource;
    dbgrKli: TDBGrid;
    Splitter1: TSplitter;
    dbgrRS: TDBGrid;
    LabelCntRecKli: TLabel;
    LabelCntRecRS: TLabel;
    qryKliNR: TIntegerField;
    qryKliKDKLI: TSmallintField;
    qryKliOKPO: TStringField;
    qryKliNMKLI: TStringField;
    qryKliNOTES: TStringField;
    qryKliWYEAR: TSmallintField;
    qryRSNR: TIntegerField;
    qryRSKDKLI: TSmallintField;
    qryRSKDRSCH: TSmallintField;
    qryRSMFO: TIntegerField;
    qryRSRSCH: TStringField;
    qryRSNMKLI: TStringField;
    qryRSNMBNK: TStringField;
    qryRSISVAL: TStringField;
    qryRSNOTES: TStringField;
    popKli: TPopupMenu;
    popKliEdt: TMenuItem;
    popKliAdd: TMenuItem;
    popKliDel: TMenuItem;
    popKliHead: TMenuItem;
    popKliSep1: TMenuItem;
    popKliOrder: TMenuItem;
    popKliOrderByOkpo: TMenuItem;
    popKliOrderByNmKli: TMenuItem;
    popKliPlategiCurKli: TMenuItem;
    LabelKliOrder: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsrcKliDataChange(Sender: TObject; Field: TField);
    procedure popKliOrderByNmKliClick(Sender: TObject);
    procedure popKliOrderByOkpoClick(Sender: TObject);
    procedure popKliPlategiCurKliClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryKliAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    n_SvKdKli : SmallInt;
    n_Year : SmallInt;
    procedure OpenQryKli(nYear : SmallInt);
    procedure OpenQryRS;
  public
    { Public declarations }
  end;

procedure KliRS2008(nYear : SmallInt);

const SECTION = 'b_KliRS';

var
  FormKliRS: TFormKliRS;
//  bIsFormShowKliDocs : boolean;  // чтобы можно было обратиться к b_ShKliD
                                 // для просмотра документов (хотя и не в
implementation                   // НеМодальном режиме)

uses A_Const, A_Dm, b_Dm, b_Main, A_Lib, b_ShKliD;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure KliRS2008(nYear : SmallInt);
begin
  FormKliRS := TFormKliRS.Create(Application);
  with FormKliRS do begin
    bIsFormShowKliDocs := false;
    Caption := 'Клиенты и расчетные счета 2008';
    n_Year := nYear;
    OpenQryKli(nYear);
    if n_SvKdKli <> 0 then
      qryKli.Locate('KdKli', n_SvKdKli, []);
    OpenQryRS;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliRS.OpenQryKli(nYear: SmallInt);
var nSvNR : SmallInt;
begin
  with qryKli do begin
    nSvNR := 0;
    if Active then begin
      nSvNR := qryKliNR.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from b_Kli ');
    if popKliOrderByOkpo.Checked then begin
      SQL.Add(' order by OKPO');
      LabelKliOrder.Caption := 'Сортировано по ОКПО'; end
    else begin
      SQL.Add(' order by NmKli, OKPO');
      LabelKliOrder.Caption := 'Сортировано по Наименованию клиента';
    end;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
    LabelCntRecKli.Caption := 'Клиентов: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliRS.OpenQryRS;
begin
  with qryRS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcKli;
    SQL.Add('Select * from b_RSch where KdKli = :KdKli order by KdRSch');
    Open;
    LabelCntRecRS.Caption := 'Расч.счетов: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliRS.FormCreate(Sender: TObject);
begin
  LabelKliOrder.Caption := '';
  LabelCntRecKli.Caption := '';
  LabelCntRecRS.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 650);
    Width  := ReadInteger(SECTION, 'wW', 700);
    dbgrKli.Height := ReadInteger(SECTION, 'GrKliH', 465);
    n_SvKdKli :=  ReadInteger(SECTION, 'nSvKli', 0);
    Free;
  end;
  if FileExists(cDirVids + 'KliRS08k.vid') then
    dbgrKli.Columns.LoadFromFile(cDirVids + 'KliRS08k.vid');
  if FileExists(cDirVids + 'KliRS08r.vid') then
    dbgrRS.Columns.LoadFromFile(cDirVids + 'KliRS08r.vid');
end;
//------------------------------------------------------------------------------
procedure TFormKliRS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if bIsFormShowKliDocs then
    FormShowKliDocs.Close;
end;
//------------------------------------------------------------------------------
procedure TFormKliRS.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  dbgrKli.Columns.SaveToFile(cDirVids + 'KliRS08k.vid');
  dbgrRS.Columns.SaveToFile(cDirVids + 'KliRS08r.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'GrKliH', dbgrKli.Height);
    WriteInteger(SECTION, 'nSvKli', qryKliKdKli.AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliRS.dsrcKliDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcKli.State = dsBrowse) and (qryRS.Active) then begin
    if qryRS.RecordCount > 0 then
      LabelCntRecRS.Caption := 'Расч.счетов: ' + IntToStr(qryRS.RecordCount)
    else
      LabelCntRecRS.Caption := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliRS.popKliOrderByNmKliClick(Sender: TObject);
begin
  if not popKliOrderByNmKli.Checked then begin
    popKliOrderByNmKli.Checked := true;
    popKliOrderByOkpo.Checked := false;
    OpenQryKli(n_Year);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliRS.popKliOrderByOkpoClick(Sender: TObject);
begin
  if not popKliOrderByOkpo.Checked then begin
    popKliOrderByOkpo.Checked := true;
    popKliOrderByNmKli.Checked := false;
    OpenQryKli(n_Year);
  end;
end;

procedure TFormKliRS.popKliPlategiCurKliClick(Sender: TObject);
var cLstRSch : string; i, nRecCount : SmallInt; nSvNR : integer;
    cNmKli, cOkpo : ShortString;
begin
  cLstRSch := '(';
  cNmKli := qryKliNmKli.AsString;
  cOkpo  := qryKliOkpo.AsString;
  with qryRS do begin
    nSvNR := qryRsNR.AsInteger;
    DisableControls;
    nRecCount := RecordCount;
    First;
    i := 1;
    while not Eof do begin
      cLstRSch := cLstRSch + qryRsKdRSch.AsString;
      Inc(i);
      if i < nRecCount then
        cLstRSch := cLstRSch + ',';
      Next;
    end;
    cLstRSch := cLstRSch + ')';
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  if cLstRSch = '()' then
    cLstRSch := '(-777)'; // Чтобы не случился SQL-error при пустом списке
                          // и все-таки переоткрылся cdsKliD в b_ShKliD
  ShowPltgCurKli(n_Year, cLstRSch, cNmKli, cOkpo);  {b_ShKliD}
end;
//------------------------------------------------------------------------------
procedure TFormKliRS.qryKliAfterScroll(DataSet: TDataSet);
var cLstRSch : string; i, nRecCount : SmallInt; nSvNR : integer;
    cNmKli, cOkpo : ShortString;
begin
  if bIsFormShowKliDocs then begin
    cLstRSch := '(';
    cNmKli := qryKliNmKli.AsString;
    cOkpo  := qryKliOkpo.AsString;
    with qryRS do begin
      nSvNR := qryRsNR.AsInteger;
      DisableControls;
      nRecCount := RecordCount;
      First;
      i := 1;
      while not Eof do begin
        cLstRSch := cLstRSch + qryRsKdRSch.AsString;
        Inc(i);
        if i < nRecCount then
          cLstRSch := cLstRSch + ',';
        Next;
      end;
      cLstRSch := cLstRSch + ')';
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    if cLstRSch = '()' then
      cLstRSch := '(-777)'; // Чтобы не случился SQL-error при пустом списке
                            // и все-таки переоткрылся cdsKliD в b_ShKliD
    FormShowKliDocs.Open_CdsKliD(n_Year, cLstRSch);
    FormShowKliDocs.Caption := 'Платежи по Клиенту "' + cNmKli +
                                               '" (ОКПО = "' + cOkpo + '")';
    FormShowKliDocs.n_Year := n_Year;
    FormShowKliDocs.c_LstRSch := cLstRSch;
  end;
end;

end.
