unit z_ChKmd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, ExtCtrls, Grids, DBGrids, DB, DBClient;

type
  TFormCheckKmd = class(TForm)
    dbgrChKmd: TDBGrid;
    Panel1: TPanel;
    sBtnCheckPrt: TSpeedButton;
    sBtnCheckClose: TSpeedButton;
    cdsCheck: TClientDataSet;
    cdsCheckNR: TIntegerField;
    cdsCheckDtProc: TDateField;
    cdsCheckTabN: TIntegerField;
    cdsCheckFamIO: TStringField;
    cdsCheckDtBeg: TDateField;
    cdsCheckDtEnd: TDateField;
    cdsCheckSpec_NrZp: TIntegerField;
    dsrcCheck: TDataSource;
    cdsCheckDtProcZp: TDateField;
    cdsCheckSm1206: TFloatField;
    procedure sBtnCheckCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrChKmdDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreOpencdsCheck;
  public
    { Public declarations }
  end;

procedure ShowCheckKmd;

const SECTION = 'z_ChKmd';

var
  FormCheckKmd: TFormCheckKmd;

implementation

uses A_Const, A_Lib, Z_DM, Z_Main, z_AddKmd, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowCheckKmd;
begin
  if not bIsFormCheckKmd then begin
    FormCheckKmd := TFormCheckKmd.Create(Application);
    with FormCheckKmd do begin
      Caption := 'Результат контроля командировочных записей';
      CreOpencdsCheck;
      if cdsCheck.RecordCount < 1 then
        ShowMessage('Не найдено некондиционных командировочных записей')
      else begin
        bIsFormCheckKmd := true;
        Show;
      end;
    end; end
  else begin
    if FormCheckKmd.WindowState = wsMinimized then
      FormCheckKmd.WindowState := wsNormal;
    FormCheckKmd.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckKmd.CreOpenCdsCheck;
var nSvNR, nPredTabN, nTabN, nPredNR, nNR, nPredSpecNR, nSpecNR : integer;
    dPredDtPrcKmd, dDtPrcKmd, dPredDtB, dDtB, dPredDtE, dDtE : TDateTime;
    dPredDtPrcZp, dDtPrcZp : TDateTime;
    nPredSm1206, nSm1206 : double;
    nCntRaz : SmallInt;
    cFamIO : ShortString;
begin
  with cdsCheck do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with FormAddKmd.qryKmd do begin
    nSvNR := FormAddKmd.qryKmdNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      nPredNR       := FormAddKmd.qryKmdNR.AsInteger;
      nPredTabN     := FormAddKmd.qryKmdTabN.AsInteger;
      nPredSpecNR   := FormAddKmd.qryKmdSpec_NR.AsInteger;
      dPredDtPrcKmd := FormAddKmd.qryKmdDtProc.AsDateTime;
      dPredDtPrcZp  := FormAddKmd.qryKmdO_DtProc.AsDateTime;
      nPredSm1206   := FormAddKmd.qryKmdSumma.AsFloat;
      dPredDtB      := FormAddKmd.qryKmdDtBeg.AsDateTime;
      dPredDtE      := FormAddKmd.qryKmdDtEnd.AsDateTime;
      nCntRaz := 0;
      while (FormAddKmd.qryKmdTabN.AsInteger = nPredTabN) and
             (FormAddKmd.qryKmdDtBeg.AsDateTime = dPredDtB) and
             (FormAddKmd.qryKmdDtEnd.AsDateTime = dPredDtE) and not Eof do begin
        Inc(nCntRaz);
        nNR       := FormAddKmd.qryKmdNR.AsInteger;
        nTabN     := FormAddKmd.qryKmdTabN.AsInteger;
        nSpecNR   := FormAddKmd.qryKmdSpec_NR.AsInteger;
        dDtPrcKmd := FormAddKmd.qryKmdDtProc.AsDateTime;
        dDtPrcZp  := FormAddKmd.qryKmdO_DtProc.AsDateTime;
        nSm1206   := FormAddKmd.qryKmdSumma.AsFloat;
        dDtB      := FormAddKmd.qryKmdDtBeg.AsDateTime;
        dDtE      := FormAddKmd.qryKmdDtEnd.AsDateTime;
        cFamIO    := FormAddKmd.qryKmdFamIO.AsString;
        Next;
      end;
      if nCntRaz > 1 then begin
        cdsCheck.Append;
        cdsCheckNR.AsInteger          := nPredNR;
        cdsCheckTabN.AsInteger        := nPredTabN;
        if nPredSpecNr > 0 then
          cdsCheckSpec_NrZp.AsInteger := nPredSpecNR;
        cdsCheckDtProc.AsDateTime     := dPredDtPrcKmd;
        if dPredDtPrcZp <> 0 then
          cdsCheckDtProcZp.AsDateTime := dPredDtPrcZp;
        cdsCheckDtBeg.AsDateTime      := dPredDtB;
        cdsCheckDtEnd.AsDateTime      := dPredDtE;
        cdsCheckFamIO.AsString        := cFamIO;
        cdsCheckSm1206.AsFloat        := nPredSm1206;
        cdsCheck.Post;
        cdsCheck.Append;
        cdsCheckNR.AsInteger          := nNR;
        cdsCheckTabN.AsInteger        := nTabN;
        if nSpecNr > 0 then
          cdsCheckSpec_NrZp.AsInteger := nSpecNR;
        cdsCheckDtProc.AsDateTime     := dDtPrcKmd;
        if dDtPrcZp <> 0 then
          cdsCheckDtProcZp.AsDateTime := dDtPrcZp;
        cdsCheckDtBeg.AsDateTime      := dDtB;
        cdsCheckDtEnd.AsDateTime      := dDtE;
        cdsCheckFamIO.AsString        := cFamIO;
        cdsCheckSm1206.AsFloat        := nSm1206;
        cdsCheck.Post;
        cdsCheck.Append;
        cdsCheck.Post;
      end;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  with cdsCheck do begin
    if RecordCount > 0 then begin
      Last;
      if cdsCheckNR.IsNull then
        Delete;
      First;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckKmd.dbgrChKmdDblClick(Sender: TObject);
begin
  with cdsCheck do begin
    if (RecordCount > 0) and not cdsCheckNR.IsNull then
      FormAddKmd.qryKmd.Locate('NR', cdsCheckNR.AsInteger, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckKmd.sBtnCheckCloseClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormCheckKmd.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 560);
    Free;
  end;
  if FileExists(cDirVids + 'ChKmd02.vid') then
    dbgrChKmd.Columns.LoadFromFile(cDirVids + 'ChKmd02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormCheckKmd.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormCheckKmd := true;
end;
//------------------------------------------------------------------------------
procedure TFormCheckKmd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrChKmd.Columns.SaveToFile(cDirVids + 'ChKmd02.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
  bIsFormCheckKmd := false;
  Action := caFree;
end;

end.
