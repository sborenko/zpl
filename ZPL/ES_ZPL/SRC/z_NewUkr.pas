unit z_NewUkr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, DB, DBTables, StdCtrls, ExtCtrls;

type
  TFormMyNewUkr = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    qryUpi: TQuery;
    dsrcUpi: TDataSource;
    dbgrUpi: TDBGrid;
    SpeedButton1: TSpeedButton;
    qryTmp: TQuery;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryUpi;
  public
    { Public declarations }
  end;

procedure ChangeUpiFIO;

var
  FormMyNewUkr: TFormMyNewUkr;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ChangeUpiFIO;
begin
  FormMyNewUkr := TFormMyNewUkr.Create(Application);
  with FormMyNewUkr do begin
    OpenQryUpi;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyNewUkr.OpenQryUpi;
begin
  with qryUpi do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyNewUkr.SpeedButton1Click(Sender: TObject);
var cFam, cIma, cOtch : ShortString;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Z_UPI Set Fam = :cFam, Ima = :cIma, Otch = :cOtch ' +
            ' where TabN = :nTabN');
    Prepare;
  end;
  with qryUpi do begin
    if not Active then Open;
    First;
    while not Eof do begin
      cFam := MyNewUkr(FieldByName('Fam').AsString);
      cIma := MyNewUkr(FieldByName('Ima').AsString);
      cOtch := MyNewUkr(FieldByName('Otch').AsString);
      qryTmp.ParamByName('cFam').AsString := cFam;
      qryTmp.ParamByName('cIma').AsString := cIma;
      qryTmp.ParamByName('cOtch').AsString := cOtch;
      qryTmp.ParamByName('nTabN').AsInteger := FieldByName('TabN').AsInteger;
      qryTmp.ExecSQL;
      Next;
    end;
  end;
  if qryTmp.Prepared then
    qryTmp.UnPrepare;
end;

end.
