unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables;

type
  TFrmMain = class(TForm)
    Database: TDatabase;
    Query: TQuery;
    UpdateSQL: TUpdateSQL;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    BtnFix: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnFixClick(Sender: TObject);
  private
    procedure OpenQuery;
    procedure FixEsvEnt(TabN: Integer; Sum1, Sum2: Double;
      Accnt1, Accnt2: ShortString);

    function GetAccntId(AccntSh: ShortString): Integer;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  DsLib, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
// Разбрасываем ЕСВ предприятия со сверхпорогов на разные счета  
//------------------------------------------------------------------------------
procedure TFrmMain.FormCreate(Sender: TObject);
begin
  OpenQuery;
end;

//------------------------------------------------------------------------------
procedure TFrmMain.OpenQuery;
begin
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Text :=
      'select * ' +
      'from z_NU ' +
      'where Tabn in (10791, 26808) ' +
        'and VidN = "8607" ' +
        'and DtProc = "6/1/2026"';
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmMain.BtnFixClick(Sender: TObject);
begin
  BtnFix.Enabled := false;

  FixEsvEnt(26808, 77060.00, 58655.39, '8511/07-2sm', '8011/б');
  FixEsvEnt(10791, 27060.00, 11971.50, '8511/07-2sm', '8011/02-2');

  with Query.Database do
    ApplyUpdates([Query]);
end;

//------------------------------------------------------------------------------
// Разделить ЕСВ предпр. на несколько счетов
//------------------------------------------------------------------------------
procedure TFrmMain.FixEsvEnt(
  TabN: Integer;
  Sum1, Sum2: Double;
  Accnt1, Accnt2: ShortString
);
begin
  with Query do begin
    Locate('TabN', TabN, []);
    
    Edit;
    FieldByName('Summa').AsFloat := Sum1;
    FieldByName('KdSPZ').AsInteger := GetAccntId(Accnt1);
    Post;

    DsUtils.CloneRec(Query);
    // FieldByName('Nr').AsInteger := QryUtils.GenerateId('Nr_ZNU');
    FieldByName('Summa').AsFloat := Sum2;
    FieldByName('KdSPZ').AsInteger := GetAccntId(Accnt2);
    Post;
  end;
end;

//------------------------------------------------------------------------------
function TFrmMain.GetAccntId(AccntSh: ShortString): Integer;
begin
  with QryUtils.PeekSBU(AccntSh) do begin
    Result := FieldByName('KdSch').AsInteger;
    Free;
  end;
end;

end.
