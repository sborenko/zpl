unit Z_GtPdn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Db, ExtCtrls, Grids, DBGrids, Menus, StdCtrls,
  Buttons, DBTables;

type
  TFormVbrShPdN = class(TForm)
    dbgrShPdN: TDBGrid;
    dsrcShPdN: TDataSource;
    popMnu: TPopupMenu;
    popMnuEdt: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuDel: TMenuItem;
    qryTmp: TQuery;
    PanelButtons: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrShPdNDblClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuAddClick(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure dbgrShPdNKeyDown(Sender: TObject; var Key: Word;
                                                Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetShPdN(var nKdShPdN : integer;
                                     var cNmShPdN, cShShPdN : string) : boolean;
procedure ShPdNShowModal;

const SECTION = 'Z_GtPdN';

var
  FormVbrShPdN: TFormVbrShPdN;
  bVuborMode : boolean;

implementation

uses A_Const, A_DM, Z_DM;

{$R *.DFM}

//--------------------------------------------------------------------
procedure ShPdNShowModal;
begin
  bVuborMode := false;
  FormVbrShPdN := TFormVbrShPdN.Create(Application);
  with FormVbrShPdN do begin
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    if not dsrcShPdN.DataSet.Active then
      dsrcShPdN.DataSet.Open;
    ShowModal;
    Free;
  end;
end;
//--------------------------------------------------------------------
function GetShPdN(var nKdShPdN : integer;
                       var cNmShPdN, cShShPdN : string) : boolean;
begin
  Result := false;
  bVuborMode := true;
  FormVbrShPdN := TFormVbrShPdN.Create(Application);
  with FormVbrShPdN do begin
    if not dsrcShPdN.DataSet.Active then
      dsrcShPdN.DataSet.Open;
    if nKdShPdN > 0 then
      dsrcShPdN.DataSet.Locate('KdSh', nKdShPdN, []);
    if ShowModal = mrOk then begin
      nKdShPdN := dsrcShPdN.DataSet.FieldByName('KdSh').asInteger;
      cNmShPdN := dsrcShPdN.DataSet.FieldByName('NmSh').asString;
      cShShPdN := dsrcShPdN.DataSet.FieldByName('ShSh').asString;
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormVbrShPdN.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 128);
    Free;
  end;
  if FileExists(cDirVids + 'z_ShPdn.vid') then
    dbgrShPdN.Columns.LoadFromFile(cDirVids + 'z_ShPdn.vid');
end;
//--------------------------------------------------------------------
procedure TFormVbrShPdN.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  dbgrShPdN.Columns.SaveToFile(cDirVids + 'z_ShPdn.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormVbrShPdN.dbgrShPdNDblClick(Sender: TObject);
begin
  if bVuborMode and (dsrcShPdN.DataSet.RecordCount <> 0) then
    ModalResult := mrOk;
end;
//--------------------------------------------------------------------
procedure TFormVbrShPdN.dbgrShPdNKeyDown(Sender: TObject;
                                   var Key: Word; Shift: TShiftState);
begin
  if bVuborMode and (Key = VK_RETURN) and (Shift = [ssCtrl]) and
                             (dsrcShPdN.DataSet.RecordCount <> 0) then
    ModalResult := mrOk;
end;
//--------------------------------------------------------------------
procedure TFormVbrShPdN.popMnuPopup(Sender: TObject);
begin
  popMnuEdt.Enabled := dsrcShPdN.DataSet.RecordCount <> 0;
  popMnuDel.Enabled := popMnuEdt.Enabled;
end;
//--------------------------------------------------------------------
procedure TFormVbrShPdN.popMnuEdtClick(Sender: TObject);
var cNmSh : string; nEdtNR : integer;
begin
  cNmSh := dsrcShPdN.DataSet.FieldByName('NmSh').asString;
  if InputQuery('Редактирование',
                     'Введите новое название', cNmSh) then begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    nEdtNR := dsrcShPdN.DataSet.FieldByName('NR').asInteger;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Update Z_ShPdN set NmSh = :cNmSh ' +
              ' where NR = :nEdtNR');
      ParamByName('cNmSh').asString  := cNmSh;
      ParamByName('nEdtNR').asInteger := nEdtNR;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with dsrcShPdN.DataSet do begin
      Close;
      Open;
      Locate('NR', nEdtNR, []);
    end;
    Screen.Cursor := crDefault;
  end;
end;
//--------------------------------------------------------------------
procedure TFormVbrShPdN.popMnuAddClick(Sender: TObject);
var cNmSh : string; nKdSh : integer;
begin
  cNmSh := 'Новая схема подоходного';
  if InputQuery('Новая запись',
                     'Введите название схемы', cNmSh) and
                                          (cNmSh <> '') then begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select Max(KdSh) as MaxKdSh from Z_ShPdN');
      Open;
      if (RecordCount <> 0) and
                    (FieldByName('MaxKdSh').asInteger > 0) then
        nKdSh := FieldByName('MaxKdSh').asInteger + 1
      else
        nKdSh := 1;
      Close;
      SQL.Clear;
      SQL.Add('Insert into Z_ShPdN ' +
              ' (KdSh, NmSh) values (:nKdSh, :cNmSh)');
      ParamByName('nKdSh').asSmallInt := nKdSh;
      ParamByName('cNmSh').asString   := cNmSh;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with dsrcShPdN.DataSet do begin
      Close;
      Open;
      Locate('KdSh', nKdSh, []);
    end;
    Screen.Cursor := crDefault;
  end;
end;
//--------------------------------------------------------------------
procedure TFormVbrShPdN.popMnuDelClick(Sender: TObject);
var nDelKdSh, nSvNR : integer; bEof, bDeleted : boolean;
begin
  nDelKdSh := dsrcShPdN.DataSet.FieldByName('KdSh').asInteger;
  bDeleted := false;
  bEof := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count(*) as CntSh from Z_Pere ' +
            ' where PdNlg = :nDelKdSh');
    ParamByName('nDelKdSh').asSmallInt := nDelKdSh;
    Open;
    if (RecordCount <> 0) and
                    (FieldByName('CntSh').asInteger > 0) then
      MessageDlg('Нельзя удалять эту запись - ссылки' + #13#10 +
               'на нее есть в других таблицах !', mtError, [mbOk], 0)
    else if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                     mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      Close;
      SQL.Clear;
      SQL.Add('Delete from Z_ShPdN where KdSh = :nDelKdSh');
      ParamByName('nDelKdSh').asSmallInt := nDelKdSh;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
      bDeleted := true;
    end;
  end;
  if bDeleted then with dsrcShPdN.DataSet do begin
    DisableControls;
    Next;
    nSvNR := 0;
    if Eof then bEof := true
    else nSvNR := FieldByName('NR').asInteger;
    Close;
    Open;
    if bEof then Last
    else Locate('NR', nSvNR, []);
    EnableControls;
  end;
  Screen.Cursor := crDefault;
end;

end.
