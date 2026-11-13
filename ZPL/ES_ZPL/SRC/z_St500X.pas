unit z_St500X;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, DB, ExtCtrls, Grids, DBGrids, DBTables,
  DBClient, Menus;

type
  TFormStorn500X = class(TForm)
    panelButtons: TPanel;
    lblInfo: TLabel;
    btnSetStorn: TSpeedButton;
    btnDelStorn: TSpeedButton;
    btnClose: TBitBtn;
    qryTmp: TQuery;
    popStorno: TPopupMenu;
    nStorno: TMenuItem;
    nUnstorno: TMenuItem;
    dbgrStorno: TDBGrid;
    dsrcStorn: TDataSource;
    qryStorn: TQuery;
    qryStornNR: TIntegerField;
    qryStornKDSPS: TSmallintField;
    qryStornDTPROC: TDateTimeField;
    qryStornZAMESGOD: TDateTimeField;
    qryStornDTSTORN: TDateTimeField;
    qryStornTABN: TIntegerField;
    qryStornVIDN: TStringField;
    qryStornOLDKDVIDN: TSmallintField;
    qryStornCHAS: TFloatField;
    qryStornSUMMA: TFloatField;
    qryStornOLDKDOBJ: TSmallintField;
    qryStornKDOBJ: TSmallintField;
    qryStornKDKATP: TSmallintField;
    qryStornDT_BEG: TDateTimeField;
    qryStornDT_END: TDateTimeField;
    qryStornPDN: TSmallintField;
    qryStornKDSPZ: TSmallintField;
    qryStornNOTES: TStringField;
    qryStornPRR: TSmallintField;
    qryStornPRPV: TSmallintField;
    qryStornKTO: TSmallintField;
    qryStornPRKR: TSmallintField;
    qryStornSPEC_NR: TIntegerField;
    qryStornDTVDPV: TDateTimeField;
    qryStornNRVDPV: TIntegerField;
    qryStornMYNOTES: TStringField;
    qryStornSPECPS: TIntegerField;
    qryStornPBNK: TSmallintField;
    qryStornSTORN: TStringField;
    qryStornKDBNK: TSmallintField;
    qryStornKDTEMU: TSmallintField;
    updStorn: TUpdateSQL;
    qryStornShVidN: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrEnter(Sender: TObject);
    procedure dbgrExit(Sender: TObject);
    procedure dbgrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryStornAfterScroll(DataSet: TDataSet);
    procedure popStornoPopup(Sender: TObject);
    procedure nStornoClick(Sender: TObject);
    procedure nUnstornoClick(Sender: TObject);
    procedure btnSetStornClick(Sender: TObject);
    procedure btnDelStornClick(Sender: TObject);
    procedure qryStornCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    bIsResult : boolean;
    n_NR: integer;
    s_Vidy: string;
    procedure Populate500X(nTabN: integer; dDtBeg, dDtEnd: TDateTime);
    procedure SetStorno;
    procedure WithdrawStorno;
    procedure Merge500X;
  public
    { Public declarations }
    procedure Add8801Otkl(nTabN: integer; dDtProc, dZaMesGod: TDateTime);
  end;

function Storn500X(nTabN : integer; dDtPrc : TDateTime) : boolean;

const SECTION = 'z_St5002';

var
  FormStorn500X: TFormStorn500X;

implementation

uses A_Const, A_Lib, Z_DM, Z_Main, sb_FormStorn;

{$R *.dfm}

//------------------------------------------------------------------------------
function Storn500X(nTabN : integer; dDtPrc : TDateTime) : boolean;
var i, nYB, nYE, nMB, nME, nD : word;
    dDtBeg, dDtEnd : TDateTime;
begin
  Result := false;

  FormStorn500X := TFormStorn500X.Create(Application);
  with FormStorn500X do begin
    s_Vidy := '"5002", "5005", "5008"';

    d_DtPrc := dDtPrc;
    DecodeDate(dDtPrc, nYE, nME, nD);
    Inc(nME, -1);
    if nME = 0 then begin
      nME := 12;
      Inc(nYE, -1);
    end;
    dDtEnd := EncodeDate(nYE, nME, 1);
    nYB := nYE;
    nMB := nME;
    for i := 0 to 11 do begin
      Inc(nMB, -1);
      if nMB = 0 then begin
        nMB := 12;
        Inc(nYB, -1);
      end;
    end;

    dDtBeg := EncodeDate(nYB, nMB, 1);

    Caption := 'Сторнирование неоплачиваемых видов ('
        + MesRus(nMB) + ' ' + IntToStr(nYB)
        + ' - '
        + MesRus(nME) + ' ' + IntToStr(nYE)
        + ')';

    Populate500X(nTabN, dDtBeg, dDtEnd);

    if qryStorn.RecordCount = 0 then
      ShowMessage('Нет записей видов: ' + s_Vidy + 'по Таб. Н-ру ' + IntToStr(nTabN)
        + ' в периоде ' + MesRus(nMB) + ' ' + IntToStr(nYB)
        + ' - ' + MesRus(nME) + ' ' + IntToStr(nYE))
    else begin
      bIsResult := false;
      ShowModal;
      Result := bIsResult;
    end;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormStorn500X.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 250);
    Width  := ReadInteger(SECTION, 'wW', 560);
    Free;
  end;
  if FileExists(cDirVids + 'storn5002.vid') then
    dbgrStorno.Columns.LoadFromFile(cDirVids + 'storn5002.vid');
end;

//------------------------------------------------------------------------------
procedure TFormStorn500X.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrStorno.Columns.SaveToFile(cDirVids + 'storn5002.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormStorn500X.dbgrEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFormStorn500X.dbgrExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TFormStorn500X.dbgrDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrStorno.Canvas do begin
    if qryStornSTORN.AsString = 'Y' then begin
      if gdFocused in State then
        Font.Color := clHighlightText
      else
        Font.Color := clGray;
      Font.Style := [];
    end;
  end;
  dbgrStorno.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
procedure TFormStorn500X.qryStornAfterScroll(DataSet: TDataSet);
begin
  BtnDelStorn.Enabled := qryStornSTORN.AsString = 'Y';
  BtnSetStorn.Enabled := not BtnDelStorn.Enabled;
end;

//------------------------------------------------------------------------------
procedure TFormStorn500X.btnSetStornClick(Sender: TObject);
begin
  SetStorno;
end;

//------------------------------------------------------------------------------
procedure TFormStorn500X.btnDelStornClick(Sender: TObject);
begin
  WithdrawStorno;
end;

//- SB -------------------------------------------------------------------------
procedure TFormStorn500X.popStornoPopup(Sender: TObject);
begin
  nUnstorno.Enabled := qryStornSTORN.AsString = 'Y';
  nStorno.Enabled := not nUnstorno.Enabled;
end;

//- SB -------------------------------------------------------------------------
procedure TFormStorn500X.nStornoClick(Sender: TObject);
begin
  SetStorno;
end;

//- SB -------------------------------------------------------------------------
procedure TFormStorn500X.nUnstornoClick(Sender: TObject);
begin
  WithdrawStorno;
end;

//- SB -------------------------------------------------------------------------
procedure TFormStorn500X.Populate500X(nTabN: integer; dDtBeg, dDtEnd: TDateTime);
begin
  with qryStorn do begin
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add(
      'select *' +
      ' from Z_OTKL' +
      ' where TabN = :nTabN and VidN in (' + s_Vidy + ')' +
        ' and DtProc >= :dDtBeg and DtProc <= :dDtEnd' +
      ' order by VidN, Spec_NR, ZaMesGod, Dt_Beg, Dt_End');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
  end;
end;

//- SB -------------------------------------------------------------------------
procedure TFormStorn500X.SetStorno;
begin
  Application.CreateForm(TFormStorn, FormStorn);
  FormStorn.ShowModal;
end;

//- SB -------------------------------------------------------------------------
procedure TFormStorn500X.WithdrawStorno;
var
  nY, nM, nD: Word;
  dDtProc: TDateTime;
  cMsg: string;
begin
  cMsg := 'Отменить сторнирование текущей записи?:';

  if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    with qryStorn do begin
      Edit;
      qryStornSTORN.AsString := '';
      qryStornDTSTORN.AsString := '';
      Post;

      Merge500X;

      ApplyUpdates;
      CommitUpdates;

      Close;
      Open;

      Locate('NR', n_NR, []);

      DecodeDate(Now, nY, nM, nD);
      dDtProc := EncodeDate(nY, nM, 1);
      Add8801Otkl(qryStornTABN.AsInteger, dDtProc, qryStornZAMESGOD.AsDateTime);
    end; {with}
  end; {if}

  cMsg := 'TabN = ' + qryStornTABN.AsString +
      ', DtProc = ' + DateToStr(d_DtPrc) +
      ', ZaMesGod = ' + qryStornZAMESGOD.AsString +
      ', VidN = ' + qryStornVIDN.AsString + ', ДтНач. = ' + qryStornDT_BEG.AsString +
      ', ДтОконч. = ' + qryStornDT_END.AsString;

  DmMain.AddLog(Now, qryStornTABN.AsInteger, 'Отменено сторнирование', gc_AppNmUsr, 'Z_Otkl', cMsg);
end;

//- SB -------------------------------------------------------------------------
procedure TFormStorn500X.Merge500X;
var
  dZaMesGod, dStornBeg, dStornEnd: TDateTime;
  cVidN: string;
begin
  cVidN := qryStornVIDN.AsString;
  dZaMesGod := qryStornZAMESGOD.AsDateTime;
  dStornBeg := qryStornDT_BEG.AsDateTime;
  dStornEnd := qryStornDT_END.AsDateTime;

  n_NR := qryStornNR.AsInteger;

  with qryStorn do begin
    Prior;
    OutputDebugString(PAnsiChar('VIDN: ' + qryStornVIDN.AsString));

    // Если существует предыдущая смежная нестронированная
    if not Bof
        and (qryStornVIDN.AsString = cVidN)
        and (qryStornZAMESGOD.AsDateTime = dZaMesGod)
        and (qryStornDT_END.AsDateTime + 1 = dStornBeg)
        and (qryStornSTORN.AsString = '') then begin

      n_NR := qryStornNR.AsInteger;

      Edit;
      qryStornDT_END.AsDateTime := dStornEnd;
      qryStornCHAS.AsFloat := DmMain.GetCntBudgChas(
        qryStornDT_BEG.AsDateTime, qryStornDT_END.AsDateTime);
      Post;

      // Новое значение для dStornBeg
      dStornBeg := qryStornDT_BEG.AsDateTime;

      Next;
      Delete;
    end;

    Locate('NR', n_NR, []);

    Next;
    OutputDebugString(PAnsiChar('VIDN: ' + qryStornVIDN.AsString));

    // Если существует следующая смежная нестронированная
    if not Eof
        and (qryStornVIDN.AsString = cVidN)
        and (qryStornZAMESGOD.AsDateTime = dZaMesGod)
        and (qryStornDT_BEG.AsDateTime - 1 = dStornEnd)
        and (qryStornSTORN.AsString = '') then begin

      n_NR := qryStornNR.AsInteger;

      Edit;
      qryStornDT_BEG.AsDateTime := dStornBeg;
      qryStornCHAS.AsFloat := DmMain.GetCntBudgChas(
        qryStornDT_BEG.AsDateTime, qryStornDT_END.AsDateTime);
      Post;

      Prior;
      Delete;
    end;

    Locate('NR', n_NR, []);
  end; {with}
end; {Merge500X}

//------------------------------------------------------------------------------
procedure TFormStorn500X.Add8801Otkl(nTabN: integer; dDtProc, dZaMesGod: TDateTime);
begin
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('delete from z_otkl'
        + ' where TabN = :nTabN'
        + ' and VidN = "8801"'
        + ' and ZaMesGod = :dZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dZaMesGod').AsDateTime := dZaMesGod;
    ExecSQL;

    SQL.Clear;
    SQL.Add('insert into z_otkl'
        + ' (KdSps, TabN, DtProc, ZaMesGod, VidN) '
        + ' values (:nKdSps, :nTabN, :dDtProc, :dZaMesGod, "8801")');
    ParamByName('nKdSps').AsInteger := gl_nAppKdSpsUsr;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ParamByName('dZaMesGod').AsDateTime := dZaMesGod;
    ExecSQL;

    SQL.Clear;
    DataBaseName := '';
  end; {with}
end; {Add8001Otkl}

procedure TFormStorn500X.qryStornCalcFields(DataSet: TDataSet);
var
  cNmVidN: string;
begin
  qryStornShVidN.AsString := DmMain.VidN2ShVidN(qryStornVidN.AsString, cNmVidN);
end;

end.
