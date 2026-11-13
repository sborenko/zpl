unit Z_VbRMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, DBTables, IniFiles,
  ExtCtrls;

type
  TFormVbRMes = class(TForm)
    dsrcMesNU: TDataSource;
    dbgrMesNU: TDBGrid;
    PanelButtons: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
//    procedure qryMesNUCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrMesNUDblClick(Sender: TObject);
    procedure dbgrMesNUKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function VuborRMes(var dDtRM : TDateTime) : boolean;

const SECTION = 'Z_VbRMes';

var
  FormVbRMes: TFormVbRMes;

implementation

uses A_Const, A_DM, Z_DM, Z_Main, A_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function VuborRMes(var dDtRM : TDateTime) : boolean;
begin
  Result := false;
  FormVbRMes := TFormVbRMes.Create(Application);
  with FormVbRMes do begin
    Caption := 'Âûבמנ לוסÿצא';
    if not DmMain.qryMesSps.Active then
      DmMain.qryMesSps.Open;
    if dDtRM <> 0 then
      DmMain.qryMesSps.Locate('DtProc', dDtRM, []);
    if ShowModal = mrOk then begin
      dDtRM := DmMain.qryMesSps.FieldByName('DtProc').AsDateTime;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbRMes.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 170);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbRMes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbRMes.dbgrMesNUDblClick(Sender: TObject);
begin
  if DmMain.qryMesSps.RecordCount > 0 then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormVbRMes.dbgrMesNUKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (DmMain.qryMesSps.RecordCount > 0) and
                              (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    ModalResult := mrOk;
end;

end.
