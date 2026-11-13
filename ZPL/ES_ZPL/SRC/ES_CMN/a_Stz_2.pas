unit a_Stz_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, ExtCtrls, Grids, DBGrids, Provider, DBTables, DBClient,
  StdCtrls, Buttons, Menus;

type
  TFormStz_2 = class(TForm)
    cdsStZ: TClientDataSet;
    qryTmp: TQuery;
    dspTmp: TDataSetProvider;
    dsrcStZ: TDataSource;
    dbgrStZ: TDBGrid;
    Panel1: TPanel;
    qryStz2: TQuery;
    dsrcStz2: TDataSource;
    dbgrStz2: TDBGrid;
    qryStz2NR: TIntegerField;
    qryStz2KDSTZ: TSmallintField;
    qryStz2SHSTZ: TStringField;
    qryStz2KDSTZ2: TSmallintField;
    qryStz2SHSTZ2: TStringField;
    qryStz2NMSTZ2: TStringField;
    cdsStZSHSTZ: TStringField;
    cdsStZKDSTZ: TSmallintField;
    cdsStZNMSTZ: TStringField;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    popStz2: TPopupMenu;
    popStz: TPopupMenu;
    popStz2Edt: TMenuItem;
    popStz2Add: TMenuItem;
    popStz2Del: TMenuItem;
    popStz2Head: TMenuItem;
    popStzHead: TMenuItem;
    popStzAddKEKV: TMenuItem;
    updStz2: TUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure popStzAddKEKVClick(Sender: TObject);
    procedure popStz2Popup(Sender: TObject);
    procedure popStz2EdtClick(Sender: TObject);
    procedure popStz2AddClick(Sender: TObject);
    procedure dbgrStz2DblClick(Sender: TObject);
    procedure popStz2DelClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreOpenCdsSpz(nKdStZ : SmallInt);
    procedure OpenQryStz2;
    function ExistsInStZ(nKdStZ : SmallInt) : boolean;
    function GetNewShStz2(nKdStz : SmallInt) : ShortString;
    function GetNewKdStz2 : integer;
    function MyCanDelKdStz2(nKdStz2 : SmallInt) : boolean;
  public
    { Public declarations }
    b_VuborMode : boolean;
    n_KdStZ : SmallInt;
    procedure SetDbgrStz2Columns;
  end;

procedure ShwStz2;
function GetStz2(nKdStZ : SmallInt; var nKdStz2 : SmallInt;
                                  var cShStz2, cNmStz2 : ShortString) : boolean;

const SECTION = 'a_Stz_2';

var
  FormStz_2: TFormStz_2;

implementation

uses a_Const, A_DM, a_StZ, a_EStz2, A_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwStz2;
begin
  FormStz_2 := TFormStz_2.Create(Application);
  with FormStz_2 do begin
    b_VuborMode := false;
    n_KdStZ := 0;
    Caption := 'КЕКВ''ы и входящие в них расходы';
    CreOpenCdsSpz(0);
    OpenQryStz2;
    SetDbgrStz2Columns;
    bBtnOk.Visible := false;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetStz2(nKdStZ : SmallInt; var nKdStz2 : SmallInt;
                                  var cShStz2, cNmStz2 : ShortString) : boolean;
begin
  Result := false;
  FormStz_2 := TFormStz_2.Create(Application);
  with FormStz_2 do begin
    b_VuborMode := true;
    n_KdStZ := n_KdStZ;
    Caption := 'КЕКВ''ы и входящие в них расходы';
    CreOpenCdsSpz(nKdStZ);
    OpenQryStz2;
    SetDbgrStz2Columns;
    bBtnOk.Visible := true;
    bBtnCancel.Caption := 'Отказ';
    if (ShowModal = mrOk) and (qryStz2.RecordCount > 0) then begin
      nKdStz2 := qryStz2KdStz2.AsInteger;
      cShStz2 := qryStz2ShStz2.AsString;
      cNmStz2 := qryStz2NmStz2.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.CreOpenCdsSpz(nKdStZ : SmallInt);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct s2.KdStZ, s2.shStz , s.NmStZ from Kd_Stz2 s2 ' +
            ' Left Outer Join ' + tbl_KdStZ + ' s on s.KdStz = s2.KdStZ');
    if nKdStZ <> 0 then begin
      SQL.Add('where s2.KdStZ = :nKdStZ');
      ParamByName('nKdStZ').AsInteger := nKdStZ;
    end;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsStZ do begin
    if Active then Close;
    ProviderName := 'dspTmp';
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Top    := ReadInteger(SECTION, 'wT', 100);
    Left   := ReadInteger(SECTION, 'wL', 100);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 450);
    dbgrStZ.Width := ReadInteger(SECTION, 'grStzW', 275);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grStzW', dbgrStZ.Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.OpenQryStz2;
begin
  with qryStz2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcStZ;
    SQL.Add('Select * from Kd_Stz2 where KdStz = :KdStz order by ShStz2');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.popStzAddKEKVClick(Sender: TObject);
var nKdStZ : integer; cShStZ, cNmStZ : string;
begin
  if GetStZ(nKdStZ, cShStZ, cNmStZ) {a_StZ} then begin
    if ExistsInStZ(nKdStZ) then
      ShowMessage('КЕКВ ' + cShStZ + ' ' + cNmStZ +
                                   ' уже есть в левой таблице')
    else with cdsStz do begin
      Append;
      cdsStzKdStz.AsInteger := nKdStZ;
      cdsStzShStz.AsString := cShStZ;
      cdsStzNmStz.AsString := cNmStz;
      Post;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormStz_2.ExistsInStZ(nKdStZ: SmallInt): boolean;
var nSvKdStZ : SmallInt;
begin
  Result := false;
  with cdsStZ do begin
    nSvKdStz := FieldByName('KdStZ').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('KdStZ').AsInteger = nKdStZ then begin
        Result := true;
        Break;
      end;
      Next;
    end;
    Locate('KdStZ', nSvKdStZ, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.popStz2Popup(Sender: TObject);
begin
  popStz2Edt.Enabled := qryStz2.RecordCount > 0;
  popStz2Del.Enabled := popStz2Edt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.popStz2EdtClick(Sender: TObject);
begin
  with qryStz2 do begin
    Edit;
    if EAStz2 {a_EStz2} then begin
      Post;
      if UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryStz2]); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
function TFormStz_2.GetNewShStz2(nKdStz : SmallInt) : ShortString;
var cBukva : Char;   nOrdBukva : integer;
    cShort : ShortString;
begin // константа cBukovki = 'абвгдежзийклмнопрстуфхцчшщюэя'; // cyrl 29 букв
      // объявлена в unit a_Const 
  Result := cBukovki[1];
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(ShStz2) as MaxShStz2 from Kd_Stz2 ' +
            ' where KdStz = :nKdStz');
    ParamByName('nKdStZ').AsInteger := nKdStz;
    Open;
    cShort := FieldByName('MaxShStz2').AsString;
    if cShort > '' then begin
      cBukva := cShort[1];
      nOrdBukva := Pos(cBukva, cBukovki);
      Inc(nOrdBukva);
      Result := cBukovki[nOrdBukva];
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormStz_2.GetNewKdStz2: integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 NR, Gen_Id(Kd_Stz2_Kd, 1) as NextKd ' +
             // Прямое обращение к генератору. Из какой таблицы - всё равно
            ' from e_Days');                   // (только надо не из пустой)
    Open;
    Result := FieldByName('NextKd').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.popStz2AddClick(Sender: TObject);
var nSvNR : integer; nKdStZ : SmallInt; cShStZ : ShortString;
begin
  nSvNR := 0;
  with qryStz2 do begin
    if RecordCount > 0 then begin
      nSvNR := qryStz2NR.AsInteger;
      Last;
      if qryStz2ShStz2.AsString = 'я' then begin
        Locate('NR', nSvNR, []);
        ShowMessage('Кончились буковки. Последняя "я".');
        Exit;
      end;
    end;
    nKdStZ := cdsStzKdStZ.AsInteger;
    cShStz := cdsStzShStz.AsString;
    Append;
    qryStz2KdStz.AsInteger := nKdStZ;
    qryStz2ShStz.AsString  := cShStZ;
    qryStz2ShStz2.AsString := GetNewShStz2(nKdStz);
    if EAStz2 {a_EStz2} then begin
      qryStz2KdStz2.AsInteger := GetNewKdStz2;
      Post;
      if UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryStz2]); end
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.dbgrStz2DblClick(Sender: TObject);
begin
  if b_VuborMode and (qryStz2.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.popStz2DelClick(Sender: TObject);
var bCanDelete : boolean; nKdStz2 : SmallInt;
begin
  nKdStz2 := qryStz2KdStz2.AsInteger;
  bCanDelete := MyCanDelKdStz2(nKdStz2);
  if not bCanDelete then
    ShowMessage('Запись удалять нельзя - на неё есть ссылки в таблице проводок')
  else if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
               mtWarning, [mbYes, mbNo], 0) = mrYes then with qryStz2 do begin
    Delete;
    if UpdatesPending then
      Form_Dm.DbMain.ApplyUpdates([qryStz2]);
  end;
end;
//------------------------------------------------------------------------------
function TFormStz_2.MyCanDelKdStz2(nKdStz2: SmallInt): boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from p_Prv where KdStz2 = :nKdStz2');
    ParamByName('nKdStz2').AsInteger := nKdStz2;
    Open;
    Result := RecordCount <= 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStz_2.SetDbgrStz2Columns;
var i : SmallInt; cFldNm : ShortString;
begin
  for i := 0 to dbgrStz2.Columns.Count-1 do begin
    cFldNm := dbgrStz2.Columns[i].FieldName;
    if cFldNm = 'KDSTZ2' then
      dbgrStz2.Columns[i].Visible := false; //bFlagDbg;
  end;
end;

end.
