unit z_OpkLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormOpkLS = class(TForm)
    qryOpkLS: TQuery;
    dsrcOpkLS: TDataSource;
    dbgrOpkLS: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    qryLocate: TQuery;
    qryAdd: TQuery;
    qryOpkLSz_TabN: TIntegerField;
    qryOpkLSNewTabN: TIntegerField;
    qryOpkLSTabN: TFloatField;
    qryOpkLSFam: TStringField;
    qryOpkLSIma: TStringField;
    qryOpkLSOtch: TStringField;
    qryOpkLSLS: TStringField;
    qryOpkLSNR: TIntegerField;
    qryOpkLSTabn_1: TIntegerField;
    qryOpkLSDTBEG: TDateTimeField;
    qryOpkLSLICSCH: TStringField;
    qryOpkLSKDBNK: TSmallintField;
    qryOpkLSNOTES: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    function FindLS(nTabN : integer) : boolean;
    procedure AddLS(nTabN : integer; cLS : ShortString);
  public
    { Public declarations }
  end;

procedure AddOpkLS;

var
  FormOpkLS: TFormOpkLS;

implementation

uses a_Const, a_DM, z_DM, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddOpkLS;
begin
  FormOpkLS := TFormOpkLS.Create(Application);
  with FormOpkLS do begin
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOpkLS.SpeedButton1Click(Sender: TObject);
begin
  with qryLocate do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_BankiLS where TabN = :nTabN');
  end;
  with qryAdd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Insert into z_BankiLS (TabN, LicSch, KdBnk, Notes) values ' +
            ' (:nTabN, :cLS, 101, "OpkLS_2")');
  end;
  with qryOpkLS do begin
    if not Active then Open;
    First;
    while not Eof do begin
      if not FindLS(FieldByName('NewTabN').AsInteger) then
        AddLS(FieldByName('NewTabN').AsInteger,
                                          FieldByName('LS').AsString);
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormOpkLS.FindLS(nTabN : integer) : boolean;
begin
  with qryLocate do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Result := (RecordCount > 0) and not FieldByName('TabN').IsNull;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOpkLS.AddLS(nTabN : integer; cLS : ShortString);
begin
  with qryAdd do begin
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('cLS').AsString := cLS;
    ExecSQL;
  end;
end;

end.
