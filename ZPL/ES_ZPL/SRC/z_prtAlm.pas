unit z_prtAlm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, DBTables, Buttons, StdCtrls, ExtCtrls,
  Math, DBClient;

type
  TFormPrtAlm = class(TForm)
    Panel1: TPanel;
    bBtnExit: TBitBtn;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    dbgrNU: TDBGrid;
    qryTmp: TQuery;
    LbxVedType: TListBox;
    Label1: TLabel;
    Splitter1: TSplitter;
    cdsAlm: TClientDataSet;
    dsrcAlm: TDataSource;
    dbgrAlm: TDBGrid;
    sBtnPrt2: TSpeedButton;
    cdsAlmNR: TAutoIncField;
    cdsAlmKdPst: TSmallintField;
    cdsAlmTabN: TIntegerField;
    cdsAlmKuda: TStringField;
    cdsAlmKomu: TStringField;
    cdsAlmSmPerevoda: TFloatField;
    cdsAlmSmPSB: TFloatField;
    cdsAlmSmNDS: TFloatField;
    cdsAlmSmBezNDS: TFloatField;
    cdsAlmSpecNR: TIntegerField;
    cdsAlmPSch: TStringField;
    Label2: TLabel;
    cdsAlmIsPst: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrt2Click(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    procedure FillLbxVedType(dDtProc : TDateTime);
    procedure OpenQryNU(dDtProc : TDateTime);
    procedure Cre_CdsAlm;
  public
    { Public declarations }
  end;

procedure PrtVedAlimCurMes(dDtProc : TDateTime);

const SECTION = 'z_PrtAlm';

var
  FormPrtAlm: TFormPrtAlm;

implementation

uses a_Const, a_Lib, z_DM, z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure PrtVedAlimCurMes(dDtProc : TDateTime);
var i : word; cMsg : string;
begin
  FormPrtAlm := TFormPrtAlm.Create(Application);
  with FormPrtAlm do begin
    d_DtProc := dDtProc;
    Label1.Caption := '';
    FillLbxVedType(dDtProc);
    if LbxVedType.Count = 0 then
      ShowMessage('Начисленний по алиментам не обнаружено')
    else begin
      if bFlagDbg then begin
        cMsg := 'Обнаружены ведомости:';
        for i := 0 to LbxVedType.Count-1 do begin
          cMsg := cMsg + ' "' + LbxVedType.Items[i] + '"';
          if i < LbxVedType.Count-1 then
            cMsg := cMsg + ',';
        end;
        Label1.Caption := cMsg;
        OpenQryNU(dDtProc);
        ShowModal; end
      else begin
        for i := 0 to LbxVedType.Count-1 do begin
          cMsg := cMsg + ' "' + LbxVedType.Items[i] + '"';
          if i < LbxVedType.Count-1 then
            cMsg := cMsg + ',';
        end;
        Label1.Caption := cMsg;
        OpenQryNU(dDtProc);
        sBtnPrt2.Click;
      end;
    end;
    Free;
  end;
end;
(*
    Сначала определить, какие почты (Posta) встретились в Z_NU,
Select distinct ud.Posta
from Z_NU nu
Left outer join z_UDERG ud on ud.TabN = nu.TabN and
                              ud.VidN = nu.VidN and ud.Spec_NR = nu.Spec_NR
where nu.DtProc = '2005/09/01' and nu.VidN in ("6601")

    потом по каждой выдать списки

Select upi.Fam, upi.Ima, upi.otch, ud.Posta, ud.Komu, nu.*
from Z_NU nu
Left outer join z_UPI upi on upi.TabN = nu.TabN
Left outer join z_UDERG ud on ud.TabN = nu.TabN and ud.VidN = nu.VidN
where nu.DtProc = '2005/09/01' and nu.VidN in ("6601", "6602")
order by nu.TabN, nu.VidN, nu.NR
*)
//------------------------------------------------------------------------------
procedure TFormPrtAlm.FillLbxVedType(dDtProc : TDateTime);
begin                 // Определить, какие почты (KdPst) встретились в Z_NU
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct ud.KdPst from Z_NU nu ' +
           ' Left outer join z_UDERG ud on ud.TabN = nu.TabN and ' +
          ' ud.VidN = nu.VidN and ud.Spec_NR = nu.Spec_NR ' +
         ' where nu.DtProc = :dDtProc and nu.VidN = "6601"'); // 6601 - алименты
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
    while not Eof do begin
      LbxVedType.Items.Add(FieldByName('KdPst').AsString);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtAlm.OpenQryNU(dDtProc : TDateTime);
begin
  with qryNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select pst.is_pst, ud.KdPst, ud.Komu, ud.SumVzn, ud.SpsRsch, ud.SP, ' +
            ' ud.NomDok, ud.Adres, ud.Notes, ud.Proc_Psb, nu.* ' +
            ' from ViNu_Main nu ' +
            ' Left outer join z_UDERG ud on ' +
            ' ud.TabN = nu.TabN and ud.VidN = nu.VidN and ' +
            ' ud.Spec_Nr = nu.Spec_NR ' +
            ' left outer join Z_PST pst on pst.KdPst = ud.KdPst ' +
            ' where nu.DtProc = :dDtProc and nu.VidN in ("6601", "6602") ' +
            ' order by nu.TabN, nu.Spec_NR, nu.VidN');
            // при такой сортировке всегда первая запись с видом 6601,
            // в которой Адрес (Kuda) и Фамилия (Komu).
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtAlm.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 480);
    Width  := ReadInteger(SECTION, 'wW', 650);
    Free;
  end;
  if FileExists(cDirVids + 'Prt_Alm.Vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'Prt_Alm.Vid');
end;
//------------------------------------------------------------------------------
procedure TFormPrtAlm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrNu.Columns.SaveToFile(cDirVids + 'Prt_Alm.Vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtAlm.sBtnPrt2Click(Sender: TObject);
begin
 Cre_CdsAlm;
end;
//------------------------------------------------------------------------------
procedure TFormPrtAlm.Cre_CdsAlm;
var nTabN, nSpecNR, nKdPst : integer;
    nSmPerevoda, nSmPsb, nSmNDS, nSmBezNDS : double;
    bIsKss, bIsPosta : boolean;
    cPSch : ShortString;
    cIsPst: string;
begin
  bIsKss := false;
  bIsPosta := false;
  nSmNds := 0;
  nSmPerevoda := 0;
  with cdsAlm do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    CreateDataSet;
    Open;
    AddIndex('OnKdPstPSchKomu', 'KdPst;PSch;TabN;SpecNR;NR', []);
    IndexName := 'OnKdPstPSchKomu'
  end;
  with qryNu do begin
    First;
    while not Eof do begin
      nTabN   := FieldByName('TabN').AsInteger;
      nSpecNR := FieldByName('Spec_NR').AsInteger;
      nKdPst  := FieldByName('KdPst').AsInteger;
      cIsPst  := FieldByName('Is_Pst').AsString;
      cPSch   := FieldByName('PSch').AsString;
      if nKdPst = 0 then
        bIsKss := true
      else if nKdPst <> 0 then
        bIsPosta := true;
      while (FieldByName('TabN').AsInteger = nTabN) and
              (FieldByName('Spec_NR').AsInteger = nSpecNR) and not Eof do begin
        if FieldByName('VidN').AsString = '6601' then begin
          nSmPerevoda := nSmPerevoda - FieldByName('Summa').AsFloat;
          nSmPsb := 0;
          nSmNDS := 0;
          nSmBezNDS := 0; end
        else begin
          nSmPerevoda := 0;
          nSmPsb := -RoundTo(FieldByName('Summa').AsFloat, -2);
          nSmNDS := nSmNDS -
                         RoundTo(0.1666666 * FieldByName('Summa').AsFloat, -2);
          nSmBezNDS := nSmPsb - nSmNDS;
        end;
        cdsAlm.Append;
        cdsAlm.FieldByName('KdPst').AsInteger := nKdPst;
        cdsAlm.FieldByName('Is_Pst').AsString := cIsPst;
        cdsAlm.FieldByName('TabN').AsInteger := nTabN;
        cdsAlm.FieldByName('SpecNR').AsInteger := nSpecNR;
        cdsAlm.FieldByName('PSch').AsString := cPSch;
        if FieldByName('VidN').AsString = '6601' then begin
          cdsAlm.FieldByName('Kuda').AsString := FieldByName('Adres').AsString;
          cdsAlm.FieldByName('Komu').AsString := FieldByName('Komu').AsString;
          cdsAlm.FieldByName('SmPerevoda').AsFloat :=
                                             -FieldByName('Summa').AsFloat; end
        else begin
          cdsAlm.FieldByName('SmPsb').AsFloat := nSmPsb;
          cdsAlm.FieldByName('SmNds').AsFloat := nSmNds;
          cdsAlm.FieldByName('SmBezNds').AsFloat := nSmBezNds;
        end;
        cdsAlm.Post;
        Next;
      end;
    end;
  end;
  if bFlagDbg then begin
    cdsAlm.SaveToFile(cDirTemp + 'AlmPost.cds');
    LbxVedType.Items.SaveToFile(cDirTemp + 'AlmPost.lbx');
  end;
  F6_PrtVedAlm(d_DtProc, cdsAlm, LbxVedType, bIsKss, bIsPosta);
end;

end.
