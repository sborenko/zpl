unit a_EGoNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, StdCtrls, Mask, DBCtrls, DB, DBTables;

type
  TFormEGoNumbs = class(TForm)
    Label1: TLabel;
    dbeSchBU: TDBEdit;
    Label2: TLabel;
    dbeDtBeg: TDBEdit;
    Label3: TLabel;
    dbeGoNR: TDBEdit;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    bBtnApply: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnVubSchBU: TSpeedButton;
    bBtnOk: TBitBtn;
    Label5: TLabel;
    dbeKdSbu: TDBEdit;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure sBtnVubSchBUClick(Sender: TObject);
    procedure bBtnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeSchBUKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
  private
    { Private declarations }
    bInsertMode : boolean;
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EAGoNumbs(dsrcGo : TDataSource) : boolean;

const SECTION = 'a_EGoNum';

var
  FormEGoNumbs: TFormEGoNumbs;

implementation

{$R *.dfm}

uses a_Const, a_Sbu, {a_GoNum,} A_ShwErr;

//------------------------------------------------------------------------------
function EAGoNumbs(dsrcGo : TDataSource) : boolean;
begin
  Result := false;
  FormEGoNumbs := TFormEGoNumbs.Create(Application);
  with FormEGoNumbs do begin
    dbeSchBU.DataSource := dsrcGO;
    dbeDtBeg.DataSource := dsrcGO;
    dbeGoNR.DataSource  := dsrcGO;
    dbeKdSbu.DataSource := dsrcGO;
    dbeNotes.DataSource := dsrcGO; 
    dbeKdSbu.Visible := bFlagDbg;
    bInsertMode := (dbeKdSbu.DataSource.State = dsInsert);
    if bInsertMode then begin
      Caption := 'Новая запись';
      bBtnApply.Visible := bFlagDbg; end
    else begin
      Caption := 'Редактирование записи';
      bBtnApply.Visible := false;
    end;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEGoNumbs.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEGoNumbs.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEGoNumbs.sBtnVubSchBUClick(Sender: TObject);
var nKdSBU : integer;
    cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSchBU.SetFocus;
  nKdSBU := dbeKdSbu.Field.AsInteger;       //.Field.AsInteger;
  if GetSBU(nKdSBU, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
    dbeSchBU.Text := cSchBU;
    dbeKdSbu.Field.AsInteger := nKdSBU;
    dbeDtBeg.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEGoNumbs.bBtnApplyClick(Sender: TObject);
begin
  if CheckVvod then with dbeKdSbu.DataSource.DataSet do begin
    Post;
    Append;
  end;
  dbeSchBU.SetFocus;
end;
//------------------------------------------------------------------------------
procedure TFormEGoNumbs.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 300);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEGoNumbs.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    dbeSchBU.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEGoNumbs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEGoNumbs.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if dbeKdSbu.Field.IsNull then
    mListErr.Add('Не заполнено поле "Cчёт"');
  if dbeGoNR.Field.IsNull or (dbeGoNR.Field.AsString = '') then
    mListErr.Add('Не заполнено поле "№ ж/рд"');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEGoNumbs.dbeSchBUKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVubSchBU.Click;
end;

end.
