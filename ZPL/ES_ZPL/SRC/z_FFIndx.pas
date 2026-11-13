unit z_FFIndx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  Math, DBTables, DBCtrls;

type
  TFormFFIndx = class(TForm)
    Panel1: TPanel;
    bBtnClose: TBitBtn;
    qryOtkl: TQuery;
    dsrcOtkl: TDataSource;
    dbgrOtkl: TDBGrid;
    qryOtklTABN: TIntegerField;
    qryOtklFAM: TStringField;
    qryOtklIMA: TStringField;
    qryOtklOTCH: TStringField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklSUMMA: TFloatField;
    sBtnGo: TSpeedButton;
    LabelCntRec: TLabel;
    DBNavigator1: TDBNavigator;
    qryAdd: TQuery;
    sBtnResult: TSpeedButton;
    qryTmp: TQuery;
    qryPrmUv: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrOtklEnter(Sender: TObject);
    procedure dbgrOtklExit(Sender: TObject);
    procedure sBtnGoClick(Sender: TObject);
    procedure sBtnResultClick(Sender: TObject);
  private
    { Private declarations }
    d_RepMes, d_Mes06, d_Mes07 : TDateTime;
    function GetSmOklNdb(nTabN : integer; dDtMes : TDateTime;
                                              var bIsCmbOkl : boolean) : double;
    function GetLastDtUv(nTabN : integer) : TDateTime;
    procedure AddRecInToFixIndx(nTabN : integer; cMsg : ShortString;
                                      nF_Smm, nFixSmm, nDSmOklNdb : double;
                                                dRepMes, dLastDtUv : TDateTime);
  public
    { Public declarations }
    nSvTabN : integer;
    procedure OpenQryOtkl;
    procedure GoPodkl;
  end;

procedure FillFixIndx;

const SECTION = 'z_FFIndx';

var
  FormFFIndx: TFormFFIndx;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib, z_CmnPrt, z_FIndx;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure FillFixIndx;
begin
  FormFFIndx := TFormFFIndx.Create(Application);
  with FormFFIndx do begin
    d_RepMes := EncodeDate(2012, 7, 1);
    d_Mes06 :=  EncodeDate(2012, 6, 1);
    d_Mes07 :=  EncodeDate(2012, 7, 1);
    Caption := 'Заполнение таблицы Z_FixIndx из отклонений октября 2012 г.';
    OpenQryOtkl;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFFIndx.OpenQryOtkl;
begin
  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    //SQL.Add('Select distinct o.TabN, u.Fam, u.Ima, u.Otch, o.ZaMesGod, ' +
    //        ' o.Summa from Z_Otkl o ' +
    //        ' Left Outer Join Z_Upi u on u.TabN = o.TabN ' +
    //        ' where o.DtProc = "10/01/2012" and o.VidN = "1620"');
    SQL.Add('Select distinct o.TabN, u.Fam, u.Ima, u.Otch, o.ZaMesGod, ' +
            ' Sum(o.Summa) as SUMMA from Z_Otkl o ' +
            ' Left Outer Join Z_Upi u on u.TabN = o.TabN ' +
            ' where o.DtProc = "10/01/2012" and ' +
            ' o.ZaMesGod >= "05/01/2012" and ' +
            ' o.ZaMesGod <= "06/01/2012" and o.VidN = "1620" ' +
            ' group by o.TabN, u.Fam, u.Ima, u.Otch, o.ZaMesGod');
    Open;
    if nSvTabN <> 0 then
      Locate('TabN', nSvTabN, []);
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFFIndx.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 455);
    Width  := ReadInteger(SECTION, 'wW', 595);
    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    Free;
  end;
  if FileExists(cDirVids + 'FFIndx.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'FFIndx.vid');
end;
//------------------------------------------------------------------------------
procedure TFormFFIndx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'FFIndx.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvTabN', qryOtklTabN.AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFFIndx.dbgrOtklEnter(Sender: TObject);
begin
  dbgrOtkl.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormFFIndx.dbgrOtklExit(Sender: TObject);
begin
  dbgrOtkl.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormFFIndx.sBtnGoClick(Sender: TObject);
begin
  GoPodkl;
end;
//------------------------------------------------------------------------------
function TFormFFIndx.GetLastDtUv(nTabN: integer): TDateTime;
begin
  Result := 0;
  with qryPrmUv do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    if not FieldByName('Dt_Uvoln').IsNull and
             (FieldByName('Dt_Uvoln').AsDateTime < d_RepMes) then
      Result := FieldByName('Dt_Uvoln').AsDateTime;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFFIndx.GoPodkl;
var nSvTabN, nTabN : integer;
    nCntRecInTabN : SmallInt;
    nF_Smm, nFixSmm, nSmOklNdb06, nSmOklNdb07, nDSmOklNdb : double;
    cMsg : ShortString;
    dFixMes, dLastDtUv : TDateTime;
    bIsCmbOkl : boolean;
begin
  // Посчитать разницу между СмОклНдб 7-го и 6-го месяцев - отнять её от ФиксСмм
  cMsg := 'Если в таблице фиксированных сумм индексации Z_FixIndx есть записи,' +
          #10#13 + 'все они будут предварительно удалены.     Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  Application.ProcessMessages;
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from z_PrmUv where TabN = :nTabN and ' +
            ' Dt_Priem < "08/01/2012" order by dt_Priem desc');
  end;
  with qryAdd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from Z_FixIndx');
    ExecSQL;
{
    SQL.Clear;
    SQL.Add('Insert into Z_FixIndx (TabN, LastDtUv, FixMes, F_Smm, D_OklNdb, ' +
            ' FixSmm, Notes) values (:nTabN, :dLastDtUv, :dFixMes, :nF_Smm, ' +
            ' :nD_OklNdb, :nFixSmm, :cNotes)');
}
  end;
  with qryOtkl do begin
    nSvTabN := qryOtklTabN.AsInteger;
    First;
    while not Eof do begin
      nTabN := qryOtklTabN.AsInteger;
      nCntRecInTabN := 0;
      nF_Smm := 0;
      dFixMes := 0;
      dLastDtUv := GetLastDtUv(nTabN);
      while (qryOtklTabN.AsInteger = nTabN) and not Eof do begin
        Inc(nCntRecInTabN);
        if qryOtklSumma.AsFloat >= nF_Smm then begin
          nF_Smm := qryOtklSumma.AsFloat;
          dFixMes := qryOtklZaMesGod.AsDateTime;
        end;
        Next;
      end;
      nSmOklNdb06 := GetSmOklNdb(nTabN, d_Mes06, bIsCmbOkl);
      nSmOklNdb07 := GetSmOklNdb(nTabN, d_Mes07, bIsCmbOkl);
      nDSmOklNdb  := RoundTo(nSmOklNdb07 - nSmOklNdb06, -2);
      if nDSmOklNdb > 0 then
        nFixSmm := nF_Smm - nDSmOklNdb
      else
        nFixSmm := nF_Smm;
      if nFixSmm > 0 then begin
        cMsg := ' Зап. ' + IntToStr(nCntRecInTabN) + '   ' + DateToStr(dFixMes);
        AddRecInToFixIndx(nTabN, cMsg, nF_Smm, nFixSmm, nDSmOklNdb,
                                                           d_RepMes, dLastDtUv);
      end;
    end;
    Locate('TabN', nSvTabN, []);
    sBtnGo.Enabled := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFFIndx.AddRecInToFixIndx(nTabN : integer; cMsg : ShortString;
                    nF_Smm, nFixSmm, nDSmOklNdb : double;
                                                 dRepMes, dLastDtUv: TDateTime);
begin
  with qryAdd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Insert into Z_FixIndx (TabN, ');
    if dLastDtUv > 0 then
      SQL.Add('LastDtUv, ');
    SQL.Add(' FixMes, F_Smm, D_OklNdb, FixSmm, Notes) values (:nTabN, ');
    if dLastDtUv > 0 then
      SQL.Add(':dLastDtUv, ');
    SQL.Add(' :dFixMes, :nF_Smm, :nD_OklNdb, :nFixSmm, :cNotes)');
    if dLastDtUv > 0 then
      ParamByName('dLastDtUv').AsDateTime := dLastDtUv;
    qryAdd.ParamByName('nTabN').AsInteger := nTabN;
    qryAdd.ParamByName('dFixMes').AsDateTime := dRepMes;
    qryAdd.ParamByName('nF_Smm').AsFloat     := nF_Smm;
    qryAdd.ParamByName('nFixSmm').AsFloat    := nFixSmm;
    qryAdd.ParamByName('nD_OklNdb').AsFloat  := nDSmOklNdb;
    qryAdd.ParamByName('cNotes').AsString    := cMsg;
    qryAdd.ExecSQL;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFFIndx.sBtnResultClick(Sender: TObject);
begin
  ShwFxIndx;     {z_FIndx}
end;
//------------------------------------------------------------------------------
function TFormFFIndx.GetSmOklNdb(nTabN: integer; dDtMes: TDateTime;
                                                var bIsCmbOkl: boolean): double;
var dDtZaMG, dDtEZaMG : TDateTime;
    nY, nM, nD : word;
begin
  DecodeDate(dDtMes, nY, nM, nD);
  dDtZaMG := EnCodeDate(nY, nM, 1);
  dDtEZaMG := MyLastDOM(dDtMes);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_GetOklNdb (:nTabN, :dDtZaMG, :dDtEZaMG)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    ParamByName('dDtEZaMG').AsDateTime := dDtEZaMG;
    Open;
    Result := FieldByName('SmOklNdb').AsFloat;
    bIsCmbOkl := FieldByName('p_CmbOkl').AsString = '1';
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

end.
