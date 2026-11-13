unit z_EALgt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, StdCtrls, Mask, DBCtrls, DB, DBTables;

type
  TFormEALgt = class(TForm)
    Label1: TLabel;
    dbeKdLgt: TDBEdit;
    Label2: TLabel;
    dbeShLgt: TDBEdit;
    Label3: TLabel;
    dbeDtBeg: TDBEdit;
    Label4: TLabel;
    dbeDtEnd: TDBEdit;
    Label5: TLabel;
    dbePrcLgt: TDBEdit;
    Label6: TLabel;
    dbeNrDoc: TDBEdit;
    Label7: TLabel;
    dbeDtDoc: TDBEdit;
    Label8: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnKdLgt: TSpeedButton;
    Label9: TLabel;
    dbeOznPilg: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure sBtnKdLgtClick(Sender: TObject);
    procedure dbeKdLgtDblClick(Sender: TObject);
    procedure dbeKdLgtKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeKdLgtExit(Sender: TObject);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EALgt : boolean;

const SECTION = 'z_EALgt';

var
  FormEALgt: TFormEALgt;

implementation

uses a_Dm, a_Const, z_Dm, z_Main, z_Lgotu, z_GtKdLg, a_Lib, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function EALgt : boolean;
begin
  Result := false;
  FormEALgt := TFormEALgt.Create(Application);
  with FormEALgt do begin
    if dbeKdLgt.DataSource.State = dsInsert then
      Caption := 'Новая льгота'
    else
      Caption := 'Редактирование льготы';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEALgt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEALgt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEALgt.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEALgt.dbeKdLgtExit(Sender: TObject);
var nKdLgt, nOznPilg : SmallInt; cShLgt, cNmLgt : ShortString;
begin
  nKdLgt := dbeKdLgt.Field.AsInteger;
  if not dbeKdLgt.Field.IsNull and (dbeKdLgt.Field.AsInteger > 0) then begin
    nKdLgt := dbeKdLgt.Field.AsInteger;
    if CheckKdLgt(nKdLgt, nOznPilg, cShLgt, cNmLgt) then begin
      dbeOznPilg.Field.AsInteger := nOznPilg;
      dbeShLgt.Field.AsString    := cShLgt;
      (Sender as TDBEdit).Color  := clWindow; end
    else begin
      dbeOznPilg.Field.AsString := '';
      dbeShLgt.Field.AsString   := '';
      ShowMessage('Код льготы "' + IntToStr(nKdLgt) +
                                     '" отсутствует в спр-ке льгот');
      dbeKdLgt.SetFocus;
    end; end
  else if (not dbeKdLgt.Field.IsNull) or
                                 (dbeKdLgt.Field.AsInteger <= 0) then begin
    dbeOznPilg.Field.AsString := '';
    dbeShLgt.Field.AsString   := '';
    ShowMessage('Код льготы не должен быть пустым или отрицательным');
    dbeKdLgt.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEALgt.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEALgt.sBtnKdLgtClick(Sender: TObject);
var nKdLgt, nOznPilg : SmallInt; cShLgt, cNmLgt : ShortString;
begin
  dbeKdLgt.SetFocus;
  nKdLgt := dbeKdLgt.Field.AsInteger;
  if GetKdLgt(nKdLgt, nOznPilg, cShLgt, cNmLgt) {z_GtKdLg} then begin
    dbeKdLgt.Field.AsInteger := nKdLgt;
    dbeOznPilg.Field.AsInteger := nOznPilg;
    dbeShLgt.Field.AsString := cShLgt;
    dbeDtBeg.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEALgt.dbeKdLgtDblClick(Sender: TObject);
begin
  sBtnKdLgt.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEALgt.dbeKdLgtKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdLgt.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEALgt.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    dbeKdLgt.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
function TFormEALgt.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if dbeKdLgt.Field.IsNull or (dbeKdLgt.Field.AsString = '') then
    mListErr.Add('Не введена льгота');
  if dbeDtBeg.Field.IsNull or MyEmptyDate(dbeDtBeg.Field.AsString) then
    mListErr.Add('Нет даты начала');
  if dbePrcLgt.Field.IsNull or (dbePrcLgt.Field.AsFloat <= 0) then
    mListErr.Add('Процент льготы должен быть больше нуля');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;

end.
