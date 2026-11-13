unit a_EPSch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles, Mask;

type
  TFormAddPSch = class(TForm)
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    edNewNm: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    meNewSch: TMaskEdit;
    Label4: TLabel;
    Label1: TLabel;
    meNewChldSch: TMaskEdit;
    Label5: TLabel;
    edNewChldNm: TEdit;
    Label6: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    meNewSch_17: TMaskEdit;
    Label8: TLabel;
    meNewChldSch_17: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure meEnter(Sender: TObject);
    procedure meExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edNewNmEnter(Sender: TObject);
    procedure edNewNmExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

       // AddNewParentNode(cNewSch, cNewNmSch, cNewChldSch,  cNewChldNm)
function AddNewParentNode(var cNewSch, cNewSch_17, cNewNmSch,
               cNewChldSch, cNewChldSch_17, cNewChldNm : ShortString) : boolean;

const SECTION = 'a_EPSch';

var
  FormAddPSch: TFormAddPSch;


implementation

{$R *.DFM}

uses A_Const;

//----------------------------------------------------------------
function AddNewParentNode(var cNewSch, cNewSch_17, cNewNmSch,
               cNewChldSch, cNewChldSch_17, cNewChldNm : ShortString) : boolean;
begin
  Result := false;
  with TFormAddPSch.Create(Application) do begin
    Caption := '¬‚Ó‰ ÌÓ‚Ó„Ó ”«ÀŒ¬Œ√Œ ˝ÎÂÏÂÌÚ‡:';
    meNewSch.Text        := cNewSch;
    meNewSch_17.Text     := cNewSch_17;
    edNewNm.Text         := cNewNmSch;
    meNewChldSch.Text    := cNewChldSch;
    meNewChldSch_17.Text := cNewChldSch_17;
    edNewChldNm.Text     := cNewChldNm;
    if ShowModal = mrOK then begin
       cNewSch        := meNewSch.Text;
       cNewSch_17     := meNewSch_17.Text;
       cNewNmSch      := edNewNm.Text;
       cNewChldSch    := meNewChldSch.Text;
       cNewChldSch_17 := meNewChldSch.Text;
       cNewChldNm     := edNewChldNm.Text;
       Result := true;
    end;
    Free;
  end;
end;//----------------------------------------------------------------
procedure TFormAddPSch.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wl', 100);
    Top  := ReadInteger(SECTION, 'wt', 300);
    Free;
  end;
end;
//----------------------------------------------------------------
procedure TFormAddPSch.FormClose(Sender: TObject;
                                       var Action: TCloseAction);
begin
  if ModalResult = mrOK then
                        with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wl', Left);
    WriteInteger(SECTION, 'wt', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPSch.meEnter(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPSch.meExit(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPSch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormAddPSch.edNewNmEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPSch.edNewNmExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

end.
