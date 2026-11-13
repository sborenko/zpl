unit z_ETbPrp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Buttons, IniFiles, Mask, DBCtrls;

type
  TFormEaTblPrp = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dsrcTmp: TDataSource;
    Label1: TLabel;
    dbeDtBeg: TDBEdit;
    LabelPrcInv: TLabel;
    dbePrcInv: TDBEdit;
    LabelPrcRest: TLabel;
    dbePrcRest: TDBEdit;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    n_Case : integer;
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EdtAddTblPrp(nCase : integer; cdsTmp : TClientDataSet) : boolean;

const SECTION = 'z_ETbPrp';

var
  FormEaTblPrp: TFormEaTblPrp;

implementation

uses a_Const, a_Lib, z_Main, z_DM, z_tblPrp, a_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function EdtAddTblPrp(nCase : integer; cdsTmp : TClientDataSet) : boolean;
begin
  Result := false;
  FormEaTblPrp := TFormEaTblPrp.Create(Application);
  with FormEaTblPrp do begin
    n_Case := nCase;
    dsrcTmp.DataSet := cdsTmp;
    if cdsTmp.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование';
    if nCase = 1 then begin // в пенс. фонд
      LabelPrcInv.Visible := true;
      dbePrcInv.Visible := true;
      LabelPrcRest.Caption := 'для всех';
      dbePrcRest.Hint := 'Процент отчислений для всех'; end
    else begin  // в остальные фонды
      LabelPrcInv.Visible := false;
      dbePrcInv.Visible := false;
      LabelPrcRest.Caption := 'Процент отчислений:';
      dbePrcRest.Hint := 'Процент отчислений';
    end;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEaTblPrp.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 100);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEaTblPrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEaTblPrp.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEaTblPrp.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
function TFormEaTblPrp.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
(*
  if IsRecDtBeg(dbedDtBeg.DataSource.
             DataSet.FieldByName('Dt_Beg').AsDateTime) then
    mListErr.Add('Уже есть запись с датой ' + dbedDtBeg.DataSource.
             DataSet.FieldByName('Dt_Beg').AsString);
*)
  if MyEmptyDate(dbeDtBeg.Text) then
    mListErr.Add('Нет даты начала');
  if (n_Case = 1) and
           ((dbePrcInv.Text = '') or (dbePrcInv.Field.AsFloat <= 0)) then
    mListErr.Add('Нет процента для инвалидов');
  if (dbePrcRest.Text = '') or  (dbePrcRest.Field.AsFloat <= 0) then begin
    if n_Case = 1 then
      mListErr.Add('Нет процента для всех')
    else
      mListErr.Add('Нет процента отчислений');
  end;
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEaTblPrp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeDtBeg.SetFocus;
    end;
  end;
end;

end.
