unit z_OldPeK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBTables, Grids, DBGrids, DB;

type
  String4 = string[4];
  TFormAddPereOpk = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    qryOpk: TQuery;
    dsrcOpk: TDataSource;
    dbgrOpk: TDBGrid;
    qryZPere: TQuery;
    updZPere: TUpdateSQL;
    dsrcZPere: TDataSource;
    dbgrZNdb: TDBGrid;
    sBtnGo: TSpeedButton;
    qryOpkUpi: TQuery;
    qryOVK: TQuery;
    qryKvd: TQuery;
    qryZPereNR: TIntegerField;
    qryZPereKDSPS: TSmallintField;
    qryZPereTABN: TIntegerField;
    qryZPereDT_BEG: TDateTimeField;
    qryZPereKDOBJ: TSmallintField;
    qryZPereKDKATP: TSmallintField;
    qryZPerePRCWRKTIME: TFloatField;
    qryZPereSO: TSmallintField;
    qryZPereOKLTRF: TFloatField;
    qryZPereAVANS: TFloatField;
    qryZPereSP_AV: TStringField;
    qryZPereKDDOLGN: TSmallintField;
    qryZPereDOLGNOST: TStringField;
    qryZPereKDSPZ: TSmallintField;
    qryZPerePR_PENS: TSmallintField;
    qryZPereSOVM: TSmallintField;
    qryZPerePDNLG: TSmallintField;
    qryZPerePROCLG: TFloatField;
    qryZPereKOLMIN: TSmallintField;
    qryZPerePRFS: TSmallintField;
    qryZPereNR_PRIKAZA: TStringField;
    qryZPereDT_PRIKAZA: TDateTimeField;
    qryZPereNOTES: TStringField;
    qryZPereINV: TSmallintField;
    qryZPereRANG: TSmallintField;
    qryZPereRAZR: TSmallintField;
    qryZPereDT_END: TDateTimeField;
    qryZPereOLDKDOBJ: TSmallintField;
    qryZPerePRDEKR: TStringField;
    qryZPereCMBOKL: TStringField;
    qryZPereSPEC_NR: TIntegerField;
    procedure sBtnGoClick(Sender: TObject);
  private
    { Private declarations }
    function OldObj2KdObj(nOldObj : integer) : integer;
    procedure GetOpkUpiInf(nNewTabn : integer; var nKdKatP : SmallInt);
    function SZatr2KdSpZ(cSZatr : ShortString;
                                            nVidN, nObj : SmallInt) : SmallInt;
  public
    { Public declarations }
  end;

procedure AddPereOpk;

var
  FormAddPereOpk: TFormAddPereOpk;

implementation

uses a_Const, a_DM, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddPereOpk;
begin
  FormAddPereOpk := TFormAddPereOpk.Create(Application);
  with FormAddPereOpk do begin
    qryOpk.Open;
    qryZPere.Open;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormAddPereOpk.OldObj2KdObj(nOldObj : integer) : integer;
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
procedure TFormAddPereOpk.sBtnGoClick(Sender: TObject);
var nKdKatP : SmallInt; nTabN : Integer;
begin
  with qryZPere do begin
    if not Active then Open;
    First;
  end;
  with qryOpk do begin
    if not Active then Open;
    First;       // сортирована by NewTabN, DtProc, ZaMesGod, OldKdVidN
    Form_Dm.DbMain.StartTransaction;
    while not Eof do begin
      nTabN := FieldByName('NewTabN').AsInteger;
      GetOpkUpiInf(nTabN, nKdKatP);
      while (FieldByName('NewTabN').AsInteger = nTabN) and not Eof do begin
        qryZPere.Append;
        qryZPereKDSPS.AsInteger := 2;
        qryZPereTABN.AsInteger := nTabN;
        qryZPereKDKATP.AsInteger := nKdKatP;
        qryZPereDT_BEG.AsString := FieldByName('Dt_Beg').AsString;
        qryZPereKDOBJ.AsInteger := OldObj2KdObj(FieldByName('Obj').AsInteger);
        qryZPereSO.AsString := FieldByName('SO').AsString;
        qryZPereOKLTRF.AsString := FieldByName('OklTrf').AsString;
        qryZPereAVANS.AsString := FieldByName('Avans').AsString;
        if FieldByName('Avans').AsInteger > 0 then
          qryZPereSP_AV.AsString := '%';
        qryZPereDOLGNOST.AsString := FieldByName('Dolgnost').AsString;
        qryZPereKDSPZ.AsInteger := SZatr2KdSpZ(FieldByName('SZatr').AsString,
                                           0, FieldByName('Obj').AsInteger);
        qryZPerePR_PENS.AsString := FieldByName('Pr_Pens').AsString;
        qryZPereSOVM.AsString := FieldByName('Sovm').AsString;
        qryZPerePDNLG.AsString := FieldByName('PdNlg').AsString;
        qryZPerePROCLG.AsString := FieldByName('Lgota').AsString;
        qryZPereKOLMIN.AsString := FieldByName('KolMin').AsString;
        qryZPerePRFS.AsString := FieldByName('Prfs').AsString;
        qryZPereNR_PRIKAZA.AsString := FieldByName('Nr_Prikaza').AsString;
        qryZPereDT_PRIKAZA.AsString := FieldByName('Dt_Prikaza').AsString;
        qryZPereNOTES.AsString := 'FrOPK SZatr=' + FieldByName('SZatr').AsString;
        qryZPereINV.AsString := FieldByName('Invalid').AsString;
        qryZPereRANG.AsString := FieldByName('Rang').AsString;
        qryZPereRAZR.AsString := FieldByName('Razr').AsString;
        qryZPereDT_END.AsString := FieldByName('Dt_End').AsString;
        qryZPereOLDKDOBJ.AsString := FieldByName('Obj').AsString;
        qryZPere.Post;
        Next;
      end;
      qryZPere.ApplyUpdates;
    end;
    Form_Dm.DbMain.Commit;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPereOpk.GetOpkUpiInf(nNewTabn: integer; var nKdKatP: SmallInt);
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
//------------------------------------------------------------------------------
function TFormAddPereOpk.SZatr2KdSpZ(cSZatr : ShortString;
                                            nVidN, nObj : SmallInt) : SmallInt;
begin
  cSZatr := Trim(cSZatr);
  if (nObj = 901) or (((nVidN >= 97) and (nVidN <= 102)) or (nVidN = 185)) then
    Result := 1385
  else if cSZatr = '211-03' then Result := 1214
  else if cSZatr = '211-05' then Result := 1216
  else if cSZatr = '211-06' then Result := 1217
  else if cSZatr = '211-07' then Result := 1218
  else if cSZatr = '211-08' then Result := 1219
  else if cSZatr = '211-09' then Result := 1220
  else if cSZatr = '211-11' then Result := 1358
  else if cSZatr = '211-12' then Result := 1359
  else if cSZatr = '211-13' then Result := 1360
  else if cSZatr = '211-14' then Result := 1221
  else if cSZatr = '211-15' then Result := 1222
  else if cSZatr = '211-25' then Result := 1232
  else if cSZatr = '211-73' then Result := 1272
  else if cSZatr = '211-9'  then Result := 1220
  else if cSZatr = '801'    then Result := 1209
  else if cSZatr = '801-0'  then Result := 1209
  else if cSZatr = '801-СГ' then Result := 1388
  else if cSZatr = '811-03' then Result := 1214
  else if cSZatr = '811-04' then Result := 1215
  else if cSZatr = '811-05' then Result := 1216
  else if cSZatr = '811-06' then Result := 1217
  else if cSZatr = '811-07' then Result := 1218
  else if cSZatr = '811-08' then Result := 1219
  else if cSZatr = '811-09' then Result := 1220
  else if cSZatr = '811-13' then Result := 1360
  else if cSZatr = '811-25' then Result := 1232
  else if cSZatr = '811-44' then Result := 1248
  else if cSZatr = '811-5'  then Result := 1216
  else if cSZatr = '811-59' then Result := 1259
  else if cSZatr = '811-6'  then Result := 1217
  else if cSZatr = '811-70' then Result := 1269
  else if cSZatr = '811-71' then Result := 1270
  else if cSZatr = '811-72' then Result := 1271
  else if cSZatr = '811-74' then Result := 1387
  else if cSZatr = '811-75' then Result := 1273
  else if cSZatr = '811-78' then Result := 1362
  else if cSZatr = '811-CГ' then Result := 1365
  else if cSZatr = '811-к'  then Result := 1365
  else if cSZatr = '811-сг' then Result := 1365
  else if cSZatr = '811-СГ' then Result := 1365
  else if cSZatr = '811/6'  then Result := 1217
  else Result := 1331;
end;

end.
