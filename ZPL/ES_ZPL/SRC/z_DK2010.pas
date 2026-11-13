unit z_DK2010;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  inifiles, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBTables,
  Menus;

type
  TFormDk2010 = class(TForm)
    qryDK: TQuery;
    dsrcDK: TDataSource;
    dbgrDK: TDBGrid;
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryDKCODE: TStringField;
    qryDKC_ZKPP: TStringField;
    qryDKNAMED: TStringField;
    qryDKNAMEFULL: TStringField;
    labelCountRec: TLabel;
    LabelRecNo: TLabel;
    qryDKid: TIntegerField;
    qryDKkdok: TIntegerField;
    qryDKnameok: TStringField;
    LebelOrder: TLabel;
    popSort: TPopupMenu;
    N1: TMenuItem;
    popOrderByCode: TMenuItem;
    popOrderByNameOK: TMenuItem;
    popOrderByCodeOK: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure qryDKAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dbgrDKDblClick(Sender: TObject);
    procedure dbgrDKKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure popOrderByNameOKClick(Sender: TObject);
    procedure popOrderByCodeClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure popOrderByCodeOKClick(Sender: TObject);
  private
    bVuborMode : Boolean;
    n_SvOrder  : SmallInt;
    procedure OpenQryDK;
  public
    class procedure ShowDK2010;
    class function GetDkRkvzt(var KdOK: SmallInt;
      var RetNmOK, RetCode, RetZ_Kpp, RetNameD,
      RetNameFull: ShortString): Boolean;
  end;

const
  SECTION = 'z_DK2010';

var
  nSvId, nSvShwKdOK: Integer;

implementation

uses
  a_Const, a_Dm, z_DM, z_Main;

{$R *.dfm}
//------------------------------------------------------------------------------
class procedure TFormDk2010.ShowDK2010;
begin
  with TFormDK2010.Create(nil) do begin
    OpenQryDK;
    QryDK.Locate('KDOK', nSvShwKdOK, []);

    Caption    := 'Классификатор профессий ДК 003:2010';
    LabelCountRec.Caption := 'Записей: ' + IntToStr(QryDK.RecordCount);

    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
class function TFormDk2010.GetDkRkvzt(
  var KdOK: SmallInt;
  var RetNmOK, RetCode, RetZ_Kpp, RetNameD, RetNameFull: ShortString
): Boolean;
begin
  Result := false;
  
  with TFormDK2010.Create(nil) do begin
    bVuborMode := true;
    n_SvOrder := 1;

    OpenQryDK;

    Caption := 'Выбор из Классификатора профессий ДК 003:2010';
    LabelCountRec.Caption := 'Записей: ' + intToStr(qryDK.RecordCount);

    if (KdOK <> 0) and not QryDK.Locate('KdOK', KdOK, []) then
    if (nSvId <> 0) and not QryDK.Locate('Id', nSvId, []) then
       qryDK.Locate('KdOK', nSvShwKdOK, []);

    If ShowModal  = mrOk then begin
      KdOk        := qryDKKdOK.AsInteger;
      nSvShwKdOK  := qryDKKdOK.AsInteger;
      nSvId       := qryDKId.AsInteger;
      RetNmOK     := qryDKNameOK.AsString;
      RetCode     := qryDKCode.AsString;
      RetZ_Kpp    := qryDKC_ZKpp.AsString;
      RetNameD    := qryDKNameD.AsString;
      RetNameFull := qryDKNameFull.AsString;
      Result      := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDk2010.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Width:= ReadInteger(SECTION, 'wW', 600);
    Height:= ReadInteger(SECTION, 'wH', 400);
    nSvId  := ReadInteger(SECTION, 'nSvId', 0);
    nSvShwKdOK  := ReadInteger(SECTION, 'nSvShwKdOK', 1);
    n_SvOrder := ReadInteger(SECTION, 'nSvOrder', 1);
    Free;
  end;
  bBtnOk.Visible := bVuborMode;
  If n_SvOrder = 1 then begin
    popOrderByCode.Checked   := true;
    popOrderByNameOK.Checked := false;
    popOrderByCodeOk.Checked := false;
  end else if n_SvOrder = 2 then begin
    popOrderByCode.Checked   := false;
    popOrderByNameOK.Checked := true;
    popOrderByCodeOk.Checked := false;
  end else begin
    popOrderByCode.Checked   := false;
    popOrderByNameOK.Checked := false;
    popOrderByCodeOk.Checked := true;
  end;
  if FileExists(cDirVids + 'GrDK_2.vid') then
    dbgrDK.Columns.LoadFromFile(cDirVids + 'GrDK_2.vid');
end;

//------------------------------------------------------------------------------
procedure TFormDk2010.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  nSvShwKdOK := qryDkKdOK.AsInteger;
  nSvId      := qryDkId.AsInteger;
  dbgrDK.Columns.SaveToFile(cDirVids + 'GrDK_2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'wH', Height);
    if not bVuborMode then
       WriteInteger(SECTION, 'nSvShwKdOK', nSvShwKdOK)
    else
       WriteInteger(SECTION, 'nSvId', nSvId);
    // if popOrderByCode.Checked then
    //   WriteInteger(SECTION, 'nSvOrder', 1)
    // else
    //   WriteInteger(SECTION, 'nSvOrder', 2);
    WriteInteger(SECTION, 'nSvOrder', n_SvOrder);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDk2010.OpenQryDK;
begin
  with qryDk do begin
    if Active then Close;
    SQL.Clear;
    DatabaseName := CESMAIN;
    SQL.Add('Select * from o_dolgnost ');
    If n_SvOrder = 1 then begin
      SQL.Add(' order by Code, c_Zkpp, nameOk');
      LebelOrder.Caption := 'Сортировка по  полю "CODE"' +
                            '(Код Державного Класификатора)';
    end else if n_SvOrder = 2 then begin
      SQL.Add(' order by NameOK, Code, c_Zkpp');
      LebelOrder.Caption := 'Сортировка по  полю "NameOK" '+
                            '(Наименование Должности Отдела Кадров)';
    end else begin
      SQL.Add(' order by kdOK, NameOK, Code, c_Zkpp');
      LebelOrder.Caption := 'Сортировка по  полю "KdOK" '+
                            '(Код Должности Отдела Кадров)';
    end;
    Open;
  end;
(*
  with qryDk do begin
    Active := false;
    SQL.Clear;
    DatabaseName := CESOK;
    SQL.Add('Select * from o_dolgnost ');
    If popOrderByCode.Checked then begin
      SQL.Add(' order by Code, c_Zkpp, nameOk');
      LebelOrder.Caption := 'Сортировка по  полю "CODE"' +
                            '(Код Державного Класификатора)'; end
    else begin
      SQL.Add(' order by NameOK, Code, c_Zkpp');
      LebelOrder.Caption := 'Сортировка по  полю "NameOK" '+
                            '(Наименование Должности Отдела Кадров)';
    end;
    Active := true;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormDk2010.qryDKAfterScroll(DataSet: TDataSet);
begin
// labelRecNo.Caption := 'Запись: ' + intToStr(qryDK.RecNo);
end;
//------------------------------------------------------------------------------
procedure TFormDk2010.FormShow(Sender: TObject);
begin
  if bVuborMode then begin
    bBtnOk.Visible := true; end
  else bBtnCancel.Caption := 'Выход';
end;
//------------------------------------------------------------------------------
procedure TFormDk2010.dbgrDKDblClick(Sender: TObject);
begin
  if bVuborMode then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormDk2010.dbgrDKKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (key = 13) and bVuborMode then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormDk2010.popOrderByCodeClick(Sender: TObject);
var nTmpSvRec : SmallInt;
begin
  if not popOrderByCode.Checked then begin
    nTmpSvRec := qryDkid.AsInteger;
    popOrderByCode.Checked   := true;
    popOrderByNameOK.Checked := false;
    popOrderByCodeOk.Checked := false;
    n_SvOrder := 1;
    OpenQryDK;
    qryDK.Locate('id', nTmpSvRec, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDk2010.popOrderByNameOKClick(Sender: TObject);
var nTmpSvRec : SmallInt;
begin
  if not popOrderByNameOK.Checked then begin
    nTmpSvRec := qryDkid.AsInteger;
    popOrderByCode.Checked   := false;
    popOrderByNameOK.Checked := true;
    popOrderByCodeOk.Checked   := false;
    n_SvOrder := 2;
    OpenQryDK;
    qryDK.Locate('id', nTmpSvRec, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDk2010.popOrderByCodeOKClick(Sender: TObject);
var nTmpSvRec : SmallInt;
begin
  if not popOrderByCodeOk.Checked then begin
    nTmpSvRec := qryDkid.AsInteger;
    popOrderByCode.Checked   := false;
    popOrderByNameOK.Checked := false;
    popOrderByCodeOk.Checked := true;
    n_SvOrder := 3;
    OpenQryDK;
    qryDK.Locate('id', nTmpSvRec, []);
  end;
end;

end.
