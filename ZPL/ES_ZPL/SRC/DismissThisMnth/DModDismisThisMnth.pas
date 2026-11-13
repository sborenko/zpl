unit DModDismisThisMnth;

interface

uses
  SysUtils, Classes, DB, DBTables, IniDismisThisMnth, DBClient;

type
  TFldMapItem = record
    FldName,
    ColName,
    Strict: ShortString;
  end;
  TFldMap = array of TFldMapItem;

  TFldMapEnumProc = procedure(FldMapItem: TFldMapItem) of object;

  TDmDismisThisMnth = class(TDataModule)
    QryDismissed: TQuery;
    CdsDismissed: TClientDataSet;
    DsrcDismised: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FldMap: TFldMap;

    procedure InitFldMap;
    procedure AddFldMapItem(FldName, ColName, Strict: ShortString);

    procedure OpenQry;
    procedure PrepareCds;
    procedure UpdateCdsIndx;
  public
    procedure SelectFldSet(FldSetType: TFldSetType; Name: ShortString);
    procedure UpdateSelFlds(FldSetType: TFldSetType; FldNames: String);

    function MapItemName(
      ItemName: ShortString; Forward: Boolean = true): ShortString;
    function MapFldNameToStrict(FldName: ShortString): ShortString;

    function FldIsInvisible(FldName: ShortString): Boolean;

    function GetDismisDataSet: TDataSet;
    procedure EnumFieldMap(EnumProc: TFldMapEnumProc);
  end;

var
  DmDismThisMnth: TDmDismisThisMnth;

implementation

uses
  IniFiles, a_Const, CdsLib, DateLib, DsLib, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.DataModuleCreate(Sender: TObject);
begin
  // Объект для работы с Ini-file'ом.
  IniDismThisMnth := TIniDismisThisMnth.Create;
  // Отображение названий полей в заголовки.
  InitFldMap;
  // Открываем запрос.
  OpenQry;
  PrepareCds;
end;

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.DataModuleDestroy(Sender: TObject);
begin
  IniDismThisMnth.Free;
end;

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.OpenQry;
var
  Stmt, Order: String;
  Buffer: TStringList;
  I: Integer;
begin
  Stmt :=
    'select u.TabN, u.Fam, u.Ima, u.Otch, pu.*, p.*, ' +
      'o.ShObj, o.NmObj, t.KdTemu, t.NmSch, k.KdKatP, k.ShKatP, k.NmKatP ' +
    'from z_PrmUv pu ' +
      'left join z_Pere p on p.TabN = pu.TabN ' +
      'left join z_Upi u on u.TabN = pu.TabN ' +
      'left join z_KdObj o on o.KdObj = p.KdObj ' +
      'left join Kd_Temu t on t.KdTemu = p.KdTemu ' +
      'left join z_KatPers k on k.KdKatP = p.KdKatP ' +
    'where pu.Dt_Uvoln >= :MnthBeg and pu.Dt_Uvoln <= :MnthEnd ' +
      'and p.Dt_Beg = (' +
        'select Max(Dt_Beg) ' +
        'from z_Pere ' +
        'where TabN = pu.TabN and Dt_Beg <= pu.Dt_Uvoln)';

  Order := IniDismThisMnth.GetCurSortFlds;
  Buffer := TStringList.Create;
  Buffer.Delimiter := ';';
  Buffer.DelimitedText := Order;
  for I := 0 to Buffer.Count - 1 do
    Buffer[I] := MapFldNameToStrict(Buffer[I]);
  Buffer.Delimiter := ',';
  Order := Buffer.DelimitedText;

  if Order <> '' then
    Stmt := Stmt + ' ' + 'order by ' + Order;

  QryUtils.InitQuery(QryDismissed);

  with QryDismissed do begin
    SQL.Add(Stmt);
    ParamByName('MnthBeg').AsDateTime := dDtProc;
    ParamByName('MnthEnd').AsDateTime := DateUtils.EndOfMonth(dDtProc);
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.PrepareCds;
begin
  CdsUtils.CreateCdsA(QryDismissed, CdsDismissed);
  DsUtils.CopyRowset(QryDismissed, CdsDismissed);

  with CdsDismissed do begin
    IndexDefs.Add('Primary', IniDismThisMnth.GetCurSortFlds, [ixPrimary]);
    IndexName := 'Primary';
  end;

  UpdateCdsIndx;
end;

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.UpdateCdsIndx;
begin
  with CdsDismissed do begin
    Close;
    IndexDefs[0].Fields := IniDismThisMnth.GetCurSortFlds;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.SelectFldSet(
  FldSetType: TFldSetType;
  Name: ShortString);
begin
  IniDismThisMnth.SelectFldSet(FldSetType, Name);

  if FldSetType = FST_SORT then
    UpdateCdsIndx;
end;

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.UpdateSelFlds(
  FldSetType: TFldSetType;
  FldNames: String);
begin
  IniDismThisMnth.UpdateSelFlds(FldSetType, FldNames);

  if FldSetType = FST_SORT then
    UpdateCdsIndx;
end;

//------------------------------------------------------------------------------
function TDmDismisThisMnth.MapItemName(
  ItemName: ShortString;
  Forward: Boolean = true): ShortString;
var
  I: Integer;
begin
  Result := '';

  for I := 0 to Length(FldMap) - 1 do begin
    if Forward and (FldMap[I].FldName = ItemName) then begin
      Result := FldMap[I].ColName;
      exit;
    end;

    if not Forward and (FldMap[I].ColName = ItemName) then begin
      Result := FldMap[I].FldName;
      exit;
    end;
  end;

  if Result = '' then
    Result := ItemName;
end;

//------------------------------------------------------------------------------
function TDmDismisThisMnth.MapFldNameToStrict(FldName: ShortString): ShortString;
var
  I: Integer;
begin
  Result := '';

  for I := 0 to Length(FldMap) - 1 do
    if FldMap[I].FldName = FldName then begin
      Result := FldMap[I].Strict;
      exit;
    end;

  if Result = '' then
    Result := FldName;
end;

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.InitFldMap;
begin
  SetLength(FldMap, 0);

  AddFldMapItem('TABN', 'Таб.№', 'U.TABN');
  AddFldMapItem('FAM', 'Фамилия', 'U.FAM');
  AddFldMapItem('IMA', 'Имя', 'U.IMA');
  AddFldMapItem('OTCH', 'Отчество', 'U.OTCH');
  AddFldMapItem('DT_PRIEM', 'ДтПриём', 'PU.DT_PRIEM');
  AddFldMapItem('DT_UVOLN', 'ДтУволн', 'PU.DT_UVOLN');
  AddFldMapItem('NR_PRIKAZA', 'НрПриказ.1', 'PU.NR_PRIKAZA');
  AddFldMapItem('DT_PRIKAZA', 'ДтПриказ.1', 'PU.DT_PRIKAZA');
  AddFldMapItem('KDPIDZV', 'ОснУволн', 'PU.KDPIDZV');
  AddFldMapItem('NR_PRUVOLN', 'НрПрУвол', 'PU.NR_PRUVOLN');
  AddFldMapItem('DT_PRUVOLN', 'ДтПрУвол', 'PU.DT_PRUVOLN');
  AddFldMapItem('NOTES', 'Прим.1', 'PU.NOTES');
  AddFldMapItem('DT_BEG', 'ДтПерем', 'P.DT_BEG');
  AddFldMapItem('NR_PRIKAZA_1', 'НрПриказ.2', 'P.NR_PRIKAZA');
  AddFldMapItem('DT_PRIKAZA_1', 'ДтПриказ.2', 'P.DT_PRIKAZA');
  AddFldMapItem('KDOBJ', 'КдПодр.', 'P.KDOBJ');
  AddFldMapItem('SHOBJ', 'Подр.', 'O.SHOBJ');
  AddFldMapItem('NMOBJ', 'НмПодр', 'o.NMOBJ');
  AddFldMapItem('KDDOLGN', 'КдДолжн', 'P.KDDOLGN');
  AddFldMapItem('DOLGNOST', 'Должность', 'P.DOLGNOST');
  AddFldMapItem('SOVM', 'Совм', 'P.SOVM');
  AddFldMapItem('KDKATP', 'КдКатП', 'K.KDKATP');
  AddFldMapItem('SHKATP', 'КатПерс', 'K.SHKATP');
  AddFldMapItem('KDKATP', 'НмКатП', 'K.NMKATP');
  AddFldMapItem('KDTEMU', 'КдТемы', 'T.KDTEMU');
  AddFldMapItem('NMSCH', 'Тема', 'T.NMSCH');
  AddFldMapItem('KDSPS_1', 'Спис', 'P.KDSPS');
  AddFldMapItem('KDSPZ', 'Счёт', 'P.KDSPZ');
  AddFldMapItem('NOTES_1', 'Прим.2', 'P.NOTES');
//  AddFldMapItem('KDOK', 'КдДол', d.KdOk
//  AddFldMapItem('NAMEOK', 'Должность', 'd.NameOk');
end;

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.AddFldMapItem(
  FldName, ColName, Strict: ShortString);
var
  Len: Integer;
begin
  Len := Length(FldMap);
  SetLength(FldMap, Len + 1);

  FldMap[Len].FldName := FldName;
  FldMap[Len].ColName := ColName;
  FldMap[Len].Strict := Strict;
end;

//------------------------------------------------------------------------------
function TDmDismisThisMnth.FldIsInvisible(FldName: ShortString): Boolean;
begin
  Result := (FldName = 'NR') or (FldName = 'NR_1')
    or (FldName = 'BM') or (FldName = 'DTBM')
    or (FldName = 'TABN_1') or (FldName = 'TABN_2')
    or (FldName = 'KDSPS')
    or (FldName = 'NPD') or (FldName = 'PRCWRKTIME') or (FldName = 'SO')
    or (FldName = 'OKLTRF') or (FldName = 'AVANS') or (FldName = 'SP_AV')
    or (FldName = 'CODE') or (FldName = 'Z_KPP') or (FldName = 'PR_PENS')
    or (FldName = 'PDNLG') or (FldName = 'PROCLG') or (FldName = 'KOLMIN')
    or (FldName = 'PRFS') or (FldName = 'INV') or (FldName = 'RANG')
    or (FldName = 'RAZR') or (FldName = 'DT_END') or (FldName = 'OLDKDOBJ')
    or (FldName = 'PRDEKR') or (FldName = 'CMBOKL') or (FldName = 'SPEC_NR')
    or (FldName = 'NRPKT') or (FldName = 'DTVPKT') or (FldName = 'NOINDX')
    or (FldName = 'OLDKDOK') or (FldName = 'NEWKDOK') or (FldName = 'IS_PERE')
//    or (FldName = 'KDOK') or (FldName = 'NAMEOK');
end;

//------------------------------------------------------------------------------
function TDmDismisThisMnth.GetDismisDataSet: TDataSet;
begin
  Result := CdsDismissed;
end;

//------------------------------------------------------------------------------
procedure TDmDismisThisMnth.EnumFieldMap(EnumProc: TFldMapEnumProc);
var
  I: Integer;
begin
  for I := 0 to Length(FldMap) - 1 do
    EnumProc(FldMap[I]);
end;

end.
