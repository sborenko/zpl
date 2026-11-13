unit FormDismisThisMnth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, CheckLst,
  DModDismisThisMnth, IniDismisThisMnth;

type
  TMnuClickProc = procedure(Sender: TObject) of object;

  TFrmDismisThisMnth = class(TForm)
    PopupMenu: TPopupMenu;
    MnuSelDisplay: TMenuItem;
    PanelSetup: TPanel;
    ChLstBoxFlds: TCheckListBox;
    PanelData: TPanel;
    DbgrDismissed: TDBGrid;
    PanelButtons: TPanel;
    BtnPrint: TBitBtn;
    BtnClose: TBitBtn;
    PanelUpDown: TPanel;
    BtnUp: TSpeedButton;
    BtnDown: TSpeedButton;
    LblTitle: TLabel;
    MnuSelSort: TMenuItem;
    PanelSaveAs: TPanel;
    EditSaveAs: TEdit;
    LblName: TLabel;
    Sep: TMenuItem;
    MnuDelete: TMenuItem;
    MnuDelDisplay: TMenuItem;
    MnuDelSort: TMenuItem;
    BtnDisplay: TSpeedButton;
    BtnSort: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChLstBoxFldsClickCheck(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure MnuSelectClick(Sender: TObject);
    procedure MnuDeleteClick(Sender: TObject);
    procedure BtnDisplayClick(Sender: TObject);
    procedure BtnSortClick(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
    procedure BtnDownClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure EditSaveAsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCloseClick(Sender: TObject);
  private
    FldSetType: TFldSetType;

    CurMnuItem: TMenuItem;
    CurMnuClickProc: TMnuClickProc;

    CurColIndx: Integer;

    procedure UpdateFldSet;

    procedure PopulateColSet;
    procedure FldMapEnumProc(FldMapItem: TFldMapItem);
    procedure RefreshSetupPanel;
    procedure RefreshCaptionPanel;
    procedure RefreshFieldList;
    procedure RefreshSaveAsPanel;

    procedure MapGridColNames;
    procedure AdjustGridCols;

    function FindColumnByCaption(Caption: ShortString): TColumn;

    procedure PopulatePopupMnu(MnuItem: TMenuItem; FldSetType: TFldSetType;
      MnuClickProc: TMnuClickProc);
    procedure FldSetsEnumProc(FldSet: TFldSetItem; FldSetType: TFldSetType);

    procedure LaunchFldItem(Caption: ShortString; Indx: Integer);

    function GetCurIndx(Caption: ShortString): Integer;
    function GetLastCheckIndx: Integer;

    procedure Save;
  public
    class procedure Run;
  end;

var
  FrmDismThisMnth: TFrmDismisThisMnth;

implementation

uses
  Math, IniFiles, a_Const, RptDismisThisMnth, TextLib, DB;

const
  SECTION = 'DismisThisMnth';

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmDismisThisMnth.Run;
begin
  FrmDismThisMnth := TFrmDismisThisMnth.Create(nil);

  with FrmDismThisMnth do begin
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Top := ReadInteger(SECTION, 'Top', Top);
    Left := ReadInteger(SECTION, 'Left', Left);
    Height := ReadInteger(SECTION, 'Height', Height);
    Width := ReadInteger(SECTION, 'Width', Width);
  end;

  PanelSetup.Visible := false;

  DmDismThisMnth := TDmDismisThisMnth.Create(nil);

  RefreshSetupPanel;
  MapGridColNames;
  AdjustGridCols;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'Top', Top);
    WriteInteger(SECTION, 'Left', Left);
    WriteInteger(SECTION, 'Height', Height);
    WriteInteger(SECTION, 'Width', Width);
  end;

  with DmDismThisMnth do
    Free;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.PopulateColSet;
var
  I, Indx: Integer;
  FldCaption: ShortString;
begin
  DmDismThisMnth.EnumFieldMap(FldMapEnumProc);

  with IniDismThisMnth.GetDefaultFldSet(FldSetType), Fields do
    for I := 0 to Count - 1 do
      with DmDismThisMnth do begin
        FldCaption := MapItemName(Fields[I]);
        Indx := GetCurIndx(FldCaption);
        LaunchFldItem(FldCaption, Indx);
      end;
end;
//..............................................................................
procedure TFrmDismisThisMnth.FldMapEnumProc(FldMapItem: TFldMapItem);
begin
  if not DmDismThisMnth.FldIsInvisible(FldMapItem.FldName) then
    ChLstBoxFlds.Items.Add(FldMapItem.ColName);
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.UpdateFldSet;
var
  I: Integer;
  FldNames: String;
begin
  FldNames := '';

  with ChLstBoxFlds do
    for I := 0 to Count - 1 do
      if Checked[I] then
        TextUtils.MergeStr(FldNames,
          DmDismThisMnth.MapItemName(Items[I], false), ';');

  DmDismThisMnth.UpdateSelFlds(FldSetType, FldNames);

  if FldSetType = FST_SORT then
    MapGridColNames;

  AdjustGridCols;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.RefreshSetupPanel;
begin
  RefreshCaptionPanel;
  RefreshFieldList;
  RefreshSaveAsPanel;
end;
//..............................................................................
procedure TFrmDismisThisMnth.RefreshCaptionPanel;
begin
  if FldSetType = FST_DISPLAY then
    LblTitle.Caption := 'Выбор отображаемых полей'
  else
    LblTitle.Caption := 'Выбор полей для сортировки';
end;
//..............................................................................
procedure TFrmDismisThisMnth.RefreshFieldList;
begin
  with ChLstBoxFlds do begin
    CurColIndx := ItemIndex;
    Clear;
    PopulateColSet;
    ItemIndex := Max(CurColIndx, 0);
  end;
end;
//..............................................................................
procedure TFrmDismisThisMnth.RefreshSaveAsPanel;
begin
  EditSaveAs.Text := IniDismThisMnth.GetSelectedFldSet(FldSetType).Caption;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.MapGridColNames;
var
  I: Word;
  FldName: ShortString;
begin
  with DbgrDismissed do
    for I := 0 to Columns.Count - 1 do begin
      FldName := Columns[I].FieldName;
      if not DmDismThisMnth.FldIsInvisible(FldName) then
        Columns[I].Title.Caption := DmDismThisMnth.MapItemName(FldName);
    end;
end;
//..............................................................................
procedure TFrmDismisThisMnth.AdjustGridCols;
var
  I: Integer;
  FldCaption: ShortString;
begin
  with IniDismThisMnth.GetDefaultFldSet(FST_DISPLAY), Fields do begin
    for I := 0 to Count - 1 do begin
      FldCaption := DmDismThisMnth.MapItemName(Fields[I], true);

      with FindColumnByCaption(FldCaption) do begin
        Index := I;
        Visible := true;
      end;
    end;

    with DbgrDismissed do
      for I := Count to Columns.Count - 1 do
        Columns[I].Visible := false;
  end;
end;

//------------------------------------------------------------------------------
function TFrmDismisThisMnth.FindColumnByCaption(Caption: ShortString): TColumn;
var
  I: Word;
begin
  Result := nil;

  with DbgrDismissed do
    for I := 0 to Columns.Count - 1 do
      if Columns[I].Title.Caption = Caption then begin
        Result := Columns[I];
        break;
      end;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.PopupMenuPopup(Sender: TObject);
begin
  PopulatePopupMnu(MnuSelDisplay, FST_DISPLAY, MnuSelectClick);
  PopulatePopupMnu(MnuSelSort, FST_SORT, MnuSelectClick);

  PopulatePopupMnu(MnuDelDisplay, FST_DISPLAY, MnuDeleteClick);
  PopulatePopupMnu(MnuDelSort, FST_SORT, MnuDeleteClick);
end;
//..............................................................................
procedure TFrmDismisThisMnth.PopulatePopupMnu(
  MnuItem: TMenuItem;
  FldSetType: TFldSetType;
  MnuClickProc: TMnuClickProc);
begin
  MnuItem.Clear;
  CurMnuItem := MnuItem;
  CurMnuClickProc := MnuClickProc;
  IniDismThisMnth.EnumFldSets(FldSetType, FldSetsEnumProc);
  MnuItem.Delete(0);
  MnuItem.Enabled := MnuItem.Count > 0;
end;
//..............................................................................
procedure TFrmDismisThisMnth.FldSetsEnumProc(
  FldSet: TFldSetItem;
  FldSetType: TFldSetType);
var
  MnuItem: TMenuItem;
begin
  MnuItem := TMenuItem.Create(CurMnuItem);

  MnuItem.Name := FldSet.Name;
  MnuItem.Caption := FldSet.Caption;
  MnuItem.Tag := Ord(FldSetType);

  MnuItem.Checked :=
    MnuItem.Name = IniDismThisMnth.GetSelectedFldSet(FldSetType).Name;
  MnuItem.Enabled := not MnuItem.Checked or (CurMnuItem.Parent <> MnuDelete);

  MnuItem.OnClick := CurMnuClickProc;
  CurMnuItem.Add(MnuItem);
end;

//------------------------------------------------------------------------------
function TFrmDismisThisMnth.GetCurIndx(Caption: ShortString): Integer;
var
  I: Integer;
begin
  Result := -1;

  with ChLstBoxFlds do
    for I := 0 to Count - 1 do
      if Items[I] = Caption then begin
        Result := I;
        break;
      end;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.LaunchFldItem(
  Caption: ShortString;
  Indx: Integer);
var
  LastCheckIndx: Integer;
begin
  with ChLstBoxFlds do begin
    // Снимаем check с только что check'нутого, чтобы не вносил помехи.
    Checked[Indx] := false;
    LastCheckIndx := GetLastCheckIndx;

    Items.Delete(Indx);
    Items.Insert(LastCheckIndx + 1, Caption);
    Checked[LastCheckIndx + 1] := true;
    ItemIndex := LastCheckIndx + 1;
  end;
end;

//------------------------------------------------------------------------------
function TFrmDismisThisMnth.GetLastCheckIndx: Integer;
var
  I: Integer;
begin
  Result := -1;
  with ChLstBoxFlds do begin
    for I := 0 to Items.Count - 1 do
      if Checked[I] then
        Inc(Result)
      else
        break;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.MnuSelectClick(Sender: TObject);
var
  MnuItem: TMenuItem;
  SetType: TFldSetType;
begin
  Save;

  MnuItem := Sender as TMenuItem;
  SetType := TFldSetType(MnuItem.Tag);

  DmDismThisMnth.SelectFldSet(SetType, MnuItem.Name);

  RefreshSetupPanel;

  if SetType = FST_SORT then
    MapGridColNames;

  AdjustGridCols;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.MnuDeleteClick(Sender: TObject);
begin
  IniDismThisMnth.DeleteFldSet((Sender as TMenuItem).Name);
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.BtnDisplayClick(Sender: TObject);
begin
  Save;
  
  with PanelSetup do begin
    Visible := BtnDisplay.Down;

    if Visible then begin
      Align := alLeft;
      FldSetType := FST_DISPLAY;

      RefreshSetupPanel;
      RefreshSaveAsPanel;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.BtnSortClick(Sender: TObject);
begin
  Save;

  with PanelSetup do begin
    Visible := BtnSort.Down;

    if Visible then begin
      Align := alRight;
      FldSetType := FST_SORT;

      RefreshSetupPanel;
      RefreshSaveAsPanel;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.BtnUpClick(Sender: TObject);
var
  Buffer: ShortString;
begin
  with ChLstBoxFlds do
    if (ItemIndex > 0) and Checked[ItemIndex] then begin
      Buffer := Items[ItemIndex - 1];

      Items[ItemIndex - 1] := Items[ItemIndex];
      Items[ItemIndex] := Buffer;
      ItemIndex := ItemIndex - 1;

      UpdateFldSet;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.BtnDownClick(Sender: TObject);
var
  Buffer: ShortString;
begin
  with ChLstBoxFlds do
    if (ItemIndex < Items.Count - 1) and Checked[ItemIndex + 1] then begin
      Buffer := Items[ItemIndex + 1];

      Items[ItemIndex + 1] := Items[ItemIndex];
      Items[ItemIndex] := Buffer;
      ItemIndex := ItemIndex + 1;

      UpdateFldSet;
    end;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.ChLstBoxFldsClickCheck(Sender: TObject);
begin
  with ChLstBoxFlds do
    if Checked[ItemIndex] then
      LaunchFldItem(Items[ItemIndex], ItemIndex)
    else begin
      UpdateFldSet;
      RefreshFieldList;
    end;

  UpdateFldSet;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.BtnPrintClick(Sender: TObject);
begin
  TRptDismisThisMnth.Run;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.EditSaveAsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Save;
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.Save;
begin
  if EditSaveAs.Text <> '' then
    IniDismThisMnth.SaveFldSetAs(FldSetType, EditSaveAs.Text);
end;

//------------------------------------------------------------------------------
procedure TFrmDismisThisMnth.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
