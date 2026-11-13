unit Z_eLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, IniFiles, StdCtrls, Mask, DBCtrls, DB, DBTables, Buttons;

type
  TFormLS = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label2: TLabel;
    dbeLS: TDBEdit;
    Label3: TLabel;
    dbeNmBnk: TDBEdit;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    sBtnBank: TSpeedButton;
    dbeKdBnk: TDBEdit;
    Label1: TLabel;
    dbeDtBeg: TDBEdit;
    Label5: TLabel;
    dbeTabN: TDBEdit;
    procedure sBtnBankClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEditEnter(Sender: TObject);
    procedure DBEditExit(Sender: TObject);
    procedure dbeKdBnkKeyDown(Sender: TObject; var Key: Word;
                                                        Shift: TShiftState);
  private
    { Private declarations }
    n_LastKdBank : integer;
    b_CloseLS : boolean;
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function AddEdtLS(cCaption : string; bSpbLS, bCloseLS : boolean) : boolean;

const SECTION = 'Z_AeLS';

var
  FormLS: TFormLS;

implementation

uses A_Const, Z_DM, Z_Main, Z_BnkLS, Z_ShwBnk, a_Lib, a_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtLS(cCaption : string; bSpbLS, bCloseLS : boolean) : boolean;
begin
  Result := false;
  FormLS := TFormLS.Create(Application);
  with FormLS do begin
    b_CloseLS := bCloseLS;
    Caption := cCaption;
    dbeDtBeg.Enabled := not bCloseLS;
    dbeKdBnk.Enabled := not bCloseLS;
    dbeNmBnk.Enabled := not bCloseLS;
    dbeLS.Enabled    := not bCloseLS;
    sBtnBank.Enabled := not bCloseLS;
    if not bSpbLS then
      Color := clBtnFace
    else
      Color := clFuchsia;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormLS.sBtnBankClick(Sender: TObject);
var nKdBnk : SmallInt; cDummy : ShortString;
begin
  dbeNmBnk.SetFocus;
  if dbeNmBnk.DataSource.DataSet.FieldByName('KdBnk').IsNull then
    nKdBnk := 0
  else
    nKdBnk := dbeNmBnk.DataSource.DataSet.FieldByName('KdBnk').AsInteger;
  if GetZplBank(nKdBnk, cDummy, cDummy) {Z_ShwBnk} then begin
    dbeNmBnk.DataSource.DataSet.FieldByName('KdBnk').AsInteger := nKdBnk;
    dbeLS.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormLS.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 350);
    Top  := ReadInteger(SECTION, 'wT', 500);
    n_LastKdBank := ReadInteger(SECTION, 'nLastKdBank', 0);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormLS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TRY
    with TIniFile.Create(cNmIniFile) do begin
      WriteInteger(SECTION, 'wL', Left);
      WriteInteger(SECTION, 'wT', Top);
      if not dbeNmBnk.DataSource.DataSet.
                              FieldByName('KdBnk').IsNull then
        WriteInteger(SECTION, 'nLastKdBank',
                               dbeNmBnk.DataSource.DataSet.
                                     FieldByName('KdBnk').AsInteger);
      Free;
    end;
  EXCEPT
  ;
  END;
end;
//------------------------------------------------------------------------------
function TFormLS.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if MyEmptyDate(dbeDtBeg.Field.AsString) then
    mListErr.Add('Нет даты "Начиная с:"');
  if (dbeKdBnk.Text = '') or (dbeNmBnk.Text = '') then
    mListErr.Add('Не выбран банк');
  if (dbeLS.Text = '') then
    mListErr.Add('Не введен лицевой счет');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormLS.FormCloseQuery(Sender: TObject;
                                             var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not b_CloseLS and not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeLS.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormLS.DBEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormLS.DBEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormLS.dbeKdBnkKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnBank.Click;
end;

end.
