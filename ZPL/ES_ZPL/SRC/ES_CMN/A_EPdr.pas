unit A_EPdr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons;

type
  TFormPdrEdit = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edRSch: TEdit;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    edMfo: TEdit;
    edOkpo: TEdit;
    edNmBank: TEdit;
    edNmPdr: TEdit;
    edNmRSch: TEdit;
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
  public
    { Public declarations }
  end;

function EdtPdr(var cNmPdr, cNotes, cNmRSch, cRSch, cMfo,
                         cOkpo, cNmBank, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal : integer) : boolean;
function AddPdr(var cNmPdr, cNotes, cNmRSch, cRSch, cMfo,
                         cOkpo, cNmBank, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal : integer) : boolean;

var
  FormPdrEdit: TFormPdrEdit;
  n_KdSchBU, n_KdVal : integer;
  bEditMode : boolean;

const SECTION = 'EdPdr';

implementation

{$R *.DFM}

uses A_Const, A_SBU, A_GtVal;

//------------------------------------------------------------------------------
function EdtPdr(var cNmPdr, cNotes, cNmRSch, cRSch, cMfo,
                         cOkpo, cNmBank, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal : integer) : boolean;
begin
  result := false;
  bEditMode := true;
  n_KdSchBU   := nKdSchBU;
  n_KdVal := nKdVal;
  FormPdrEdit := TFormPdrEdit.Create(Application);
  with FormPdrEdit do begin
    Caption := 'Редактирование записи о подразделении';
    edNmPdr.Text   := cNmPdr;
    edNmRSch.Text  := cNmRSch;
    edRSch.Text    := cRSch;
    edMfo.Text     := cMfo;
    edOkpo.Text    := cOkpo;
    edNmBank.Text  := cNmBank;
    edSchBU.Text   := cSchBU;
    edNmVal.Text   := cNmVal;
    edNmVal.Color  := clBtnFace;
    sBtnVubVal.Enabled := false;
    MemoNotes.Text := cNotes;
    if ShowModal = mrOK then begin
      result    := true;
      cNmPdr    := edNmPdr.Text;
      cNotes    := MemoNotes.Text;
      cNmRSch   := edNmRSch.Text;
      cRSch     := edRSch.Text;
      cMfo      := edMfo.Text;
      cOkpo     := edOkpo.Text;
      cNmBank   := edNmBank.Text;
      cSchBU    := edSchBU.Text;
      cNmVal    := edNmVal.Text;
      nKdVal    := n_KdVal;
      nKdSchBU  := n_KdSchBU;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function AddPdr(var cNmPdr, cNotes, cNmRSch, cRSch, cMfo,
                         cOkpo, cNmBank, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal : integer) : boolean;
begin
  result := false;
  bEditMode := false;
  n_KdSchBU   := 0;
  n_KdVal     := 0;
  FormPdrEdit := TFormPdrEdit.Create(Application);
  with FormPdrEdit do begin
    Caption := 'Новая запись о подразделении';    
    if ShowModal = mrOK then begin
      cNmPdr    := edNmPdr.Text;
      cNotes    := MemoNotes.Text;
      cNmRSch   := edNmRSch.Text;
      cRSch     := edRSch.Text;
      cMfo      := edMfo.Text;
      cOkpo     := edOkpo.Text;
      cNmBank   := edNmBank.Text;
      cSchBU    := edSchBU.Text;
      nKdSchBU  := n_KdSchBU;
      cNmVal    := edNmVal.Text;
      nKdVal    := n_KdVal;
      result    := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPdrEdit.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPdrEdit.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPdrEdit.FormCloseQuery(Sender: TObject;
                                           var CanClose: Boolean);
begin
  if (ModalResult = mrOK) and
           ((edNmPdr.Text = '') or (edNmRSch.Text = '') or
            (edRSch.Text = '') or (edMfo.Text = '') or
            (edOkpo.Text = '') or (edNmBank.Text = '') or
                                 (edSchBU.Text = '')) then begin
    ModalResult := mrNone;
    MessageDlg('Надо заполнить все реквизиты.',
                                              mtError, [mbOk], 0);
    CanClose := false;
    edNmPdr.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPdrEdit.sBtnVubSchBUClick(Sender: TObject);
//var cSchBU, cPSch, cNmSchBU : string; bHsCh : boolean;
begin
(*
  if GetSbu1S(n_KdSchBU, cSchBU, cPSch, cNmSchBU, bHsCh) then {A_SBU}
    edSchBU.Text := cSchBU;        // изменится и var n_KdSchBU
*)
end;
//------------------------------------------------------------------------------
procedure TFormPdrEdit.sBtnVubValClick(Sender: TObject);
var cNmVal : string;
begin
  if GetKdVal(n_KdVal, cNmVal) then        {A_GtVal}
    edNmVal.Text := cNmVal;
end;
//------------------------------------------------------------------------------
procedure TFormPdrEdit.edNmValDblClick(Sender: TObject);
begin
  if not bEditMode then
    sBtnVubVal.Click;
end;

end.
