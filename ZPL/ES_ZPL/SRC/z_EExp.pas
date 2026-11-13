unit z_EExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, Buttons, ExtCtrls,
  Mask, DBCtrls;

type
  TFormEAExpFSS = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dbeTabN: TDBEdit;
    dbeFamIO: TDBEdit;

    dbeID: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    dbeDtDoc: TDBEdit;
    Label13: TLabel;
    dbeSerDoc: TDBEdit;
    Label14: TLabel;
    dbeNDoc: TDBEdit;
    dbeDtProc: TDBEdit;
    BitBtn1: TBitBtn;
    grBoxZ: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    sBtnUpi: TSpeedButton;
    Label9: TLabel;
    dbeIdP: TDBEdit;
    dbeFamP: TDBEdit;
    dbeImaP: TDBEdit;
    dbeOtchP: TDBEdit;
    Label4: TLabel;
    grboxA: TGroupBox;
    dbeNrAct: TDBEdit;
    dbeDtAct: TDBEdit;
    Label11: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    dbeSumma: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeTabNExit(Sender: TObject);
    procedure dbeTabNEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sBtnUpiClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function AddEdtPgr(qryPgr:TQuery; dsrcPgr: TDataSource): boolean;

const
 SECTION = 'z_EExp';

var
  FormEAExpFSS: TFormEAExpFSS;

implementation

uses A_Const, A_DM, A_Lib, Z_DM, Z_Main, z_GtQUpi, z_ShBln, A_ShwErr;


{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtPgr(qryPgr:TQuery; dsrcPgr: TDataSource): boolean;
begin
  Result := false;
  FormEAExpFSS :=  TFormEAExpFSS.Create(Application);
  with FormEAExpFSS do begin
    if  FormShowBln.qryPgr.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if qryPgr.FieldByName('TipD').AsInteger = 2 then begin
      Height         := 325;
      grboxZ.Top     := 137;
      grboxA.Visible := false;
      grboxZ.Visible := true; end
    else begin
      Height         := 258;
      grboxA.Visible := true;
      grboxZ.Visible := false;
    end;
    If ShowModal = mrOk then  begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAExpFSS.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAExpFSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAExpFSS.dbeTabNExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAExpFSS.dbeTabNEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAExpFSS.BitBtn1Click(Sender: TObject);
begin
//  if FormShowBln.qryPgr.UpdatesPending then
//     FormShowBln.qryPgr.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormEAExpFSS.sBtnUpiClick(Sender: TObject);
var nTabN : integer; cFam, cIma, cOtch, cFamIO, cDum : string;
begin
  dbeTabN.SetFocus;
  nTabN := FormShowBln.qryPgr.FieldByName('TabN').AsInteger;
  if GetUpiTabN(nTabN, cFam, cIma, cOtch, cFamIO, cDum) {z_GtQUpi} then begin
  with FormShowBln.qryPgr do begin
    DataBaseName := CESMAIN;
    if Active then Close;
    Open;
    Append;
    FieldByName('TabN').AsInteger   := nTabN;
    Post;
  end;

//    LabelFamIO.Caption := cFamIO;
//    dbeShVidN.SetFocus;
  end;
//  bTabNBySBtnUpi := false;
end;
//------------------------------------------------------------------------------
function TFormEAExpFSS.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dbeTabN.Text = '') then
    mListErr.Add('Не введен табельный номер покойного');
//  if qryPgr.FieldByName('TipD').AsInteger = 2 then begin
  if (dbeSerDoc.Text = '') then
    mListErr.Add('Не введена серия св-ва о смерти');
  if (dbeNDoc.Text = '') then
    mListErr.Add('Не введён номер св-ва о смерти');
   if myEmptyDate(dbeDtDoc.Text) then
    mListErr.Add('Не введена дата св-ва о смерти');
//  if ((dbeFamP.Text = '') or (dbeImaP.Text = '') or (dbeOtchP.Text = '') or
//                             (dbeIdP.Text = '') or (dbeSumma.Text = '')) then
//    mListErr.Add('Заполните ВСЕ полч раздеда "Данные заявителя"');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEAExpFSS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeTabN.SetFocus;
    end;
  end;
end;

end.
