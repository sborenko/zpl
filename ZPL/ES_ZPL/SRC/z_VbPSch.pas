unit z_VbPSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DB, Grids, DBGrids, DBTables;

type
  TFormVbPSch = class(TForm)
    qryPSch: TQuery;
    dsrcPSch: TDataSource;
    dbgrPSch: TDBGrid;
    qryPSchPSCH: TStringField;
    qryPSchCNT: TIntegerField;
    qryPSchSMM: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure OpenQryPSch(dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

function GetPSch(dDtPrc : TDateTime; var cPSch : ShortString) : boolean;

const SECTION = 'z_vbPSch';

var
  FormVbPSch: TFormVbPSch;

implementation

uses a_Const, a_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetPSch(dDtPrc : TDateTime; var cPSch : ShortString) : boolean;
begin
  Result := false;
  FormVbPSch := TFormVbPSch.Create(Application);
  with FormVbPSch do begin
    Caption := 'Выбор счета';
    OpenQryPSch(dDtPrc);
    if cPSch > '' then
      qryPSch.Locate('PSch', cPSch, []);
    if ShowModal = mrOk then begin
      cPSch := qryPSchPSch.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbPSch.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 175);
    Width  := ReadInteger(SECTION, 'wW', 245);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbPSch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbPSch.OpenQryPSch(dDtPrc: TDateTime);
begin
  with qryPSch do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSCH, count(NR) as CNT, Sum(Summa) as SMM ' +
            ' from ViNu_Main where dtProc = :dDtPrc and VidN < "8000" ' +
            ' group by PSCH');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
end;

end.
