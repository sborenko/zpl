unit z_OtklDp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables;

type
  TFormOtklDp = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    qryDp: TQuery;
    dsrcDp: TDataSource;
    dbgrDp: TDBGrid;
    qryDpN_R: TIntegerField;
    qryDpKdSps: TSmallintField;
    qryDpDtProc: TDateField;
    qryDpZaMesGod: TDateField;
    qryDpTabN: TIntegerField;
    qryDpVidN: TStringField;
    qryDpChas: TFloatField;
    qryDpSumma: TFloatField;
    qryDpKdObj: TSmallintField;
    qryDpKdKatP: TSmallintField;
    qryDpPdN: TSmallintField;
    qryDpKdSpZ: TSmallintField;
    qryDpPRR: TSmallintField;
    qryDpNotes: TStringField;
    qryDpMyNotes: TStringField;
    qryDpPrPV: TSmallintField;
    sBtnGo: TSpeedButton;
    qryTmp: TQuery;
    qryAdd: TQuery;
    procedure sBtnGoClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryDp;
    function NewVedNr : integer;
    procedure AddRecInVdPv(dDtPrc, dDtVdPv : TDateTime;
                         nNrVdPv, nKdUsr : integer; cMyNotes : ShortString);
    procedure AddToOtkl(nTabN, nNrVdPv : integer;
                                dDtVdPv, dDtPrc, dZaMG : TDateTime;
                      nKdSps, nKdObj, nKdKatP, nPdN, nKdSpZ, nPrPV : SmallInt;
                       nSumma : double; cVidN, cNotes, cMyNotes : ShortString);
    function IsInCurSps(nTabN : integer; dDtPrc : TDateTime) : boolean;
    procedure AddTabNInCurSps(nTabN : integer;
                       nKdSps, nKdObj, nKdKatP : SmallInt; dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

procedure PodklDopOtkl;

var
  FormOtklDp: TFormOtklDp;

implementation

uses a_Const, a_DM, z_DM, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure PodklDopOtkl;
begin
  FormOtklDp := TFormOtklDp.Create(Application);
  with FormOtklDp do begin
    OpenQryDp;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormOtklDp.NewVedNr : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from GetNewVdPV');  // Дает отрицательный NewVedNR
    Open;                                 // для ввода в z_VdPv
    Result := FieldByName('NewVdPV').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOtklDp.OpenQryDp;
begin
  with qryDp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDirInd;
    SQL.Add('Select * from tb_Otkl order by TabN, ZaMesGod, VidN');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOtklDp.AddRecInVdPv(dDtPrc, dDtVdPv : TDateTime;
                         nNrVdPv, nKdUsr : integer; cMyNotes : ShortString);
begin
  with qryTmp do begin;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_VdPv (DtProc, NrVdPV, DtVdPV, KdUsr, MyNotes) ' +
            ' values (:dDtPrc, :nNrVdPv, :dDtVdPv, :nKdUsr, :cMyNotes)');
    ParamByName('dDtPrc').AsDateTime  := dDtPrc;
    ParamByName('nNrVdPV').AsInteger  := nNrVdPV;
    ParamByName('dDtVdPV').AsDateTime := dDtVdPV;
    ParamByName('nKdUsr').AsInteger   := nKdUsr;
    ParamByName('cMyNotes').AsString  := cMyNotes;
    ExecSQL;                                 // ввод в z_VdPv
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOtklDp.sBtnGoClick(Sender: TObject);
var nTabN, nNrVdPv : integer;
    nKdSps, nKdObj, nKdKatP, nPdN, nKdSpZ, nPrPV : SmallInt;
    nSumma : double;
    dDtPrc, dZaMG, dDtVdPv : TDateTime;
    cVidN, cNotes, cMyNotes : ShortString;
    bIsInCurSps : boolean;
begin
  nNrVdPv := NewVedNR;
  dDtVdPv := Date;
  nKdSps  := 1;
  nKdKatP := 1;
  nPrPv   := 1;
  nPdN    := 0;
  nKdSpZ  := 1385; // 801/рз - Расчеты по реструктуризации ст.57
  cNotes  := 'Рестр. 20-04-2007';
  cMyNotes := 'Restr070420';
  dDtPrc := EncodeDate(2007, 4, 1);
  AddRecInVdPv(dDtPrc, dDtVdPv, nNrVdPv, nAppKdUsr, cMyNotes);
  with qryAdd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_Otkl (KdSpS, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, PdN, KdSpZ, Notes, PrPV, ' +
            ' DtVdPV, NrVdPv, MyNotes) values (:nKdSpS, :dDtPrc, :dZaMG, ' +
            ' :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, :nPdN, :nKdSpZ, ' +
            ' :cNotes, :nPrPV, :dDtVdPV, :nNrVdPv, :cMyNotes)');
    Prepare;
  end;
  with qryDp do begin
    if not Active then
      OpenQryDp;
    First;
    dDtPrc := qryDpDtProc.AsDateTime; // тут она по всему файлу одна и та же
    while not Eof do begin
      nTabN := qryDpTabN.AsInteger;
      nKdObj := qryDpKdObj.AsInteger; // тут по всему ТабН одинаковый
      bIsInCurSps := IsInCurSps(nTabN, dDtPrc);
      while (qryDpTabN.AsInteger = nTabN) and not Eof do begin
        dZaMG := qryDpZaMesGod.AsDateTime;
        while (qryDpZaMesGod.AsDateTime = dZaMG) and
                     (qryDpTabN.AsInteger = nTabN) and not Eof do begin
          cVidN := qryDpVidN.AsString;
          nSumma := 0;
          while (qryDpVidN.AsString = cVidN) and
                     (qryDpZaMesGod.AsDateTime = dZaMG) and
                     (qryDpTabN.AsInteger = nTabN) and not Eof do begin
            nSumma := nSumma + qryDpSumma.AsFloat;
            Next;
          end;
          AddToOtkl(nTabN, nNrVdPv, dDtVdPv, dDtPrc, dZaMG,
                           nKdSps, nKdObj, nKdKatP, nPdN, nKdSpZ, nPrPV,
                           nSumma, cVidN, cNotes, cMyNotes);
        end;
      end;
      if not bIsInCurSps then
        AddTabNInCurSps(nTabN, nKdSps, nKdObj, nKdKatP, dDtPrc);
    end;
  end;
  if qryAdd.Prepared then
    qryAdd.UnPrepare;
end;

//------------------------------------------------------------------------------
function TFormOtklDp.IsInCurSps(nTabN : integer; dDtPrc : TDateTime) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from Z_Sps ' +
             ' where TabN = :nTabN and DtProc = :dDtPrc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    Result := (RecordCount > 0) and (FieldByName('TabN').AsInteger = nTabN);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOtklDp.AddTabNInCurSps(nTabN : integer;
                       nKdSps, nKdObj, nKdKatP : SmallInt; dDtPrc : TDateTime);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Sps (KdSps, DtProc, TabN, KdObj, KdKatP, Notes) ' +
            ' values (:nKdSps, :dDtPrc, :nTabN, :nKdObj, :nKdKatP, :cNotes)');
    ParamByName('nKdSps').AsInteger  := nKdSps;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('nKdObj').AsInteger  := nKdObj;
    ParamByName('nKdKatP').AsInteger := nKdKatP;
    ParamByName('cNotes').AsString   := 'Restr070420';
    ExecSQL;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOtklDp.AddToOtkl(nTabN, nNrVdPv : integer;
                                dDtVdPv, dDtPrc, dZaMG : TDateTime;
                      nKdSps, nKdObj, nKdKatP, nPdN, nKdSpZ, nPrPV : SmallInt;
                      nSumma : double; cVidN, cNotes, cMyNotes : ShortString);
begin
  with qryAdd do begin
    ParamByName('nKdSps').AsInteger   := nKdSps;
    ParamByName('dDtPrc').AsDateTime  := dDtPrc;
    ParamByName('dZaMG').AsDateTime   := dZaMG;
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('cVidN').AsString     := cVidN;
    ParamByName('nSumma').AsFloat     := nSumma;
    ParamByName('nKdObj').AsInteger   := nKdObj;
    ParamByName('nKdKatP').AsInteger  := nKdKatP;
    ParamByName('nPdN').AsInteger     := nPdN;
    ParamByName('nKdSpZ').AsInteger   := nKdSpZ;
    ParamByName('cNotes').AsString    := cNotes;
    ParamByName('nPrPV').AsInteger    := nPrPV;
    ParamByName('dDtVdPV').AsDateTime := dDtVdPV;
    ParamByName('nNrVdPV').AsInteger  := nNrVdPV;
    ParamByName('cMyNotes').AsString  := cMyNotes;
    ExecSQL;
  end;
end;

end.
