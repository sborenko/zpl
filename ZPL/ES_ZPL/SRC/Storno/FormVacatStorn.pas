unit FormVacatStorn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, StdCtrls, Buttons, Mask, DBCtrls,
  Math, DBClient;

type
  TFrmVacatStorn = class(TForm)
    GrpBoxVacat: TGroupBox;
    LblVacatBeg: TLabel;
    DbeVacatBeg: TDBEdit;
    LblVacatEnd: TLabel;
    DbeVacatEnd: TDBEdit;
    GrpBoxStorn: TGroupBox;
    LblStornBeg: TLabel;
    DbeStornBeg: TDBEdit;
    LblStornEnd: TLabel;
    DbeStornEnd: TDBEdit;
    LblVacatSum: TLabel;
    DbeVacatSum: TDBEdit;
    LblSalarySum: TLabel;
    TxtSalarySum: TStaticText;
    LblVacatTtls: TLabel;
    LblSalaryTtls: TLabel;
    DsrcRec: TDataSource;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbeStornBegEnter(Sender: TObject);
    procedure DbeStornBegExit(Sender: TObject);
  private
    procedure DisplayDtBegErr(Rec: TDataSet);
    procedure DisplayDtEndErr(Rec: TDataSet);
    procedure DisplayStornRes(StornDays: Integer; VacatSum: Double;
      WorkHrs: Integer; SalarySum: Double);
  public
    class function StornVacatPart: Boolean;
  end;

const SECTION = 'z_EOtpP';

implementation

uses a_Const, a_DM, DateLib, DModVacatStorn, DsLib, z_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFrmVacatStorn.StornVacatPart: Boolean;
begin
  Result := false;

  with TFrmVacatStorn.Create(Application) do begin
    DmVacatStorn.StartStorn(DisplayDtBegErr, DisplayDtEndErr, DisplayStornRes);

    if ShowModal = mrOk then
      Result := true;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmVacatStorn.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top := ReadInteger(SECTION, 'wT', 400);
    Free;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmVacatStorn.FormCloseQuery(
  Sender: TObject;
  var CanClose: Boolean
);
begin
  CanClose := DmVacatStorn.DataAreValid;

  if not CanClose then
    ShowMessage('Неправильно указан период сторнирования');
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmVacatStorn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
    DmVacatStorn.SaveStorn;

  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmVacatStorn.DisplayStornRes(
  StornDays: Integer;
  VacatSum: Double;
  WorkHrs: Integer;
  SalarySum: Double
);
begin
  TxtSalarySum.Caption := FloatToStrF(SalarySum, ffFixed, 18, 2);

  LblVacatTtls.Caption :=
    'Сторн. дней: ' + IntToStr(StornDays) + ',   ' +
    'Сторн. отпускных: ' + FloatToStrF(VacatSum, ffFixed, 18, 2);

  LblSalaryTtls.Caption :=
    'Вернуть оклад ' + TxtSalarySum.Caption +
    ' за ' + FloatToStrF(WorkHrs, ffFixed, 12, 2) + ' часов';
end;

//------------------------------------------------------------------------------
procedure TFrmVacatStorn.DisplayDtBegErr(Rec: TDataSet);
begin
  with Rec do
    raise Exception.Create(
      'Дата начала сторнируемого периода должна быть между ' +
      FieldByName('Dt_Beg').AsString + ' и ' + FieldByName('Dt_End').AsString +
      ' (включительно).');
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmVacatStorn.DisplayDtEndErr(Rec: TDataSet);
begin
  with Rec do
    raise Exception.Create(
      'Дата конца сторнируемого периода должна быть между ' +
      FieldByName('Dt_Beg').AsString + ' и ' + FieldByName('Dt_End').AsString +
      ' (включительно).');
end;

//------------------------------------------------------------------------------
procedure TFrmVacatStorn.DbeStornBegEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmVacatStorn.DbeStornBegExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

//------------------------------------------------------------------------------
end.
