unit z_InvPns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  TFormInvNoPens = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dbgrP: TDBGrid;
    cdsP: TClientDataSet;
    dsrcP: TDataSource;
    qryTmp: TQuery;
    cdsPNR: TAutoIncField;
    cdsPTabN: TIntegerField;
    cdsPFamIO: TStringField;
    cdsPDolgnost: TStringField;
    cdsPdtBeg: TDateField;
    cdsPPrPens: TSmallintField;
    cdsPInv: TSmallintField;
    cdsPOklTrf: TFloatField;
    Splitter1: TSplitter;
    dbgrNU: TDBGrid;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    qryNUVIDN: TStringField;
    qryNUSHVIDN: TStringField;
    qryNUPSCH: TStringField;
    qryNUSCHBU: TStringField;
    qryNUVID_KDSPZ: TSmallintField;
    qryNUVID_SPZ: TStringField;
    qryNUVID_KDSCHDT: TSmallintField;
    qryNUVID_SCHDT: TStringField;
    qryNUVID_KDSCHKT: TSmallintField;
    qryNUVID_SCHKT: TStringField;
    qryNUVID_KEKV: TStringField;
    qryNUNR: TIntegerField;
    qryNUDTPROC: TDateTimeField;
    qryNUZAMESGOD: TDateTimeField;
    qryNUTABN: TIntegerField;
    qryNUCHAS: TFloatField;
    qryNUSUMMA: TFloatField;
    qryNUDT_BEG: TDateTimeField;
    qryNUDT_END: TDateTimeField;
    qryNUKDSPS: TSmallintField;
    qryNUKDOBJ: TSmallintField;
    qryNUKDKATP: TSmallintField;
    qryNUKDSPZ: TSmallintField;
    qryNUPDN: TSmallintField;
    qryNUNOTES: TStringField;
    qryNUPRR: TSmallintField;
    qryNUPRPV: TSmallintField;
    qryNUKTO: TSmallintField;
    qryNUPRKR: TSmallintField;
    qryNUMYNOTES: TStringField;
    qryNUSPECPS: TIntegerField;
    qryNUSPEC_NR: TIntegerField;
    qryNUDTVDPV: TDateTimeField;
    qryNUNRVDPV: TIntegerField;
    qryNUZP13: TStringField;
    qryNUOTP: TStringField;
    qryNUBLN: TStringField;
    qryNUOTPUSKN: TStringField;
    qryNUBOLNIC: TStringField;
    qryNUSPRM: TStringField;
    qryNUCPRM: TStringField;
    qryNUDETI: TStringField;
    qryNUDETIM: TStringField;
    qryNUDETIK: TStringField;
    qryNUDETIG: TStringField;
    qryNUIND: TStringField;
    qryNUDHD: TStringField;
    qryNUOKLFND: TStringField;
    qryNUCBUDG: TStringField;
    qryNUSNDB: TStringField;
    qryNUSPDN: TStringField;
    qryNUSPRF: TStringField;
    qryNUSPENS: TStringField;
    qryNUSALIM: TStringField;
    qryNUCNDB: TStringField;
    qryNUSSOCSTRAH: TStringField;
    qryNUSBZR: TStringField;
    qryNUSP_PF: TStringField;
    qryNUSP_FSTVP: TStringField;
    qryNUSP_FSNV: TStringField;
    qryNUSP_FZ: TStringField;
    qryNUSOVM: TStringField;
    qryNUSPOV: TStringField;
    PanelTts: TPanel;
    SpeedButton1: TSpeedButton;
    sBtnTotals: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelCntTt: TLabel;
    LabelSmTt: TLabel;
    LabelCntInP: TLabel;
    LabelSmInPFz: TLabel;
    sBtnPrt: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrPDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure sBtnTotalsClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    n_Y, n_M : word;
    procedure CreOpenCdsP(dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

procedure ShowInvNoPens(dDtPrc : TDateTime);

const SECTION = 'z_InvPns';

var
  FormInvNoPens: TFormInvNoPens;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowInvNoPens(dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormInvNoPens := TFormInvNoPens.Create(Application);
  with FormInvNoPens do begin
    DecodeDate(dDtPrc, nY, nM, nD);
    n_Y := nY;
    n_M := nM;
    Caption := 'Пенсионеры - Инвалиды (' +
                             MesRus(nM) + ' ' + IntToStr(nY) + ' г.)';
    CreOpenCdsP(dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.CreOpenCdsP(dDtPrc : TDateTime);
var dDtEndMes : TDateTime;
begin
  dDtEndMes := MyLastDOM(dDtPrc);
  with cdsP do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select TabN, count(TabN) from Z_NU ' +
            ' where dtProc = :dDtPrc and VidN < "6000" and ' +
            ' PRR in (3,4,7) group by TabN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      cdsP.Append;
      cdsPTabN.AsInteger := FieldByName('TabN').AsInteger;
      cdsPFamIO.AsString := DmMain.TabN2FamIO(FieldByName('TabN').AsInteger);
      cdsP.Post;
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select * from GET_PERE (:nTabN, :dDtEndMes)');
    ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
    cdsP.First;
    while not cdsP.Eof do begin
      Close;
      ParamByName('nTabN').AsInteger := cdsPTabN.AsInteger;
      Open;
      cdsP.Edit;
      cdsPDolgnost.AsString := FieldByName('Dolgnost').AsString;
      cdsPDtBeg.AsString    := FieldByName('Dt_Beg').AsString;
      cdsPPrPens.AsString   := FieldByName('Pr_Pens').AsString;
      cdsPInv.AsString      := FieldByName('Inv').AsString;
      cdsPOklTrf.AsString   := FieldByName('OklTrf').AsString;
      cdsP.Post;
      cdsP.Next;
    end;
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  cdsP.First;
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcP;
    SQL.Add('Select * from ViNuMain where DtProc = :dDtPrc and ' +
            ' TabN = :TabN and VidN < "6000" order by ZaMesGod, VidN' );
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 580);
    Width  := ReadInteger(SECTION, 'wW', 685);
    dbgrNU.Height := ReadInteger(SECTION, 'grpNU', 250);
    Free;
  end;
  if FileExists(cDirVids + 'PiP.vid') then
    dbgrP.Columns.LoadFromFile(cDirVids + 'PiP.vid');
  if FileExists(cDirVids + 'PipNU_1.vid') then
    dbgrNU.Columns.LoadFromFile(cDirVids + 'PipNU_1.vid');
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrP.Columns.SaveToFile(cDirVids + 'PiP.vid');
  dbgrNU.Columns.SaveToFile(cDirVids + 'PipNU_1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grpNU', dbgrNU.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.dbgrPDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrP.Canvas do begin
    if not (gdFocused in State) then begin
      if cdsPPrPens.IsNull or (cdsPPrPens.AsInteger <= 0) then
        Font.Style := [fsBold];
    end;
  end;
  dbgrP.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.dbgrNUDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrNU.Canvas do begin
    if not (gdFocused in State) then begin
      if (UpperCase(Column.FieldName) = 'SUMMA') then begin
        Font.Style := [fsBold];
        if Column.Field.Value < 0 then
          Font.Color := clRed;
      end;    
    end;
  end;
  dbgrNU.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.FormResize(Sender: TObject);
begin
  PanelTts.Top := Round((Height - PanelTts.Height) / 2);
  PanelTts.Left := Round((Width - PanelTts.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.sBtnTotalsClick(Sender: TObject);
var nCntTt, nCntInP : SmallInt;  nSvNR : integer;
    nSmTt, nSmInP, nSmInPFz : double;
begin
  PanelTts.Visible := false;
  Application.ProcessMessages;
  nCntTt   := 0;  // всего инвалидов
  nCntInP  := 0;  // всего инвалидов неПенсионеров
  nSmTt    := 0;  // ФОТ всех инвалидов
  nSmInP   := 0;  // ФОТ всех инвалидов неПенсионеров
  nSmInPFz := 0;  // ФОТ всех инвалидов неПенсионеров для ФЗ (с 7)
  with cdsP do begin
    nSvNR := cdsPNR.AsInteger;
    First;
    while not Eof do begin
      Inc(nCntTt);
      if cdsPPrPens.IsNull or (cdsPPrPens.AsInteger <= 0) then
        nCntInP := nCntInP + 1;
      qryNU.First;
      while not qryNu.Eof do begin
        nSmTt := nSmTt + qryNuSumma.AsFloat;
        if cdsPPrPens.IsNull or (cdsPPrPens.AsInteger <= 0) then begin
          nSmInP := nSmInP + qryNuSumma.AsFloat;
          if not qryNuSBZR.IsNull and (qryNuSBZR.AsInteger = 1) then
            nSmInPFz := nSmInPFz + qryNuSumma.AsFloat;
        end;
        qryNu.Next;
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    LabelCntTt.Caption := IntToStr(nCntTt);
    LabelSmTt.Caption := FloatToStrF(nSmTt, ffCurrency, 18, 2);
    LabelCntInP.Caption := IntToStr(nCntInP);
    LabelSmInPFz.Caption := FloatToStrF(nSmInPFz, ffCurrency, 18, 2);
  end;
  PanelTts.Visible := true;
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.SpeedButton1Click(Sender: TObject);
begin
  PanelTts.Visible := false;;
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormInvNoPens.sBtnPrtClick(Sender: TObject);
var cMes : ShortString;
begin
  cMes := MesRus(n_M) + ' ' + IntToStr(n_Y) + ' г.';
  F6PrtInvPns(cdsP, qryNU, cMes);   {z_CmnPrt}
end;

end.
