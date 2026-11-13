unit z_ESpB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, StdCtrls, Mask, DBCtrls, DB;

type
  TFormEASpB = class(TForm)
    Label1: TLabel;
    dbeTabN: TDBEdit;
    Label2: TLabel;
    dbeFamIO: TDBEdit;
    Label3: TLabel;
    dbeKdSps: TDBEdit;
    Label4: TLabel;
    dbeKdObj: TDBEdit;
    Label5: TLabel;
    dbeKdKatP: TDBEdit;
    Label6: TLabel;
    dbeKdSpZ: TDBEdit;
    Label7: TLabel;
    dbeSpZ: TDBEdit;
    Label8: TLabel;
    dbeMaxSm: TDBEdit;
    Label9: TLabel;
    dbeSmToVed: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCacel: TBitBtn;
    Label10: TLabel;
    dbeKdBnk: TDBEdit;
    Label11: TLabel;
    dbeLS: TDBEdit;
    sBtnTabN: TSpeedButton;
    sBtnSpZ: TSpeedButton;
    sBtnBnkLS: TSpeedButton;
    dbeNmBnk: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure sBtnTabNClick(Sender: TObject);
    procedure sBtnSpZClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnBnkLSClick(Sender: TObject);
    procedure dbeKdBnkDblClick(Sender: TObject);
    procedure dbeLSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    function CheckVvod : boolean;
  public
    { Public declarations }
    nSvKdSpz : SmallInt;
    cSvSpZ, cSvPSCH : ShortString;
  end;

function EASpb(dDtPrc : TDateTime) : boolean;

const SECTION = 'z_ESpB';

var
  FormEASpB: TFormEASpB;

implementation

uses A_Const, A_DM, Z_DM, Z_Main, A_Lib, Z_VedV, z_TUpi, z_ShwBnk, z_BnkLS,
     A_SBU, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function EASpb(dDtPrc : TDateTime) : boolean;
begin
  Result := false;
  FormEASpB := TFormEASpB.Create(Application);
  with FormEASpB do begin
    d_DtPrc := dDtPrc;
    if dbeTabN.DataSource.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then begin
      nSvKdSpz := dbeKdSpZ.Field.AsInteger;
      cSvSpZ   := dbeSpZ.Field.AsString;
      cSvPSCH  := FormVedV.cdsSpbPSCH.AsString;
      Result   := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 50);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEASpB.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dbeTabN.Text = '') or (dbeTabN.Text = '0') then
    mListErr.Add('Не введен табельный номер')
  else if (dbeFamIO.Text = '') then
    mListErr.Add('Некорректный табельный номер');
  if (dbeSPZ.Text = '') then
    mListErr.Add('Не выбран счёт БухУчета (источник финансирования)');
  if dbeKdBnk.Field.IsNull or (dbeKdBnk.Field.AsString = '') then
    mListErr.Add('Не выбран банк');
  if (dbeNmBnk.Field.AsString = '') then
    mListErr.Add('Некорректно выбран банк');
  if dbeLS.Field.IsNull or (dbeLS.Field.AsString = '') then
    mListErr.Add('Отсутствует лицевой счет');
  if dbeSmToved.Field.IsNull or (dbeSmToVed.Field.AsFloat <= 0) then
    mListErr.Add('Сумма должна быть больше нуля');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeTabN.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TRY
    with TIniFile.Create(cNmIniFile) do begin
      WriteInteger(SECTION, 'wL', Left);
      WriteInteger(SECTION, 'wT', Top);
      Free;
    end;
  EXCEPT
  ;
  END;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.sBtnTabNClick(Sender: TObject);
var nTabN, nKdObj, nKdKatP : integer; n_KdSps : SmallInt;
    cFam, cIma, cOtch : string; bWasUpdated : boolean;
begin
  dbeTabN.SetFocus;
  nTabN := FormVedV.cdsSpbTabN.AsInteger;
  if GetTabN(nTabN, nKdObj, nKdKatP, n_KdSps, cFam, cIma, cOtch,
                                           bWasUpdated) {z_TUpi} then begin
    FormVedV.cdsSpbTabN.AsInteger := nTabN;
    dbeSpZ.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.sBtnSpZClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSPZ.SetFocus;
  with dbeKdSPZ.DataSource.DataSet do begin
    nKdSpZ := dbeKdSpZ.Field.AsInteger;
    cSchBU := dbeSpZ.Field.AsString;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if bHsCh then begin
        ShowMessage('Выбранный счёт имеет СубСчета - на него относить нельзя');
        dbeSPZ.SetFocus;
        Exit;
      end;
      dbeKdSpZ.Field.AsInteger := nKdSpZ;
      dbeSpZ.Field.AsString := cSchBU;
      dbeKdBnk.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.sBtnBnkLSClick(Sender: TObject);
var nTabN : integer; nKdBnk : SmallInt;
    cNmBnk, cFamIO, cLS : ShortString;
    bWasUpdated : boolean;
    dVedDate : TDateTime;
begin
  if dbeTabN.Field.IsNull then
    Exit;
  dbeLS.SetFocus;
  dVedDate := FormVedV.qryVedVEDDATE.AsDateTime;
  with FormVedV.cdsSpb do begin
    nTabN  := FormVedV.cdsSpbTabN.AsInteger;
    cFamIO := FormVedV.cdsSpbFamIO.AsString;
    nKdBnk := FormVedV.cdsSpbKdBnk.AsInteger;
    cLS    := FormVedV.cdsSpbLS.AsString;
    cNmBnk := FormVedV.cdsSpbNmBnk.AsString;
    if GetBnkSpecLS(nTabN, dVedDate, cFamIO, nKdBnk, cNmBnk, cLS,
                                              bWasUpdated) {z_BnkLS} then begin
      FormVedV.cdsSpbKdBnk.AsInteger := nKdBnk;
      FormVedV.cdsSpbNmBnk.AsString  := cNmBnk;
      FormVedV.cdsSpbLS.AsString     := cLS;
      dbeSmToVed.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.dbeKdBnkDblClick(Sender: TObject);
begin
  sBtnBnkLS.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEASpB.dbeLSKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_RETURN) then
    sBtnBnkLS.Click;
end;

end.
