unit z_EUpi2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, IniFiles, DB, DBTables;

type
  TFormEUpi2 = class(TForm)
    Label13: TLabel;
    dbeTabNr: TDBEdit;
    Label7: TLabel;
    dbeID: TDBEdit;
    Label1: TLabel;
    dbeFam: TDBEdit;
    Label2: TLabel;
    dbeIma: TDBEdit;
    Label3: TLabel;
    dbeOtch: TDBEdit;
    Label12: TLabel;
    dbePol: TDBEdit;
    Label18: TLabel;
    dbeDOB: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCacel: TBitBtn;
    qryLS: TQuery;
    qryLSNR: TIntegerField;
    qryLSTABN: TIntegerField;
    qryLSDTBEG: TDateTimeField;
    qryLSLICSCH: TStringField;
    qryLSKDBNK: TSmallintField;
    qryLSNOTES: TStringField;
    dsrcLS: TDataSource;
    updLS: TUpdateSQL;
    Label8: TLabel;
    Label9: TLabel;
    sBtnKdBnk: TSpeedButton;
    Label10: TLabel;
    dbeLicSch: TDBEdit;
    qryLSShBnk: TStringField;
    Label4: TLabel;
    dbeShBnk: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure sBtnKdBnkClick(Sender: TObject);
    procedure qryLSCalcFields(DataSet: TDataSet);
    procedure dbeShBnkKeyDown(Sender: TObject; var Key: Word;
                                                        Shift: TShiftState);
  private
    { Private declarations }
    function CheckVvod : boolean;
    procedure OpenQryLS(nTabN : integer);
  public
    { Public declarations }
  end;

function EdtUpi : boolean;

const SECTION = 'z_EUpi2';

var
  FormEUpi2: TFormEUpi2;

implementation

uses A_Const, A_DM, Z_DM, z_Main, A_ShwErr, z_TUpi, Z_ShwBnk;

{$R *.dfm}

//------------------------------------------------------------------------------
function EdtUpi : boolean;
var nTabN : integer;
begin
  Result := false;
  FormEUpi2 := TFormEUpi2.Create(Application);
  with FormEUpi2 do begin
    Caption := 'Редактирование записи';
    nTabN := dbeTabNr.Field.AsInteger;
    OpenQryLS(nTabN);
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi2.OpenQryLS(nTabN : integer);
begin
  with qryLS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_BankiLS where TABN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEUpi2.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if dbeFam.Text = '' then
    mListErr.Add('Нет фамилии');
  if dbeIma.Text = '' then
    mListErr.Add('Нет имени');
  if dbeOtch.Text = '' then
    mListErr.Add('Нет отчества');
  if dbePol.Text = '' then
    mListErr.Add('Не введен пол');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeID.SetFocus; end
    else begin
      if (qryLS.State = dsInsert) or (qryLS.State = dsEdit) then
        qryLS.Post;
      if qryLSLicSch.AsString > '' then
        Form_DM.DbMain.ApplyUpdates([qryLS]);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi2.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi2.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi2.sBtnKdBnkClick(Sender: TObject);
var nKdBnk : SmallInt; cShBnk, cNmBnk : ShortString;
begin
  dbeShBnk.SetFocus;
  with qryLS do begin
    nKdBnk := qryLSKdBnk.AsInteger;
    if GetZplBank(nKdBnk, cShBnk, cNmBnk) {Z_ShwBnk} then begin
      if (RecordCount > 0) and (State = dsBrowse) then
        Edit
      else if (RecordCount = 0) then
        Append;
      qryLSKdBnk.AsInteger := nKdBnk;
      if qryLSTabN.IsNull then
        qryLSTabN.AsInteger := dbeTabNr.Field.AsInteger;
      Post;
      dbeLicSch.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi2.qryLSCalcFields(DataSet: TDataSet);
var cNmBnk, cShBnk : ShortString;
begin
  cNmBnk := DmMain.KdBnk2NmBnk(qryLsKdBnk.AsInteger, cShBnk);
  qryLSShBnk.AsString := cShBnk;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi2.dbeShBnkKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdBnk.Click;
end;

end.
