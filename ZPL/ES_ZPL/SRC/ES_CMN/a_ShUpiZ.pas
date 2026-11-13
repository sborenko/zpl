unit a_ShUpiZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls,
  Menus;

type
  TForm_ShUpi = class(TForm)
    dbgrUpi: TDBGrid;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    DBNavigator1: TDBNavigator;
    pop: TPopupMenu;
    popSort: TMenuItem;
    popSortFIO: TMenuItem;
    popSortTabN: TMenuItem;
    popSeek: TMenuItem;
    LabelCountRec: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popSortFIOClick(Sender: TObject);
    procedure popSortTabNClick(Sender: TObject);
    procedure popSeekClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrUpiDblClick(Sender: TObject);
  private
    { Private declarations }
    bVuborMode : boolean;
  public
    { Public declarations }
  end;

procedure Shw_Upi(nTabN : integer);
function Get_FromUpi(var nTabN : integer;
                               var cFam, cIma, cOtch : ShortString) : boolean;



const SECTION = 'k_ShUpi';

var
  Form_ShUpi: TForm_ShUpi;

implementation

uses A_Const, a_Lib, A_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure Shw_Upi(nTabN : integer);
begin
  Form_ShUpi := TForm_ShUpi.Create(Application);
  with Form_ShUpi do begin
    bVuborMode := false;
    if not Form_DM.qryUpi.Active then
      Form_DM.OpenQryUpi(nKmdUpiSortMode);
    if nTabN <> 0 then
      Form_DM.QryUpi.Locate('TabN', nTabN, []);
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    Caption := 'Сотрудники';
    LabelCountRec.Caption := 'Записей: ' + IntToStr(Form_DM.qryUpi.RecordCount);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function Get_FromUpi(var nTabN : integer;
                                var cFam, cIma, cOtch : ShortString) : boolean;
begin
  Result := false;
  Form_ShUpi := TForm_ShUpi.Create(Application);
  with Form_ShUpi do begin
    bVuborMode := true;
    if not Form_DM.qryUpi.Active then
      Form_DM.OpenQryUpi(nKmdUpiSortMode);
    if nTabN <> 0 then
      Form_DM.QryUpi.Locate('TabN', nTabN, []);
    Caption := 'Выбор сотрудника';
    LabelCountRec.Caption := 'Записей: ' + IntToStr(Form_DM.qryUpi.RecordCount);
    if ShowModal = mrOk then begin
      nTabN := Form_DM.QryUpiTabN.AsInteger;
      cFam := Form_DM.QryUpiFam.AsString;
      cIma := Form_DM.QryUpiIma.AsString;
      cOtch := Form_DM.QryUpiOtch.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_ShUpi.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 505);
    Free;
  end;
  popSortTabN.Checked := (nKmdUpiSortMode = 0);
  popSortFIO.Checked := not popSortTabN.Checked;
  if FileExists(cDirVids + 'grUpi02.vid') then
    dbgrUpi.Columns.LoadFromFile(cDirVids + 'grUpi02.vid');
end;
//------------------------------------------------------------------------------
procedure TForm_ShUpi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrUpi.Columns.SaveToFile(cDirVids + 'grUpi02.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_ShUpi.popSortFIOClick(Sender: TObject);
var nSvNR : integer;
begin
  if not popSortFIO.Checked then begin
    nSvNR := 0;
    if Form_DM.qryUpi.Active then
      nSvNR := Form_DM.qryUpiNR.AsInteger;
    popSortFIO.Checked := true;
    popSortTabN.Checked := false;
    nKmdUpiSortMode := 1;
    Form_DM.OpenQryUpi(nKmdUpiSortMode);
    if nSvNR <> 0 then
      Form_DM.qryUpi.Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_ShUpi.popSortTabNClick(Sender: TObject);
var nSvNR : integer;
begin
  if not popSortTabN.Checked then begin
    nSvNR := 0;
    if Form_DM.qryUpi.Active then
      nSvNR := Form_DM.qryUpiNR.AsInteger;
    popSortTabN.Checked := true;
    popSortFIO.Checked := false;
    nKmdUpiSortMode := 0;
    Form_DM.OpenQryUpi(nKmdUpiSortMode);
    if nSvNR <> 0 then
      Form_DM.qryUpi.Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_ShUpi.popSeekClick(Sender: TObject);
var nTabN, nCase : integer; cFamIO : ShortString;
begin
(*
  if VvodFmTnForUpi(nTabN, nCase, cFamIO) {z_VvFmTn} then begin
    if nCase = 0 {по ТабН} then begin
      if nTabN > 0 then begin
        if not Form_DM.qryUpi.Locate('TabN', nTabN, []) then
          ShowMessage('Табельный номер ' + IntToStr(nTabN) +
                      ' ' + cFamIO +
                      '  Вам не доступен.' + #13#10 +
                      'Возможно он уволен.');
      end; end
    else begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      Form_DM.qryUpi.Locate('TabN', nTabN, []);
      Screen.Cursor := crDefault;
    end;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TForm_ShUpi.FormKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где нужно, пользуйтесь контекстными меню')
  else if (Key = VK_F3) then
    popSeek.Click;
end;
//------------------------------------------------------------------------------
procedure TForm_ShUpi.dbgrUpiDblClick(Sender: TObject);
begin
  if bVuborMode and Form_DM.qryUpi.Active then
    ModalResult := mrOk;
end;

end.
