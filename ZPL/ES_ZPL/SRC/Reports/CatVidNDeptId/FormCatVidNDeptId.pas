unit FormCatVidNDeptId;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DModCatVidNDeptId;

type
  TFrmCatVidNDeptId = class(TForm)
    DbgrReport: TDBGrid;
    PanelButtons: TPanel;
    Splitter: TSplitter;
    DbgrMisVidN: TDBGrid;
    BtnPrint: TBitBtn;
    LblYear: TLabel;
    procedure BtnPrintClick(Sender: TObject);
  private
    DataModule: TDmCatVidNDeptId;
  public
    class procedure Run(RptYear: Integer);
  end;

implementation

uses
  RptCatVidNDeptId;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmCatVidNDeptId.Run(RptYear: Integer);
begin
  with TFrmCatVidNDeptId.Create(nil) do begin
    DataModule := TDmCatVidNDeptId.Create(RptYear);

    LblYear.Caption := IntToStr(RptYear);
    ShowModal;

    DataModule.Free;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmCatVidNDeptId.BtnPrintClick(Sender: TObject);
begin
  with DataModule do
    TRptCatVidNDeptId.Run(GetRptYear, GetReportCds);
end;

end.
