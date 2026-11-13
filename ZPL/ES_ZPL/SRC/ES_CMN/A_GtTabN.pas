unit A_GtTabN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, IniFiles,
  Menus;

type
  TFormGetTabN = class(TForm)
    qryUpi: TQuery;
    dsrcUpi: TDataSource;
    dbgrUpi: TDBGrid;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryUpiNR: TIntegerField;
    qryUpiTABN: TIntegerField;
    qryUpiFAM: TStringField;
    qryUpiIMA: TStringField;
    qryUpiOTCH: TStringField;
    qryUpiPOL: TStringField;
    qryUpiDTPRIEM: TDateTimeField;
    qryUpiDTUVOLN: TDateTimeField;
    qryUpiPRUV: TSmallintField;
    qryUpiID: TStringField;
    popMnu: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    qryTmp: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrUpiDblClick(Sender: TObject);
    procedure dbgrUpiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure popMnuPopup(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetTabN(var nTabN : integer; var cFam, cIma, cOtch : string;
                                      bCanAddEdt : boolean) : boolean;

const SECTION = 'A_GtTabN';

var
  FormGetTabN: TFormGetTabN;
  b_CanAddEdt : boolean;

implementation

uses A_Const, A_Dm, B_EUpi;

{$R *.DFM}

//--------------------------------------------------------------------
function GetTabN(var nTabN : integer; var cFam, cIma, cOtch : string;
                                      bCanAddEdt : boolean) : boolean;
begin
  Result := false;
  b_CanAddEdt := bCanAddEdt;
  FormGetTabN := TFormGetTabN.Create(Application);
  with FormGetTabN do begin
    qryUpi.Open;
    if qryUpi.RecordCount <> 0 then begin
      if ShowModal = mrOk then begin
        nTabN := qryUpi.FieldByName('TabN').asInteger;
        cFam  := qryUpi.FieldByName('Fam').asString;
        cIma  := qryUpi.FieldByName('Ima').asString;
        cOtch := qryUpi.FieldByName('Otch').asString;
        Result := true;
      end; end
    else begin
      ShowMessage('В таблице "Сотрудники" нет ни одной записи');
    end;
    qryUpi.Close;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetTabN.FormCreate(Sender: TObject);
begin
  Caption := 'Список сотрудников';
	with TIniFile.Create(cNmIniFile) do begin
  	Left   := ReadInteger(SECTION, 'wL', 100);
	  Top    := ReadInteger(SECTION, 'wT', 100);
  	Height := ReadInteger(SECTION, 'wH', 285);
	  Width  := ReadInteger(SECTION, 'wW', 450);
    Free;
  end;
  if FileExists(cDirVids + 'GtTabN.vid') then
    dbgrUpi.Columns.LoadFromFile(cDirVids + 'GtTabN.vid');
  if b_CanAddEdt then
    dbgrUpi.PopupMenu := popMnu
  else
    dbgrUpi.PopupMenu := NIL;
end;
//--------------------------------------------------------------------
procedure TFormGetTabN.FormClose(Sender: TObject;
                                           var Action: TCloseAction);
begin
  dbgrUpi.Columns.SaveToFile(cDirVids + 'GtTabN.vid');
	with TIniFile.Create(cNmIniFile) do begin
  	WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
  	WriteInteger(SECTION, 'wH', Height);
	  WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetTabN.dbgrUpiDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;
//--------------------------------------------------------------------
procedure TFormGetTabN.dbgrUpiKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    ModalResult := mrOk;
end;
//--------------------------------------------------------------------
procedure TFormGetTabN.popMnuPopup(Sender: TObject);
begin
  popEdt.Enabled := qryUpi.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//--------------------------------------------------------------------
procedure TFormGetTabN.popEdtClick(Sender: TObject);
var nSvNR : integer;
begin                      {B_EUpi}
  if Edt_InUpi(qryUpi.FieldByName('TabN').AsInteger) then
                                            with qryUpi do begin
    nSvNR := FieldByName('NR').AsInteger;
    Close;
    Open;
    Locate('NR', nSvNR, []);
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetTabN.popAddClick(Sender: TObject);
var nNewTabN : integer;
begin
  if Add_InUpi(nNewTabN) then with qryUpi do begin
    Close;
    Open;
    Locate('TabN', nNewTabN, []);
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetTabN.popDelClick(Sender: TObject);
var bCanDelete, bEof : boolean; nSvNR : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Select * from kss_mov where TabN = :nTabN');
    ParamByName('nTabN').AsInteger :=
                         qryUpi.FieldByName('TabN').AsInteger;
    Open;
    bCanDelete := RecordCount = 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if not bCanDelete then begin
    MessageDlg('Запись удалять нельзя. На нее' + #13#10 +
               'есть ссылки в других таблицах', mtError, [mbOk], 0);
    Exit;
  end;
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN; 
      SQL.Add('Delete from z_upi where NR = :nNR');
      ParamByName('nNR').AsInteger :=
                         qryUpi.FieldByName('NR').AsInteger;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    bEof := false;
    nSvNR := 0;
    with qryUpi do begin
      DisableControls;
      Next;
      if Eof then
        bEof := true
      else
        nSvNR := FieldByName('NR').AsInteger;
      Close;
      Open;
      if bEof then
        Last
      else
        Locate('NR', nSvNR, []);
      EnableControls;
    end;
  end;
end;

end.
