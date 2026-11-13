unit z_FiTemu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Mask, DBCtrls, DB, DBClient, Buttons,
  DBTables;

type
  TFormFiTemu = class(TForm)
    cdsFT: TClientDataSet;
    dsrcFT: TDataSource;
    cdsFTKdTemu: TSmallintField;
    Label1: TLabel;
    dbeKdTemu: TDBEdit;
    bBtnOkByKdTemu: TBitBtn;
    bBtnCancel: TBitBtn;
    cdsFTNmSch: TStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    bBtnOkByNmTemu: TBitBtn;
    qryFi: TQuery;
    DBComboKdTemu: TDBComboBox;
    DBComboNmTemu: TDBComboBox;
    LbxSvKdTemu: TListBox;
    LbxSvNmTemu: TListBox;
    procedure dbeNmTemuEnter(Sender: TObject);
    procedure dbeNmTemuExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBtnOkByKdTemuClick(Sender: TObject);
    procedure bBtnOkByNmTemuClick(Sender: TObject);
    procedure DBComboKdTemuEnter(Sender: TObject);
    procedure DBComboKdTemuExit(Sender: TObject);
  private
    { Private declarations }
    nSvKdTemu, n_KdTemuGrp, n_KdTemuPgr : SmallInt;
    cSvNmTemu : ShortString;
    procedure CreOpenCdsFT;
    procedure SaveTemuToLboxes;
  public
    { Public declarations }
  end;

const SECTION = 'z_FiTemu';

function ZFiTemu(var nKdTemuGrp, nKdTemuPgr : SmallInt) : boolean;

var
  FormFiTemu: TFormFiTemu;

implementation

uses A_Const, Z_Main, a_Lib, z_FTem2;


{$R *.dfm}

//------------------------------------------------------------------------------
function ZFiTemu(var nKdTemuGrp, nKdTemuPgr : SmallInt) : boolean;
begin
  Result := false;
  FormFiTemu := TFormFiTemu.Create(Application);
  with  FormFiTemu do begin
    Caption := 'Задание условия для поиска';
    CreOpenCdsFT;
    if ShowModal = mrOk then begin
      nKdTemuGrp := n_KdTemuGrp;
      nKdTemuPgr := n_KdTemuPgr;
      Result := true;
     end;
     Free;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.dbeNmTemuEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.dbeNmTemuExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
   Top   := ReadInteger(SECTION, 'wT', 300);
   cSvNmTemu := ReadString(SECTION, 'cSvNmTemu', '');
   nSvKdTemu := ReadInteger(SECTION, 'nSvKdTemu', 0);
     Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if (ModalResult = mrOk) and cdsFT.Active then begin
      WriteString(SECTION, 'cSvNmTemu', cdsFT.FieldByName('NmSch').AsString);
      WriteInteger(SECTION, 'nSvKdTemu', cdsFT.FieldByName('KdTemu').AsInteger);
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.CreOpenCdsFT;
begin
  with cdsFT do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    if cSvNmTemu <> '' then
      FieldByName('NmSch').AsString := cSvNmTemu;
    if nSvKdTemu <> 0 then
      FieldByName('KdTemu').AsInteger := nSvKdTemu;
    if FileExists(cDirVids + 'SvNmTemu.lbx') then begin
      DBComboNmTemu.Items.LoadFromFile(cDirVids + 'SvNmTemu.lbx');
      LbxSvNmTemu.Items.LoadFromFile(cDirVids + 'SvNmTemu.lbx');
    end;
    if FileExists(cDirVids + 'SvKdTemu.lbx') then begin
      DBComboKdTemu.Items.LoadFromFile(cDirVids +  'SvKdTemu.lbx');
      LbxSvKdTemu.Items.LoadFromFile(cDirVids +  'SvKdTemu.lbx');
    end;
  end;
;end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.bBtnOkByKdTemuClick(Sender: TObject);
var nKdTemu : SmallInt;
begin
   if cdsFTKdTemu.IsNull or (cdsFTKdTemu.AsInteger = 0) then begin
     ModalResult := mrNone;
     dbeKdTemu.SetFocus;
     ShowMessage('Код темы не может быть пустым или нулевым.'); end
   else with qryFi do begin
     nKdTemu := cdsFTKdTemu.AsInteger;
     if Active then Close;
     SQL.Clear;
     DataBaseName := CESMAIN;
     SQL.Add('Select t2.Grp, t2.NmSch NmGrp,t2.KdTemu KdTemuGrp,' +
             ' t.Grp PGR, t.NmSch NmPGR, t.KdTemu KdTemuPgr ' +
             ' from Kd_Temu t ' +
             ' Left outer Join Kd_Temu t2 on t2.Grp = t.Grp-1 ' +
             ' where t.KdTemu = :nKdTemu order by t.Grp');
     ParamByName('nKdTemu').AsInteger := nKdTemu;
     Open;
     if RecordCount = 0 then
      ShowMessage('Не найдена тема с кодом "' + IntToStr(nKdTemu) + '".')
     else if RecordCount = 1 then begin
       n_KdTemuGrp := FieldByName('KdTemuGrp').AsInteger;
       n_KdTemuPgr := FieldByName('KdTemuPgr').AsInteger;
       SaveTemuToLboxes;
     end;
   end;
 end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.SaveTemuToLboxes;
var cDbgMsg : ShortString;  i : SmallInt;
begin
  if not cdsFtKdTemu.IsNull then begin
    LbxSvKdTemu.Items.Clear;
    cDbgMsg := cdsFtKdTemu.AsString;
    if cDbgMsg > '' then
      LbxSvKdTemu.Items.Add(cDbgMsg);
    for i := 0 to DBComboKdTemu.Items.Count-1 do begin
      cDbgMsg := DBComboKdTemu.Items[i];
      if LbxSvKdTemu.Items.IndexOf(cDbgMsg) < 0 then
        LbxSvKdTemu.Items.Add(cDbgMsg);
      if i > 15 then
        Break;
    end;
    LbxSvKdTemu.Items.SaveToFile(cDirVids + 'SvKdTemu.lbx');
  end;
  if not cdsFtNmSch.IsNull then begin
    LbxSvNmTemu.Items.Clear;
    cDbgMsg := cdsFtNmSch.AsString;
    if cDbgMsg > '' then
      LbxSvNmTemu.Items.Add(cDbgMsg);
    for i := 0 to DBComboNmTemu.Items.Count-1 do begin
      cDbgMsg := DBComboNmTemu.Items[i];
      if LbxSvNmTemu.Items.IndexOf(cDbgMsg) < 0 then
        LbxSvNmTemu.Items.Add(cDbgMsg);
      if i > 15 then
        Break;
    end;
    LbxSvNmTemu.Items.SaveToFile(cDirVids + 'SvNmTemu.lbx');
  end;
;
end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.bBtnOkByNmTemuClick(Sender: TObject);
var nKdTemuGrp, nKdTemuPgr :SmallInt;
    cSvMsg, cMsg : ShortString;
begin
  with qryFi do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    cSvMsg := Trim(cdsFTNmSch.AsString);
    cMsg   := AnsiUpperCase(cSvMsg);
    SQL.Add('Select t2.Grp, t2.NmSch NmGrp,t2.KdTemu KdTemuGrp,' +
            ' t.Grp PGR, t.NmSch NmPGR, t.KdTemu KdTemuPgr ' +
            ' from Kd_Temu t ' +
            ' Left outer Join Kd_Temu t2 on t2.Grp = t.Grp-1 ' +
            ' where Upper(t.NmSch) containing "' + cMsg + '" ' +
            ' order by t.Grp');
    Open;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'FTemu.txt');
    if RecordCount = 0 then begin
       ShowMessage('Не найдена тема с входимостью "' + cSvMsg + '"');
       ModalResult := mrNone;
       DBComboNmTemu.SetFocus; end
    else if RecordCount = 1 then begin
      n_KdTemuGrp := FieldByName('KdTemuGrp').AsInteger;
      n_KdTemuPgr := FieldByName('KdTemuPgr').AsInteger; end
    else if ZFiTem2(qryFI, nKdTemuGrp, nKdTemuPgr)  {z_FTem2} then begin
      n_KdTemuGrp := nKdTemuGrp;
      n_KdTemuPgr := nKdTemuPgr;
    end;
    SaveTemuToLboxes;

//    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.DBComboKdTemuEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormFiTemu.DBComboKdTemuExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clWindow;
end;

end.
