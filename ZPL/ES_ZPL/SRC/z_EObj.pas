unit z_EObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Buttons, IniFiles, DBTables;

type
  TFormETObj = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelNmParent: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    sBtnSPZ: TSpeedButton;
    dbeShObj: TDBEdit;
    dbeNmObj: TDBEdit;
    dbeSpZ: TDBEdit;
    dbeFioUpoln: TDBEdit;
    dbeKdObj: TDBEdit;
    Label3: TLabel;
    qryTmp: TQuery;
    Label4: TLabel;
    dbeNrGO: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnSPZClick(Sender: TObject);
    procedure dbeSpZKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    //c_Msg, c_NmObj : string;
    //n_KdObj, n_KdSPZ : integer;
    b_EditMode : boolean;
    function CheckVvod : boolean;
    function CheckDoubleKdObj(cKdObj : ShortString) : boolean;
  public
    { Public declarations }
  end;

function AddEdtTObj(bEditMode : boolean; cMsg : string) : boolean;

const SECTION = 'Z_EObj';

var
  FormETObj: TFormETObj;

implementation

uses A_Const, A_Dm, A_ShwErr, A_SBU, z_TObj;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtTObj(bEditMode : boolean; cMsg : string) : boolean;
begin
  Result := false;
  FormETObj := TFormETObj.Create(Application);
  with FormETObj do begin
    b_EditMode := bEditMode;
    LabelNmParent.Caption := cMsg;
    if bEditMode then begin
      dbeKdObj.Enabled := false;
      dbeKdObj.Color := clBtnFace;
      Caption := 'Редактирование узла'; end
    else
      Caption := 'Новый узел';
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormETObj.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormETObj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormETObj.dbEditEnter(Sender: TObject);
begin
  if (Sender as TDBEdit).Enabled then
    (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormETObj.dbEditExit(Sender: TObject);
begin
  if (Sender as TDBEdit).Enabled then
    (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
function TFormETObj.CheckDoubleKdObj(cKdObj : ShortString) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdObj where KdObj = :nKdObj');
    ParamByName('nKdObj').AsInteger := StrToInt(cKdObj);
    Open;
    Result := (RecordCount > 0) and (not FieldByName('NR').IsNull);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormETObj.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (not b_EditMode) and CheckDoubleKdObj(dbeKdObj.Text) then
    mListErr.Add('Код ' + dbeKdObj.Text + ' уже занят в другой записи');
  if (dbeKdObj.Text = '') then
    mListErr.Add('Нет кода подразделения');
  if (dbeShObj.Text = '') then
    mListErr.Add('Нет шифра подразделения');
  if (dbeNmObj.Text = '') then
    mListErr.Add('Нет наименования');
  if dbeSpZ.Field.AsString = '' then
    mListErr.Add('Нет связанного счета БухУчета');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormETObj.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeShObj.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormETObj.sBtnSPZClick(Sender: TObject);
var nKdSpZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSPZ.SetFocus;
  nKdSpZ := dbeSpZ.DataSource.DataSet.FieldByName('KdSpZ').AsInteger;
  if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
    dbeSpZ.DataSource.DataSet.FieldByName('KdSpZ').AsInteger := nKdSpZ;
    dbeFioUpoln.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormETObj.dbeSpZKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZClick(Self);
end;

end.
