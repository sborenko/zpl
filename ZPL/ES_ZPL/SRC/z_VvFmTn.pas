unit z_VvFmTn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Buttons, Mask, DBCtrls, DBClient,
  DBTables, ExtCtrls;

type
  TFormVvFmTn = class(TForm)
    cdsVv: TClientDataSet;
    cdsVvTabN: TIntegerField;
    Label1: TLabel;
    dsrcVv: TDataSource;
    bBtnOkTabN: TBitBtn;
    bBtnCancel: TBitBtn;
    cdsVvFam: TStringField;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    rBtnCase0: TRadioButton;
    rBtnCase1: TRadioButton;
    rBtnCase2: TRadioButton;
    qryTmp: TQuery;
    cdsVvID: TStringField;
    Label3: TLabel;
    DBComboBoxTabN: TDBComboBox;
    LbxSvTabN: TListBox;
    DBComboBoxFam: TDBComboBox;
    LbxSvFam: TListBox;
    DBComboBoxID: TDBComboBox;
    LbxSvID: TListBox;
    rBtnTabN: TRadioButton;
    rBtnFam: TRadioButton;
    rBtnInn: TRadioButton;
    bBtnOkFam: TBitBtn;
    bBtnOkID: TBitBtn;
    procedure DBEdit_Enter(Sender: TObject);
    procedure DBEdit_Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboBoxEnter(Sender: TObject);
    procedure DBComboBoxExit(Sender: TObject);
    procedure DBComboBoxTabNDblClick(Sender: TObject);
    procedure DBComboBoxFamDblClick(Sender: TObject);
    procedure DBComboBoxIDDblClick(Sender: TObject);
    procedure DBComboBoxTabNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBoxFamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBoxIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBoxTabNKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBoxFamKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bBtnEnter(Sender: TObject);
    procedure bBtnExit(Sender: TObject);
  private
    { Private declarations }
    cSvFam, cSvID : ShortString;
    nSvTabN : integer;
    nSvFamCase, nSvActCtrl : word;
    d_DtProc : TDateTime;
    n_TabN, n_KdObj, n_RetCase : integer;

    procedure CreOpenCdsVv;
    procedure SaveTabNToLbx;
    function FindByFam(cFam : ShortString; var nTabN : integer) : boolean;
    function FindByID(cID : ShortString; var nTabN : integer) : boolean;
    function FindByTabN(var nTabN : integer) : boolean;
  public
    { Public declarations }
  end;

function VvodFmTn(dDtProc : TDateTime; {вызов из осн. экрана - ищем по Z_SPS}
                            var nTabN, nKdObj, nRetCase : integer) : boolean;
function VvodFmTnForUpi(var nTabN, nRetCase : integer) : boolean; {вызов из спр.
                                                 "Сотрудники" - ищем по Z_UPI}

const SECTION = 'z_VvFmTn';

var
  FormVvFmTn: TFormVvFmTn;

implementation

uses
  A_Const, z_ShVbFm, DMUserStats;

{$R *.dfm}

//------------------------------------------------------------------------------
function VvodFmTnForUpi(var nTabN, nRetCase : integer) : boolean;
begin
  Result := false;
  FormVvFmTn := TFormVvFmTn.Create(Application);
  with FormVvFmTn do begin
    Caption := ' Задайте один из реквизитов для поиска';
    nTabN := 0;
    nRetCase := 0;
    CreOpenCdsVv;
    d_DtProc := dDtProc;
    if ShowModal = mrOk then begin
      nTabN := n_TabN;
      nRetCase := n_RetCase;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function VvodFmTn(dDtProc : TDateTime;
                            var nTabN, nKdObj, nRetCase : integer) : boolean;
begin
  Result := false;
  FormVvFmTn := TFormVvFmTn.Create(Application);
  with FormVvFmTn do begin
    Caption := ' Задайте один из реквизитов для поиска';
    nTabN := 0;
    nRetCase := 0; //-1;
    nKdObj := 0;
    CreOpenCdsVv;
    d_DtProc := dDtProc;
    if ShowModal = mrOk then begin
      nTabN := n_TabN;
      nRetCase := n_RetCase;
      nKdObj := n_KdObj;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.FormCreate(Sender: TObject);
begin
  // Обновить статистику использования
  DMUsrStats.UseOldEmplSrchDlg := DMUsrStats.UseOldEmplSrchDlg + 1;

  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 550);
    cSvFam := ReadString(SECTION, 'cSvFam', '');
    cSvID  := ReadString(SECTION, 'cSvId', '');
    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    nSvFamCase := ReadInteger(SECTION, 'nSvFamCase', 0);
    nSvActCtrl := ReadInteger(SECTION, 'nSvActCtrl', 0);
    Free;
  end;
  if nSvFamCase = 0 then
    rBtnCase0.Checked := true
  else if nSvFamCase = 1 then
    rBtnCase1.Checked := true
  else
    rBtnCase2.Checked := true;
  if nSvActCtrl = 1 then begin
    rBtnTabN.Checked := true;
    ActiveControl := DBComboBoxTabN; end
  else if nSvActCtrl = 2 then begin
    rBtnFam.Checked := true;
    ActiveControl := DBComboBoxFam; end
  else begin
    rBtnInn.Checked := true;
    ActiveControl := DBComboBoxId;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveTabNToLbx;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if (ModalResult = mrOk) and cdsVv.Active then begin
      WriteString(SECTION, 'cSvFam', cdsVv.FieldByName('Fam').AsString);
      WriteString(SECTION, 'cSvId', cdsVv.FieldByName('ID').AsString);
      WriteInteger(SECTION, 'nSvTabN', cdsVv.FieldByName('TabN').AsInteger);
      if rBtnCase0.Checked then
        WriteInteger(SECTION, 'nSvFamCase', 0)
      else if rBtnCase1.Checked then
        WriteInteger(SECTION, 'nSvFamCase', 1)
      else
        WriteInteger(SECTION, 'nSvFamCase', 2);

      if rBtnTabN.Checked then
        WriteInteger(SECTION, 'nSvActCtrl', 1)
      else if rBtnFam.Checked then
        WriteInteger(SECTION, 'nSvActCtrl', 2)
      else
        WriteInteger(SECTION, 'nSvActCtrl', 3);
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.SaveTabNToLbx;
var i : SmallInt; cDbgMsg : ShortString;
begin
  if not cdsVvFam.IsNull then begin
    LbxSvFam.Items.Clear;
    cDbgMsg := cdsVvFam.AsString;
    if cDbgMsg > '' then
      LbxSvFam.Items.Add(cDbgMsg);
    for i := 0 to DBComboBoxFam.Items.Count-1 do begin
      cDbgMsg := DBComboBoxFam.Items[i];
      if LbxSvFam.Items.IndexOf(cDbgMsg) < 0 then
        LbxSvFam.Items.Add(cDbgMsg);
      if i > 15 then
        Break;
    end;
    LbxSvFam.Items.SaveToFile(cDirVids + 'SvVvFm.lbx');
  end;
  if not cdsVvTabN.IsNull then begin
    LbxSvTabN.Items.Clear;
    cDbgMsg := cdsVvTabN.AsString;
    if cDbgMsg > '' then
      LbxSvTabN.Items.Add(cDbgMsg);
    for i := 0 to DBComboBoxTabN.Items.Count-1 do begin
      cDbgMsg := DBComboBoxTabN.Items[i];
      if LbxSvTabN.Items.IndexOf(cDbgMsg) < 0 then
        LbxSvTabN.Items.Add(cDbgMsg);
      if i > 15 then
        Break;
    end;
    LbxSvTabN.Items.SaveToFile(cDirVids + 'SvVvTN.lbx');
  end;
  if not cdsVvID.IsNull then begin
    LbxSvID.Items.Clear;
    cDbgMsg := cdsVvID.AsString;
    if cDbgMsg > '' then
      LbxSvID.Items.Add(cDbgMsg);
    for i := 0 to DBComboBoxID.Items.Count-1 do begin
      cDbgMsg := DBComboBoxID.Items[i];
      if LbxSvID.Items.IndexOf(cDbgMsg) < 0 then
        LbxSvID.Items.Add(cDbgMsg);
      if i > 15 then
        Break;
    end;
    LbxSvID.Items.SaveToFile(cDirVids + 'SvVvID.lbx');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.CreOpenCdsVv;
begin
  with cdsVv do begin
    if Active then Close;
    CreateDataSet;
    Append;
    if cSvFam <> '' then
      FieldByName('Fam').AsString := cSvFam;
    if nSvTabN <> 0 then
      FieldByName('TabN').AsInteger := nSvTabN;
    if cSvID <> '' then
      FieldByName('ID').AsString := cSvID;
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
    DBComboBoxID.Items.LoadFromFile(cDirVids +  'SvVvID.lbx');
    LbxSvID.Items.LoadFromFile(cDirVids +  'SvVvID.lbx');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBEdit_Enter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBEdit_Exit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxTabNDblClick(Sender: TObject);
begin
  bBtnOkTabN.SetFocus;
  if (not cdsVv.FieldByName('TabN').IsNull) and
              (cdsVv.FieldByName('TabN').AsInteger > 0) then begin
    n_TabN := cdsVv.FieldByName('TabN').AsInteger;
    if FindByTabN(n_TabN) then begin
      ;
    end;

    end;
end;
//------------------------------------------------------------------------------
function TFormVvFmTn.FindByTabN(var nTabN: integer): boolean;
begin
  Result := false;;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.TabN, u.Fam, u.Ima, u.Otch, u.Id, s.KdSps, s.KdObj, ' +
            's.KdKatP ' +
            'from Z_Upi u ' +
            'Left Outer Join Z_Sps s on (s.TabN = u.TabN) and ' +
            '(s.dtProc = :dDtProc)'  +
            ' where u.TabN = :nTabN ');
    SQL.Add(' order by u.Fam, u.Ima, u.Otch');
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('dDtProc').AsDateTime := d_DtProc;
    SQL.SaveToFile(cDirTemp + 'proba.txt');
    Open;
    if RecordCount = 0 then begin
      ShowMessage('Не найден таб. н-р ' + IntToStr(nTabN));
      ModalResult := mrNone;

      Result := false; end
    else if RecordCount = 1 then begin
      n_TabN  := FieldByName('TabN').AsInteger;
      ModalResult := mrOk;
      Result := true; end
    else begin
      if Shw_FamsForUpi(qryTmp, nTabN) {z_ShVbFm} then begin
        n_TabN := nTabN;
        n_RetCase := 0;
        ModalResult := mrOk;
        Result := true;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxFamDblClick(Sender: TObject);
var nTabN : integer; cFam : ShortString;
begin
  bBtnOkFam.SetFocus;
  if not cdsVv.FieldByName('Fam').IsNull and
                     (Trim(cdsVv.FieldByName('Fam').AsString) <> '') then begin

    cFam := AnsiUpperCase(Trim(cdsVv.FieldByName('Fam').AsString));

    if FindByFam(cFam, nTabN) then begin
      ;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TFormVvFmTn.FindByFam(cFam: ShortString;  var nTabN: integer): boolean;
var nKdObj : integer;
begin
  Result := false;;
  nTabN := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.TabN, u.Fam, u.Ima, u.Otch, u.Id, s.KdSps, s.KdObj, ' +
            's.KdKatP ' +
            'from Z_Upi u ' +
            'Left Outer Join Z_Sps s on (s.TabN = u.TabN) and ' +
            '(s.dtProc = :dDtProc)'  +
            ' where ');
    if rBtnCase2.Checked then
      SQL.Add(' (upper(u.Fam) = :cFam) ')
    else if rBtnCase1.Checked then
      SQL.Add(' (upper(u.Fam) starting(:cFam)) ')
    else
      SQL.Add(' (upper(u.Fam) containing(:cFam)) ');
    SQL.Add(' order by u.Fam, u.Ima, u.Otch');
    ParamByName('cFam').AsString    := cFam;
    ParamByName('dDtProc').AsDateTime := d_DtProc;
    Open;
    if RecordCount = 0 then begin
      ShowMessage('Не найдено фамилии по заданному условию');
      ModalResult := mrNone;

      Result := false; end
    else if RecordCount = 1 then begin
      n_TabN  := FieldByName('TabN').AsInteger;
      ModalResult := mrOk;
      Result := true; end
    else begin
      // COMMENT BY SB if Shw_FamsForUpi(qryTmp, nTabN) {z_ShVbFm} then begin
      if {REPLACEMENT: we need wide format} Shw_FamsForSps(qryTmp, nTabN, nKdObj) {z_ShVbFm} then begin
        n_TabN := nTabN;
        n_RetCase := 0;
        ModalResult := mrOk;
        Result := true;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxIDDblClick(Sender: TObject);
var nTabN : integer; cID : ShortString;
begin
  bBtnOkID.SetFocus;
  if not cdsVv.FieldByName('ID').IsNull and
                     (Trim(cdsVv.FieldByName('ID').AsString) <> '') then begin

    cID := AnsiUpperCase(Trim(cdsVv.FieldByName('ID').AsString));

    if FindByID(cID, nTabN) then begin
      ;
    end;
  end; end;
//------------------------------------------------------------------------------
function TFormVvFmTn.FindByID(cID: ShortString; var nTabN: integer): boolean;
begin
  Result := false;;
  nTabN := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.TabN, u.Fam, u.Ima, u.Otch, u.Id, s.KdSps, s.KdObj, ' +
            's.KdKatP ' +
            'from Z_Upi u ' +
            'Left Outer Join Z_Sps s on (s.TabN = u.TabN) and ' +
            '(s.dtProc = :dDtProc)'  +
            ' where ');
      SQL.Add(' (upper(u.ID) = :cID) ');
    ParamByName('cID').AsString    := cID;
    ParamByName('dDtProc').AsDateTime := d_DtProc;
    Open;
    if RecordCount = 0 then begin
      ShowMessage('Не найдено фамилии по заданному условию');
      ModalResult := mrNone;

      Result := false; end
    else if RecordCount = 1 then begin
      n_TabN  := FieldByName('TabN').AsInteger;
      ModalResult := mrOk;
      Result := true; end
    else begin
      if Shw_FamsForUpi(qryTmp, nTabN) {z_ShVbFm} then begin
        n_TabN := nTabN;
        n_RetCase := 0;
        ModalResult := mrOk;
        Result := true;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxTabNKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
//  ShowMessage('On TabN');
  if (Key = VK_RETURN) and (Shift = []) then
      DBComboBoxTabNDblClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxFamKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
//    ShowMessage('On Fam');
    if (Key = VK_RETURN) and (Shift = []) then
      DBComboBoxFamDblClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxIDKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
//    ShowMessage('On Id');
    if (Key = VK_RETURN) and (Shift = []) then
      DBComboBoxIdDblClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxTabNKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then DBComboBoxTabNDblClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.DBComboBoxFamKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then DBComboBoxFamDblClick(Sender);
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.bBtnEnter(Sender: TObject);
begin
  (Sender as TBitBtn).Font.Color := clRed;
  (Sender as TBitBtn).Font.Style := [fsBold];
end;
//------------------------------------------------------------------------------
procedure TFormVvFmTn.bBtnExit(Sender: TObject);
begin
  (Sender as TBitBtn).Font.Color := clWindowText;
  (Sender as TBitBtn).Font.Style := [];
end;

end.


