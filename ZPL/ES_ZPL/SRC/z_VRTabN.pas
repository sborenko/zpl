unit z_VRTabN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls;

type
  TFormVbrResTabN = class(TForm)
    dbgrTmp: TDBGrid;
    dsrcTmp: TDataSource;
    PanelButtons: TPanel;
    Label1: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrTmpEnter(Sender: TObject);
    procedure dbgrTmpExit(Sender: TObject);
    procedure dbgrTmpDblClick(Sender: TObject);
    procedure dbgrTmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function VuborResTabN(qryTmp : TQuery; var nKdObj : integer) : boolean;

const SECTION = 'z_VRTabN';

var
  FormVbrResTabN: TFormVbrResTabN;

implementation

uses a_Const, a_DM, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function VuborResTabN(qryTmp : TQuery; var nKdObj : integer) : boolean;
begin
  Result := false;
  FormVbrResTabN := TFormVbrResTabN.Create(Application);
  with FormVbrResTabN do begin
    dsrcTmp.DataSet := qryTmp;
    nKdObj := 0;
    if ShowModal = mrOk then begin
      nKdObj := qryTmp.FieldByName('KdObj').AsInteger;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbrResTabN.FormCreate(Sender: TObject);
begin
  Caption := 'Сделайте выбор';
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL',350);
	  Top    := ReadInteger(SECTION, 'wT', 450);
    Height := ReadInteger(SECTION, 'wH', 155);
    Width  := ReadInteger(SECTION, 'wW', 415);
	  Free;
  end;
  if FileExists(cDirVids + 'VRTabN02.vid') then
    dbgrTmp.Columns.LoadFromFile(cDirVids + 'VRTabN02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormVbrResTabN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsrcTmp.DataSet.Active then
    dbgrTmp.Columns.SaveToFile(cDirVids + 'VRTabN02.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbrResTabN.dbgrTmpEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormVbrResTabN.dbgrTmpExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormVbrResTabN.dbgrTmpDblClick(Sender: TObject);
begin
  if dsrcTmp.DataSet.RecordCount > 0 then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormVbrResTabN.dbgrTmpKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (dsrcTmp.DataSet.RecordCount > 0) and (Key = VK_RETURN) and
                                                      (Shift = [ssCtrl]) then
    ModalResult := mrOk;

end;

end.
