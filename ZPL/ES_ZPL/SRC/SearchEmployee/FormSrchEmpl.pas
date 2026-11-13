unit FormSrchEmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Buttons, Mask, DBCtrls, DBClient,
  DBTables, ExtCtrls;

type
  TSelectResult = (
    // Для каждого сотрудника формируется одна консолидирующая запись.
    // При этом, код подразделения указывается искусственно: 0 или 1,
    // и нужен только для того, чтобы на форме Shw_FamsForSps выделить
    // активных и неактивных сортудников:
    SelResClarifyObj,
    // Выбранный сотрудник указан точно, но если сотрудник отсутствует
    // в списке месяца, код подразделения будет нулевым.
    SelResUseResult);

  TFrmSrchEmpl = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBComboBoxTabN: TDBComboBox;
    DBComboBoxFam: TDBComboBox;
    DBComboBoxINN: TDBComboBox;
    GroupSearchType: TGroupBox;
    rBtnAny: TRadioButton;
    rBtnBegin: TRadioButton;
    rBtnExact: TRadioButton;
    BtnSearch: TBitBtn;
    BtnCancel: TBitBtn;
    LbxSvTabN: TListBox;
    LbxSvFam: TListBox;
    LbxSvID: TListBox;
    cdsVv: TClientDataSet;
    dsrcVv: TDataSource;
    cdsVvTabN: TIntegerField;
    cdsVvFam: TStringField;
    cdsVvID: TStringField;
    qryTmp: TQuery;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboBoxTabNEnter(Sender: TObject);
    procedure DBComboBoxFamEnter(Sender: TObject);
    procedure DBComboBoxINNEnter(Sender: TObject);
    procedure bBtnEnter(Sender: TObject);
    procedure bBtnExit(Sender: TObject);
    procedure DBComboBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBoxKeyUpRestorer(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSearchClick(Sender: TObject);

  private
    DtProc: TDateTime;
    TabN, KdObj: integer;
    ForUPI: boolean;
    Fam, INN: ShortString;
    Found: boolean;

    LastSearchCase, LastFamCase: word;

    procedure CreOpenCdsVv;

    procedure SaveValuesToLbx;
    procedure SaveValuesToLbx1(ComboBox: TDBComboBox; ListBox: TListBox;
      FieldName, FileName: string);

    function Search: boolean;
    function FindByTabN: boolean;
    function FindByFam: boolean;
    function FindByINN: boolean;
    function ResumeSearch(Query: TQuery; Sender: TDBComboBox; ErrMsg, Suffix: string): boolean;
    function CheckSelectResult: TSelectResult;

    procedure RestoreActiveCtrl;

    function SelectClause: string;
    function SortClause: string;
  public
    class function SearchBothTabNObj(
      pDtProc: TDateTime;
      var pTabN, pKdObj: integer;
      var pSelectResult: TSelectResult) : boolean;

    class function SearchOnlyTabN(var pTabN: integer) : boolean;
  end;

const
  SECTION = 'z_VvFmTn';

  SearchTabN = 0;
  SearchFam  = 1;
  SearchINN  = 2;

  SearchFamAny   = 0;
  SearchFamBegin = 1;
  SearchFamExact = 2;

var
  FrmSrchEmpl: TFrmSrchEmpl;

implementation

uses
  A_Const, z_DM, z_ShVbFm, DMUserStats;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFrmSrchEmpl.SearchBothTabNObj(
  pDtProc: TDateTime;
  var pTabN, pKdObj : integer;
  var pSelectResult: TSelectResult): boolean;
begin
  FrmSrchEmpl := TFrmSrchEmpl.Create(Application);

  with FrmSrchEmpl do begin
    Caption := 'Поиск сотрудника';
    ForUPI := false;

    CreOpenCdsVv;
    DtProc := pDtProc;

    ShowModal;

    if Found then begin
      pTabN := TabN;
      pKdObj := KdObj;
      pSelectResult := CheckSelectResult;
    end;

    Result := Found;
    Free;
  end;
end;

//------------------------------------------------------------------------------
class function TFrmSrchEmpl.SearchOnlyTabN(var pTabN: integer): boolean;
begin
  FrmSrchEmpl := TFrmSrchEmpl.Create(Application);

  with FrmSrchEmpl do begin
    Caption := 'Поиск сотрудника';
    ForUPI := true;

    CreOpenCdsVv;
    DtProc := dDtProc;

    ShowModal;

    if Found then
      pTabN := TabN;

    Result := Found;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.FormCreate(Sender: TObject);
begin
  // Обновить статистику использования
  DMUsrStats.UseNewEmplSrchDlg := DMUsrStats.UseNewEmplSrchDlg + 1;

  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'Left', 400);
    Top  := ReadInteger(SECTION, 'Top', 550);

    TabN := ReadInteger(SECTION, 'TabN', 0);
    Fam  := ReadString(SECTION, 'Fam', '');
    INN  := ReadString(SECTION, 'INN', '');

    LastSearchCase := ReadInteger(SECTION, 'LastSearchCase', 0);
    LastFamCase := ReadInteger(SECTION, 'LastFamCase', 0);

    Free;
  end;

  RestoreActiveCtrl;

  if LastFamCase = SearchFamAny then
    rBtnAny.Checked := true
  else if LastFamCase = SearchFamBegin then
    rBtnBegin.Checked := true
  else
    rBtnExact.Checked := true;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // SaveValuesToLbx;

  SaveValuesToLbx1(DBComboBoxTabN, LbxSvTabN, 'TabN', 'SvVvTN.lbx');
  SaveValuesToLbx1(DBComboBoxFam, LbxSvFam, 'Fam', 'SvVvFm.lbx');
  SaveValuesToLbx1(DBComboBoxINN, LbxSvID, 'ID', 'SvVvID.lbx');

  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'Left', Left);
    WriteInteger(SECTION, 'Top', Top);

    WriteInteger(SECTION, 'TabN', cdsVv.FieldByName('TabN').AsInteger);
    WriteString(SECTION, 'Fam', cdsVv.FieldByName('Fam').AsString);
    WriteString(SECTION, 'INN', cdsVv.FieldByName('ID').AsString);

    WriteInteger(SECTION, 'LastSearchCase', LastSearchCase);

    if rBtnAny.Checked then
      WriteInteger(SECTION, 'LastFamCase', SearchFamAny)
    else if rBtnBegin.Checked then
      WriteInteger(SECTION, 'LastFamCase', SearchFamBegin)
    else
      WriteInteger(SECTION, 'LastFamCase', SearchFamExact);

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.BtnSearchClick(Sender: TObject);
begin
  if Search then
    Close;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.DBComboBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    BtnSearch.SetFocus;

    if Search then
      Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.DBComboBoxKeyUpRestorer(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    DBComboBoxTabN.OnKeyUp := DBComboBoxKeyUp;
    DBComboBoxFam.OnKeyUp := DBComboBoxKeyUp;
    DBComboBoxINN.OnKeyUp := DBComboBoxKeyUp;
  end;
end;

//------------------------------------------------------------------------------
function TFrmSrchEmpl.Search: boolean;
begin
  if LastSearchCase = SearchTabN then
    Result := FindByTabN
  else if LastSearchCase = SearchFam then
    Result := FindByFam
  else
    Result := FindByINN;

  if Result then
    Self.TabN := TabN
  else
    RestoreActiveCtrl;

  Found := Result;
end;

//------------------------------------------------------------------------------
function TFrmSrchEmpl.FindByTabN: boolean;
begin
  Result := false;

  if DBComboBoxTabN.Field.IsNull then
    exit;

  TabN := DBComboBoxTabN.Field.Value;

  InitQuery(qryTmp);

  with qryTmp do begin
    SQL.Add(
      SelectClause +
      'where u.TabN = :TabN ' +
      SortClause);

    ParamByName('TabN').AsInteger := TabN;
    ParamByName('DtProc').AsDateTime := DtProc;
    Open;

    Result := ResumeSearch(qryTmp, DBComboBoxTabN, 'Табельный № ' + IntToStr(TabN), '');
  end; {with}

  ReleaseQuery(qryTmp);
end;

//------------------------------------------------------------------------------
function TFrmSrchEmpl.FindByFam: boolean;
var
  Message, Suffix: string;
begin
  Result := false;

  if DBComboBoxFam.Field.IsNull or (Trim(DBComboBoxFam.Field.Value) = '') then
    exit;

  Fam := AnsiUpperCase(DBComboBoxFam.Field.Value);

  InitQuery(qryTmp);

  with qryTmp do begin
    SQL.Add(
      SelectClause +
      'where upper(u.Fam) ');

    if rBtnAny.Checked then
      SQL.Add('containing(:Fam) ')
    else if rBtnBegin.Checked then
      SQL.Add('starting(:Fam) ')
    else
      SQL.Add('= :Fam ');

    SQL.Add(SortClause);

    ParamByName('Fam').AsString  := Fam;
    ParamByName('DtProc').AsDateTime := DtProc;
    Open;

    if rBtnExact.Checked then begin
      Message := 'Фамилия ';
      Suffix := 'а';
    end else begin
      Message := 'Фрагмент фамилии ';
      Suffix := '';
    end;

    Result := ResumeSearch(qryTmp, DBComboBoxFam, Message + Fam, Suffix);
  end;

  ReleaseQuery(qryTmp);
end;

//------------------------------------------------------------------------------
function TFrmSrchEmpl.FindByINN: boolean;
var
  Message: string;
begin
  Result := false;

  if DBComboBoxINN.Field.IsNull or (Trim(DBComboBoxINN.Field.Value) = '') then
    exit;

  INN := AnsiUpperCase(DBComboBoxINN.Field.Value);

  InitQuery(qryTmp);

  with qryTmp do begin
    SQL.Add(
      SelectClause +
      'where upper(u.ID) ');

    if rBtnAny.Checked then
      SQL.Add('containing(:INN) ')
    else if rBtnBegin.Checked then
      SQL.Add('starting(:INN) ')
    else
      SQL.Add('= :INN ');

    SQL.Add(SortClause);

    ParamByName('INN').AsString := INN;
    ParamByName('DtProc').AsDateTime := DtProc;
    Open;

    if rBtnExact.Checked then
      Message := 'ИНН '
    else
      Message := 'Фрагмент ИНН ';
    Result := ResumeSearch(qryTmp, DBComboBoxINN, Message + INN, '');
  end;
end;

//------------------------------------------------------------------------------
function TFrmSrchEmpl.ResumeSearch(
  Query: TQuery;
  Sender: TDBComboBox;
  ErrMsg, Suffix: string): boolean;
begin
  with Query do begin
    if RecordCount = 0 then begin
      Sender.OnKeyUp := DBComboBoxKeyUpRestorer;
      ShowMessage(ErrMsg + ' не найден' + Suffix + ' в списке сотрудников.');
      Result := false;

    end else if (RecordCount = 1) then begin
      TabN  := FieldByName('TabN').AsInteger;
      KdObj := FieldByName('KdObj').AsInteger;
      Result := true;

    end else begin
      if ForUpi then
        Result := Shw_FamsForUpi(qryTmp, TabN) {z_ShVbFm}
      else
        Result := Shw_FamsForSps(qryTmp, TabN, KdObj) {z_ShVbFm};
    end;
  end;
end;

//------------------------------------------------------------------------------
function TFrmSrchEmpl.CheckSelectResult: TSelectResult;
begin
  if ForUPI then
    Result := SelResClarifyObj
  else begin
    Result := SelResUseResult;
    {InitQuery(qryTmp);

    with qryTmp do begin
      SQL.Add(
        SelectClause +
        'where u.TabN = :TabN ' +
        SortClause);

      ParamByName('TabN').AsInteger := TabN;
      ParamByName('DtProc').AsDateTime := DtProc;
      Open;

      if RecordCount = 1 then
        Result := SelResSingle
      else
        Result := SelResMultiple;
    end;

    ReleaseQuery(qryTmp);}
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.RestoreActiveCtrl;
begin
  if LastSearchCase = SearchTabN then
    ActiveControl := DBComboBoxTabN
  else if LastSearchCase = SearchFam then
    ActiveControl := DBComboBoxFam
  else
    ActiveControl := DBComboBoxINN;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.CreOpenCdsVv;
begin
  with cdsVv do begin
    if Active then Close;
    CreateDataSet;
    Append;

    if TabN <> 0 then
      FieldByName('TabN').AsInteger := TabN;
    if Fam <> '' then
      FieldByName('Fam').AsString := Fam;
    if INN <> '' then
      FieldByName('ID').AsString := INN;
  end;

  if FileExists(cDirVids + 'SvVvTN.lbx') then begin
    DBComboBoxTabN.Items.LoadFromFile(cDirVids +  'SvVvTN.lbx');
    LbxSvTabN.Items.LoadFromFile(cDirVids +  'SvVvTN.lbx');
  end;

  if FileExists(cDirVids + 'SvVvFm.lbx') then begin
    DBComboBoxFam.Items.LoadFromFile(cDirVids +  'SvVvFm.lbx');
    LbxSvFam.Items.LoadFromFile(cDirVids +  'SvVvFm.lbx');
  end;

  if FileExists(cDirVids + 'SvVvID.lbx') then begin
    DBComboBoxINN.Items.LoadFromFile(cDirVids +  'SvVvID.lbx');
    LbxSvID.Items.LoadFromFile(cDirVids +  'SvVvID.lbx');
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.SaveValuesToLbx;
var
  i: SmallInt;
  Value: ShortString;
begin
  if cdsVvTabN.AsInteger > 0 then begin
    LbxSvTabN.Items.Clear;
    LbxSvTabN.Items.Add(cdsVvTabN.AsString);
    for i := 0 to DBComboBoxTabN.Items.Count - 1 do begin
      Value := DBComboBoxTabN.Items[i];
      if LbxSvTabN.Items.IndexOf(Value) < 0 then
        LbxSvTabN.Items.Add(Value);
      if i > 15 then
        Break;
    end;
    LbxSvTabN.Items.SaveToFile(cDirVids + 'SvVvTN.lbx');
  end;

  Value := cdsVvFam.AsString;
  if Value <> '' then begin
    LbxSvFam.Items.Clear;
    LbxSvFam.Items.Add(Value);
    for i := 0 to DBComboBoxFam.Items.Count - 1 do begin
      Value := DBComboBoxFam.Items[i];
      if LbxSvFam.Items.IndexOf(Value) < 0 then
        LbxSvFam.Items.Add(Value);
      if i > 15 then
        Break;
    end;
    LbxSvFam.Items.SaveToFile(cDirVids + 'SvVvFm.lbx');
  end;

  Value := cdsVvID.AsString;
  if Value <> '' then begin
    LbxSvID.Items.Clear;
    LbxSvID.Items.Add(Value);
    for i := 0 to DBComboBoxINN.Items.Count - 1 do begin
      Value := DBComboBoxINN.Items[i];
      if LbxSvID.Items.IndexOf(Value) < 0 then
        LbxSvID.Items.Add(Value);
      if i > 15 then
        Break;
    end;
    LbxSvID.Items.SaveToFile(cDirVids + 'SvVvID.lbx');
  end;
end; {SaveValuesToLbx}

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.SaveValuesToLbx1(ComboBox: TDBComboBox; ListBox: TListBox;
  FieldName, FileName: string);
var
  i: SmallInt;
  Value: ShortString;
begin
  Value := cdsVv.FieldByName(FieldName).AsString;

  if Value <> '' then begin
    ListBox.Items.Clear;
    ListBox.Items.Add(Value);

    for i := 0 to ComboBox.Items.Count - 1 do begin
      Value := ComboBox.Items[i];
      if ListBox.Items.IndexOf(Value) < 0 then
        ListBox.Items.Add(Value);
      if i > 15 then
        Break;
    end;
    ListBox.Items.SaveToFile(cDirVids + FileName);
  end;
end;


//------------------------------------------------------------------------------
function TFrmSrchEmpl.SelectClause: string;
begin
  if ForUPI then
    Result :=
      'select distinct u.TabN, u.Fam, u.Ima, u.Otch, u.Id, ' +
      'case s.KdObj when s.KdObj then 1 else null end as KdObj '
  else
    Result :=
      'select u.TabN, s.KdObj, s.KdSps, s.KdKatP, u.Fam, u.Ima, u.Otch, u.Id ';

  Result := Result +
    'from Z_Upi u ' +
      'left join Z_Sps s on s.TabN = u.TabN and s.dtProc = :DtProc ';
end;

//------------------------------------------------------------------------------
function TFrmSrchEmpl.SortClause: string;
begin
  Result := 'order by u.Fam, u.Ima, u.Otch';
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.DBComboBoxTabNEnter(Sender: TObject);
begin
  LastSearchCase := SearchTabN;
  DBComboBoxTabN.Color := clYellow;
  DBComboBoxFam.Color := clWindow;
  DBComboBoxINN.Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.DBComboBoxFamEnter(Sender: TObject);
begin
  LastSearchCase := SearchFam;
  DBComboBoxTabN.Color := clWindow;
  DBComboBoxFam.Color := clYellow;
  DBComboBoxINN.Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.DBComboBoxINNEnter(Sender: TObject);
begin
  LastSearchCase := SearchINN;
  DBComboBoxTabN.Color := clWindow;
  DBComboBoxFam.Color := clWindow;
  DBComboBoxINN.Color := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.bBtnEnter(Sender: TObject);
begin
  (Sender as TBitBtn).Font.Color := clRed;
  (Sender as TBitBtn).Font.Style := [fsBold];
end;

//------------------------------------------------------------------------------
procedure TFrmSrchEmpl.bBtnExit(Sender: TObject);
begin
  (Sender as TBitBtn).Font.Color := clWindowText;
  (Sender as TBitBtn).Font.Style := [];
end;

end.

