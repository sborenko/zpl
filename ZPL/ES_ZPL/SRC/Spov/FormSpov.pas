unit FormSpov;

interface

uses
  Classes, ComCtrls, Controls, StdCtrls, Buttons, Forms, Dialogs, SysUtils,
  IniFiles, FormEvaluate, ReportSpov, DB, DBTables;

type
  TFrmSpov = class(TForm)
    GrBoxPeriod: TGroupBox;
    LblYear: TLabel;
    LblQuart: TLabel;
    EdtYear: TEdit;
    UpDownYear: TUpDown;
    EdtQuart: TEdit;
    UpDownQuart: TUpDown;
    GrBoxAppx: TGroupBox;
    ChBoxAppx4: TCheckBox;
    ChBoxAppx5: TCheckBox;
    ChBoxAppx1And6: TCheckBox;
    ChBoxAppx4Grants: TCheckBox;
    GrBoxEmpl: TGroupBox;
    LblEmplId: TLabel;
    RadioListOnly: TRadioButton;
    RadioAllEmpls: TRadioButton;
    MemoEmplIds: TMemo;
    BtnStart: TBitBtn;
    LblMnth: TLabel;
    EdtMnth: TEdit;
    UpDownMnth: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnStartClick(Sender: TObject);
    procedure MemoEmplIdsEnter(Sender: TObject);
    procedure ChBoxAppx4GrantsClick(Sender: TObject);
  private
    function CheckExceptEmplList(EmplIds: string): string;
    function CreateAppxSet: TAppxSet;
    function ConfirmCreate(OutputPath: String): Boolean;
  public
    class procedure Run;
  end;

const SECTION = 'SpovMain';

var
  FrmSpov: TFrmSpov;

implementation

uses
  a_Const, DateLib, PathLib;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmSpov.Run;
begin
  FrmSpov := TFrmSpov.Create(nil);

  with FrmSpov do begin
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmSpov.FormCreate(Sender: TObject);
begin
  ActiveControl := BtnStart;

  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top := ReadInteger(SECTION, 'wT', 50);

    UpDownYear.Position := ReadInteger(SECTION, 'nYYYY', 2023);
    UpDownQuart.Position := ReadInteger(SECTION, 'nQuarter', 1);
    UpDownMnth.Position := ReadInteger(SECTION, 'Month', 1);

    ChBoxAppx5.Checked := ReadBool(SECTION, 'checkD5T5', true);
    ChBoxAppx1And6.Checked := ReadBool(SECTION, 'checkD1D6T6T7', true);
    ChBoxAppx4.Checked := ReadBool(SECTION, 'checkD41DF', true);

    ChBoxAppx4Grants.Checked := ReadBool(SECTION, 'CheckAppx4Grants', false);

    if ReadBool(SECTION, 'FullList', true) then
      RadioAllEmpls.Checked := true
    else
      RadioListOnly.Checked := true;

    Free;
  end;

  if FileExists(cDirVids + 'PfLst.lbx') then
    MemoEmplIds.Lines.LoadFromFile(cDirVids + 'PfLst.lbx');

  // Убрать new line после последнего номера. Мешает.
  MemoEmplIds.Text := Trim(MemoEmplIds.Text);
end;

//------------------------------------------------------------------------------
procedure TFrmSpov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);

    WriteInteger(SECTION, 'nYYYY', UpDownYear.Position);
    WriteInteger(SECTION, 'nQuarter', UpDownQuart.Position);
    WriteInteger(SECTION, 'Month', UpDownMnth.Position);

    WriteBool(SECTION, 'checkD5T5', ChBoxAppx5.Checked);
    WriteBool(SECTION, 'checkD1D6T6T7', ChBoxAppx1And6.Checked);
    WriteBool(SECTION, 'checkD41DF', ChBoxAppx4.Checked);
    WriteBool(SECTION, 'CheckAppx4Grants', ChBoxAppx4Grants.Checked);

    WriteBool(SECTION, 'FullList', RadioAllEmpls.Checked);

    Free;
  end;

  MemoEmplIds.Lines.SaveToFile(cDirVids + 'PfLst.lbx');
end;

//------------------------------------------------------------------------------
procedure TFrmSpov.BtnStartClick(Sender: TObject);
var
  EmplIds: string;
  CanRun: boolean;
  OutputPath: String;
  Year, Quart, Mnth: Word;
begin
  CanRun := true;

  if RadioListOnly.Checked then
    try
      EmplIds := CheckExceptEmplList(MemoEmplIds.Text)
    except
      CanRun := false;
      ShowMessage('Неправильный формат списка табельных номеров.' + #13#10 +
        'Используйте запятую в качестве разделителя.');
    end
  else
    EmplIds := '';

  if not CanRun then
    exit;

  Mnth := UpDownMnth.Position;
  Quart := UpDownQuart.Position;
  Year := UpDownYear.Position;

  if nAppKdUsr = 101 then
    OutputPath := PathUtils.GetPersonalDir(nAppKdUsr) +
      // С 1.1.2025
      // 'СПОВ\Y' + IntToStr(Year) + '_Q' + IntToStr(Quart) + '\'
      'СПОВ\Y' + IntToStr(Year) + '_M' + IntToStr(Mnth) + '\'
  else
    OutputPath := 'k:\PensFond\PF_' + IntToStr(Year) +
      // С 1.1.2025
      // '\Y' + IntToStr(Year) + '_Q' + IntToStr(Quart) + '\';
      '\Y' + IntToStr(Year) + '_M' + IntToStr(Mnth) + '\';

  if ConfirmCreate(OutputPath) then begin
    SpovReport := TSpovReport.Create(Mnth,
      Quart, Year, EmplIds, CreateAppxSet, OutputPath);

    with SpovReport do begin
      TFrmEvaluate.Run(Start);
      Free;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Переформатируем список табельных номеров.
//------------------------------------------------------------------------------
function TFrmSpov.CheckExceptEmplList(EmplIds: string): string;
var
  I: integer;
  EmplId: ShortString;
begin
  with TStringList.Create do begin
    try
      Delimiter := ',';
      DelimitedText := EmplIds;

      I := 0;
      while I < Count do begin
        EmplId := Trim(Strings[I]);

        if EmplId = '' then
          Delete(I)
        else begin
          StrToInt(EmplId);
          Inc(I);
        end;
      end;

      Result := DelimitedText;
    finally
      Free;
    end;
  end; {with}
end; {CheckExceptEmplList}

//------------------------------------------------------------------------------
function TFrmSpov.CreateAppxSet;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure AddAppx(Appx: TAppx);
  var
    Len: integer;
  begin
    Len := Length(Result);
    SetLength(Result, Len + 1);
    Result[Len] := Appx;
  end;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
begin
  SetLength(Result, 0);

  if ChBoxAppx5.Checked then
    AddAppx(Appx5);

  if ChBoxAppx1And6.Checked then
    AddAppx(Appx1And6);

  if ChBoxAppx4.Checked then
    AddAppx(Appx4);

  if ChBoxAppx4Grants.Checked then
    AddAppx(Appx4Grants);
end;

//------------------------------------------------------------------------------
procedure TFrmSpov.MemoEmplIdsEnter(Sender: TObject);
begin
  MemoEmplIds.SelectAll;
end;

//------------------------------------------------------------------------------
function TFrmSpov.ConfirmCreate(OutputPath: String): Boolean;
begin
  // Надоедливая проверка. Комментируем
  // if DirectoryExists(OutputPath) then begin
  //   Result := MessageDlg('Файлы уже существуют. Создать?',
  //     mtWarning, [mbYes, mbNo], -1) = mrYes
  // end else
    Result := true;
end;

//------------------------------------------------------------------------------
// Устанавливаем формирование 4-го приложения зарплаты на случай повторного
// формирования 4-го приложения стипендии. Потому что результаты стипендии
// будут добавляться файл зарплаты, и чтобы не получилось дублирования в
// результате повторного залива, зарплатный файл пересоздаём.
//------------------------------------------------------------------------------
procedure TFrmSpov.ChBoxAppx4GrantsClick(Sender: TObject);
begin
  if ChBoxAppx4Grants.Checked then
    ChBoxAppx4.Checked := true;
end;

end.
