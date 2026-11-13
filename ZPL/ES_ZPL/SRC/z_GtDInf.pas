unit z_GtDInf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, Mask, DBCtrls, DB, DBClient;

type
  TFormGetDopInf = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelFamIO: TLabel;
    LabelTabN: TLabel;
    cdsTmp: TClientDataSet;
    cdsTmpKdObj: TSmallintField;
    cdsTmpKdKatP: TSmallintField;
    dsrcTmp: TDataSource;
    Label1: TLabel;
    dbeKdObj: TDBEdit;
    Label2: TLabel;
    dbeKdKatP: TDBEdit;
    sBtnObj: TSpeedButton;
    sBtnKatP: TSpeedButton;
    cdsTmpShObj: TStringField;
    cdsTmpShKatP: TStringField;
    dbeShObj: TDBEdit;
    dbeShKatP: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnObjClick(Sender: TObject);
    procedure sBtnKatPClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function GetDopInf(cFamIO : string; nTabN : integer;
                                      var nKdObj, nKdKatP : integer;
                                      var cShObj, cShKatP : string) : boolean;

const SECTION = 'z_GtDInf';

var
  FormGetDopInf: TFormGetDopInf;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, z_TObj, Z_GtPers, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetDopInf(cFamIO : string; nTabN : integer;
                                      var nKdObj, nKdKatP : integer;
                                      var cShObj, cShKatP : string) : boolean;
begin
  Result := false;
  FormGetDopInf := TFormGetDopInf.Create(Application);
  with FormGetDopInf do begin
    Caption := 'Введите дополнительно...';
    LabelTabN.Caption := 'Таб.н-р ' + IntToStr(nTabN);
    LabelFamIO.Caption := cFamIO;
    with cdsTmp do begin
      CreateDataSet;
      Open;
      Append;
      cdsTmpKdObj.AsInteger  := nKdObj;
      cdsTmpKdKatP.AsInteger := nKdKatP;
      cdsTmpShObj.AsString   := cShObj;
      cdsTmpShKatP.AsString  := cShKatP;
    end;
    if ShowModal = mrOk then begin
      Result  := true;
      nKdObj  := cdsTmpKdObj.AsInteger;
      nKdKatP := cdsTmpKdKatP.AsInteger;
      cShObj  := cdsTmpShObj.AsString;
      cShKatP := cdsTmpShKatP.AsString;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormGetDopInf.CheckVvod : boolean;
var mListErr : TStringList;

begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (cdsTmpKdObj.AsInteger = 0) then
    mListErr.Add('Не выбрано подразделение');
  if (cdsTmpKdKatP.AsInteger = 0) then
    mListErr.Add('Не выбрана категория персонала');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr); {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormGetDopInf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeKdObj.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetDopInf.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetDopInf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetDopInf.sBtnObjClick(Sender: TObject);
var nKdObj, nKdSpZ : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  dbeShObj.SetFocus;
  nKdObj := cdsTmpKdObj.AsInteger;
  if GetKdObj(nKdObj, nKdSpZ, cShObj, cNmObj, bWasUpdated) {z_TObj} then begin
    cdsTmpKdObj.AsInteger := nKdObj;
    cdsTmpShObj.AsString  := cShObj;
    dbeKdKatP.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetDopInf.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer; cNmKatP, cShKatP : string;
begin
  dbeShKatP.SetFocus;
  nKdKatP := cdsTmpKdKatP.AsInteger;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {Z_GtPers} then begin
    cdsTmpKdKatP.AsInteger := nKdKatP;
    cdsTmpShKatP.AsString  := cShKatP;
    bBtnOk.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetDopInf.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGetDopInf.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
