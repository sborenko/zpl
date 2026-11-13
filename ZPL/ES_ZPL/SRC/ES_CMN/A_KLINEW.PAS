unit A_KliNew;

interface

uses
	SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics,
	Controls, Forms, Dialogs, StdCtrls, DBCtrls, Mask, Buttons,
	ExtCtrls, DBTables, DB, IniFiles;

type
	TFormNewKli = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edNmKli: TEdit;
    edNmRSch: TEdit;
    edRSch: TEdit;
    edMfo: TEdit;
    edOkpo: TEdit;
    edNmBank: TEdit;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    Label13: TLabel;
    MemoNotes: TMemo;
    edNotesRS: TEdit;
    Label2: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    sBtnBank: TSpeedButton;
    LabelSwift: TLabel;
    edSwift: TEdit;
    Label15: TLabel;
    edAdres: TEdit;
    Label16: TLabel;
    edOkpo2: TEdit;
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edEnter(Sender: TObject);
    procedure edExit(Sender: TObject);
    procedure MemoNotesEnter(Sender: TObject);
    procedure MemoNotesExit(Sender: TObject);
    procedure edNmKliExit(Sender: TObject);
    procedure edOkpo2Exit(Sender: TObject);
	private
		{ Private declarations }
    bAddKznRS : boolean; // ввод сведений из казначейства
	public
		{ Public declarations }
	end;

function AddKlient(bIsVal : boolean; var cNmKli, cAdres, cNotes, cNmRSch,
                    cRSch, cMfo, cOkpo, cNmBank, cNotesRS, cSwift : ShortString;
                                              var nKdBank : SmallInt) : boolean;
function AddKznKliRS(bIsVal : boolean; var cNmKli, cAdres, cNotes, cNmRSch,
                    cRSch, cMfo, cOkpo, cNmBank, cNotesRS, cSwift : ShortString;
                                              var nKdBank : SmallInt) : boolean;

var
	FormNewKli: TFormNewKli;

const SECTION = 'NwKli';

implementation

{$R *.DFM}

uses A_Const;

//------------------------------------------------------------------------------
function AddKznKliRS(bIsVal : boolean; var cNmKli, cAdres, cNotes, cNmRSch,
                    cRSch, cMfo, cOkpo, cNmBank, cNotesRS, cSwift : ShortString;
                                              var nKdBank : SmallInt) : boolean;
begin
  Result := false;
  FormNewKli := TFormNewKli.Create(Application);
  with FormNewKli do begin
    Caption := 'Новый клиент (из казначейства)';
    bAddKznRS := true;
    if bIsVal then begin
      edNmBank.ReadOnly := true;
      edNmBank.Width := 303;
      sBtnBank.Visible := true;
      LabelSwift.Visible := true;
      edSwift.Visible := true; end
    else begin
      edNmBank.ReadOnly := false;
      edNmKli.Text := cNmKli;
      edNmRSch.Text := cNmRSch;
      edRSch.Text := cRSch;
      edMFO.Text := cMfo;
      edOkpo.Text := cOkpo;
      edNmBank.Text := cNmBank;
      edNmBank.Width := 320;
      sBtnBank.Visible := false;
      LabelSwift.Visible := false;
      edSwift.Visible := false;
    end;
    if ShowModal = mrOK then begin
      cNmKli   := edNmKli.Text;
      cAdres   := edAdres.Text;
      cNotes   := MemoNotes.Text;
      cNmRSch  := edNmRSch.Text;
      cRSch    := edRSch.Text;
      cMfo     := edMfo.Text;
      cOkpo    := edOkpo.Text;
      cNmBank  := edNmBank.Text;
      cNotesRS := edNotesRS.Text;
      Result   := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function AddKlient(bIsVal : boolean; var cNmKli, cAdres, cNotes, cNmRSch,
                    cRSch, cMfo, cOkpo, cNmBank, cNotesRS, cSwift : ShortString;
                                              var nKdBank : SmallInt) : boolean;
begin
  Result := false;
  FormNewKli := TFormNewKli.Create(Application);
  with FormNewKli do begin
    bAddKznRS := false;
    if bIsVal then begin
      edNmBank.ReadOnly := true;
      edNmBank.Width := 303;
      sBtnBank.Visible := true;
      LabelSwift.Visible := true;
      edSwift.Visible := true; end
    else begin
      edNmBank.ReadOnly := false;
      edNmBank.Width := 320;
      sBtnBank.Visible := false;
      LabelSwift.Visible := false;
      edSwift.Visible := false;
    end;
    if ShowModal = mrOK then begin
      cNmKli   := edNmKli.Text;
      cAdres   := edAdres.Text;
      cNotes   := MemoNotes.Text;
      cNmRSch  := edNmRSch.Text;
      cRSch    := edRSch.Text;
      cMfo     := edMfo.Text;
      cOkpo    := edOkpo.Text;
      cNmBank  := edNmBank.Text;
      cNotesRS := edNotesRS.Text;
      Result   := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewKli.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewKli.FormClose(Sender: TObject;
																	var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewKli.FormCloseQuery(Sender: TObject;
                                           var CanClose: Boolean);
begin
  if (ModalResult = mrOK) and (edNmKli.Text = '') then begin
    ModalResult := mrNone;
    MessageDlg('Надо заполнить, как минимум, наименование ' +
              #13#10 + 'клиента или отказаться (кнопка "Отказ").',
                                              mtError, [mbOk], 0);
    CanClose := false;
    edNmKli.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewKli.edEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormNewKli.edExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormNewKli.MemoNotesEnter(Sender: TObject);
begin
  (Sender as TMemo).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormNewKli.MemoNotesExit(Sender: TObject);
begin
  (Sender as TMemo).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormNewKli.edNmKliExit(Sender: TObject);
begin
  if edNmRSch.Text = '' then
    edNmRSch.Text := edNmKli.Text;
  (Sender as TEdit).Color := clWindow;
end;

procedure TFormNewKli.edOkpo2Exit(Sender: TObject);
begin
  if edOkpo.Text = '' then
    edOkpo.Text := edOkpo2.Text;
  (Sender as TEdit).Color := clWindow;
end;

end.
