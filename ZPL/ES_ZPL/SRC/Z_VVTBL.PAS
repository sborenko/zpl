unit z_VvTbl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables;

type
  TFormVvTbl = class(TForm)
    dbgrTab: TDBGrid;
    qryTab: TQuery;
    qryTabNR: TIntegerField;
    qryTabDTPROC: TDateTimeField;
    qryTabTABN: TIntegerField;
    qryTabKDOBJ: TSmallintField;
    qryTabKDKATP: TSmallintField;
    qryTabDT_BEG: TDateTimeField;
    qryTabKDVIDN: TSmallintField;
    qryTabPDN: TSmallintField;
    qryTabCHAS: TFloatField;
    qryTabSUMMA: TFloatField;
    qryTabSPZ: TStringField;
    qryTabNOTES: TStringField;
    qryTabShVidN: TStringField;
    dsrcTab: TDataSource;
    updTab: TUpdateSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure VvodTabel(dDtProc : TDateTime; nTabN : integer);

var
  FormVvTbl: TFormVvTbl;

implementation

uses A_Const, Z_DM, Z_Main;

{$R *.dfm}

procedure VvodTabel(dDtProc : TDateTime; nTabN : integer);
begin

end;

end.
