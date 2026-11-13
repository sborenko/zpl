unit z_SvKatP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormSvodByKatP = class(TForm)
    qrySvd: TQuery;
    dsrcSvd: TDataSource;
    dbgrSvd: TDBGrid;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnPrt: TSpeedButton;
    qrySvdPSCH: TStringField;
    qrySvdSHKATP: TStringField;
    qrySvdKDKATP: TSmallintField;
    qrySvdVIDN: TStringField;
    qrySvdSHVIDN: TStringField;
    qrySvdZNAK: TSmallintField;
    qrySvdSUMMA: TFloatField;
    qrySvdNMVIDN: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
    procedure dbgrSvdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrSvdDblClick(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    procedure OpenQrySvd(dDtProc : TDateTime);
  public
    { Public declarations }
  end;

procedure SvodByKatP(dDtProc : TDateTime; cCaption : ShortString);

const SECTION = 'z_SvKatP';

var
  FormSvodByKatP: TFormSvodByKatP;

implementation

uses A_Const, a_Dm, z_Dm, z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure SvodByKatP(dDtProc : TDateTime; cCaption : ShortString);
begin
  FormSvodByKatP := TFormSvodByKatP.Create(Application);
  with FormSvodByKatP do begin
    d_DtProc := dDtProc;
    Caption := cCaption;
    OpenQrySvd(dDtProc);
    if bFlagDbg then
      ShowModal
    else
      F6PrtSvdByKatP(qrySvd, dDtProc); {z_CmnPrt}
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvodByKatP.OpenQrySvd(dDtProc : TDateTime);
begin
  with qrySvd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    // 1-я часть запроса в разрезе PSch
    SQL.Add('Select n.PSch, n.KdKatP, k.ShKatP, n.VidN, n.ShVidN, ' +
            ' n.NmVidN, n.Znak, Sum(n.Summa) as Summa ' +
            ' from GetNuWithZnak (:dDtProc) n ' +
            ' Left outer join z_KatPers k on k.KdKatP = n.KdKatP ' +
            ' where n.vidN < "5000" and n.KdObj <> 1056 ' +
            ' group by n.PSCH, n.KdKatP, k.ShKatP, n.VidN, n.ShVidN, ' +
            ' n.NmVidN, n.Znak ');
    // 2-я часть запроса без PSch (всё на ВсеPSch)
    SQL.Add('UNION Select Cast("ВсеPSch" as Char(10)) as PSch, ' +
            ' n.KdKatP, k.ShKatP, n.VidN, n.ShVidN, ' +
            ' n.NmVidN, n.Znak, Sum(n.Summa) as Summa ' +
            ' from GetNuWithZnak (:dDtProc) n ' +
            ' Left outer join z_KatPers k on k.KdKatP = n.KdKatP ' +
            ' where n.vidN < "5000"   and n.KdObj <> 1056  ' +
            ' group by n.KdKatP, k.ShKatP, n.VidN, n.ShVidN, ' +
            ' n.NmVidN, n.Znak ');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvodByKatP.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 450);
    Free;
  end;
  if FileExists(cDirVids + 'x_SvKtgP.vid') then
    dbgrSvd.Columns.LoadFromFile(cDirVids + 'x_SvKtgP.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSvodByKatP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSvd.Columns.SaveToFile(cDirVids + 'x_SvKtgP.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvodByKatP.sBtnPrtClick(Sender: TObject);
begin
  F6PrtSvdByKatP(qrySvd, d_DtProc); {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormSvodByKatP.dbgrSvdDrawColumnCell(Sender: TObject;
                         const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrSvd.Canvas do begin
   cFldNm := UpperCase(Column.FieldName);
   if not (gdFocused in State) then begin
     if (cFldNm = 'SUMMA') and (Column.Field.AsFloat < 0) then
       Font.Color := clRed;
    end;   
  end;
  dbgrSvd.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormSvodByKatP.dbgrSvdDblClick(Sender: TObject);
begin
;
end;

end.
