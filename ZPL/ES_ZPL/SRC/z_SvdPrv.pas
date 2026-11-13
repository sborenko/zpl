unit z_SvdPrv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBClient,
  Grids, DBGrids, DBTables;

type
  String4 = string[4];
  String10 = string[10];
  TFormSvdProverka = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    dsrcPrv: TDataSource;
    qryTmp: TQuery;
    tblPrv: TTable;
    tblPrvKDOBJ_SPS: TSmallintField;
    tblPrvTABN: TIntegerField;
    tblPrvFamIO: TStringField;
    tblPrvSmForPf_1: TFloatField;
    tblPrvSmForPfP_1: TFloatField;
    tblPrvSmPrgPf_1: TFloatField;
    tblPrvSmPf_1: TFloatField;
    tblPrvSmPfP_1: TFloatField;
    tblPrvSmForSs_1: TFloatField;
    tblPrvSmForTvpP_1: TFloatField;
    tblPrvSmPrgTvp_1: TFloatField;
    tblPrvSmSs_1: TFloatField;
    tblPrvSmTvpP_1: TFloatField;
    tblPrvSmForNvP_1: TFloatField;
    tblPrvSmNvP_1: TFloatField;
    tblPrvSmForFz_1: TFloatField;
    tblPrvSmForFzP_1: TFloatField;
    tblPrvSmPrgFz_1: TFloatField;
    tblPrvSmFz_1: TFloatField;
    tblPrvSmFzP_1: TFloatField;
    tblPrvSmForPf_2: TFloatField;
    tblPrvSmForPfP_2: TFloatField;
    tblPrvSmPrgPf_2: TFloatField;
    tblPrvSmPf_2: TFloatField;
    tblPrvSmPfP_2: TFloatField;
    tblPrvSmForSs_2: TFloatField;
    tblPrvSmForTvpP_2: TFloatField;
    tblPrvSmPrgTvp_2: TFloatField;
    tblPrvSmSs_2: TFloatField;
    tblPrvSmTvpP_2: TFloatField;
    tblPrvSmForNvP_2: TFloatField;
    tblPrvSmNvP_2: TFloatField;
    tblPrvSmForFz_2: TFloatField;
    tblPrvSmForFzP_2: TFloatField;
    tblPrvSmPrgFz_2: TFloatField;
    tblPrvSmFz_2: TFloatField;
    tblPrvSmFzP_2: TFloatField;
    tblPrvNR: TAutoIncField;
    tblPrvSmPfPInv_1: TFloatField;
    tblPrvSmPfPInv_2: TFloatField;
    dbgrPrv: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CreOpenTblPrv(dDtPrc : TDateTime);
    procedure AddTblPrvRec(nKdObj_Sps, nTabN : integer;
                                             cFam, cIma, cOtch : ShortString);
    procedure AddSvedFromTmp;
  public
    { Public declarations }
  end;

procedure ShwSvdPrv(cdsSPZ : TClientDataSet; dDtPrc : TDateTime);

const SECTION = 'z_SvdPrv';

var
  FormSvdProverka: TFormSvdProverka;

implementation

{$R *.dfm}

uses a_Const, A_DM, a_Lib, Z_Dm, z_Main;

//------------------------------------------------------------------------------
procedure ShwSvdPrv(cdsSPZ : TClientDataSet; dDtPrc : TDateTime);
begin
  FormSvdProverka := TFormSvdProverka.Create(Application);
  with FormSvdProverka do begin
    CreOpenTblPrv(dDtPrc);
    ShowModal;
    Free;
  end;
end;
(*
Можно добавить еще и ТабН и устроить cds с подробностями .
select VidN, ShVidN, PSCH, Sum(summa), sPens, sp_pf, SSocStrah, sp_fsTvp, sBzr, sp_FZ
from Vinu_Sps
where DtProc = '03-01-2006'
group by VidN, ShVidN, PSCH, sPens, sp_pf, SSocStrah, sp_fsTvp, sBzr, sp_FZ



Select distinct nu.KdObj_Sps, nu.TabN, u.Fam, u.Ima, u.Otch
 from ViNu_Sps nu
    Left Outer Join z_Upi u on u.TabN = nu.TabN
               where nu.dtProc = '03-01-2006' and
                     nu.VidN > '6300' and nu.VidN < '8700' and nu.KdObj_Sps <> 1056

*)
procedure TFormSvdProverka.CreOpenTblPrv(dDtPrc : TDateTime);
begin
  with tblPrv do begin
    if Active then Close;
    DataBaseName := cDirInd;
    TableName := 'x_SvdPrv.db';
    if Exists then
      DeleteTable;
    CreateTable;
    Open;
    DisableControls;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct nu.KdObj_Sps, nu.TabN, u.Fam, u.Ima, u.Otch ' +
            ' from ViNu_Sps nu Left Outer Join z_Upi u on u.TabN = nu.TabN ' +
            ' where nu.dtProc = :dDtPrc and nu.VidN > "6300" and ' +
            ' nu.VidN < "8700" and nu.KdObj_Sps <> 1056');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      AddTblPrvRec(FieldByName('KdObj_Sps').AsInteger,
                    FieldByName('TabN').AsInteger,
                     FieldByName('Fam').AsString,
                      FieldByName('Ima').AsString,
                       FieldByName('Otch').AsString);
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select * from ViNu_Sps where DtProc = :dDtPrc and TabN = :TabN');
    SQL.Add('order by VidN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    DataSource := dsrcPrv;
  end;
  tblPrv.EnableControls;
  with tblPrv do begin
    First;
    qryTmp.Open;
    while not Eof do begin
      AddSvedFromTmp;
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdProverka.AddSvedFromTmp;
var nSmForPf_1, nSmForPfP_1, nSmPrgPf_1, nSmPf_1, nSmPfPInv_1, nSmPfP_1,
    nSmForSs_1, nSmForTvpP_1, nSmPrgTvp_1, nSmSs_1, nSmTvpP_1,
                nSmForNvP_1, nSmNvP_1,
    nSmForFz_1, nSmForFzP_1, nSmPrgFz_1, nSmFz_1, nSmFzP_1,
    nSmForPf_2, nSmForPfP_2, nSmPrgPf_2, nSmPf_2, nSmPfPInv_2, nSmPfP_2,
    nSmForSs_2, nSmForTvpP_2, nSmPrgTvp_2, nSmSs_2, nSmTvpP_2,
                nSmForNvP_2, nSmNvP_2,
    nSmForFz_2, nSmForFzP_2, nSmPrgFz_2, nSmFz_2, nSmFzP_2 : double;
    cVidN : String4; cPSch : String10;
begin
  nSmForPf_1   := 0;
  nSmForPfP_1  := 0;
  nSmPrgPf_1   := 0;
  nSmPf_1      := 0;
  nSmPfP_1     := 0;
  nSmPfPInv_1  := 0;
  nSmForSs_1   := 0;
  nSmForTvpP_1 := 0;
  nSmPrgTvp_1  := 0;
  nSmSs_1      := 0;
  nSmTvpP_1    := 0;
  nSmForNvP_1  := 0;
  nSmNvP_1     := 0;
  nSmForFz_1   := 0;
  nSmForFzP_1  := 0;
  nSmPrgFz_1   := 0;
  nSmFz_1      := 0;
  nSmFzP_1     := 0;
  nSmForPf_2   := 0;
  nSmForPfP_2  := 0;
  nSmPrgPf_2   := 0;
  nSmPf_2      := 0;
  nSmPfP_2     := 0;
  nSmPfPInv_2  := 0;
  nSmForSs_2   := 0;
  nSmForTvpP_2 := 0;
  nSmPrgTvp_2  := 0;
  nSmSs_2      := 0;
  nSmTvpP_2    := 0;
  nSmForNvP_2  := 0;
  nSmNvP_2     := 0;
  nSmForFz_2   := 0;
  nSmForFzP_2  := 0;
  nSmPrgFz_2   := 0;
  nSmFz_2      := 0;
  nSmFzP_2     := 0;
  with qryTmp do begin
    First;
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      cPSch := FieldByName('PSch').AsString;
      if (cPSch = '801') then begin
        if cVidN < '6000' then begin
          if FieldByName('SPens').AsString = '1' then
            nSmForPf_1 := nSmForPf_1 + FieldByName('Summa').AsFloat;
          if FieldByName('SP_PF').AsString = '1' then
            nSmForPfP_1 := nSmForPfP_1 + FieldByName('Summa').AsFloat;
          if FieldByName('SSocStrah').AsString = '1' then
            nSmForSs_1 := nSmForSs_1 + FieldByName('Summa').AsFloat;
          if FieldByName('SP_FsTvp').AsString = '1' then
            nSmForTvpP_1 := nSmForTvpP_1 + FieldByName('Summa').AsFloat;
          if FieldByName('SP_FsNv').AsString = '1' then
            nSmForNvP_1 := nSmForNvP_1 + FieldByName('Summa').AsFloat;
          if FieldByName('SBzr').AsString = '1' then
            nSmForFz_1 := nSmForFz_1 + FieldByName('Summa').AsFloat;
          if FieldByName('SP_Fz').AsString = '1' then
            nSmForFzP_1 := nSmForFzP_1 + FieldByName('Summa').AsFloat; end
        else if ((cVidN >= '6401') and (cVidN < '6500')) then
          nSmPf_1 := nSmPf_1 - FieldByName('Summa').AsFloat
        else if (cVidN = '8611') then
          nSmPfP_1 := nSmPfP_1 - FieldByName('Summa').AsFloat
        else if (cVidN = '8612') then
          nSmPfPInv_1 := nSmPfPInv_1 - FieldByName('Summa').AsFloat
        else if ((cVidN >= '6301') and (cVidN <= '6304')) then
          nSmSs_1 := nSmSs_1 - FieldByName('Summa').AsFloat
        else if (cVidN = '8621') then
          nSmTvpP_1 := nSmTvpP_1 - FieldByName('Summa').AsFloat
        else if (cVidN = '8631') then
          nSmNvP_1 := nSmNvP_1 - FieldByName('Summa').AsFloat
        else if ((cVidN >= '6501') and (cVidN <= '6502')) then
          nSmFz_1 := nSmFz_1 - FieldByName('Summa').AsFloat
        else if (cVidN = '8641') then
          nSmFzP_1 := nSmFzP_1 - FieldByName('Summa').AsFloat
        else if (cVidN = '8671') then
          nSmPrgPf_1 := nSmPrgPf_1 + FieldByName('Summa').AsFloat
        else if (cVidN = '8672') then
          nSmPrgTvp_1 := nSmPrgTvp_1 + FieldByName('Summa').AsFloat
        else if (cVidN = '8674') then
          nSmPrgFz_1 := nSmPrgFz_1 + FieldByName('Summa').AsFloat; end
      else if (cPSch = '811') then begin
        if cVidN < '6000' then begin
          if FieldByName('SPens').AsString = '1' then
            nSmForPf_2 := nSmForPf_2 + FieldByName('Summa').AsFloat;
          if FieldByName('SP_PF').AsString = '1' then
            nSmForPfP_2 := nSmForPfP_2 + FieldByName('Summa').AsFloat;
          if FieldByName('SSocStrah').AsString = '1' then
            nSmForSs_2 := nSmForSs_2 + FieldByName('Summa').AsFloat;
          if FieldByName('SP_FsTvp').AsString = '1' then
            nSmForTvpP_2 := nSmForTvpP_2 + FieldByName('Summa').AsFloat;
          if FieldByName('SP_FsNv').AsString = '1' then
            nSmForNvP_2 := nSmForNvP_2 + FieldByName('Summa').AsFloat;
          if FieldByName('SBzr').AsString = '1' then
            nSmForFz_2 := nSmForFz_2 + FieldByName('Summa').AsFloat;
          if FieldByName('SP_Fz').AsString = '1' then
            nSmForFzP_2 := nSmForFzP_2 + FieldByName('Summa').AsFloat; end
        else if ((cVidN >= '6401') and (cVidN < '6500')) then
          nSmPf_2 := nSmPf_2 - FieldByName('Summa').AsFloat
        else if (cVidN = '8611') then
          nSmPfP_2 := nSmPfP_2 - FieldByName('Summa').AsFloat
        else if (cVidN = '8612') then
          nSmPfPInv_2 := nSmPfPInv_2 - FieldByName('Summa').AsFloat
        else if ((cVidN >= '6301') and (cVidN <= '6304')) then
          nSmSs_2 := nSmSs_2 - FieldByName('Summa').AsFloat
        else if (cVidN = '8621') then
          nSmTvpP_2 := nSmTvpP_2 - FieldByName('Summa').AsFloat
        else if (cVidN = '8631') then
          nSmNvP_2 := nSmNvP_2 - FieldByName('Summa').AsFloat
        else if ((cVidN >= '6501') and (cVidN <= '6502')) then
          nSmFz_2 := nSmFz_2 - FieldByName('Summa').AsFloat
        else if (cVidN = '8641') then
          nSmFzP_2 := nSmFzP_2 - FieldByName('Summa').AsFloat
        else if (cVidN = '8671') then
          nSmPrgPf_2 := nSmPrgPf_2 + FieldByName('Summa').AsFloat
        else if (cVidN = '8672') then
          nSmPrgTvp_2 := nSmPrgTvp_2 + FieldByName('Summa').AsFloat
        else if (cVidN = '8674') then
          nSmPrgFz_2 := nSmPrgFz_2 + FieldByName('Summa').AsFloat;
      end;
      Next;
    end;
    tblPrv.Edit;
    tblPrv.FieldByName('SmForPf_1').AsFloat := nSmForPf_1;
    tblPrv.FieldByName('SmForPfP_1').AsFloat := nSmForPfP_1;
    tblPrv.FieldByName('SmPrgPf_1').AsFloat := nSmPrgPf_1;
    tblPrv.FieldByName('SmPf_1').AsFloat := nSmPf_1;
    tblPrv.FieldByName('SmPfP_1').AsFloat := nSmPfP_1;
    tblPrv.FieldByName('SmPfPInv_1').AsFloat := nSmPfPInv_1;
    tblPrv.FieldByName('SmForSs_1').AsFloat := nSmForSs_1;
    tblPrv.FieldByName('SmForTvpP_1').AsFloat := nSmForTvpP_1;
    tblPrv.FieldByName('SmPrgTvp_1').AsFloat := nSmPrgTvp_1;
    tblPrv.FieldByName('SmSs_1').AsFloat := nSmSs_1;
    tblPrv.FieldByName('SmTvpP_1').AsFloat := nSmTvpP_1;
    tblPrv.FieldByName('SmForNvP_1').AsFloat := nSmForNvP_1;
    tblPrv.FieldByName('SmNvP_1').AsFloat := nSmNvP_1;
    tblPrv.FieldByName('SmForFz_1').AsFloat := nSmForFz_1;
    tblPrv.FieldByName('SmForFzP_1').AsFloat := nSmForFzP_1;
    tblPrv.FieldByName('SmPrgFz_1').AsFloat := nSmPrgFz_1;
    tblPrv.FieldByName('SmFz_1').AsFloat := nSmFz_1;
    tblPrv.FieldByName('SmFzP_1').AsFloat := nSmFzP_1;

    tblPrv.FieldByName('SmForPf_2').AsFloat := nSmForPf_2;
    tblPrv.FieldByName('SmForPfP_2').AsFloat := nSmForPfP_2;
    tblPrv.FieldByName('SmPrgPf_2').AsFloat := nSmPrgPf_2;
    tblPrv.FieldByName('SmPf_2').AsFloat := nSmPf_2;
    tblPrv.FieldByName('SmPfP_2').AsFloat := nSmPfP_2;
    tblPrv.FieldByName('SmPfPInv_2').AsFloat := nSmPfPInv_2;
    tblPrv.FieldByName('SmForSs_2').AsFloat := nSmForSs_2;
    tblPrv.FieldByName('SmForTvpP_2').AsFloat := nSmForTvpP_2;
    tblPrv.FieldByName('SmPrgTvp_2').AsFloat := nSmPrgTvp_2;
    tblPrv.FieldByName('SmSs_2').AsFloat := nSmSs_2;
    tblPrv.FieldByName('SmTvpP_2').AsFloat := nSmTvpP_2;
    tblPrv.FieldByName('SmForNvP_2').AsFloat := nSmForNvP_2;
    tblPrv.FieldByName('SmNvP_2').AsFloat := nSmNvP_2;
    tblPrv.FieldByName('SmForFz_2').AsFloat := nSmForFz_2;
    tblPrv.FieldByName('SmForFzP_2').AsFloat := nSmForFzP_2;
    tblPrv.FieldByName('SmPrgFz_2').AsFloat := nSmPrgFz_2;
    tblPrv.FieldByName('SmFz_2').AsFloat := nSmFz_2;
    tblPrv.FieldByName('SmFzP_2').AsFloat := nSmFzP_2;
    tblPrv.Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdProverka.AddTblPrvRec(nKdObj_Sps, nTabN : integer;
                                             cFam, cIma, cOtch : ShortString);
begin
  with tblPrv do begin
    Append;
    FieldByName('KdObj_Sps').AsInteger := nKdObj_Sps;
    FieldByName('TabN').AsInteger := nTabN;
    FieldByName('FamIO').AsString := MyFamIO(cFam, cIma, cOtch);
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdProverka.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 750);
    Free;
  end;
  if FileExists(cDirVids + 'SvdPrv_1.vid') then
    dbgrPrv.Columns.LoadFromFile(cDirVids + 'SvdPrv_1.vid');

end;
//------------------------------------------------------------------------------
procedure TFormSvdProverka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tblPrv.Active then
    dbgrPrv.Columns.SaveToFile(cDirVids + 'SvdPrv_1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;

end.
