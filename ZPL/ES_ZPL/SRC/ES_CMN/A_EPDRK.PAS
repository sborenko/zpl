unit A_EPdrK;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons;

type
  TFormEAKssPdr = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    edNmPdr: TEdit;
    edSchBU: TEdit;
    MemoNotes: TMemo;
    Label13: TLabel;
    sBtnVubSchBU: TSpeedButton;
    edNmVal: TEdit;
    sBtnVubVal: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject;
                                        var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject;
                                           var CanClose: Boolean);
    procedure sBtnVubSchBUClick(Sender: TObject);
    procedure sBtnVubValClick(Sender: TObject);
    procedure edNmValDblClick(Sender: TObject);
  private
    { Private declarations }
    n_KdSchBU, n_KdVal : integer;
    bEditMode : boolean;
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EdtKssPdr(var cNmPdr, cNotes, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal : integer) : boolean;
function AddKssPdr(var cNmPdr, cNotes, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal : integer) : boolean;

var
  FormEAKssPdr: TFormEAKssPdr;

const SECTION = 'A_EPdrK';

implementation

{$R *.DFM}

uses A_Const, A_SBU, A_GtVal, A_ShwErr;

// Для ввода и редактирования "кассовых" подразделений

//------------------------------------------------------------------------------
function EdtKssPdr(var cNmPdr, cNotes, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal : integer) : boolean;
begin
  Result := false;
  FormEAKssPdr := TFormEAKssPdr.Create(Application);
  with FormEAKssPdr do begin
    bEditMode := true;
    n_KdSchBU   := nKdSchBU;
    n_KdVal := nKdVal;
    Caption := 'Редактирование записи о кассе';
    edNmPdr.Text   := cNmPdr;
    edSchBU.Text   := cSchBU;
    edNmVal.Text   := cNmVal;
    edNmVal.Color  := clBtnFace;
    sBtnVubVal.Enabled := false;
    MemoNotes.Text := cNotes;
    if ShowModal = mrOK then begin
      Result    := true;
      cNmPdr    := edNmPdr.Text;
      cNotes    := MemoNotes.Text;
      cSchBU    := edSchBU.Text;
      cNmVal    := edNmVal.Text;
      nKdVal    := n_KdVal;
      nKdSchBU  := n_KdSchBU;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function AddKssPdr(var cNmPdr, cNotes, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal : integer) : boolean;
begin
  Result := false;
  FormEAKssPdr := TFormEAKssPdr.Create(Application);
  with FormEAKssPdr do begin
    bEditMode := false;
    n_KdSchBU   := 0;
    n_KdVal     := 0;
    Caption := 'Новая касса';
    if ShowModal = mrOK then begin
      cNmPdr    := edNmPdr.Text;
      cNotes    := MemoNotes.Text;
      cSchBU    := edSchBU.Text;
      nKdSchBU  := n_KdSchBU;
      cNmVal    := edNmVal.Text;
      nKdVal    := n_KdVal;
      Result    := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAKssPdr.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 100);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAKssPdr.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEAKssPdr.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if edNmPdr.Text = '' then
    mListErr.Add('Не заполнено название кассы');
  if edSchBU.Text = '' then
    mListErr.Add('Не выбран связанный счёт БухУчёта');
  if edNmVal.Text = '' then
      mListErr.Add('Не выбрана валюта');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEAKssPdr.FormCloseQuery(Sender: TObject;
                                           var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    edNmPdr.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAKssPdr.sBtnVubSchBUClick(Sender: TObject);
var cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  if GetSBU(n_KdSchBU, cSchBU, cPSch, cNmSBU, bHsCh) then  {A_SBU}
    edSchBU.Text := cSchBU;     // изменится и var n_KdSchBU
end;
//------------------------------------------------------------------------------
procedure TFormEAKssPdr.sBtnVubValClick(Sender: TObject);
var cNmVal : string;
begin
  if GetKdVal(n_KdVal, cNmVal) then        {A_GtVal}
    edNmVal.Text := cNmVal;
end;
//------------------------------------------------------------------------------
procedure TFormEAKssPdr.edNmValDblClick(Sender: TObject);
begin
  if not bEditMode then
    sBtnVubVal.Click;
end;

end.
