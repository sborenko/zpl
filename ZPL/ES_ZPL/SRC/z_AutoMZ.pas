unit z_AutoMZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, DBTables, Buttons;

type
  TFormAutoDmz = class(TForm)
    Panel1: TPanel;
    qryAmz: TQuery;
    dsrcAmz: TDataSource;
    qryAmzMYDATE: TDateTimeField;
    qryAmzDTBEGAUTO: TDateTimeField;
    qryAmzNOTES: TStringField;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    DBEdit2: TDBEdit;
    updAmz: TUpdateSQL;
    bBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure qryAmzAfterPost(DataSet: TDataSet);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryAmz;
  public
    { Public declarations }
  end;

function GetNewDtBegAuto(var dNewDtBegAuto : TDateTime) : boolean;

var
  FormAutoDmz: TFormAutoDmz;

implementation

uses A_Const, A_Lib, A_DM, Z_DM, Z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetNewDtBegAuto(var dNewDtBegAuto : TDateTime) : boolean;
begin
  Result := false;
  FormAutoDmz := TFormAutoDmz.Create(Application);
  with FormAutoDmz do begin
    OpenQryAmz;
    if ShowModal = mrOk then begin
      if qryAmz.State = dsEdit then
        qryAmz.Post;
      Result := true;
      dNewDtBegAuto := qryAmzDtBegAuto.AsDateTime;
    end;
    Free;
end;

end;
//------------------------------------------------------------------------------
procedure TFormAutoDmz.OpenQryAmz;
begin
  with qryAmz do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_BgDtAu ');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAutoDmz.qryAmzAfterPost(DataSet: TDataSet);
begin
  if qryAmz.UpdatesPending then
    Form_DM.DbMain.ApplyUpdates([qryAmz]);
end;
//------------------------------------------------------------------------------
procedure TFormAutoDmz.DBEdit1Enter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAutoDmz.DBEdit1Exit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
