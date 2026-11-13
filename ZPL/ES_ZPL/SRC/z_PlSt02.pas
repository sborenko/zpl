unit z_PlSt02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, StdCtrls, Mask, DBCtrls, DBClient, Buttons,
  DBTables, ExtCtrls, ComCtrls;

type
  TFormPlStat02 = class(TForm)
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    cdsTmp: TClientDataSet;
    cdsTmpTabN: TIntegerField;
    cdsTmppMes01: TFloatField;
    cdsTmppMes02: TFloatField;
    cdsTmppMes03: TFloatField;
    cdsTmppMes04: TFloatField;
    cdsTmppMes05: TFloatField;
    cdsTmppPer01: TFloatField;
    cdsTmppPer02: TFloatField;
    cdsTmppPer03: TFloatField;
    cdsTmppPer04: TFloatField;
    cdsTmppPer05: TFloatField;
    cdsTmppPer06: TFloatField;
    cdsTmppPer07: TFloatField;
    cdsTmppPer08: TFloatField;
    cdsTmppPer09: TFloatField;
    Label1: TLabel;
    dbeTabN2: TDBEdit;
    dsrcTmp: TDataSource;
    Label2: TLabel;
    dbePMes01: TDBEdit;
    Label3: TLabel;
    dbePMes02: TDBEdit;
    Label4: TLabel;
    dbePMes03: TDBEdit;
    Label5: TLabel;
    dbePMes04: TDBEdit;
    Label6: TLabel;
    dbePMes05: TDBEdit;
    Label7: TLabel;
    dbePPer01: TDBEdit;
    Label8: TLabel;
    dbePPer02: TDBEdit;
    Label9: TLabel;
    dbePPer03: TDBEdit;
    Label10: TLabel;
    dbePPer04: TDBEdit;
    Label11: TLabel;
    dbePPer05: TDBEdit;
    Label12: TLabel;
    dbePPer06: TDBEdit;
    Label13: TLabel;
    dbePPer07: TDBEdit;
    Label14: TLabel;
    dbePPer08: TDBEdit;
    Label15: TLabel;
    dbePPer09: TDBEdit;
    bBtnCancel2: TBitBtn;
    qryTmp: TQuery;
    Panel1: TPanel;
    Label16: TLabel;
    dbeTabN: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    bBtnCancel: TBitBtn;
    cds01: TClientDataSet;
    cds01TabN: TIntegerField;
    dsrc01: TDataSource;
    sBtnGoBack: TSpeedButton;
    sBtnGoForward: TSpeedButton;
    sBtnTabN: TSpeedButton;
    cds01God: TSmallintField;
    cds01Mes: TSmallintField;
    UpDownGod: TUpDown;
    UpDownMes: TUpDown;
    edGod: TEdit;
    edMes: TEdit;
    cds01FamIO: TStringField;
    dbtFamIO: TDBText;
    dbtFamIO2: TDBText;
    LabelZaMes: TLabel;
    LabelZaGod: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure sBtnGoBackClick(Sender: TObject);
    procedure sBtnGoForwardClick(Sender: TObject);
    procedure DBEditEnter(Sender: TObject);
    procedure DBEditExit(Sender: TObject);
    procedure edGodEnter(Sender: TObject);
    procedure edGodExit(Sender: TObject);
    procedure cds01TabNValidate(Sender: TField);
    procedure sBtnTabNClick(Sender: TObject);
  private
    n_TabN, n_SvTabN : integer;
    c_FamIO, c_SvFamIO : ShortString;
    n_God, n_Mes, n_SvGod, n_SvMes : SmallInt;
    d_DtPrc, d_DtBegP, d_DtEndP : TdateTime;
    bNeedValidation : boolean;
    procedure DoSchet(nTabN : integer; dDtPrc, dDtBegP, dDtEndP : TDateTime);
    { Private declarations }
  public
    { Public declarations }
  end;

procedure GetPlStat02(nTabN : integer; cFamIO : ShortString);

const SECTION = 'z_PlSt02';

var
  FormPlStat02: TFormPlStat02;

implementation

uses A_Const, A_Lib, A_DM, Z_DM, z_Main, z_GtQUpi;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure GetPlStat02(nTabN : integer; cFamIO : ShortString);
begin
  FormPlStat02 := TFormPlStat02.Create(Application);
  with FormPlStat02 do begin
    Caption := 'Статистика планового отдела';
    n_TabN   := nTabN;
    c_FamIO  := cFamIO;
    ts1.TabVisible := false;
    ts2.TabVisible := false;
    PageControl1.ActivePage := ts1;
    Panel1.Top := Round((Height - Panel1.Height) / 2) - 40;
    bNeedValidation := false;
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
    end;
    with cds01 do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
    end;
    with cds01 do begin
      if nTabN > 0 then begin
        cds01TabN.AsInteger := nTabN;
        cds01FamIO.AsString := cFamIO; end
      else if n_SvTabN > 0 then begin
        cds01TabN.AsInteger := n_SvTabN;
        cds01FamIO.AsString := c_SvFamIO;
      end;
      if n_SvGod <> 0 then
        UpDownGod.Position := n_SvGod;
      if n_SvMes <> 0 then
        UpDownMes.Position := n_SvMes;
    end;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left      := ReadInteger(SECTION, 'wL', 100);
    Top       := ReadInteger(SECTION, 'wT', 400);
    Height    := 447;
    n_SvGod   := ReadInteger(SECTION, 'nSvGd', 2013);
    n_SvMes   := ReadInteger(SECTION, 'nSvMs', 9);
    n_SvTabN  := ReadInteger(SECTION, 'nSvTN', 0);
    c_SvFamIO := ReadString(SECTION, 'cSvFm', '');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nSvGd', UpDownGod.Position);
    WriteInteger(SECTION, 'nSvMs', UpDownMes.Position);
    WriteInteger(SECTION, 'nSvTN', cds01TabN.AsInteger);
    WriteString(SECTION, 'cSvFm', cds01FamIO.AsString);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.DoSchet(nTabN: integer;
                                           dDtPrc, dDtBegP, dDtEndP: TDateTime);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod = :dDtPrc and ' +
            ' VidN >= "1001" and VidN <= "2411"');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    cdsTmpPMes01.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod = :dDtPrc and ' +
            ' VidN in ("1003", "1206")');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    cdsTmpPMes02.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod = :dDtPrc and VidN = "1204"');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    cdsTmpPMes03.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod = :dDtPrc and VidN >= "2201" and VidN <= "2214"');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    cdsTmpPMes04.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod = :dDtPrc and VidN in ("1201", "1202")');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    cdsTmpPMes05.AsFloat := FieldByName('SMM').AsFloat;


    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBegP and ZaMesGod <= :dDtEndP and ' +
            ' VidN >= "1001" and VidN <= "2411"');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegP').AsDateTime := dDtBegP;
    ParamByName('dDtEndP').AsDateTime := dDtEndP;
    Open;
    cdsTmpPPer01.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBegP and ZaMesGod <= :dDtEndP and ' +
            ' VidN in ("1003", "1206")');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegP').AsDateTime := dDtBegP;
    ParamByName('dDtEndP').AsDateTime := dDtEndP;
    Open;
    cdsTmpPPer02.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBegP and ZaMesGod <= :dDtEndP and ' +
            ' VidN in ("1204")');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegP').AsDateTime := dDtBegP;
    ParamByName('dDtEndP').AsDateTime := dDtEndP;
    Open;
    cdsTmpPPer03.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBegP and ZaMesGod <= :dDtEndP and ' +
            ' VidN in ("1404")');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegP').AsDateTime := dDtBegP;
    ParamByName('dDtEndP').AsDateTime := dDtEndP;
    Open;
    cdsTmpPPer04.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBegP and ZaMesGod <= :dDtEndP and ' +
            ' VidN >= "2201" and VidN <= "2214"');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegP').AsDateTime := dDtBegP;
    ParamByName('dDtEndP').AsDateTime := dDtEndP;
    Open;
    cdsTmpPPer05.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBegP and ZaMesGod <= :dDtEndP and ' +
            ' VidN in ("2206", "2214")');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegP').AsDateTime := dDtBegP;
    ParamByName('dDtEndP').AsDateTime := dDtEndP;
    Open;
    cdsTmpPPer06.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBegP and ZaMesGod <= :dDtEndP and ' +
            ' VidN in ("1201", "1202")');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegP').AsDateTime := dDtBegP;
    ParamByName('dDtEndP').AsDateTime := dDtEndP;
    Open;
    cdsTmpPPer07.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBegP and ZaMesGod <= :dDtEndP and ' +
            ' VidN in ("2402", "2403", "2406", "2411")');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegP').AsDateTime := dDtBegP;
    ParamByName('dDtEndP').AsDateTime := dDtEndP;
    Open;
    cdsTmpPPer08.AsFloat := FieldByName('SMM').AsFloat;

    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBegP and ZaMesGod <= :dDtEndP and ' +
            ' VidN in ("1801", "1803", "1810")');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegP').AsDateTime := dDtBegP;
    ParamByName('dDtEndP').AsDateTime := dDtEndP;
    Open;
    cdsTmpPPer09.AsFloat := FieldByName('SMM').AsFloat;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.FormResize(Sender: TObject);
begin
  //Panel1.Top := Round((Height - Panel1.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.sBtnGoBackClick(Sender: TObject);
begin
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.sBtnGoForwardClick(Sender: TObject);
begin
  n_TabN   := cds01TabN.AsInteger;
  n_God    := UpDownGod.Position;
  n_Mes    := UpDownMes.Position;
  d_DtPrc  := EncodeDate(n_God, n_Mes, 1);
  d_DtBegP := EncodeDate(n_God, 1, 1);
  d_DtEndP := EncodeDate(n_God, 12, 1);
  LabelZaMes.Caption := 'За ' + MesRus(n_Mes) + ':';
  LabelZaGod.Caption := 'За ' + IntToStr(n_God) + ' г.:';
  cdsTmpTabN.AsInteger := cds01TabN.AsInteger;
  DoSchet(n_TabN, d_DtPrc, d_DtBegP, d_DtEndP);
  PageControl1.ActivePage := ts2;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.DBEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.DBEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.edGodEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.edGodExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.cds01TabNValidate(Sender: TField);
var nTabN : integer; cFamIO : string;
begin
  if bNeedValidation then begin
    nTabN := cds01TabN.AsInteger;
    cFamIO := DmMain.TabN2FamIO(nTabN);
    cds01FamIO.AsString  := cFamIO;
    if cdsTmp.Active then
      cdsTmpTabN.AsInteger := nTabN;
  end;
  bNeedValidation := true;
end;
//------------------------------------------------------------------------------
procedure TFormPlStat02.sBtnTabNClick(Sender: TObject);
var nTabN : integer; cFam, cIma, cOtch, cFamIO, cTIN : string;
begin
  dbeTabN.SetFocus;
  Application.ProcessMessages;
  nTabN := cds01TabN.AsInteger;
  bNeedValidation := false;
  if GetUpiTabN(nTabN, cFam, cIma, cOtch, cFamIO, cTIN) {z_GtQUpi} then begin
    cds01TabN.AsInteger  := nTabN;
    cds01FamIO.AsString  := cFamIO;
    cdsTmpTabN.AsInteger := nTabN;
  end;
end;

end.
