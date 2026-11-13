unit Z_eDPere;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, Mask, DBCtrls, DB, DBTables;

type
  TFormEADPere = class(TForm)
    Label1: TLabel;
    dbePrcOkl: TDBEdit;
    Label2: TLabel;
    dbeOklTrf: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    dbeSPZ: TDBEdit;
    sBtnSPZ: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    dbeShSps: TDBEdit;
    sBtnKdSps: TSpeedButton;
    Label7: TLabel;
    dbeKdObj: TDBEdit;
    dbeShObj: TDBEdit;
    sBtnObj: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnSPZClick(Sender: TObject);
    procedure dbelEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure dbeSPZKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sBtnKdSpsClick(Sender: TObject);
    procedure dbeShSpsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sBtnObjClick(Sender: TObject);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EdtAddDPere : boolean;

const SECTION = 'Z_eDPere';

var
  FormEADPere: TFormEADPere;

implementation

uses a_Const, Z_DM, z_Main, z_EPere, A_SBU, a_ShKSps, A_ShwErr, z_TObj;


{$R *.dfm}

//------------------------------------------------------------------------------

function EdtAddDPere : boolean;
var cCaption : ShortString;
begin
  Result := false;
  FormEADPere := TFormEADPere.Create(Application);
  with FormEADPere do begin
    if  dbePrcOkl.Field.DataSet.State = dsEdit then
      cCaption := 'Редактирование записи'
    else
      cCaption := 'Новая запись';
    Caption := cCaption;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEADPere.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dbePrcOkl.Text = '') then
    mListErr.Add('Нет процента оклада');
  if (dbeOklTrf.Text = '') then
    mListErr.Add('Нет суммы оклада');
  if (not dbeOklTrf.Field.IsNull) and (dbeOklTrf.Field.AsInteger < 0) then
    mListErr.Add('Сумма оклада должна быть больше или равна 0');
  if (dbeSPZ.Text = '') then
    mListErr.Add('Нет СчётаБУ (источника финансирования)');
  if (dbeShObj.Text = '') then
    mListErr.Add('Не выбано подразделение');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    dbePrcOkl.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.sBtnSPZClick(Sender: TObject);
var nKdSpZ : integer; cSchBU, cPSch, cNmSchBU : string; bHsCh : boolean;
begin
  dbeSPZ.SetFocus;
  with dbeSPZ.DataSource.DataSet do begin
    nKdSpZ := FieldByName('KdSpz').AsInteger;
    if GetSbu(nKdSpZ, cSchBU, cPSch, cNmSchBU, bHsCh) {A_SBU} then begin
      FieldByName('KdSPZ').AsInteger := nKdSpZ;
      dbeNotes.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.dbelEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                      Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.sBtnKdSpsClick(Sender: TObject);
var n_KdSps : integer; var cShSps, cNmSps : string;
begin
  dbeShSps.SetFocus;
  n_KdSps := dbeShSps.DataSource.DataSet.FieldByName('KdSps').AsInteger;
  if GetKdSps(n_KdSps, cShSps, cNmSps) {a_ShKSps} then begin
    dbeShSps.DataSource.DataSet.FieldByName('KdSps').AsInteger := n_KdSps;
    dbePrcOkl.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.dbeShSpsKeyDown(Sender: TObject; var Key: Word;
                                                        Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdSpsClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEADPere.sBtnObjClick(Sender: TObject);
var nKdObj, nKdSpZ : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  dbeKdObj.SetFocus;
  nKdObj := dbeKdObj.DataSource.DataSet.FieldByName('KdObj').AsInteger;
  if GetKdObj(nKdObj, nKdSpZ, cShObj, cNmObj, bWasUpdated) {z_TObj} then begin
    dbeKdObj.DataSource.DataSet.FieldByName('KdObj').AsInteger := nKdObj;
    dbeNotes.SetFocus;
  end;
end;

end.
