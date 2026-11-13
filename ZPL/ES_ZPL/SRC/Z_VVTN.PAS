unit Z_VvTn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, DBTables, IniFiles;

type
  TFormVvTabN = class(TForm)
    tblTmp: TTable;
    tblTmpTabN: TIntegerField;
    Label1: TLabel;
    dbeTabN: TDBEdit;
    dsrcTmp: TDataSource;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelFamIO: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeTabNEnter(Sender: TObject);
    procedure dbeTabNExit(Sender: TObject);
  private
    { Private declarations }
    n_SvTabN : integer;
    procedure CreOpenTblTmp;
  public
    { Public declarations }
  end;

function VvodTabN(var nTabN : integer; var cFamIO : ShortString) : boolean;

const SECTION = 'Z_VvTn';

var
  FormVvTabN: TFormVvTabN;

implementation

uses A_Const, Z_Main, Z_DM, z_TUpi;

{$R *.dfm}

//------------------------------------------------------------------------------
function VvodTabN(var nTabN : integer; var cFamIO : ShortString) : boolean;
begin
  Result := false;
  FormVvTabN := TFormVvTabN.Create(Application);
  with FormVvTabN do begin
    LabelFamIO.Caption := '';
    Caption := 'Ввод таб. номера';
    CreOpenTblTmp;
    if ShowModal = mrOk then begin
      nTabN := tblTmp.FieldByName('TabN').AsInteger;
      cFamIO := LabelFamIO.Caption;
      Result := true;
    end;
    with tblTmp do begin
      if Active then Close;
      DataBaseName := cDirInd;
      if Exists then DeleteTable;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvTabN.CreOpenTblTmp;
var cFamIO : string;
begin
  with tblTmp do begin
    if Active then Close;
    DataBaseName := cDirInd;
    if Exists then DeleteTable;
    DataBaseName := cDirInd;
    CreateTable;
    Open;
    Edit;
    if n_SvTabN > 0 then begin
      FieldByName('TabN').AsInteger := n_SvTabN;
      cFamIO := DmMain.TabN2FamIO(n_SvTabN); {z_Dm}
      if cFamIO <> '' then
        LabelFamIO.Caption := cFamIO
      else
        LabelFamIO.Caption := '???';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvTabN.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    n_SvTabN := ReadInteger(SECTION, 'nSvTn', 0);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvTabN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nSvTn', tblTmp.FieldByName('TabN').AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvTabN.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) then begin
    bBtnOk.SetFocus;
    if ((tblTmp.FieldByName('TabN').AsString = '') or
                      (tblTmp.FieldByName('TabN').AsInteger <= 0)) then begin
      CanClose := false;
      ModalResult := mrNone;
      ShowMessage('Некорректный табельный номер');
      dbeTabN.SetFocus;
    end;  
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvTabN.dbeTabNEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVvTabN.dbeTabNExit(Sender: TObject);
var cFamIO : string;
begin
  (Sender as TDBEdit).Color := clWindow;
  if (tblTmp.FieldByName('TabN').AsString <> '') and
                (tblTmp.FieldByName('TabN').AsInteger > 0) then begin
    cFamIO := DmMain.TabN2FamIO(tblTmp.FieldByName('TabN').AsInteger); {z_Dm}
    if cFamIO <> '' then
      LabelFamIO.Caption := cFamIO
    else
      LabelFamIO.Caption := '??????';
  end;
end;

end.
