unit a_e2RSch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TFormAERSch = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    edNmRSch: TEdit;
    edRSch: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    edNmBank: TEdit;
    Label6: TLabel;
    edMfo: TEdit;
    Label5: TLabel;
    edOkpo: TEdit;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    StaticTextNmKli: TStaticText;
    edNotes: TEdit;
    Label2: TLabel;
    sBtnBank: TSpeedButton;
    LabelSwift: TLabel;
    edSwift: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edEnter(Sender: TObject);
    procedure edExit(Sender: TObject);
    procedure sBtnBankClick(Sender: TObject);
  private
    { Private declarations }
    n_KdBank : integer;
  public
    { Public declarations }
  end;

function AddRSch(bIsVal : boolean; cNmKli : ShortString;
         var cNmRSch, cRSch, cMfo, cOkpo, cNmBank, cNotes, cSwift : ShortString;
                                              var nKdBank : SmallInt) : boolean;
function EdtRSch(bIsVal : boolean; cNmKli : ShortString;
         var cNmRSch, cRSch, cMfo, cOkpo, cNmBank, cNotes, cSwift : ShortString;
                                              var nKdBank : SmallInt) : boolean;

var
  FormAERSch: TFormAERSch;

const SECTION = 'A_e2RSch';

implementation

{$R *.DFM}

uses A_Const, b_ShBnks;

//------------------------------------------------------------------------------
function AddRSch(bIsVal : boolean; cNmKli : ShortString;
         var cNmRSch, cRSch, cMfo, cOkpo, cNmBank, cNotes, cSwift : ShortString;
                                              var nKdBank : SmallInt) : boolean;
begin
  Result := false;
  FormAERSch := TFormAERSch.Create(Application);
  with FormAERSch do begin
    n_KdBank := 0;
    Caption := 'Новый расчетный счет';
    StaticTextNmKli.Caption := cNmKli;
    if cNmRSch > '' then
      edNmRSch.Text := cNmRSch
    else
      edNmRSch.Text := cNmKli;
    edOkpo.Text := cOkpo;
    edRSch.Text := cRSch;
    edMfo.Text := cMfo;
    edNmBank.Text := cNmBank;
    LabelSwift.Visible := bIsVal;
    edSwift.Visible := bIsVal;
    sBtnBank.Visible := bIsVal;
    edNmBank.ReadOnly := bIsVal;
    if bIsVal then
      edNmBank.Width := 307
    else
      edNmBank.Width := 323;
    if ShowModal = mrOk then begin
      Result  := true;
      nKdBank := n_KdBank;
      cNmRSch := edNmRSch.Text;
      cRSch   := edRSch.Text;
      cMfo    := edMfo.Text;
      cOkpo   := edOkpo.Text;
      cNmBank := edNmBank.Text;
      cNotes  := edNotes.Text;
      cSwift  := edSwift.Text;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function EdtRSch(bIsVal : boolean; cNmKli : ShortString;
         var cNmRSch, cRSch, cMfo, cOkpo, cNmBank, cNotes, cSwift : ShortString;
                                              var nKdBank : SmallInt) : boolean;
begin
  Result := false;
  FormAERSch := TFormAERSch.Create(Application);
  with FormAERSch do begin
    Caption := 'Редактирование расчетного счета';
    StaticTextNmKli.Caption := cNmKli;
    edNmRSch.Text := cNmKli;
    edNmRSch.Text := cNmRSch;
    edRSch.Text   := cRSch;
    edMfo.Text    := cMfo;
    edOkpo.Text   := cOkpo;
    edNmBank.Text := cNmBank;
    edNotes.Text  := cNotes;
    edSwift.Text  := cSwift;
    n_KdBank      := nKdBank;
    LabelSwift.Visible := bIsVal;
    edSwift.Visible := bIsVal;
    sBtnBank.Visible := bIsVal;
    edNmBank.ReadOnly := bIsVal;
    if bIsVal then
      edNmBank.Width := 307
    else
      edNmBank.Width := 323;
    if ShowModal = mrOk then begin
      Result  := true;
      cNmRSch := edNmRSch.Text;
      cRSch   := edRSch.Text;
      cMfo    := edMfo.Text;
      cOkpo   := edOkpo.Text;
      cNmBank := edNmBank.Text;
      cNotes  := edNotes.Text;
      cSwift  := edSwift.Text;
      nKdBank := n_KdBank;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAERSch.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 100);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAERSch.FormClose(Sender: TObject;
                                     var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAERSch.FormCloseQuery(Sender: TObject;
                                           var CanClose: Boolean);
begin
  if (ModalResult = mrOK) and
       ((edNmRSch.Text = '') or (edRSch.Text = '')) then begin
    ModalResult := mrNone;
    MessageDlg('Надо заполнить, как минимум, наименование ' +
               #13#10 + 'счета и счет или нажать кнопку "Отказ".',
                                              mtError, [mbOk], 0);
    CanClose := false;
    edNmRSch.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAERSch.edEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAERSch.edExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAERSch.sBtnBankClick(Sender: TObject);
var cNmBank : string;
begin
  cNmBank := '';
  if GetBank(n_KdBank, cNmBank) {b_ShBnks} then
    edNmBank.Text := cNmBank;
end;

end.
