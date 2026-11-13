unit FormOznDoh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TFrmOznDoh = class(TForm)
    PanelBottom: TPanel;
    BtnSelect: TBitBtn;
    BtnExit: TBitBtn;
    DbgrOznDoh: TDBGrid;
    QryOznDoh: TQuery;
    UpdOznDoh: TUpdateSQL;
    DsrcOznDoh: TDataSource;
    QryOznDohOZN: TIntegerField;
    QryOznDohNOTES: TStringField;
    QryPeek: TQuery;
    PopMenu: TPopupMenu;
    NDelete: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DsrcOznDohDataChange(Sender: TObject; Field: TField);
    procedure QryOznDohOZNValidate(Sender: TField);
    procedure QryOznDohAfterPost(DataSet: TDataSet);
    procedure NDeleteClick(Sender: TObject);
    procedure DbgrOznDohDblClick(Sender: TObject);
  private
    procedure OpenQryOznDoh;
  public
    class function Run(var OznDoh: Integer): Boolean;
  end;

var
  FrmOznDoh: TFrmOznDoh;

implementation

uses
  QryLib, SalaryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFrmOznDoh.Run(var OznDoh: Integer): Boolean;
begin
  with TFrmOznDoh.Create(nil) do begin
    Result := ShowModal = mrOk;

    if Result then begin
      OznDoh := QryOznDoh.FieldByName('OznDoh').AsInteger;
    end;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmOznDoh.FormCreate(Sender: TObject);
begin
  OpenQryOznDoh;
end;

//------------------------------------------------------------------------------
procedure TFrmOznDoh.OpenQryOznDoh;
begin
  QryUtils.InitQuery(QryOznDoh);

  with QryOznDoh do begin
    SQL.Text :=
      'select * ' +
      'from z_OznDoh ' +
      'order by OznDoh';

    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmOznDoh.DsrcOznDohDataChange(Sender: TObject; Field: TField);
begin
  BtnSelect.Enabled := QryOznDoh.RecordCount > 0;
end;

//------------------------------------------------------------------------------
procedure TFrmOznDoh.QryOznDohOZNValidate(Sender: TField);
begin
  if SalaryUtils.PeekOznDoh(QryPeek, Sender.AsInteger) then
    raise Exception.Create(
      'ќзнака дохода ' + Sender.AsString + ' уже имеетс€ в справочнике.');
end;

//------------------------------------------------------------------------------
// ¬ базу пишем сразу, чтобы можно было при вводе следующей записи сделать
// Validate
//------------------------------------------------------------------------------
procedure TFrmOznDoh.QryOznDohAfterPost(DataSet: TDataSet);
begin
    QryOznDoh.Database.ApplyUpdates([QryOznDoh]);
end;

//------------------------------------------------------------------------------
procedure TFrmOznDoh.NDeleteClick(Sender: TObject);
begin
  QryOznDoh.Delete;
  QryOznDoh.Database.ApplyUpdates([QryOznDoh]);
end;

//------------------------------------------------------------------------------
procedure TFrmOznDoh.DbgrOznDohDblClick(Sender: TObject);
begin
  Close;
  ModalResult := mrOk;
end;

end.
