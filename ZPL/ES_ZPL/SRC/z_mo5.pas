unit z_mo5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, DBClient, ExtCtrls, Grids, DBGrids, DB, DBTables,
  Buttons;

type
  string4 = string[4];
  string10 = string[10];
  string15 = string[15];
  TFormMo5 = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    dbgrNU: TDBGrid;
    Splitter1: TSplitter;
    dbgrTmp: TDBGrid;
    cds_Tmp: TClientDataSet;
    dsrcTmp: TDataSource;
    SpeedButton2: TSpeedButton;
    cds_TmpNR: TAutoIncField;
    cds_TmpVidN: TStringField;
    cds_TmpShVidN: TStringField;
    cds_TmpSumma: TFloatField;
    cds_TmpPSch: TStringField;
    cds_TmpSchBU: TStringField;
    qryNUKDOBJ_SPS: TSmallintField;
    qryNUTABN: TIntegerField;
    qryNUVIDN: TStringField;
    qryNUSHVIDN: TStringField;
    qryNUDTPROC: TDateTimeField;
    qryNUZAMESGOD: TDateTimeField;
    qryNUCHAS: TFloatField;
    qryNUSUMMA: TFloatField;
    qryNUPSCH: TStringField;
    qryNUSCHBU: TStringField;
    qryNUOLDKDVIDN: TSmallintField;
    qryNUVID_KDSPZ: TSmallintField;
    qryNUKEKV: TStringField;
    qryNUNR: TIntegerField;
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
    qryNUOLDKDOBJ: TSmallintField;
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
    tblTmp: TTable;
    tblTmpNR: TAutoIncField;
    tblTmpVidN: TStringField;
    tblTmpShVidN: TStringField;
    tblTmpSumma: TFloatField;
    tblTmpPSch: TStringField;
    tblTmpSchBU: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    procedure OpenQryNu(dDtProc : TDateTime);
    procedure CreOpenTblTmp;
    procedure CreOpenCdsTmp;
    procedure AddRecInCdsTmp(cPSch : string10; cVidN : string4;
                                          cShVidN : string15; nSmVida : double);
  public
    { Public declarations }
  end;

procedure MakeMo5(dDtProc : TDateTime);

const SECTION = 'z_mo5';

var
  FormMo5: TFormMo5;

implementation

uses a_Const, A_DM, a_Lib, Z_Dm, z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure MakeMo5(dDtProc : TDateTime);
begin
  FormMo5 := TFormMo5.Create(Application);
  with FormMo5 do begin
    d_DtProc := dDtProc;
    Label1.Caption := 'Делаем за ' + DateToStr(dDtProc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo5.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 750);
    dbgrNU.Height := ReadInteger(SECTION, 'grNuH', 350);
    Free;
  end;
  if FileExists(cDirVids + 'm_5gr_1.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'm_5gr_1.vid');
//  if FileExists(cDirVids + 'm_5gr_2.vid') then
//    dbgrTmp.Columns.LoadFromFile(cDirVids + 'm_5gr_2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormMo5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grNuH', dbgrNU.Height);
    Free;
  end;
  dbgrNu.Columns.SaveToFile(cDirVids + 'm_5gr_1.vid');
//  dbgrTmp.Columns.SaveToFile(cDirVids + 'm_5gr_2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormMo5.SpeedButton1Click(Sender: TObject);
begin
  OpenQryNu(d_DtProc);
end;
//------------------------------------------------------------------------------
procedure TFormMo5.OpenQryNu(dDtProc : TDateTime);
begin
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from ViNu_Sps where (DtProc = :dDtProc) ' +
//            ' and TabN in (12394, 15934) ' + // временно
            ' order by TabN, PSch, VidN desc, SchBU ');  // если только для синт. МО
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo5.CreOpenTblTmp;
begin
  with tblTmp do begin
    IndexName := '';
    if Active then Close;
    TableName := 'xxx_123.db';
    DataBaseName := cDirTemp;
    if Exists then
      DeleteTable;
    CreateTable;
    Open;
    IndexName := 'OnPSchVidN';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo5.CreOpenCdsTmp;
begin
  with cds_Tmp do begin
    IndexName := '';
    if Active then Close;
    CreateDataSet;
    Open;
    IndexName := 'OnPSchVidN';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMo5.SpeedButton2Click(Sender: TObject);
var {bInv : boolean;} nTabN : integer;
    cVidN : string4; cPSch : string10;
    cShVidN : string15;
    nSmVida : double;
    nCntRec, nCnt100 : integer;
begin
  CreOpenTblTmp;
  tblTmp.DisableControls;
//  CreOpenCdsTmp;
//  cds_Tmp.DisableControls;
  with qryNu do begin
    DisableControls;
    First;
    nCntRec := 0;
    nCnt100 := 0;
    while not Eof do begin
      nTabN := qryNuTabN.AsInteger;
      while (qryNuTabN.AsInteger = nTabN) and not Eof do begin
        cPSch := qryNuPSch.AsString;
        while (qryNuPSch.AsString = cPSch) and
                       (qryNuTabN.AsInteger = nTabN) and not Eof do begin
          cVidN := qryNuVidN.AsString;
          cShVidN := qryNuShVidN.AsString;
          nSmVida := 0;
          while (qryNuVidN.AsString = cVidN) and
                         (qryNuPSch.AsString = cPSch) and
                             (qryNuTabN.AsInteger = nTabN) and not Eof do begin
            nSmVida := nSmVida + qryNuSumma.AsFloat;
            Inc(nCnt100);
            Inc(nCntRec);
            if (nCnt100 >= 100) then begin
              nCnt100 := 0;
              Label1.Caption := 'Записей: ' + IntToStr(nCntRec);
              Application.ProcessMessages;
            end;
            Next;
          end;
          AddRecInCdsTmp(cPSch, cVidN, cShVidN, nSmVida);
        end;
      end;
    end;
    EnableControls;
  end;
  tblTmp.EnableControls;
//  cds_Tmp.EnableControls;
end;

// Можно попробовать cds с правильным обращением к индексу (не через Locate().
(*
//------------------------------------------------------------------------------
procedure TFormMo5.AddRecInCdsTmp(cPSch : string10; cVidN : string4;
                                     cShVidN : string15; nSmVida : double);
begin
  with cds_Tmp do begin
    if not FindKey([cPSch, cVidN]) then begin
      Append;
      cds_TmpPSch.AsString := cPSch;
      cds_TmpVidN.AsString := cVidN;
      cds_TmpShVidN.AsString := cShVidN; end
    else
      Edit;
    cds_TmpSumma.AsFloat := cds_TmpSumma.AsFloat + nSmVida;
    Post;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormMo5.AddRecInCdsTmp(cPSch : string10; cVidN : string4;
                                     cShVidN : string15; nSmVida : double);
begin
  with tblTmp do begin
    if not Locate('PSch;VidN', VarArrayOf([cPSch, cVidN]), []) then begin
      Append;
      tblTmpPSch.AsString := cPSch;
      tblTmpVidN.AsString := cVidN;
      tblTmpShVidN.AsString := cShVidN; end
    else
      Edit;
    tblTmpSumma.AsFloat := tblTmpSumma.AsFloat + nSmVida;
    Post;
  end;
end;

end.
