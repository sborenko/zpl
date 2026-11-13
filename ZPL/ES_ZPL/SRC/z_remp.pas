unit z_remp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  DBCtrls;

type
  TFormRemPere = class(TForm)
    Panel1: TPanel;
    bBtnClose: TBitBtn;
    tblRem: TTable;
    dsrcRem: TDataSource;
    dbgrRem: TDBGrid;
    sBtnGo1: TSpeedButton;
    LabelCntRec: TLabel;
    tblRemTABN: TIntegerField;
    tblRemKDKATP: TSmallintField;
    tblRemNRPKT: TIntegerField;
    tblRemG0: TStringField;
    tblRemOKO_0: TSmallintField;
    tblRemNKO_0: TSmallintField;
    tblRemG1: TStringField;
    tblRemOKO: TSmallintField;
    tblRemNKO: TSmallintField;
    tblRemG2: TStringField;
    tblRemOKO2: TSmallintField;
    tblRemNKO2: TSmallintField;
    sBtnGo2: TSpeedButton;
    DBNavigator1: TDBNavigator;
    qryUpd: TQuery;
    procedure sBtnGo1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnGo2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


procedure shwRemP;

var
  FormRemPere: TFormRemPere;

implementation
                                           
uses a_Const, a_DM, z_Main;

{$R *.dfm}

// Запускалась одмн раз. Бодьше не нужна. 07-02-2019
//------------------------------------------------------------------------------
procedure shwRemP;
begin
  FormRemPere := TFormRemPere.Create(Application);
  with FormRemPere do begin
    with tblRem do begin
      Active := true;
      First;
      LabelCntRec.Caption := 'Записей: ' + intToStr(recordCount);
//      Show; //ShowModal;
//      Free;
    end;
    bIsFormRemPere := true;
    Show; //ShowModal;
  end;

end;
//------------------------------------------------------------------------------
procedure TFormRemPere.sBtnGo1Click(Sender: TObject);
var kdn , kdo: smallint;
begin
  with tblRem do begin
    First;
    While not EOF do begin
      kdn := 0;
      kdo := 0;
      If not tblRemnko.IsNull then kdn := kdn or 1;
      If not tblRemoko.IsNull then kdn := kdn or 2;

      If not tblRemoko_0.IsNull then kdo := kdo or 1;
      If not tblRemnko_0.IsNull then kdo := kdo or 2;

      if kdn = 1 then begin
        edit;
        tblRemoko2.Value := tblRemnko.Value;
        tblRemnko2.Value := tblRemnko.Value;
        post;
      end;
      if kdn = 2 then begin
        edit;
        tblRemoko2.Value := tblRemoko.Value;
        tblRemnko2.Value := tblRemoko.Value;
        post;
      end;
      if kdn = 3 then begin
        edit;
        tblRemoko2.Value := tblRemoko.Value;
        tblRemnko2.Value := tblRemnko.Value;
        post;
      end;
      if kdn = 0 then begin
        if (kdo = 2) or (kdo = 3) then begin
          edit;
          tblRemoko2.Value := tblRemnko_0.Value;
          tblRemnko2.Value := tblRemnko_0.Value;
          post;
        end;
        if (kdo = 1) then begin
          edit;
          tblRemoko2.Value := tblRemoko_0.Value;
          tblRemnko2.Value := tblRemOko_0.Value;
          post;
        end;
      end;
      next;
    end;
  end;

  sBtnGo1.enabled := false;
  sBtnGo2.enabled := true;

end;
//------------------------------------------------------------------------------
procedure TFormRemPere.sBtnGo2Click(Sender: TObject);
begin
  with qryUpd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Z_Pere Set OldKdOk = :nOko2, NewKdOk = :nNko2 ' +
            ' where TabN = :nTabN and NrPkt = :nNrPkt ')
  end;
  with tblRem do begin
    First;
    while not Eof do begin
      if (not tblRemOKO2.IsNull and not tblRemNKO2.IsNull) then begin
        qryUpd.ParamByName('nTabN').AsInteger := tblRemTabN.AsInteger;
        qryUpd.ParamByName('nNrPkt').AsInteger := tblRemNrPkt.AsInteger;
        qryUpd.ParamByName('nOko2').AsInteger := tblRemOko2.AsInteger;
        qryUpd.ParamByName('nNko2').AsInteger := tblRemNko2.AsInteger;
        qryUpd.ExecSQL;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRemPere.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
  bIsFormRemPere := false;
end;
//------------------------------------------------------------------------------
procedure TFormRemPere.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bIsFormRemPere := false;
end;

end.
