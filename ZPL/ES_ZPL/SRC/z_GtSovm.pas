unit z_GtSovm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Db, Grids, DBGrids, IniFiles,
  Menus, DBTables;

type
  TFormGetSovm = class(TForm)
    dbgrSovm: TDBGrid;
    dsrcSovm: TDataSource;
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
    procedure dbgrSovmDblClick(Sender: TObject);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuAddClick(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure dbgrSovmKeyDown(Sender: TObject; var Key: Word;
                                        Shift: TShiftState);
  private
    { Private declarations }
    bVuborMode : boolean;
  public
    { Public declarations }
  end;

function GetVidSovm(var nKdSovm: integer;
                                     var cShSovm, cNmSovm : string) : boolean;
procedure ShowSovm;

const SECTION = 'Z_GtSovm';

var
  FormGetSovm: TFormGetSovm;

implementation

uses A_Const, A_DM, Z_DM, z_ESovm;

{$R *.DFM}

//--------------------------------------------------------------------
procedure ShowSovm;
begin
  FormGetSovm := TFormGetSovm.Create(Application);
  with FormGetSovm do begin
    Caption := 'Виды совместительства';
    bVuborMode := false;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    if not dsrcSovm.DataSet.Active then
      DmMain.CreOpenCdsSovm;
    ShowModal;
    Free;
  end;
end;
//--------------------------------------------------------------------
function GetVidSovm(var nKdSovm: integer;
                                     var cShSovm, cNmSovm : string) : boolean;
begin
  Result := false;
  FormGetSovm := TFormGetSovm.Create(Application);
  with FormGetSovm do begin
    Caption := 'Выбор вида совместительства';
    bVuborMode := true;
    if not dsrcSovm.DataSet.Active then
      DmMain.CreOpenCdsSovm;
    if nKdSovm > 0 then
      dsrcSovm.DataSet.Locate('KdSovm', nKdSovm, []);
    if ShowModal = mrOk then begin
      nKdSovm := dsrcSovm.DataSet.FieldByName('KdSovm').AsInteger;
      cShSovm := dsrcSovm.DataSet.FieldByName('ShSovm').AsString;
      cNmSovm := dsrcSovm.DataSet.FieldByName('NmSovm').AsString;
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSovm.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 131);
    Width  := ReadInteger(SECTION, 'wW', 300);
    Free;
  end;
  if FileExists(cDirVids + 'z_GtSovm.vid') then
    dbgrSovm.Columns.LoadFromFile(cDirVids + 'z_GtSovm.vid');
end;
//--------------------------------------------------------------------
procedure TFormGetSovm.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  dbgrSovm.Columns.SaveToFile(cDirVids + 'z_GtSovm.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSovm.dbgrSovmDblClick(Sender: TObject);
begin
  if (dsrcSovm.DataSet.RecordCount > 0) then begin
    if bVuborMode then
      ModalResult := mrOk
    else
      popMnuEdt.Click;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSovm.dbgrSovmKeyDown(Sender: TObject;
                                   var Key: Word; Shift: TShiftState);
begin
  if bVuborMode and (Key = VK_RETURN) and (Shift = [ssCtrl]) and
                             (dsrcSovm.DataSet.RecordCount <> 0) then
    ModalResult := mrOk;
end;
//--------------------------------------------------------------------
procedure TFormGetSovm.popMnuPopup(Sender: TObject);
begin
  popMnuEdt.Enabled := dsrcSovm.DataSet.RecordCount <> 0;
  popMnuDel.Enabled := popMnuEdt.Enabled;
end;
//--------------------------------------------------------------------
procedure TFormGetSovm.popMnuEdtClick(Sender: TObject);
var nKdSovm : integer; cShSovm, cNmSovm, cNotes : string;
    bNewRec : boolean;
begin
  cShSovm := dsrcSovm.DataSet.FieldByName('ShSovm').AsString;
  cNmSovm := dsrcSovm.DataSet.FieldByName('NmSovm').AsString;
  cNotes  := dsrcSovm.DataSet.FieldByName('Notes').AsString;
  nKdSovm := dsrcSovm.DataSet.FieldByName('KdSovm').AsInteger;
  bNewRec := false;
  if EASovm(cShSovm, cNmSovm, cNotes, bNewRec) {z_ESovm} then begin
    Screen.Cursor := crHourGlass;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Update Z_KdSovm set ShSovm = :cShSovm, ' +
              ' NmSovm = :cNmSovm, Notes = :cNotes ' +
              ' where KdSovm = :nKdSovm');
      ParamByName('cShSovm').AsString  := cShSovm;
      ParamByName('cNmSovm').AsString  := cNmSovm;
      ParamByName('cNotes').AsString   := cNotes;
      ParamByName('nKdSovm').AsInteger := nKdSovm;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    DmMain.CreOpenCdsSovm;
    dsrcSovm.DataSet.Locate('KdSovm', nKdSovm, []);
    Screen.Cursor := crDefault;
    Screen.Cursor := crDefault;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSovm.popMnuAddClick(Sender: TObject);
var nKdSovm : integer; cShSovm, cNmSovm, cNotes : string;
    bNewRec : boolean;
begin
  cShSovm := '';
  cNmSovm := '';
  cNotes  := '';
  //nKdSovm := 0;
  bNewRec := true;
  if EASovm(cShSovm, cNmSovm, cNotes, bNewRec) {z_ESovm} then begin
    Screen.Cursor := crHourGlass;
    nKdSovm := DmMain.NewKdSovm;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Insert into Z_KdSovm (KdSovm, ShSovm, NmSovm, Notes) values ' +
              ' (:nKdSovm, :cShSovm, :cNmSovm, :cNotes)');
      ParamByName('nKdSovm').AsInteger := nKdSovm;
      ParamByName('cShSovm').AsString  := cShSovm;
      ParamByName('cNmSovm').AsString  := cNmSovm;
      ParamByName('cNotes').AsString   := cNotes;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    DmMain.CreOpenCdsSovm;
    dsrcSovm.DataSet.Locate('KdSovm', nKdSovm, []);
    Screen.Cursor := crDefault;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSovm.popMnuDelClick(Sender: TObject);
var nDelKdSovm, nSvNR : integer; bEof, bDeleted : boolean;
begin
  nDelKdSovm := dsrcSovm.DataSet.FieldByName('KdSovm').AsInteger;
  bDeleted := false;
  bEof := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count(*) as CntOpl from Z_Pere ' +
            ' where Sovm = :nDelKdSovm');
    ParamByName('nDelKdSovm').AsInteger := nDelKdSovm;
    Open;
    if (RecordCount <> 0) and
                    (FieldByName('CntOpl').asInteger > 0) then
      MessageDlg('Нельзя удалять эту запись - ссылки' + #13#10 +
               'на нее есть в других таблицах !', mtError, [mbOk], 0)
    else if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                     mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      Close;
      SQL.Clear;
      SQL.Add('Delete from Z_KdSovm where KdSovm = :nDelKdSovm');
      ParamByName('nDelKdSovm').AsInteger := nDelKdSovm;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
      bDeleted := true;
    end;
  end;
  if bDeleted then with dsrcSovm.DataSet do begin
    DisableControls;
    Next;
    nSvNR := 0;
    if Eof then
      bEof := true
    else
      nSvNR := FieldByName('NR').AsInteger;
    DmMain.CreOpenCdsSovm;
    if bEof then
      Last
    else
      Locate('NR', nSvNR, []);
    EnableControls;
  end;
  Screen.Cursor := crDefault;
end;

end.
