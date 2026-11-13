unit z_MyDbg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBClient;

type
  TFormMyDbg = class(TForm)
    cdsMyDbg: TClientDataSet;
    dsrcMyDbg: TDataSource;
    cdsMyDbgMyFld: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MemoRus: TMemo;
    MemoUkr: TMemo;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    nSvSumma : double;
    procedure CreOpenCdsMyDbg;
  public
    { Public declarations }
  end;

procedure ShwMyDbg;

const SECTION = 'z_MyDbg';

var
  FormMyDbg: TFormMyDbg;

implementation

uses a_Const, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwMyDbg;
begin
  FormMyDbg := TFormMyDbg.Create(Application);
  with FormMyDbg do begin
    Caption := 'SumPropis и UkrSumPropis';
    CreOpenCdsMyDbg;
    ShowModal;
    Free;
  end;
end;                      
//------------------------------------------------------------------------------
procedure TFormMyDbg.CreOpenCdsMyDbg;
begin
  with cdsMyDbg do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    if nSvSumma >= 0 then
      cdsMyDbgMyFld.AsFloat := nSvSumma;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyDbg.BitBtn1Click(Sender: TObject);
var nSumma : double; nKopeek : integer; cMsg : ShortString;
begin
  if not cdsMyDbgMyFld.IsNull and (cdsMyDbgMyFld.AsFloat > 0) then begin
    nSumma := cdsMyDbgMyFld.AsFloat;
    cMsg := SumPropis(nSumma, 'm', nKopeek);
    cMsg := AnsiUpperCase(Copy(cMsg,1,1)) +
                              Copy(cMsg, 2, Length(cMsg)) + ' руб., ';
    if nKopeek <> 0 then
      cMsg := cMsg + IntToStr(nKopeek) + ' коп.'
    else
      cMsg := cMsg + '00 коп.';
    MemoRus.Text := cMsg;
    cMsg := UkrSumPropis(nSumma, 'w', nKopeek);
    cMsg := AnsiUpperCase(Copy(cMsg,1,1)) +
                              Copy(cMsg, 2, Length(cMsg)) + ' грн., ';
    if nKopeek <> 0 then
      cMsg := cMsg + IntToStr(nKopeek) + ' коп.'
    else
      cMsg := cMsg + '00 коп.';
    MemoUkr.Text := cMsg;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyDbg.DBEdit1Enter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormMyDbg.DBEdit1Exit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormMyDbg.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Width  := ReadInteger(SECTION, 'wW', 385);
    nSvSumma := ReadFloat(SECTION, 'nSvSumma', 0);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyDbg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wW', Width);
    if not cdsMyDbgMyFld.IsNull and (cdsMyDbgMyFld.AsFloat > 0) then
      WriteFloat(SECTION, 'nSvSumma', cdsMyDbgMyFld.AsFloat);
    Free;
  end;
end;

end.
