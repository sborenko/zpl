unit z_VbDrZd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons;

type
  TFormVbDirZd = class(TForm)
    LbxDirOldZp: TListBox;
    sBtnMoveUpi: TSpeedButton;
    sBtnMoveNadb: TSpeedButton;
    sBtnMoveUdrg: TSpeedButton;
    sBtnMoveSps: TSpeedButton;
    sBtnMoveNU: TSpeedButton;
    sBtnMoveOtkl: TSpeedButton;
    sBtnMoveOtp: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    sBtnMovePere2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnMoveUpiClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetMemoText;
  public
    { Public declarations }
  end;

function VuborDir(var cAlias : string; var nCase : word) : boolean;

const SECTION = 'z_VbDrZd';

var
  FormVbDirZd: TFormVbDirZd;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function VuborDir(var cAlias : string; var nCase : word) : boolean;
begin
  Result := false;
  FormVbDirZd := TFormVbDirZd.Create(Application);
  with FormVbDirZd do begin
    Caption := 'Формирование задания';
    cAlias := '';
    nCase := 0;
    if ShowModal = mrOk then begin
      if LbxDirOldZp.ItemIndex = 0 then
        cAlias := 'D_01'
      else if LbxDirOldZp.ItemIndex = 1 then
        cAlias := 'D_02'
      else if LbxDirOldZp.ItemIndex = 2 then
        cAlias := 'D_03'
      else if LbxDirOldZp.ItemIndex = 3 then
        cAlias := 'D_04'
      else if LbxDirOldZp.ItemIndex = 4 then
        cAlias := 'D_05'
      else
        cAlias := 'D_06';
      if sBtnMoveUpi.Down then
        nCase := 1
      else if sBtnMovePere2.Down then
        nCase := 2
      else if sBtnMoveNadb.Down then
        nCase := 3
      else if sBtnMoveUdrg.Down then
        nCase := 4
      else if sBtnMoveSps.Down then
        nCase := 5
      else if sBtnMoveNu.Down then
        nCase := 6
      else if sBtnMoveOtkl.Down then
        nCase := 7
      else
        nCase := 8;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbDirZd.FormCreate(Sender: TObject);
var nBtnCase : word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    LbxDirOldZp.ItemIndex := ReadInteger(SECTION, 'nDirOldZp', 0);
    nBtnCase := ReadInteger(SECTION, 'nBtnCase', 1);
    Free;
  end;
  if nBtnCase = 1 then
    sBtnMoveUpi.Down := true
  else if nBtnCase = 2 then
    sBtnMovePere2.Down := true
  else if nBtnCase = 3 then
    sBtnMoveNadb.Down := true
  else if nBtnCase = 4 then
    sBtnMoveUdrg.Down := true
  else if nBtnCase = 5 then
    sBtnMoveSps.Down := true
  else if nBtnCase = 6 then
    sBtnMoveNu.Down := true
  else if nBtnCase = 7 then
    sBtnMoveOtkl.Down := true
  else
    sBtnMoveOtp.Down := true;
  SetMemoText;
end;
//------------------------------------------------------------------------------
procedure TFormVbDirZd.FormClose(Sender: TObject; var Action: TCloseAction);
var nBtnCase : word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'nDirOldZp', LbxDirOldZp.ItemIndex);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if sBtnMoveUpi.Down then
      nBtnCase := 1
    else if sBtnMovePere2.Down then
      nBtnCase := 2
    else if sBtnMoveNadb.Down then
      nBtnCase := 3
    else if sBtnMoveUdrg.Down then
      nBtnCase := 4
    else if sBtnMoveSps.Down then
      nBtnCase := 5
    else if sBtnMoveNu.Down then
      nBtnCase := 6
    else if sBtnMoveOtkl.Down then
      nBtnCase := 7
    else
      nBtnCase := 8;
    WriteInteger(SECTION, 'nBtnCase', nBtnCase);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbDirZd.sBtnMoveUpiClick(Sender: TObject);
begin
  SetMemoText;
end;
//------------------------------------------------------------------------------
procedure TFormVbDirZd.SetMemoText;
var cMsg : string;
begin
  if sBtnMoveUpi.Down then
    cMsg := 'В выбранной директории-алиасе должны быть файлы:' +
            ' UPI.DBF, Pere2.DBF ' + #13#10 +
            'В Pere2.dbf должно быть поле NR и сделано из FOXa' + #13#10 +
            'REPLACE ALL NR WITH RECNO()'
  else if sBtnMovePere2.Down then
    cMsg := 'В выбранной директории-алиасе должен быть файл Pere.dbf: ' + #13#10 +
            'В Pere.dbf д.б. добавлено поле NR и сделано из FOXa Replace all NR with RecNo()'
  else if sBtnMoveNadb.Down then
    cMsg := 'Проверить при отладке!. В выбранной директории-алиасе должны быть файлы: ' + #13#10 +
            ' UPI.DBF, NADB.DBF'
  else if sBtnMoveUdrg.Down then
    cMsg := 'Проверить при отладке!. В выбранной директории-алиасе должны быть файлы: ' + #13#10 +
            ' UPI.DBF, UDRG.DBF '
  else if sBtnMoveSps.Down then
    cMsg := 'Проверить при отладке!. В выбранной директории-алиасе должны быть файлы: ' + #13#10 +
            ' UPI.DBF, SPS''ы.DBF'
  else if sBtnMoveNu.Down then
    cMsg := 'Заполнить при отладке!!!.'
  else if sBtnMoveOtkl.Down then
    cMsg := 'Заполнить при отладке!!!.'
  else
    cMsg := 'Заполнить при отладке!!!.';
  Memo1.Text := cMsg;
end;

end.
