unit IniDismisThisMnth;

// Формат записи Ini-file'а:
//
// Для отображаемых полей, например:
//  DisplayCount = 2
// Т.о., имеем две группы записей
//  Display1Name = 'Display' + <Имя данное пользователем>
//  Display + <Имя данное пользователем> = <Список полей через точку с запятой>
//  Display2Name = 'Display' + <Имя данное пользователем>
//  Display + <Имя данное пользователем> = <Список полей через точку с запятой>
// Кроме того, имеем запись
//  Display + 'Default = '<Имя данное пользователем>
// для последним выбранного набора полей.
//
// И точно так-же для сортировок, например:
//  SortCount = 1
// Т.о., имеем одну группу записей
//  Sort1Name = 'Sort' + <Имя данное пользователем>
//  Sort + <Имя данное пользователем> = <Список полей через точку с запятой>
// Аналогично, имеем запись
//  Sort + 'Default = <Имя данное пользователем>
// для последним выбранного набора полей.

interface

uses
  Classes, IniFiles;

type
  TFldSetType = (FST_DISPLAY, FST_SORT);

  TFldSetItem = record
    Name,
    Caption: ShortString;
    Fields: TStringList;
  end;
  TFldSetArr = array of TFldSetItem;

  TFldSetsEnumProc = procedure(
    Item: TFldSetItem; FldSetType: TFldSetType) of object;

  TFldSets = class
  private
    FldSets: TFldSetArr;
    CurSetName: ShortString;
    LastId: Integer;

    SetType: TFldSetType;

    procedure AddFldSet(Name, Caption: ShortString; FldNames: String); overload;
    function AddFldSet(
      Caption: ShortString; FldNames: String): Integer; overload;

    function IndexOf(Value: ShortString; Name: Boolean): Integer;

    procedure EmptyIni(IniFile: TIniFile);

    function Prefix: ShortString;
  public
    constructor Create(SetType: TFldSetType);
    destructor Destroy; override;

    procedure Load;
    procedure Save;

    procedure AddFldSet(Id: Integer; Caption: ShortString; FldNames: String); overload;
    procedure EnumFldSets(EnumProc: TFldSetsEnumProc);

    procedure SelectFldSet(Id: Integer); overload;
    procedure SelectFldSet(Name: ShortString; Save: Boolean); overload;

    function GetDefaultFldSet: TFldSetItem;
    function GetSelectedFldSet: TFldSetItem;

    procedure SaveFldSet(Caption: ShortString);
    procedure DeleteFldSet(Name: ShortString);

    procedure UpdateSelFlds(FldNames: String);
    function FieldIsSelected(FldName: ShortString): Boolean;

    function Count: Integer;
  end;

  TIniDismisThisMnth = class
  private
    DisplaySets,
    SortSets: TFldSets;

    function FldSetsByType(FldSetType: TFldSetType): TFldSets;
    function FldSetTypeByName(Name: ShortString): TFldSetType;

  public
    constructor Create;
    destructor Destroy; override;

    procedure EnumFldSets(FldSetType: TFldSetType; EnumProc: TFldSetsEnumProc);

    function GetCurSortFlds: String;

    procedure SelectFldSet(FldSetType: TFldSetType; Name: ShortString);
    procedure DeleteFldSet(Name: ShortString);

    function GetSelectedFldSet(FldSetType: TFldSetType): TFldSetItem;
    function GetDefaultFldSet(FldSetType: TFldSetType): TFldSetItem;

    procedure SaveFldSetAs(
      FldSetType: TFldSetType; Caption: ShortString);

    procedure UpdateSelFlds(FldSetType: TFldSetType; FldNames: String);
    function FieldIsSelected(FldSetType: TFldSetType;
      FldName: ShortString): Boolean;
  end;

var
  IniDismThisMnth: TIniDismisThisMnth;

implementation

uses
  SysUtils, a_Const;

const
  SECTION = 'DismisThisMnth';
  DEFINDX = 0;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
constructor TIniDismisThisMnth.Create;
begin
  DisplaySets := TFldSets.Create(FST_DISPLAY);
  with DisplaySets do
    if Count = 1 then begin
      AddFldSet(1, 'Таб.№, Фам. Подр. Должн.',
        'TABN;FAM;IMA;OTCH;SHOBJ;DOLGNOST');
      SelectFldSet(1);
      LastId := 1;
    end;

  SortSets := TFldSets.Create(FST_SORT);
  with SortSets do
    if Count = 1 then begin
      AddFldSet(1, 'По Таб.№, Подр.', 'TABN;KDOBJ');
      AddFldSet(2, 'По Фам., Подр.', 'FAM;KDOBJ');
      SelectFldSet(1);
      LastId := 2;
    end;
end;

//------------------------------------------------------------------------------
destructor TIniDismisThisMnth.Destroy;
begin
  DisplaySets.Free;
  SortSets.Free;
end;

//------------------------------------------------------------------------------
function TIniDismisThisMnth.GetCurSortFlds: String;
begin
  Result := SortSets.GetDefaultFldSet.Fields.DelimitedText;
end;

//------------------------------------------------------------------------------
procedure TIniDismisThisMnth.EnumFldSets(
  FldSetType: TFldSetType;
  EnumProc: TFldSetsEnumProc);
begin
  FldSetsByType(FldSetType).EnumFldSets(EnumProc);
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TIniDismisThisMnth.SelectFldSet(
  FldSetType: TFldSetType;
  Name: ShortString);
begin
  FldSetsByType(FldSetType).SelectFldSet(Name, true);
end;
//..............................................................................
function TIniDismisThisMnth.GetSelectedFldSet(
  FldSetType: TFldSetType): TFldSetItem;
begin
  Result := FldSetsByType(FldSetType).GetSelectedFldSet;
end;
//..............................................................................
function TIniDismisThisMnth.GetDefaultFldSet(
  FldSetType: TFldSetType): TFldSetItem;
begin
  Result := FldSetsByType(FldSetType).GetDefaultFldSet;
end;

//..............................................................................
procedure TIniDismisThisMnth.SaveFldSetAs(
  FldSetType: TFldSetType;
  Caption: ShortString);
begin
  FldSetsByType(FldSetType).SaveFldSet(Caption);
end;
//..............................................................................
procedure TIniDismisThisMnth.DeleteFldSet(Name: ShortString);
begin
  FldSetsByType(FldSetTypeByName(Name)).DeleteFldSet(Name);
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TIniDismisThisMnth.FldSetsByType(FldSetType: TFldSetType): TFldSets;
begin
  if FldSetType = FST_DISPLAY then
    Result := DisplaySets
  else
    Result := SortSets;
end;

//------------------------------------------------------------------------------
function TIniDismisThisMnth.FldSetTypeByName(Name: ShortString): TFldSetType;
begin
  if Copy(Name, 1, Length('Sort')) = 'Sort' then
    Result := FST_SORT
  else
    Result := FST_DISPLAY;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TIniDismisThisMnth.UpdateSelFlds(
  FldSetType: TFldSetType;
  FldNames: String);
begin
  FldSetsByType(FldSetType).UpdateSelFlds(FldNames);
end;
//..............................................................................
function TIniDismisThisMnth.FieldIsSelected(
  FldSetType: TFldSetType;
  FldName: ShortString): Boolean;
begin
  Result := FldSetsByType(FldSetType).FieldIsSelected(FldName);
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
constructor TFldSets.Create(SetType: TFldSetType);
begin
  Self.SetType := SetType;
  Load;
end;

//------------------------------------------------------------------------------
destructor TFldSets.Destroy;
begin
  SaveFldSet(GetSelectedFldSet.Caption);
  Save;
end;

//------------------------------------------------------------------------------
procedure TFldSets.Load;
var
  Count, I: Integer;
  Name: ShortString;
begin
  // Умолчательный набор полей.
  AddFldSet('', '', '');
  CurSetName := '';
  LastId := 0;

  // Пользовательские наборы полей.
  with TIniFile.Create(cNmIniFile) do begin
    Count := ReadInteger(SECTION, Prefix + 'Count', 0);

    for I := 1 to Count do begin
      Name := Prefix + IntToStr(I);

      AddFldSet(Name,
        ReadString(SECTION, Name + 'Caption', ''),
        ReadString(SECTION, Name + 'Fields', ''));

      LastId := I;
    end;

    Name := ReadString(SECTION, Prefix + 'Default', '');
    SelectFldSet(Name, false);

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFldSets.Save;
var
  IniFile: TIniFile;
  Count, I: Integer;
  NewName: ShortString;
begin
  IniFile := TIniFile.Create(cNmIniFile);

  // Освобождаем умолчательный элемент.
  FldSets[DEFINDX].Fields.Free;

  with IniFile do begin
    EmptyIni(IniFile);

    // -1 - умолчательный
    Count := Length(FldSets) - 1;

    if Count > 0 then
      WriteInteger(SECTION, Prefix + 'Count', Count);

    // Со следующего за умолчательным ...
    for I := 1 to Count do begin
      NewName := Prefix + IntToStr(I);

      WriteString(SECTION, NewName + 'Caption', FldSets[I].Caption);
      WriteString(SECTION, NewName + 'Fields', FldSets[I].Fields.DelimitedText);

      if FldSets[I].Name = CurSetName then
        WriteString(SECTION, Prefix + 'Default', NewName);

      FldSets[I].Fields.Free;
    end;

  end;

  SetLength(FldSets, 0);
end;

//------------------------------------------------------------------------------
function TFldSets.Count: Integer;
begin
  Result := Length(FldSets);
end;

//------------------------------------------------------------------------------
procedure TFldSets.EmptyIni(IniFile: TIniFile);
var
  Count, I: Integer;
  Name: ShortString;
begin
  with IniFile do begin
    Count := ReadInteger(SECTION, Prefix + 'Count', 0);

    for I := 1 to Count do begin
      Name := Prefix + IntToStr(I);

      DeleteKey(SECTION, Name + 'Caption');
      DeleteKey(SECTION, Name + 'Fields');
    end;

    DeleteKey(SECTION, Prefix + 'Count');
    DeleteKey(SECTION, Prefix + 'Default');
  end;
end;

//------------------------------------------------------------------------------
procedure TFldSets.EnumFldSets(EnumProc: TFldSetsEnumProc);
var
  Count, I: Integer;
begin
  Count := Length(FldSets);
  for I := 0 to Count - 1 do EnumProc(FldSets[I], SetType);
end;

//------------------------------------------------------------------------------
function TFldSets.GetSelectedFldSet: TFldSetItem;
begin
  Result := FldSets[IndexOf(CurSetName, true)];
end;
//..............................................................................
function TFldSets.GetDefaultFldSet: TFldSetItem;
begin
  Result := FldSets[DEFINDX];
end;

//------------------------------------------------------------------------------
procedure TFldSets.SaveFldSet(Caption: ShortString);
var
  FldNames: String;
  Indx: Integer;
begin
  // Берём поля из умолчательного набора.
  FldNames := FldSets[DEFINDX].Fields.DelimitedText;

  Indx := IndexOf(Caption, false);

  if Indx = -1 then
    // Создаём новый набор
    Indx := AddFldSet(Caption, FldNames)
  else
    FldSets[Indx].Fields.DelimitedText := FldNames;

  CurSetName := FldSets[Indx].Name;
end;

//------------------------------------------------------------------------------
function TFldSets.IndexOf(Value: ShortString; Name: Boolean): Integer;
var
  Count, I: Integer;
begin
  Result := -1;
  Count := Length(FldSets);

  for I := 0 to Count - 1 do
    if Name and (FldSets[I].Name = Value)
        or not Name and (FldSets[I].Caption = Value) then begin
      Result := I;
      break;
    end;
end;

//------------------------------------------------------------------------------
procedure TFldSets.SelectFldSet(Id: Integer);
begin
  SelectFldSet(Prefix + IntToStr(Id), false);
end;

//------------------------------------------------------------------------------
procedure TFldSets.SelectFldSet(Name: ShortString; Save: Boolean);
var
  Indx: Integer;
begin
  if Save then begin
    Indx := IndexOf(CurSetName, true);
    FldSets[Indx].Fields.DelimitedText := FldSets[DEFINDX].Fields.DelimitedText;
  end;

  // При смене набора полей копию помещаем в умолчательный набор.
  // Он используется как буфер при редаткировании полей и выгружается
  // в текущий при очередной смене набора.

  CurSetName := Name;

  Indx := IndexOf(CurSetName, true);
  FldSets[DEFINDX].Fields.DelimitedText := FldSets[Indx].Fields.DelimitedText;
end;
//..............................................................................
procedure TFldSets.AddFldSet(
  Id: Integer;
  Caption: ShortString;
  FldNames: String);
begin
  AddFldSet(Prefix + IntToStr(Id), Caption, FldNames);
end;
//..............................................................................
function TFldSets.AddFldSet(Caption: ShortString; FldNames: String): Integer;
var
  FldSetName: ShortString;
begin
  Inc(LastId);
  FldSetName := Prefix + IntToStr(LastId);

  AddFldSet(FldSetName, Caption, FldNames);
  Result := LastId;
end;
//..............................................................................
procedure TFldSets.AddFldSet(Name, Caption: ShortString; FldNames: String);
var
  Indx: Integer;
begin
  Indx := Length(FldSets);
  SetLength(FldSets, Indx + 1);

  FldSets[Indx].Name := Name;
  FldSets[Indx].Caption := Caption;
  FldSets[Indx].Fields := TStringList.Create;

  with FldSets[Indx].Fields do begin
    Delimiter := ';';
    DelimitedText := FldNames;
  end;
end;
//..............................................................................
procedure TFldSets.DeleteFldSet(Name: ShortString);
var
  Indx, Count, I: Integer;
begin
  Indx := IndexOf(Name, true);
  Count := Length(FldSets);

  for I := Indx to Count - 2 do
    FldSets[I] := FldSets[I + 1];

  SetLength(FldSets, Count - 1);
end;

//------------------------------------------------------------------------------
procedure TFldSets.UpdateSelFlds(FldNames: String);
begin
  FldSets[DEFINDX].Fields.DelimitedText := FldNames;
end;
//..............................................................................
function TFldSets.FieldIsSelected(FldName: ShortString): Boolean;
begin
  Result := FldSets[DEFINDX].Fields.IndexOf(FldName) > -1;
end;

//------------------------------------------------------------------------------
function TFldSets.Prefix: ShortString;
begin
  if SetType = FST_DISPLAY then
    Result := 'Display'
  else
    Result := 'Sort';
end;

end.
