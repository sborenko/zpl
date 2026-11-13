unit z_eVids;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB,
  DBTables;

type
  string3 = string[3];
  String4 = string[4];
  TFormEA2VidN = class(TForm)
    Bevel2: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label14: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dbeSPZ: TDBEdit;
    dbeNmVidNShort: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    dbeNmVidN: TDBEdit;
    Bevel1: TBevel;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelMsg: TLabel;
    qryTmp: TQuery;
    sBtnSPZ: TSpeedButton;
    sBtnClearSpZ: TSpeedButton;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    dbeVidN: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBCheckBox26: TDBCheckBox;
    Label32: TLabel;
    DBCheckBox27: TDBCheckBox;
    Label33: TLabel;
    dbeKEKV: TDBEdit;
    LabelDtBTDtE: TLabel;
    dbeDtBDtE: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    dbeSchDt: TDBEdit;
    sBtnSchDt: TSpeedButton;
    sBtnClearSchDt: TSpeedButton;
    Label26: TLabel;
    dbeSchKt: TDBEdit;
    sBtnSchKt: TSpeedButton;
    sBtnClearSchKt: TSpeedButton;
    Bevel3: TBevel;
    Label27: TLabel;
    DBCheckBox2: TDBCheckBox;
    Label22: TLabel;
    DBCheckBox3: TDBCheckBox;
    Label25: TLabel;
    chBoxSSrK: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure dbeKdVidNEnter(Sender: TObject);
    procedure dbeKdVidNExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnSPZClick(Sender: TObject);
    procedure sBtnClearSpZClick(Sender: TObject);
    procedure DBCheckBoxEnter(Sender: TObject);
    procedure DBCheckBoxExit(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure sBtnSchDtClick(Sender: TObject);
    procedure sBtnSchKtClick(Sender: TObject);
    procedure sBtnClearSchDtClick(Sender: TObject);
    procedure sBtnClearSchKtClick(Sender: TObject);
  private
    { Private declarations }
    c_VidN : string4;
    bEditMode : boolean;
    function CheckVvod : boolean;
    function KodZanjat(cVidN : string4) : boolean;
  public
    { Public declarations }
  end;

function AddEdtTVids(cLabelMsg, cNmKatVN : string;
                                     var cVidN : string4) : boolean;

const SECTION = 'z_eVids';

var
  FormEA2VidN: TFormEA2VidN;

implementation

uses A_Const, Z_DM, Z_Main, z_TVids, A_SBU, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtTVids(cLabelMsg, cNmKatVN : string;
                                         var cVidN : string4) : boolean;
begin
  Result := false;
  FormEA2VidN := TFormEA2VidN.Create(Application);
  with FormEA2VidN do begin
    LabelMsg.Caption := cLabelMsg;
    if dbeNmVidNShort.DataSource.State = dsInsert then begin
      bEditMode := false;
      Caption := '[Новая запись]';
//      dbeKdVidN.ReadOnly := false;
//      dbeKdVidN.Color := clWindow;
      dbeVidN.TabStop := true;
      dbeVidN.ReadOnly := false;
      dbeVidN.Color := clWindow;
      dbeVidN.TabStop := true; end
    else begin
      bEditMode := true;
      Caption := '[Редактирование записи]';
    end;
    if ShowModal = mrOk then begin
      if not bEditMode then
        cVidN   := c_VidN;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 150);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
  LabelDtBTDtE.Visible := bFlagDbg;
  dbeDtBDtE.Visible := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.dbeKdVidNEnter(Sender: TObject);
begin
  if not (Sender as TDBEdit).ReadOnly then
    (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.dbeKdVidNExit(Sender: TObject);
begin
  if not (Sender as TDBEdit).ReadOnly then
    (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
function TFormEA2VidN.KodZanjat(cVidN : string4) : boolean;
var nNR : integer;
begin
  Result := false;
  with dbeNmVidNShort.DataSource.DataSet as TQuery do begin
    if State = dsInsert then begin {Вводится новый элемент - проверить, чтобы
                                    предлагаемого кода вообще не было в Z_KdVidN}
      if qryTmp.Active then qryTmp.Close;
      qryTmp.SQL.Clear;
      qryTmp.DatabaseName := CESMAIN;
      qryTMP.SQL.Add('Select count(*) as CNT from Z_KdVidN ' +
                     ' where VidN = :cVidN');
      qryTmp.ParamByName('cVidN').AsString := cVidN;
      qryTmp.Open;
      if qryTmp.FieldByName('CNT').AsInteger > 0 then
        Result := true;
      qryTmp.Close;
      qryTmp.SQL.Clear;
      qryTmp.DatabaseName := ''; end
    else if State = dsEdit then begin {Редактируется элемент - проследить чтобы
             в редактируемую запись не подставили код, занятый в другой записи}
      nNR := FieldByName('NR').AsInteger;
      if qryTmp.Active then qryTmp.Close;
      qryTmp.SQL.Clear;
      qryTmp.DatabaseName := CESMAIN; 
      qryTMP.SQL.Add('Select count(*) as CNT from Z_KdVidN ' +
                     ' where (VidN = :cVidN) and (NR <> :nNR)');
      qryTmp.ParamByName('cVidN').AsString := cVidN;
      qryTmp.ParamByName('nNR').AsInteger := nNR;
      qryTmp.Open;
      if qryTmp.FieldByName('CNT').AsInteger > 0 then
        Result := true;
      qryTmp.Close;
      qryTmp.SQL.Clear;
      qryTmp.DatabaseName := '';
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormEA2VidN.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if KodZanjat(dbeVidN.Text) then
    mListErr.Add('Введенный код вида "' + dbeVidN.Text + '" уже занят!')
  else
    c_VidN := dbeVidN.Text;
  if dbeVidN.Text = '' then
    mListErr.Add('Не введен код вида');
  if dbeNmVidNShort.Text = '' then
    mListErr.Add('Нет шифра вида');
  if dbeNmVidN.Text = '' then
    mListErr.Add('Нет названия вида');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    dbeVidN.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.sBtnSPZClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSPZ := FieldByName('KdSPZ').AsInteger;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSPZ').asInteger := nKdSPZ;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.sBtnSchDtClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSPZ := FieldByName('KdSchDt').AsInteger;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSchDt').asInteger := nKdSPZ;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.sBtnSchKtClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSPZ := FieldByName('KdSchKt').AsInteger;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSchKt').asInteger := nKdSPZ;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.sBtnClearSpZClick(Sender: TObject);
begin
  dbeSPZ.DataSource.DataSet.FieldByName('KdSpz').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.sBtnClearSchDtClick(Sender: TObject);
begin
  dbeSPZ.DataSource.DataSet.FieldByName('KdSchDt').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.sBtnClearSchKtClick(Sender: TObject);
begin
  dbeSPZ.DataSource.DataSet.FieldByName('KdSchKt').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.DBCheckBoxEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.DBCheckBoxExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.DBMemo1Enter(Sender: TObject);
begin
  (Sender as TDBMemo).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEA2VidN.DBMemo1Exit(Sender: TObject);
begin
  (Sender as TDBMemo).Color := clWindow;
end;

end.
