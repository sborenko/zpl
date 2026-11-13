unit z_ShAlm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBTables;

type
  TFormShwAlm = class(TForm)
    qryAlm: TQuery;
    dsrcAlm: TDataSource;
    dbgrAlm: TDBGrid;
    Panel1: TPanel;
    bBtnExit: TBitBtn;
    Splitter1: TSplitter;
    dbgrUdrg: TDBGrid;
    qryUdrg: TQuery;
    dsrcUdrg: TDataSource;
    qryAlmTABN: TIntegerField;
    qryAlmFAM: TStringField;
    qryAlmIMA: TStringField;
    qryAlmOTCH: TStringField;
    qryAlmFamIO: TStringField;
    qryUdrgNR: TIntegerField;
    qryUdrgKDSPS: TSmallintField;
    qryUdrgTABN: TIntegerField;
    qryUdrgVIDN: TStringField;
    qryUdrgOLDKDVIDN: TSmallintField;
    qryUdrgSUMDOLG: TFloatField;
    qryUdrgSUMVZN: TFloatField;
    qryUdrgSPSRSCH: TSmallintField;
    qryUdrgSP: TStringField;
    qryUdrgNOMDOK: TStringField;
    qryUdrgDT_BEG: TDateTimeField;
    qryUdrgDT_END: TDateTimeField;
    qryUdrgKDSPZ: TSmallintField;
    qryUdrgKDRSSCH: TIntegerField;
    qryUdrgKOMU: TStringField;
    qryUdrgADRES: TStringField;
    qryUdrgKDPST: TIntegerField;
    qryUdrgPOSTA: TStringField;
    qryUdrgNOTES: TStringField;
    qryUdrgNOMSBERBANK: TStringField;
    qryUdrgLICSCHET: TStringField;
    qryUdrgRSCHET: TStringField;
    qryUdrgBANK: TStringField;
    qryUdrgOKPOBANKA: TStringField;
    qryUdrgPROC_PSB: TFloatField;
    qryUdrgSPEC_NR: TIntegerField;
    LabelCntAlmRec: TLabel;
    qryUdrgShPst: TStringField;
    qryUdrgPrcPsb: TFloatField;
    sBtnPrt: TSpeedButton;
    qryAlmUVOLEN: TStringField;
    qryTmp: TQuery;
    updAlm: TUpdateSQL;
    rBtnAll: TRadioButton;
    rBtnNeUvoln: TRadioButton;
    procedure qryAlmCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrUdrgDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryUdrgCalcFields(DataSet: TDataSet);
    procedure sBtnPrtClick(Sender: TObject);
    procedure dbgrAlmDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    n_SvTabN, n_Case : integer;
    d_DtPrc, dDtLastPrc : TDateTime;
    bIsUvolennue : boolean;
    procedure OpenQryAlm;
    procedure SetUvolnMetka(dDtPrc, dDtLastPrc : TDateTime);
    procedure OpenQryUdrg;
  public
    { Public declarations }
  end;

procedure ShowAllAlim(dDtProc : TDateTime; nCase : integer);

const SECTION = 'z_ShAlm';

var
  FormShwAlm: TFormShwAlm;

implementation

uses A_Const, a_DM, z_Dm, z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowAllAlim(dDtProc : TDateTime; nCase : integer);
var cCaption : ShortString;
begin
  FormShwAlm := TFormShwAlm.Create(Application);
  with FormShwAlm do begin
    n_Case := nCase;
    d_DtPrc := dDtProc;
    bIsUvolennue := false;
    dDtLastPrc := MyLastDOM(d_DtPrc);
    cCaption := 'Наши алиментщики';
    if nCase = 2 then
      cCaption := cCaption + '  [только "боевые"]';
    OpenQryAlm;
    sBtnPrt.Enabled := (nCase = 2) and (qryAlm.RecordCount > 0);
    rBtnNeUvoln.Enabled := sBtnPrt.Enabled;
    rBtnAll.Enabled := sBtnPrt.Enabled;
    if n_SvTabN <> 0 then
      qryAlm.Locate('TabN', n_SvTabN, []);
    if bIsUvolennue then
      cCaption := cCaption + '  (бледным помечены уволенные)';
    Caption := cCaption;
    LabelCntAlmRec.Caption := 'Записей: ' + IntToStr(qryAlm.RecordCount);
    OpenQryUdrg;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.OpenQryAlm;
begin
  with qryAlm do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if n_Case = 1 then       // Все алиментщики
      SQL.Add('Select distinct ud.TabN, upi.Fam, upi.Ima, upi.Otch, ' +
              ' cast(null as char(1)) as uvolen ' +
              ' from Z_Uderg ud ' +
              ' Left Outer Join z_Upi upi on upi.TabN = ud.Tabn ' +
              ' where (ud.VidN = "6601") and (not upi.Fam is null) ' +
              ' order by Fam, Ima, Otch')
    else begin               // только "боевые" (по датам Dt_Beg и Dt_End)
      SQL.Add('Select distinct ud.Tabn, upi.Fam, upi.Ima, upi.Otch, ' +
              ' cast(null as char(1)) as uvolen ' +
              ' from Z_Uderg ud ' +
              ' Left Outer Join z_Upi upi on upi.TabN = ud.Tabn ' +
              ' where (ud.VidN = "6601") and (not upi.Fam is null) and ' +
              ' Exists (Select TabN from Z_Uderg ud2 ' +
              ' where (ud2.TabN = ud.TabN) and ' +
              ' (ud2.Dt_End is Null or ud2.Dt_End > :d_DtPrc)) ' +
              ' order by Fam, Ima, Otch');
      ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
    end;
    Open;
    SetUvolnMetka(d_DtPrc, dDtLastPrc);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.SetUvolnMetka(dDtPrc, dDtLastPrc : TDateTime);
var bUvolen : boolean;
begin
  // решить "уволен / не уволен" на dDtPrc и сделать отметку в qryAlm
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcAlm;
    SQL.Add('Select * from z_PrmUv where TabN = :TabN ' +
            ' order by KdSps desc, Dt_Priem desc');
    Open;
  end;
  with qryAlm do begin
    First;
    while not Eof do begin
      bUvolen := false;
      qryTmp.First;
      while not qryTmp.Eof do begin
        if not qryTmp.FieldByName('Dt_Priem').IsNull and
            (qryTmp.FieldByName('Dt_Priem').AsDateTime <= dDtLastPrc) then begin
          if qryTmp.FieldByName('Dt_Uvoln').IsNull or
               (qryTmp.FieldByName('Dt_Uvoln').AsDateTime >= dDtLastPrc) then
            bUvolen := false
          else
            bUvolen := true;
          Break;
        end;
        qryTmp.Next;
      end;
      if bUvolen then begin
        Edit;
        FieldByName('Uvolen').AsString := 'Y';
        bIsUvolennue := true;
        Post;
      end;
      Next;
    end;
    First;
  end;
  with qryTmp do begin
    Close;
    SQL.Clear;
    DataBaseName := '';
    DataSource := nil;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.OpenQryUdrg;
begin
  with qryUdrg do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcAlm;
    SQL.Add('Select * from Z_Uderg where TabN = :TabN and VidN = "6601" ' +
            ' order by Dt_Beg, Dt_End');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 650);
    dbgrAlm.Width := ReadInteger(SECTION, 'grAlmW', 180);
    n_SvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    rBtnNeUvoln.Checked := ReadBool(SECTION, 'bPrtNeUv', true);
    rBtnAll.Checked := not rBtnNeUvoln.Checked;
    Free;
  end;
  LabelCntAlmRec.Caption := '';
  if FileExists(cDirVids + 'ShAlm11.vid') then
    dbgrAlm.Columns.LoadFromFile(cDirVids + 'ShAlm11.vid');
  if FileExists(cDirVids + 'ShAlm22.vid') then
    dbgrUdrg.Columns.LoadFromFile(cDirVids + 'ShAlm22.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrAlm.Columns.SaveToFile(cDirVids + 'ShAlm11.vid');
  dbgrUdrg.Columns.SaveToFile(cDirVids + 'ShAlm22.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grAlmW', dbgrAlm.Width);
    WriteInteger(SECTION, 'nSvTabN', qryAlmTabN.AsInteger);
    WriteBool(SECTION, 'bPrtNeUv', rBtnNeUvoln.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.qryAlmCalcFields(DataSet: TDataSet);
begin
  qryAlmFamIO.AsString := MyFamIO(qryAlmFam.AsString,
                                  qryAlmIma.AsString, qryAlmOtch.AsString)
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.dbgrUdrgDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var bBoevaja : boolean;
begin
  // Выделить цветом "боевые" записи (которые каким-либо
  // краем перекрывают текущий месяц)
  // Есть d_DtPrc (всегда 1-е число месяца d_DtPrc) и
  //      dDtLastPrc (последнее число месяца d_DtPrc)
  bBoevaja := false;
  with qryUdrg do begin
    if (FieldByName('Dt_Beg').AsDateTime < dDtLastPrc) then begin
      if FieldByName('Dt_End').IsNull or
            (FieldByName('Dt_End').AsDateTime >= d_DtPrc) then
        bBoevaja := true;
    end;
  end;
  with dbgrUdrg.Canvas do begin
    if not (gdFocused in State) then begin
      if bBoevaja then
        Font.Color := clMaroon
      else
        Font.Color := clGray;
    end;
    if qryUdrg.FieldByName('KdSps').AsInteger <> gl_nKdSps then
      Font.Style := []
    else
      Font.Style := [fsBold];
  end;
  dbgrUdrg.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.qryUdrgCalcFields(DataSet: TDataSet);
var nPrcPsb : double;
begin
  nPrcPsb := 0;
  with DmMain.qryPst do begin
    if not Active then Open;
    if Locate('KdPst', qryUdrgKdPst.AsInteger, []) then begin
      qryUdrgShPst.AsString := FieldByName('ShPst').AsString;
      if not DmMain.qryPsb.Active then
        DmMain.qryPsb.Open;
      // qryPsb завязана с qryPst "Select * from z_Pst_Psb where KdPst = :KdPst
      //   order by DtBeg" поэтому с хвоста ищу дату <= d_DtPrc и беру процент
      if DmMain.qryPsb.Locate('KdPst', qryUdrgKdPst.AsInteger, []) then begin
        DmMain.qryPsb.Last;
        while not DmMain.qryPsb.Bof do begin
          if DmMain.qryPsb.FieldByName('DtBeg').AsDateTime <= d_DtPrc then begin
            nPrcPsb := DmMain.qryPsb.FieldByName('PrcPsb').AsFloat;
            Break;
          end;
          DmMain.qryPsb.Prior;
        end;
      end;
      if nPrcPsb <> 0 then
        qryUdrgPrcPsb.AsFloat := nPrcPsb;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.sBtnPrtClick(Sender: TObject);
begin
  F6_PrtActiveAlm(d_DtPrc, dDtLastPrc, qryAlm, qryUdrg, rBtnAll.Checked);
end;
//------------------------------------------------------------------------------
procedure TFormShwAlm.dbgrAlmDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrAlm.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryAlm.FieldByName('Uvolen').AsString = 'Y') then begin
        // Font.Color := clMaroon;
        Font.Style := []; end
      else begin
        // Font.Color  := clWindowText;
        Font.Style := [fsBold];
      end;
    end;
  end;
  dbgrAlm.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
