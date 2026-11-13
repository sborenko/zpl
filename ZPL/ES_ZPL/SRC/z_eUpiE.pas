unit z_eUpiE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, IniFiles, DB, DBTables,
  ExtCtrls;

type
  TFormUpiEdt = class(TForm)
    PanelButtons: TPanel;
    bBtnOk: TBitBtn;
    bBtnCacel: TBitBtn;
    PanelMain: TPanel;
    Label13: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeTabNr: TDBEdit;
    dbeID: TDBEdit;
    dbeFam: TDBEdit;
    dbeIma: TDBEdit;
    dbeOtch: TDBEdit;
    PanelExtra: TPanel;
    DBCheckBox1: TDBCheckBox;
    Label12: TLabel;
    dbePol: TDBEdit;
    Label18: TLabel;
    dbeDOB: TDBEdit;
    dbeMyNotes: TDBEdit;
    Label5: TLabel;
    qryLS: TQuery;
    qryLSTABN: TIntegerField;
    qryLSDTBEG: TDateTimeField;
    qryLSLICSCH: TStringField;
    qryLSKDBNK: TSmallintField;
    qryLSShBnk: TStringField;
    qryLSNMBNK: TStringField;
    qryLSNOTES: TStringField;
    dsrcLS: TDataSource;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    dbeShBnk: TDBEdit;
    dbeLicSch: TDBEdit;
    Label10: TLabel;
    dbeDtBeg: TDBEdit;
    Label6: TLabel;
    sBtnELS: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure sBtnELSClick(Sender: TObject);
    procedure qryLSCalcFields(DataSet: TDataSet);
    procedure dbeShBnkKeyDown(Sender: TObject; var Key: Word;
                                                        Shift: TShiftState);
    procedure DBCheckBox1Enter(Sender: TObject);
    procedure DBCheckBox1Exit(Sender: TObject);
  private
    function CheckVvod : boolean;
    procedure OpenQryLS(nTabN : integer);
  public
    class function EdtUpi: Boolean;
  end;

const SECTION = 'z_eUpiE';

implementation

uses
  a_Const, a_DM, a_Lib, a_ShwErr, z_BnkLS, z_DM, z_Main, z_TUpi, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFormUpiEdt.EdtUpi: Boolean;
var nTabN : integer;
begin
  with TFormUpiEdt.Create(Application) do begin
    nTabN := dbeTabNr.Field.AsInteger;
    OpenQryLS(nTabN);

    Result := ShowModal = mrOk;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormUpiEdt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormUpiEdt.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeID.SetFocus;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormUpiEdt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormUpiEdt.OpenQryLS(nTabN : integer);
begin
  QryUtils.InitQuery(qryLS);
  with qryLS do begin
    SQL.Text :=
      'select * ' +
      'from z_Get_BnkLS(:TabN, :OnDate)';
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('OnDate').AsDateTime := Date;
    Open;
  end;
end;

//------------------------------------------------------------------------------
function TFormUpiEdt.CheckVvod : boolean;
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
procedure TFormUpiEdt.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiEdt.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiEdt.sBtnELSClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString; bWasUpdated : boolean;
    dOnDate : TDateTime;
begin
  nTabN  := dbeTabNr.Field.AsInteger;
  cFamIO := MyFamIO(dbeFam.Field.AsString, dbeIma.Field.AsString,
                                                dbeOtch.Field.AsString);
  dOnDate := Date;
  ShowBnkLS(nTabN, dOnDate, cFamIO, bWasUpdated);  {z_BnkLS}
  if bWasUpdated then begin
    Application.ProcessMessages;
    OpenQryLS(nTabN);
  end;
(*
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
*)
end;
//------------------------------------------------------------------------------
procedure TFormUpiEdt.qryLSCalcFields(DataSet: TDataSet);
var cNmBnk, cShBnk : ShortString;
begin
  cNmBnk := DmMain.KdBnk2NmBnk(qryLsKdBnk.AsInteger, cShBnk);
  qryLSShBnk.AsString := cShBnk;
end;
//------------------------------------------------------------------------------
procedure TFormUpiEdt.dbeShBnkKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnELS.Click;
end;

//------------------------------------------------------------------------------
procedure TFormUpiEdt.DBCheckBox1Enter(Sender: TObject);
begin
  (Sender as TDbCheckBox).Color := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFormUpiEdt.DBCheckBox1Exit(Sender: TObject);
begin
  (Sender as TDbCheckBox).Color := clBtnFace;
end;

end.
