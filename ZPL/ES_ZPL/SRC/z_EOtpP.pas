unit z_EOtpP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, StdCtrls, Buttons, Mask, DBCtrls,
  Math, DBClient;

type
  TFormStornPart = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    cdsTmp: TClientDataSet;
    cdsTmpNR: TAutoIncField;
    cdsTmpZaMG: TDateField;
    cdsTmpSvDtBeg: TDateField;
    cdsTmpSvDtEnd: TDateField;
    cdsTmpStornDtBeg: TDateField;
    cdsTmpStornDtEnd: TDateField;
    cdsTmpSmStorn: TFloatField;
    cdsTmpSmOkl: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource2: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsTmpStornDtBegValidate(Sender: TField);
    procedure cdsTmpStornDtEndValidate(Sender: TField);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
  private
    { Private declarations }
    b_EditMode : boolean;
    n_CurOklTrf, n_SmSrDn, n_SmOtp : double;
    c_RK : ShortString;
    n_CntDays : SmallInt;
    bFormReady : boolean;
    d_ZaMG : TDateTime;
    procedure RaschetSmStorn(dDtBeg, dDtEnd : TDateTime);
  public
    { Public declarations }
  end;

function AddStornPart(qryStorn : TQuery;
                      dZaMG, dSvDtBeg, dSvDtEnd : TDateTime;
                      nCurOklTrf, nSmSrDn, nSmOtp : double;
                      cRK : ShortString; nCntDays : SmallInt) : boolean;

const SECTION = 'z_EOtpP';

var
  FormStornPart: TFormStornPart;

implementation

uses A_Const, A_DM, Z_DM, Z_Main, z_EOtpSt;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddStornPart(qryStorn : TQuery;
                      dZaMG, dSvDtBeg, dSvDtEnd : TDateTime;
                      nCurOklTrf, nSmSrDn, nSmOtp : double;
                      cRK : ShortString; nCntDays : SmallInt) : boolean;
var cCase : ShortString;
    nCntWorkDays, nCntWorkChas : double;
begin
  Result := false;
  FormStornPart := TFormStornPart.Create(Application);
  with FormStornPart do begin
    bFormReady := false;
    d_ZaMG := dZaMG;
    n_CurOklTrf := nCurOklTrf;
    n_SmSrDn := nSmSrDn;
    n_SmOtp := nSmOtp;
    c_RK := cRK;
    n_CntDays := nCntDays;
    if qryStorn.State = dsInsert then begin
      b_EditMode := false;
      Caption := 'Новая запись'; end
    else begin
      b_EditMode := true;
      Caption := 'Редактирование';
    end;
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      cdsTmpZaMG.AsDateTime := dZaMG;
      cdsTmpSvDtBeg.AsDateTime := dSvDtBeg;
      cdsTmpSvDtEnd.AsDateTime := dSvDtEnd;
      if not b_EditMode then begin
        cdsTmpStornDtBeg.AsDateTime := dSvDtBeg;
        cdsTmpStornDtEnd.AsDateTime := dSvDtEnd; end
      else begin
        cdsTmpStornDtBeg.AsDateTime := qryStorn.FieldByName('Dt_Beg').AsDateTime;
        cdsTmpStornDtEnd.AsDateTime := qryStorn.FieldByName('Dt_End').AsDateTime;
      end;
    end;
    bFormReady := true;
    RaschetSmStorn(cdsTmpStornDtBeg.AsDateTime, cdsTmpStornDtEnd.AsDateTime);
    if ShowModal = mrOk then begin
      Result := true;
      // qryStorn.Edit;
      qryStorn.FieldByName('Dt_Beg').AsDateTime := cdsTmpStornDtBeg.AsDateTime;
      qryStorn.FieldByName('Dt_End').AsDateTime := cdsTmpStornDtEnd.AsDateTime;
      qryStorn.FieldByName('Summa').AsFloat := -cdsTmpSmStorn.AsFloat;
      if c_RK = 'K' then
        cCase := 'otk'
      else
        cCase := 'otp';
      DmMain.GetCntWrkDaysOtp(cdsTmpStornDtBeg.AsDateTime,
                                    cdsTmpStornDtEnd.AsDateTime,
                                 nCntWorkDays, nCntWorkChas, cCase);
      qryStorn.FieldByName('Chas').AsFloat := -nCntWorkChas;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornPart.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 400);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornPart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornPart.cdsTmpStornDtBegValidate(Sender: TField);
var dDtInp : TDateTime;
begin
  if not bFormReady then Exit;
  if ModalResult <> mrCancel then begin
    dDtInp := Sender.AsDateTime;
    if (dDtInp < cdsTmpSvDtBeg.AsDateTime) or
                (dDtInp > cdsTmpSvDtEnd.AsDateTime) or
                         (dDtInp > cdsTmpStornDtEnd.AsDateTime) then
      Raise Exception.
              Create('Дата должна быть между ' + cdsTmpSvDtBeg.AsString +
                    ' и ' + cdsTmpSvDtEnd.AsString +
                   ' (включительно) и не больше ' + cdsTmpStornDtEnd.AsString)
    else begin
      RaschetSmStorn(dDtInp, cdsTmpStornDtEnd.AsDateTime);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornPart.cdsTmpStornDtEndValidate(Sender: TField);
var dDtInp : TDateTime;
begin
  if not bFormReady then Exit;
  if ModalResult <> mrCancel then begin
    dDtInp := Sender.AsDateTime;
    if (dDtInp < cdsTmpSvDtBeg.AsDateTime) or
                (dDtInp > cdsTmpSvDtEnd.AsDateTime) or
                         (dDtInp < cdsTmpStornDtBeg.AsDateTime) then
      Raise Exception.
              Create('Дата должна быть между ' + cdsTmpSvDtBeg.AsString +
                    ' и ' + cdsTmpSvDtEnd.AsString +
                   ' (включительно) и не меньше '  + cdsTmpStornDtBeg.AsString)
    else begin
      RaschetSmStorn(cdsTmpStornDtBeg.AsDateTime, dDtInp);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornPart.RaschetSmStorn(dDtBeg, dDtEnd : TDateTime);
var nCntWorkDays, nCntWorkChas, nSmStornOtp, nSmStornOkl : double;
    nCntStornDays : SmallInt;  nBudgetMG : double;
    nCntDayMG, nCntWorkDayMG : integer;
    nY, nM, nD : word; cCase : ShortString;
begin
  // по датам dDtBeg, dDtEnd рассчитать к-во сторнируемых дней, сумму сторно,
  // оклад, который, возможно, надо вернуть
  if c_RK = 'K' then
    cCase := 'otk'
  else
    cCase := 'otp';
  // Если d_ZaMG = рабочему месяцу, то ничего возвращать не надо, достаточно
  // только сторнирующей записи - остальное автоматом сделает z_RS
  DecodeDate(d_ZaMG, nY, nM, nD);
  DmMain.GetCntWrkDaysOtp(dDtBeg, dDtEnd,
                                 nCntWorkDays, nCntWorkChas, cCase);
  nSmStornOtp := RoundTo(n_SmSrDn * nCntWorkDays, -2);
  nCntStornDays := Round(nCntWorkDays);
  Label8.Caption := 'Сторн. дней: ' + IntToStr(nCntStornDays) +
           ',   Сторн. отпускных: ' + FloatToStrF(nSmStornOtp, ffFixed, 18, 2);
  nBudgetMG := DmMain.Budget(nY, nM, nCntDayMG, nCntWorkDayMG);
  nSmStornOkl := RoundTo(n_CurOklTrf / nBudgetMG * nCntWorkChas, -2);
  Label9.Caption := 'Вернуть оклад ' + FloatToStrF(nSmStornOkl, ffFixed, 18,2) +
                 ' за ' + FloatToStrF(nCntWorkChas, ffFixed, 12, 2) + ' часов';
  cdsTmpSmStorn.AsFloat := nSmStornOtp;
  cdsTmpSmOkl.AsFloat := nSmStornOkl;
end;
//------------------------------------------------------------------------------
procedure TFormStornPart.DBEdit4Enter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormStornPart.DBEdit4Exit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
