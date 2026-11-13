unit z_NrVed1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient;

type
  TFormNrVed = class(TForm)
    cdsTmp: TClientDataSet;
    cdsTmpVedNR: TIntegerField;
    LabelMsg: TLabel;
    dbeVedNR: TDBEdit;
    dsrcTmp: TDataSource;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnBezVedNR: TSpeedButton;
    procedure dbeVedNREnter(Sender: TObject);
    procedure dbeVedNRExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnBezVedNRClick(Sender: TObject);
    procedure bBtnOkClick(Sender: TObject);
  private
    { Private declarations }
    bBezVedNR : boolean;
  public
    { Public declarations }
  end;

function NrVedDlg(cMsg : string; var nNrFirstVed : integer) : integer;

const SECTION = 'z_NrVed1';

var
  FormNrVed: TFormNrVed;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function NrVedDlg(cMsg : string; var nNrFirstVed : integer) : integer;
begin
  Result := 0;
  FormNrVed := TFormNrVed.Create(Application);
  with FormNrVed do begin
    bBezVedNr := false;
    LabelMsg.Caption := cMsg;
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Edit;
      if nNrFirstVed > 0 then
        FieldByName('VedNR').AsInteger := nNrFirstVed
      else
        FieldByName('VedNR').AsInteger := 1;
    end;
    if ShowModal = mrOk then begin
      if bBezVedNR then begin
        nNrFirstVed := 0;
        Result := 1; end
      else begin
        nNrFirstVed := cdsTmpVedNR.AsInteger;
        Result := 2;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNrVed.dbeVedNREnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormNrVed.dbeVedNRExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormNrVed.FormCreate(Sender: TObject);
begin
  Caption := '¬вод номера ведомости';
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNrVed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNrVed.sBtnBezVedNRClick(Sender: TObject);
begin
  bBtnOk.SetFocus;
  bBezVedNR := true;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormNrVed.bBtnOkClick(Sender: TObject);
begin
  if cdsTmpVedNR.IsNull or (cdsTmpVedNR.AsString = '') or
                        (cdsTmpVedNR.AsInteger <= 0) then begin
    ShowMessage('Ќомер ведомости дожен быть не пустым, ' +
                             'положительным и больше нул€');
    cdsTmpVedNR.AsInteger := 1;
    dbeVedNR.SetFocus; end
  else begin
    bBezVedNR := false;
    ModalResult := mrOk;
  end;
end;

end.
