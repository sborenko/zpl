unit z_oldSpK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBTables, Grids, DBGrids, DB;

type
  String4 = string[4];
  TFormAddSpsOpk = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    qryOpk: TQuery;
    dsrcOpk: TDataSource;
    dbgrOpk: TDBGrid;
    qryZ: TQuery;
    updZ: TUpdateSQL;
    dsrcZ: TDataSource;
    dbgrZNdb: TDBGrid;
    sBtnGo: TSpeedButton;
    qryOpkUpi: TQuery;
    qryOVK: TQuery;
    qryKvd: TQuery;
    qryZNR: TIntegerField;
    qryZKDSPS: TSmallintField;
    qryZNCH: TStringField;
    qryZDTPROC: TDateTimeField;
    qryZTABN: TIntegerField;
    qryZKDOBJ: TSmallintField;
    qryZKDKATP: TSmallintField;
    qryZNOTES: TStringField;
    qryZOLDKDOBJ: TSmallintField;
    qryInSps: TQuery;
    qryOpkNR: TIntegerField;
    qryOpkNewTabN: TIntegerField;
    qryOpkDTPROC: TDateField;
    qryOpkOBJ: TSmallintField;
    qryOpkNCH: TStringField;
    qryOpkVED: TSmallintField;
    qryOpkBRIG: TSmallintField;
    qryOpkTabN: TFloatField;
    qryOpkFAMIO: TStringField;
    qryOpkREC: TFloatField;
    procedure sBtnGoClick(Sender: TObject);
  private
    { Private declarations }
    function OldObj2KdObj(nOldObj : integer) : integer;
    procedure GetOpkUpiInf(nNewTabn : integer; var nKdKatP : SmallInt);
    function MyInSpisok(nTabN : Integer; dDtProc : TDateTime) : boolean;
  public
    { Public declarations }
  end;

procedure AddSpsOpk;

var
  FormAddSpsOpk: TFormAddSpsOpk;

implementation

uses a_Const, a_DM, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddSpsOpk;
begin
  FormAddSpsOpk := TFormAddSpsOpk.Create(Application);
  with FormAddSpsOpk do begin
    qryOpk.Open;
    qryZ.Open;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormAddSpsOpk.OldObj2KdObj(nOldObj : integer) : integer;
begin
  Result := 0;
  with qryOVK do begin
    if not Active then Open;
    if Locate('Obj', nOldObj, []) then begin
      if not FieldByName('NewKdObj').IsNull then
        Result := FieldByName('NewKdObj').AsInteger
      else
        Result := 1000 + nOldObj;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormAddSpsOpk.MyInSpisok(nTabN : Integer; dDtProc : TDateTime) : boolean;
begin
  Result := false;
  with qryInSps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_Sps where DtProc = :dDtProc and TabN = :nTabn');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    if (RecordCount > 0) and not FieldByName('NR').IsNull then
      Result := true;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddSpsOpk.sBtnGoClick(Sender: TObject);
var nKdKatP : SmallInt; nTabN : Integer;  dDtProc : TDateTime;
begin
  with qryZ do begin
    if not Active then Open;
    First;
  end;
  with qryOpk do begin
    if not Active then Open;
    First;       // сортирована by NewTabN, DtProc, ZaMesGod, OldKdVidN
    Form_Dm.DbMain.StartTransaction;
    while not Eof do begin
      dDtProc := FieldByName('DtProc').AsDateTime;
      while (FieldByName('DtProc').AsDateTime = dDtProc) and not Eof do begin
        nTabN := FieldByName('NewTabN').AsInteger;
        if not MyInSpisok(nTabN, dDtProc) then begin
          qryZ.Append;
          qryZKDSPS.AsInteger := 1; // Несмотря на то, что ОПК
          qryZNCH.AsString := 'X';
          qryZDTPROC.AsString := FieldByName('DtProc').AsString;
          qryZTABN.AsInteger := nTabN;
          qryZKDOBJ.AsInteger := OldObj2KdObj(FieldByName('Obj').AsInteger);
          GetOpkUpiInf(nTabn, nKdKatP);
          qryZKDKATP.AsInteger := nKdKatP;
          qryZNOTES.AsString := 'FrOPK';
          qryZOLDKDOBJ.AsString := FieldByName('Obj').AsString;
          qryZ.Post;
        end;
        Next;
      end;
      qryZ.ApplyUpdates;
    end;
    Form_Dm.DbMain.Commit;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddSpsOpk.GetOpkUpiInf(nNewTabn: integer; var nKdKatP: SmallInt);
begin
  with qryOpkUpi do begin
    nKdKatP := 2; // не ППС - других сведений не добыть !!!
    if not Active then Open;
    if Locate('NewTabN', nNewTabN, []) then begin
      if qryOpkUpi.FieldByName('Rang').AsInteger = 77 then
        nKdKatP := 1
      else
        nKdKatP := 2;
    end;
  end;
end;

end.
