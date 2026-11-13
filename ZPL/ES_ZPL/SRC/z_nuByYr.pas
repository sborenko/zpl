unit z_nuByYr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, DBTables, Grids, DBGrids,
  Math, DB, DBClient;

type
  TFormNuByYears = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    cdsRep: TClientDataSet;
    dsrcRep: TDataSource;
    dbgrRep: TDBGrid;
    qryTmp: TQuery;
    cdsRepGod: TSmallintField;
    cdsRepSZ: TFloatField;
    cdsRepSZP: TFloatField;
    cdsRepSL: TFloatField;
    cdsRepSBSV: TFloatField;
    cdsRepSPD: TFloatField;
    cdsRepSPDP: TFloatField;
    cdsRepSSvPorog: TFloatField;
    sBtnPrt: TSpeedButton;
    sBtnDetails: TSpeedButton;
    PanelMsg: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    sBtnPnlMsg: TSpeedButton;
    sBtnMsg: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrRepDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPrtClick(Sender: TObject);
    procedure sBtnDetailsClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sBtnMsgClick(Sender: TObject);
    procedure sBtnPnlMsgClick(Sender: TObject);
    procedure dsrcRepDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    n_God, nMinGodZa, nMaxGodZa : SmallInt;
    dDtBegPrc, dDtEndPrc, dDtBegZaMG, dDtEndZaMG : TDateTime;
    procedure CreOpenCdsRep(nGod : SmallInt);
    function GodZa(dZaMG : TDateTime) : SmallInt;
    procedure FillFieldSZ;
    procedure FillFieldSZP;
    procedure FillFieldSL;
    procedure FillFieldBSV;
    procedure FillFieldSPD;
    procedure FillFieldSPDP;
    procedure FillFieldSSvPorog;
    procedure SetPanelMsgVisible;
  public
    { Public declarations }
  end;

procedure ShwNuByYears(nGod : SmallInt);

const SECTION = 'z_NuByYr';

var
  FormNuByYears: TFormNuByYears;
  // Начисления/Удержания заданного года (по dtProc) по годам (по ZaMesGod)

implementation

uses A_Const, A_DM, Z_DM, Z_Main, A_Lib, z_nuByY2, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwNuByYears(nGod : SmallInt);
begin
  FormNuByYears := TFormNuByYears.Create(Application);
  with FormNuByYears do begin
    n_God := nGod;
    dDtBegPrc := EncodeDate(nGod, 1, 1);
    dDtEndPrc := EncodeDate(nGod, 12, 1);
    Caption := 'Распределение сумм, начисленных в ' + IntToStr(nGod) +
                            ' году, по годам "ЗаГод"';
    CreOpenCdsRep(nGod);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.CreOpenCdsRep(nGod: SmallInt);
var nTmpGod, nM, nD : word; i : SmallInt;
begin
  with cdsRep do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct ZaMesGod from z_NU ' +
            'where DtProc >= :dDtBegPrc and DtProc <= :dDtEndPrc');
    ParamByName('dDtBegPrc').AsDateTime := dDtBegPrc;
    ParamByName('dDtEndPrc').AsDateTime := dDtEndPrc;
    Open;
    i := 0;
    while not Eof do begin
      DecodeDate(FieldByName('ZaMesGod').AsDateTime, nTmpGod, nM, nD);
      if not cdsRep.Locate('God', nTmpGod, []) then begin
        cdsRep.Append;
        cdsRep.FieldByName('God').AsInteger := nTmpGod;
        cdsRep.Post;
        Inc(i);
        if i = 1 then
          nMinGodZa := nTmpGod;
        nMaxGodZa := nTmpGod;
      end;
      Next;
    end;
  end;
  dDtBegZaMG := EncodeDate(nMinGodZa, 1, 1);
  dDtEndZaMG := EncodeDate(nMaxGodZa, 12, 1);
  FillFieldSZ;
  FillFieldSZP;
  FillFieldSL;
  FillFieldBSV;
  FillFieldSPD;
  FillFieldSPDP;
  FillFieldSSvPorog;
end;
//------------------------------------------------------------------------------
function TFormNuByYears.GodZa(dZaMG : TDateTime) : SmallInt;
var nY, nM, nD : word;
begin
  DecodeDate(dZaMG, nY, nM, nD);
  Result := nY;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FillFieldSZ;
var nGodZa : SmallInt; nSmm : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select ZaMesGod, Sum(Summa) as SMM from Z_NU ' +
            ' where DtProc >= :dDtBegPrc and DtProc <= :dDtEndPrc and ' +
            ' ZaMesGod >= :dDtBegZaMG and ZaMesGod <= :dDtEndZaMG and ' +
            ' VidN < "2700" group by ZaMesGod');
    ParamByName('dDtBegPrc').AsDateTime := dDtBegPrc;
    ParamByName('dDtEndPrc').AsDateTime := dDtEndPrc;
    ParamByName('dDtBegZaMG').AsDateTime := dDtBegZaMG;
    ParamByName('dDtEndZaMG').AsDateTime := dDtEndZaMG;
    Open;
    First;
    while not Eof do begin
      nGodZa := GodZa(FieldByName('ZaMesGod').AsDateTime);
      nSmm := 0;
      while (GodZa(FieldByName('ZaMesGod').AsDateTime) = nGodZa) and
                                                       not Eof do begin
        nSmm := nSmm + FieldByName('SMM').AsFloat;
        Next;
      end;
      nSmm := RoundTo(nSmm, -2);
      if (nSmm <> 0) and cdsRep.Locate('God', nGodZa, []) then begin
        cdsRep.Edit;
        cdsRep.FieldByName('SZ').AsFloat := nSmm;
        cdsRep.Post;
      end;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FillFieldSZP;
var nGodZa : SmallInt; nSmm : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select ZaMesGod, Sum(Summa) as SMM from ViNuMain ' +
            ' where DtProc >= :dDtBegPrc and DtProc <= :dDtEndPrc and ' +
            ' ZaMesGod >= :dDtBegZaMG and ZaMesGod <= :dDtEndZaMG and ' +
            ' VidN < "2700" and Spov = "1" group by ZaMesGod');
    ParamByName('dDtBegPrc').AsDateTime := dDtBegPrc;
    ParamByName('dDtEndPrc').AsDateTime := dDtEndPrc;
    ParamByName('dDtBegZaMG').AsDateTime := dDtBegZaMG;
    ParamByName('dDtEndZaMG').AsDateTime := dDtEndZaMG;
    Open;
    First;
    while not Eof do begin
      nGodZa := GodZa(FieldByName('ZaMesGod').AsDateTime);
      nSmm := 0;
      while (GodZa(FieldByName('ZaMesGod').AsDateTime) = nGodZa) and
                                                       not Eof do begin
        nSmm := nSmm + FieldByName('SMM').AsFloat;
        Next;
      end;
      nSmm := RoundTo(nSmm, -2);
      if (nSmm <> 0) and cdsRep.Locate('God', nGodZa, []) then begin
        cdsRep.Edit;
        cdsRep.FieldByName('SZP').AsFloat := nSmm;
        cdsRep.Post;
      end;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FillFieldSL;
var nGodZa : SmallInt; nSmm : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select ZaMesGod, Sum(Summa) as SMM from ViNuMain ' +
            ' where DtProc >= :dDtBegPrc and DtProc <= :dDtEndPrc and ' +
            ' ZaMesGod >= :dDtBegZaMG and ZaMesGod <= :dDtEndZaMG and ' +
            ' VidN < "2700" and VidN <> "2602" and Bolnic = "1" ' +
            ' group by ZaMesGod');
    ParamByName('dDtBegPrc').AsDateTime := dDtBegPrc;
    ParamByName('dDtEndPrc').AsDateTime := dDtEndPrc;
    ParamByName('dDtBegZaMG').AsDateTime := dDtBegZaMG;
    ParamByName('dDtEndZaMG').AsDateTime := dDtEndZaMG;
    Open;
    First;
    while not Eof do begin
      nGodZa := GodZa(FieldByName('ZaMesGod').AsDateTime);
      nSmm := 0;
      while (GodZa(FieldByName('ZaMesGod').AsDateTime) = nGodZa) and
                                                       not Eof do begin
        nSmm := nSmm + FieldByName('SMM').AsFloat;
        Next;
      end;
      nSmm := RoundTo(nSmm, -2);
      if (nSmm <> 0) and cdsRep.Locate('God', nGodZa, []) then begin
        cdsRep.Edit;
        cdsRep.FieldByName('SL').AsFloat := nSmm;
        cdsRep.Post;
      end;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FillFieldBSV;
var nGodZa : SmallInt; nSmm : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select ZaMesGod, Sum(Summa) as SMM from ViNuMain ' +
            ' where DtProc >= :dDtBegPrc and DtProc <= :dDtEndPrc and ' +
            ' ZaMesGod >= :dDtBegZaMG and ZaMesGod <= :dDtEndZaMG and ' +
            ' VidN = "2602" group by ZaMesGod');
    ParamByName('dDtBegPrc').AsDateTime := dDtBegPrc;
    ParamByName('dDtEndPrc').AsDateTime := dDtEndPrc;
    ParamByName('dDtBegZaMG').AsDateTime := dDtBegZaMG;
    ParamByName('dDtEndZaMG').AsDateTime := dDtEndZaMG;
    Open;
    First;
    while not Eof do begin
      nGodZa := GodZa(FieldByName('ZaMesGod').AsDateTime);
      nSmm := 0;
      while (GodZa(FieldByName('ZaMesGod').AsDateTime) = nGodZa) and
                                                       not Eof do begin
        nSmm := nSmm + FieldByName('SMM').AsFloat;
        Next;
      end;
      nSmm := RoundTo(nSmm, -2);
      if (nSmm <> 0) and cdsRep.Locate('God', nGodZa, []) then begin
        cdsRep.Edit;
        cdsRep.FieldByName('SBSV').AsFloat := nSmm;
        cdsRep.Post;
      end;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FillFieldSPD;
var nGodZa : SmallInt; nSmm : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select ZaMesGod, Sum(Summa) as SMM from ViNuMain ' +
            ' where DtProc >= :dDtBegPrc and DtProc <= :dDtEndPrc and ' +
            ' ZaMesGod >= :dDtBegZaMG and ZaMesGod <= :dDtEndZaMG and ' +
            ' VidN >= "6401" and VidN <= "6415" group by ZaMesGod');
    ParamByName('dDtBegPrc').AsDateTime := dDtBegPrc;
    ParamByName('dDtEndPrc').AsDateTime := dDtEndPrc;
    ParamByName('dDtBegZaMG').AsDateTime := dDtBegZaMG;
    ParamByName('dDtEndZaMG').AsDateTime := dDtEndZaMG;
    Open;
    First;
    while not Eof do begin
      nGodZa := GodZa(FieldByName('ZaMesGod').AsDateTime);
      nSmm := 0;
      while (GodZa(FieldByName('ZaMesGod').AsDateTime) = nGodZa) and
                                                       not Eof do begin
        nSmm := nSmm + FieldByName('SMM').AsFloat;
        Next;
      end;
      nSmm := RoundTo(nSmm, -2);
      if (nSmm <> 0) and cdsRep.Locate('God', nGodZa, []) then begin
        cdsRep.Edit;
        cdsRep.FieldByName('SPD').AsFloat := nSmm;
        cdsRep.Post;
      end;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FillFieldSPDP;
var nGodZa : SmallInt; nSmm : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select ZaMesGod, Sum(Summa) as SMM from ViNuMain ' +
            ' where DtProc >= :dDtBegPrc and DtProc <= :dDtEndPrc and ' +
            ' ZaMesGod >= :dDtBegZaMG and ZaMesGod <= :dDtEndZaMG and ' +
            ' VidN in ("8611","8612") group by ZaMesGod');
    ParamByName('dDtBegPrc').AsDateTime := dDtBegPrc;
    ParamByName('dDtEndPrc').AsDateTime := dDtEndPrc;
    ParamByName('dDtBegZaMG').AsDateTime := dDtBegZaMG;
    ParamByName('dDtEndZaMG').AsDateTime := dDtEndZaMG;
    Open;
    First;
    while not Eof do begin
      nGodZa := GodZa(FieldByName('ZaMesGod').AsDateTime);
      nSmm := 0;
      while (GodZa(FieldByName('ZaMesGod').AsDateTime) = nGodZa) and
                                                       not Eof do begin
        nSmm := nSmm + FieldByName('SMM').AsFloat;
        Next;
      end;
      nSmm := RoundTo(nSmm, -2);
      if (nSmm <> 0) and cdsRep.Locate('God', nGodZa, []) then begin
        cdsRep.Edit;
        cdsRep.FieldByName('SPDP').AsFloat := nSmm;
        cdsRep.Post;
      end;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FillFieldSSvPorog;
var nGodZa : SmallInt; nSmm : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select ZaMesGod, Sum(Summa) as SMM from ViNuMain ' +
            ' where DtProc >= :dDtBegPrc and DtProc <= :dDtEndPrc and ' +
            ' ZaMesGod >= :dDtBegZaMG and ZaMesGod <= :dDtEndZaMG and ' +
            ' VidN = "8671" group by ZaMesGod');
    ParamByName('dDtBegPrc').AsDateTime := dDtBegPrc;
    ParamByName('dDtEndPrc').AsDateTime := dDtEndPrc;
    ParamByName('dDtBegZaMG').AsDateTime := dDtBegZaMG;
    ParamByName('dDtEndZaMG').AsDateTime := dDtEndZaMG;
    Open;
    First;
    while not Eof do begin
      nGodZa := GodZa(FieldByName('ZaMesGod').AsDateTime);
      nSmm := 0;
      while (GodZa(FieldByName('ZaMesGod').AsDateTime) = nGodZa) and
                                                       not Eof do begin
        nSmm := nSmm + FieldByName('SMM').AsFloat;
        Next;
      end;
      nSmm := RoundTo(nSmm, -2);
      if (nSmm <> 0) and cdsRep.Locate('God', nGodZa, []) then begin
        cdsRep.Edit;
        cdsRep.FieldByName('SSvPorog').AsFloat := nSmm;
        cdsRep.Post;
      end;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 625);
    Free;
  end;
  if FileExists(cDirVids + 'NuByYear.vid') then
    dbgrRep.Columns.LoadFromFile(cDirVids + 'NuByYear.vid');
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrRep.Columns.SaveToFile(cDirVids + 'NuByYear.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.dbgrRepDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrRep.Canvas do begin
    if not (gdFocused in State) then begin
      if Column.Field.AsFloat < 0 then
        Font.Color := clRed
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrRep.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.sBtnPrtClick(Sender: TObject);
begin
  F6PrtNyByYears(n_God, cdsRep);   {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.sBtnDetailsClick(Sender: TObject);
var nGodPrc, nGodZaMG : SmallInt;
begin
  if not sBtnDetails.Enabled then Exit;
  nGodPrc := n_God;
  nGodZaMG := cdsRep.FieldByName('God').AsInteger;
  ShowNuByYear(nGodPrc, nGodZaMG);  {z_nuByY2}
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.FormResize(Sender: TObject);
begin
  PanelMsg.Left := Round((Width - PanelMsg.Width) / 2);
  PanelMsg.Top := Round((Height - PanelMsg.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.sBtnMsgClick(Sender: TObject);
begin
  SetPanelMsgVisible;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.SetPanelMsgVisible;
begin
  PanelMsg.Visible := sBtnMsg.Down;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.sBtnPnlMsgClick(Sender: TObject);
begin
  sBtnMsg.Down := false;
  PanelMsg.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormNuByYears.dsrcRepDataChange(Sender: TObject; Field: TField);
begin
  if dsrcRep.State = dsBrowse then
    sBtnDetails.Enabled := cdsRepGod.AsInteger <> n_God;
end;

end.
