unit z_MkVed2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Mask, DBCtrls, Buttons, DB, DBClient;

type
  TFormMkVed2 = class(TForm)
    GroupBox2: TGroupBox;
    Label5: TLabel;
    rBtnVed01: TRadioButton;
    rBtnVed03: TRadioButton;
    rBtnVed04: TRadioButton;
    rBtnVed02: TRadioButton;
    GroupBox3: TGroupBox;
    LabelNumVed: TLabel;
    rBtnNumNo: TRadioButton;
    rBtnNumYes: TRadioButton;
    edNumVed: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    cdsTmp: TClientDataSet;
    cdsTmpF_Int: TIntegerField;
    dsrcTmp: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rBtnNumYesClick(Sender: TObject);
    procedure rBtnNumNoClick(Sender: TObject);
    procedure edNumVedEnter(Sender: TObject);
    procedure edNumVedExit(Sender: TObject);
  private
    { Private declarations }
    procedure SetNumDela;
  public
    { Public declarations }
  end;

function GetVedType(var nVedCase, nNumCase, nNumFirstVed : integer) : boolean;

const SECTION = 'z_MkVed2';

var
  FormMkVed2: TFormMkVed2;

implementation

{$R *.dfm}

uses a_Const, z_Main;

//------------------------------------------------------------------------------
function GetVedType(var nVedCase, nNumCase, nNumFirstVed : integer) : boolean;
begin
  Result := false;
  FormMkVed2 := TFormMkVed2.Create(Application);
  with FormMkVed2 do begin
    Caption := 'Задание на печать ведомости';
    if ShowModal = mrOk then begin
      if rBtnVed04.Checked then
        nVedCase := 4
      else if rBtnVed03.Checked then
        nVedCase := 3
      else if rBtnVed02.Checked then
        nVedCase := 2
      else
        nVedCase := 1;
      if rBtnNumYes.Checked then
        nNumCase := 2
      else
        nNumCase := 1;
      if nNumCase = 2 then
        nNumFirstVed := cdsTmp.FieldByName('F_Int').AsInteger
      else
        nNumFirstVed := 0;  
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed2.FormCreate(Sender: TObject);
var  nVedCase, nNumCase, nNumFirstVed : integer;
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
  end;
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 100);
    nVedCase := ReadInteger(SECTION, 'nVedCase', 1);
    nNumCase := ReadInteger(SECTION, 'nNumCase', 1);
    nNumFirstVed := ReadInteger(SECTION, 'nNumFV', 1);
    Free;
  end;
  if nVedCase = 2 then
    rBtnVed02.Checked := true
  else if nVedCase = 3 then
    rBtnVed03.Checked := true
  else if nVedCase = 4 then
    rBtnVed04.Checked := true
  else
    rBtnVed01.Checked := true;
  rBtnNumNo.Checked := nNumCase = 1;
  rBtnNumYes.Checked := not rBtnNumNo.Checked;
  cdsTmpF_Int.AsInteger := nNumFirstVed;
  SetNumDela;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if rBtnVed04.Checked then
      WriteInteger(SECTION, 'nVedCase', 4)
    else if rBtnVed03.Checked then
      WriteInteger(SECTION, 'nVedCase', 3)
    else if rBtnVed02.Checked then
      WriteInteger(SECTION, 'nVedCase', 2)
    else
      WriteInteger(SECTION, 'nVedCase', 1);
    if rBtnNumYes.Checked then
      WriteInteger(SECTION, 'nNumCase', 2)
    else
      WriteInteger(SECTION, 'nNumCase', 1);
    WriteInteger(SECTION, 'nNumFV', cdsTmpF_Int.AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed2.SetNumDela;
begin
  LabelNumVed.Enabled := rBtnNumYes.Checked;
  if rBtnNumNo.Checked then begin
    edNumVed.Color := clBtnFace;
    edNumVed.Enabled := false; end
  else begin
    edNumVed.Color := clWindow;
    edNumVed.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed2.rBtnNumYesClick(Sender: TObject);
begin
  SetNumDela;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed2.rBtnNumNoClick(Sender: TObject);
begin
  SetNumDela;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed2.edNumVedEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed2.edNumVedExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
