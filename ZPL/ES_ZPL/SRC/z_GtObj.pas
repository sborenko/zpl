unit z_GtObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient,
  DBTables;

type
  TFormGetObj = class(TForm)
    cdsTmp: TClientDataSet;
    cdsTmpKdObj: TSmallintField;
    Label1: TLabel;
    dbeKdObj: TDBEdit;
    dsrcTmp: TDataSource;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryTmp: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeKdObjEnter(Sender: TObject);
    procedure dbeKdObjExit(Sender: TObject);
  private
    { Private declarations }
    nSvKdObj : SmallInt;
    d_DtPrc : TDateTime;
  public
    { Public declarations }
  end;

function Get_KdObj(dDtPrc : TDateTime; var nKdObj : SmallInt) : boolean;

const SECTION = 'z_GtObj';

var
  FormGetObj: TFormGetObj;

implementation

uses a_Const, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function Get_KdObj(dDtPrc : TDateTime; var nKdObj : SmallInt) : boolean;
begin
  Result := false;
  FormGetObj := TFormGetObj.Create(Application);
  with FormGetObj do begin
    d_DtPrc := dDtPrc;
    Caption := '¬ыбор подразделени€';
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Append;
      if nSvKdObj > 0 then
        FieldByName('KdObj').AsInteger := nSvKdObj
      else
        FieldByName('KdObj').AsString := '';
    end;
    if (ShowModal = mrOk) and
             (cdsTmp.FieldByName('KdObj').AsInteger > 0) then begin
      Result := true;
      nKdObj := cdsTmp.FieldByName('KdObj').AsInteger;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetObj.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    nSvKdObj := ReadInteger(SECTION, 'nSvKdObj', 0);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetObj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if cdsTmp.Active and (cdsTmp.FieldByName('KdObj').AsInteger > 0) then
      WriteInteger(SECTION, 'nSvKdObj', cdsTmp.FieldByName('KdObj').AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetObj.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var nY, nM, nD : word;
begin
  bBtnOk.SetFocus; // чтобы выйти из dbeKdObj
  if (ModalResult = mrOk) then begin
    if (cdsTmp.FieldByName('KdObj').IsNull) or
             (cdsTmp.FieldByName('KdObj').AsInteger <= 0) then begin
      ModalResult := mrNone;
      ShowMessage('¬ведите корректный код или откажитесь');
      dbeKdObj.SetFocus; end
    else with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
(*
      // Ёто остаетс€ на потом - когда в список
      // будут выбиратьс€ только непустые подразделени€
      SQL.Add('Select First 1 KdObj from z_Sps ' +
              ' where DtProc = :d_DtPrc and KdObj = :nKdObj');
      ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
      ParamByName('nKdObj').AsInteger := cdsTmp.FieldByName('KdObj').AsInteger;
      Open;
*)
      SQL.Add('Select * from z_KdObj where KdObj = :nKdObj');
      ParamByName('nKdObj').AsInteger := cdsTmp.FieldByName('KdObj').AsInteger;
      Open;
      if (RecordCount = 0) or FieldByName('KdObj').IsNull then begin
        ModalResult := mrNone;
        DecodeDate(d_DtPrc, nY, nM, nD);
        // ShowMessage('Ќет в списке на ' + MesRus(nM) + ' ' + IntToStr(nY) +
        //             ' г. подразделени€ с кодом ' +
        //             IntToStr(cdsTmp.FieldByName('KdObj').AsInteger));
        ShowMessage('Ќет в справочнике "ѕодразделени€" ' +
                    'подразделени€ с кодом ' +
                    IntToStr(cdsTmp.FieldByName('KdObj').AsInteger));
        dbeKdObj.SetFocus;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetObj.dbeKdObjEnter(Sender: TObject);
begin
 (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGetObj.dbeKdObjExit(Sender: TObject);
begin
 (Sender as TDBEdit).Color := clWindow;
end;

end.
