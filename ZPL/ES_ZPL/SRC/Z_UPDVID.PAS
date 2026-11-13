unit z_UpdVid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables;

type
  TFormUpdVids = class(TForm)
    qryVids: TQuery;
    dsrcVids: TDataSource;
    dbgrVids: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    bBtnCancel: TBitBtn;
    SpeedButton3: TSpeedButton;
    Splitter1: TSplitter;
    dbgrRes: TDBGrid;
    qryRes: TQuery;
    dsrcRes: TDataSource;
    SpeedButton5: TSpeedButton;
    qryTmp: TQuery;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowFormUpdVids;

var
  FormUpdVids: TFormUpdVids;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowFormUpdVids;
begin
  FormUpdVids := TFormUpdVids.Create(Application);
  with FormUpdVids do begin
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpdVids.FormCreate(Sender: TObject);
begin
  qryVids.Open;
end;
//------------------------------------------------------------------------------
procedure TFormUpdVids.FormClose(Sender: TObject; var Action: TCloseAction);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormUpdVids.SpeedButton1Click(Sender: TObject);
begin
(*
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryVids.DatabaseName;
    SQL.Add('Update Z_Nadb Set KdVidN = :nNewKdVidN where KdVidN = :nOldKdVidN');
  end;
  with qryVids do begin
    if not Active then Open;
    First;
    while not Eof do begin
      qryTmp.ParamByName('nOldKdVidN').AsInteger :=
                                 FieldByName('OldKdVidN').AsInteger;
      qryTmp.ParamByName('nNewKdVidN').AsInteger :=
                                 FieldByName('KdVidN').AsInteger;
      qryTmp.ExecSQL;
      Next;
    end;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormUpdVids.SpeedButton2Click(Sender: TObject);
begin
(*
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryVids.DatabaseName;
    SQL.Add('Update Z_Otkl Set KdVidN = :nNewKdVidN where KdVidN = :nOldKdVidN');
  end;
  with qryVids do begin
    if not Active then Open;
    First;
    while not Eof do begin
      qryTmp.ParamByName('nOldKdVidN').AsInteger :=
                                 FieldByName('OldKdVidN').AsInteger;
      qryTmp.ParamByName('nNewKdVidN').AsInteger :=
                                 FieldByName('KdVidN').AsInteger;
      qryTmp.ExecSQL;
      Next;
    end;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormUpdVids.SpeedButton3Click(Sender: TObject);
begin
(*
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryVids.DatabaseName;
    SQL.Add('Update Z_NU Set KdVidN = :nNewKdVidN where KdVidN = :nOldKdVidN');
  end;
  with qryVids do begin
    if not Active then Open;
    First;
    while not Eof do begin
      qryTmp.ParamByName('nOldKdVidN').AsInteger :=
                                 FieldByName('OldKdVidN').AsInteger;
      qryTmp.ParamByName('nNewKdVidN').AsInteger :=
                                 FieldByName('KdVidN').AsInteger;
      qryTmp.ExecSQL;
      Next;
    end;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormUpdVids.SpeedButton5Click(Sender: TObject);
begin
(*
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryVids.DatabaseName;
    SQL.Add('Update Z_VBln Set KdVidN = :nNewKdVidN where KdVidN = :nOldKdVidN');
  end;
  with qryVids do begin
    if not Active then Open;
    First;
    while not Eof do begin
      qryTmp.ParamByName('nOldKdVidN').AsInteger :=
                                 FieldByName('OldKdVidN').AsInteger;
      qryTmp.ParamByName('nNewKdVidN').AsInteger :=
                                 FieldByName('KdVidN').AsInteger;
      qryTmp.ExecSQL;
      Next;
    end;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormUpdVids.SpeedButton4Click(Sender: TObject);
begin
(*
  // Нету больше zPKdVid2
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryVids.DatabaseName;
    SQL.Add('Update Z_KdVidN Set KdVidN = :nNewKdVidN ' +
            ' where OldKdVidN = :nOldKdVidN');
  end;
  with qryVids do begin
    if not Active then Open;
    First;
    while not Eof do begin
      qryTmp.ParamByName('nOldKdVidN').AsInteger :=
                                 FieldByName('OldKdVidN').AsInteger;
      qryTmp.ParamByName('nNewKdVidN').AsInteger :=
                                 FieldByName('KdVidN').AsInteger;
      qryTmp.ExecSQL;
      Next;
    end;
  end;
*)
end;

end.
