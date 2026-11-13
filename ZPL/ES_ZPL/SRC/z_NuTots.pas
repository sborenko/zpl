unit z_NuTots;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TForm2 = class(TForm)
    qryTotsNU: TQuery;
    qryTotsNUTABN: TIntegerField;
    qryTotsNUSMNACH: TFloatField;
    qryTotsNUSMUDRG: TFloatField;
    qryTotsNUMesRus: TStringField;
    qryTotsNUSmNaRuki: TFloatField;
    qryTotsNUDTPROC: TDateTimeField;
    dsrcTotsNU: TDataSource;
    dbgrTotsNU: TDBGrid;
    Panel1: TPanel;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    procedure qryTotsNUCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses A_Lib;

{$R *.dfm}

procedure TForm2.qryTotsNUCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qryTotsNUDtProc.AsDateTime, nY, nM, nD);
  qryTotsNUMesRus.AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' ã.';
  qryTotsNUSmNaRuki.AsFloat := qryTotsNUSmNach.AsFloat + qryTotsNUSmUdrg.AsFloat;
end;

end.
