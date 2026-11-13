unit z_MsgDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons;

type
  TFormMyMsgDlg = class(TForm)
    bBtnOk: TBitBtn;
    bBtnNo: TBitBtn;
    bBtnOk2: TBitBtn;
    MemoMsg: TMemo;
    LabelMsg: TLabel;
    procedure bBtnNoClick(Sender: TObject);
    procedure bBtnOkClick(Sender: TObject);
    procedure bBtnOk2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    nMy_Result : word;
  public
    { Public declarations }
  end;

function MyMsgDlg(cCaption, cMsg : string; nCase : word;
                                              var nMyResult : word) : boolean;

const SECTION = 'z_MsgDlg';

var
  FormMyMsgDlg: TFormMyMsgDlg;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function MyMsgDlg(cCaption, cMsg : string; nCase : word;
                                              var nMyResult : word) : boolean;
var nCntLines : integer;
begin
  Result := false;
  FormMyMsgDlg := TFormMyMsgDlg.Create(Application);
  with FormMyMsgDlg do begin
    nMy_Result := 0;
    if nCase = 1 then begin        // Видны кнопки "Нет" и "Да"
      bBtnOk.Visible := true;
      bBtnOk2.Visible := false;
      bBtnOk.Left := 114; end
    else if nCase = 2 then begin   // Видны кнопки "Нет" и "Да с пересчетом"
      bBtnOk.Visible := false;
      bBtnOk2.Visible := true; end
    else if nCase = 3 then begin   // Видны все три кнопки
      bBtnOk.Visible := true;
      bBtnOk2.Visible := true;
      bBtnOk.Left := 36;
    end;
    Caption := cCaption;
    LabelMsg.Caption := cMsg;
    MemoMsg.Text := cMsg;
    // MemoMsg держу только, чтобы посчитать nCntLine, а на деле оно NotVisible
    nCntLines := MemoMsg.Lines.Count;
    if nCntLines = 1 then
      Height := 86                 // 1 line
    else if nCntLines = 2 then
      Height := 99                 // 2 line
    else if nCntLines = 3 then
      Height := 109                // 3 line
    else if nCntLines = 4 then
      Height := 124                // 4 line
    else if nCntLines = 5 then
      Height := 136                // 5 line
    else if nCntLines = 6 then
      Height := 147                // 6 line
    else
      Height := 160;               // > 6 line  !!!
    if ShowModal = mrOk then begin
      nMyResult := nMy_Result;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyMsgDlg.bBtnNoClick(Sender: TObject);
begin
  nMy_Result := 0;
  ModalResult := mrCancel;
end;
//------------------------------------------------------------------------------
procedure TFormMyMsgDlg.bBtnOkClick(Sender: TObject);
begin
  nMy_Result := 1;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormMyMsgDlg.bBtnOk2Click(Sender: TObject);
begin
  nMy_Result := 2;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormMyMsgDlg.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 450);
    Top  := ReadInteger(SECTION, 'wT', 450);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyMsgDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
