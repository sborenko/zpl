unit a_ERSch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TFormRSchNew = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edEnter(Sender: TObject);
    procedure edExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddRSch(cNmKli : string; var cNmRSch, cRSch,
                    cMfo, cOkpo, cNmBank, cNotes : string) : boolean;
function EdtRSch(cNmKli : string; var cNmRSch, cRSch,
                    cMfo, cOkpo, cNmBank, cNotes : string) : boolean;

var
  FormRSchNew: TFormRSchNew;

const SECTION = 'A_RSchNw';

implementation

{$R *.DFM}

uses A_Const;

//--------------------------------------------------------------------
function EdtRSch(cNmKli : string; var cNmRSch, cRSch,
                     cMfo, cOkpo, cNmBank, cNotes : string) : boolean;
begin
  result := false;
  FormRSchNew := TFormRSchNew.Create(Application);
  with FormRSchNew do begin
    Caption := 'Редактирование расчетного счета';
    StaticTextNmKli.Caption := cNmKli;
    edNmRSch.Text := cNmKli;
    edNmRSch.Text := cNmRSch;
    edRSch.Text   := cRSch;
    edMfo.Text    := cMfo;
    edOkpo.Text   := cOkpo;
    edNmBank.Text := cNmBank;
    edNotes.Text  := cNotes;
    if ShowModal = mrOk then begin
      result  := true;
      cNmRSch := edNmRSch.Text;
      cRSch   := edRSch.Text;
      cMfo    := edMfo.Text;
      cOkpo   := edOkpo.Text;
      cNmBank := edNmBank.Text;
      cNotes  := edNotes.Text;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
function AddRSch(cNmKli : string; var cNmRSch,
             cRSch, cMfo, cOkpo, cNmBank, cNotes : string) : boolean;
begin
  Result := false;
  FormRSchNew := TFormRSchNew.Create(Application);
  with FormRSchNew do begin
    Caption := 'Новый расчетный счет';
    StaticTextNmKli.Caption := cNmKli;
    edNmRSch.Text := cNmKli;
    edOkpo.Text := cOkpo;
    if ShowModal = mrOk then begin
      Result  := true;
      cNmRSch := edNmRSch.Text;
      cRSch   := edRSch.Text;
      cMfo    := edMfo.Text;
      cOkpo   := edOkpo.Text;
      cNmBank := edNmBank.Text;
      cNotes  := edNotes.Text;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormRSchNew.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormRSchNew.FormClose(Sender: TObject;
                                     var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormRSchNew.FormCloseQuery(Sender: TObject;
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
//--------------------------------------------------------------------
procedure TFormRSchNew.edEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//--------------------------------------------------------------------
procedure TFormRSchNew.edExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

end.
