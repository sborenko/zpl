unit z_About;

interface

uses
  Buttons, Classes, ComCtrls, Controls, Db, DbTables, Dialogs, ExtCtrls, Forms,
  Graphics, StdCtrls, SysUtils, Windows, Mask, DBCtrls, Menus, jpeg;

type
  TFormAbout = class(TForm)
    Panel: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    ProgramIcon: TImage;
    BtnOk: TButton;
    BtnPrev: TButton;
    BtnNext: TButton;
    RichVersionInfo: TDBRichEdit;
    DbeVersion: TDBEdit;
    DatePick: TDateTimePicker;
    LblDate: TLabel;
    LblVersion: TLabel;
    Qry: TQuery;
    BtnAppend: TButton;
    BtnDelete: TButton;
    Dsrc: TDataSource;
    Upd: TUpdateSQL;
    Popup: TPopupMenu;
    NFont: TMenuItem;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnPrevClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnAppendClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure QryAfterInsert(DataSet: TDataSet);
    procedure DatePickChange(Sender: TObject);
    procedure NFontClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DsrcDataChange(Sender: TObject; Field: TField);

  private
    ReadOnly: boolean;

    CurVersionInfo: string;

    procedure LoadInfo(VerNum: ShortString);
    procedure CheckUpToDate(VerNum: ShortString);

    function DataAreCorrect: boolean;
    // function DataAreEmpty: boolean;
    procedure Complete;

    class function VersionWithoutBuild(FullVersion: ShortString): ShortString;
  public
    class procedure UpdateVersionInfo;
    class procedure Run;
  end;

implementation

uses
  a_Const, VersionInfo, QryUtils;

{$R *.DFM}

//------------------------------------------------------------------------------
class procedure TFormAbout.UpdateVersionInfo;
var
  VerNum: ShortString;
begin
  with TFormAbout.Create(Application) do begin
    ReadOnly := false;

    VerNum := VersionWithoutBuild(GetAppVersion);

    LoadInfo(VerNum);
    CheckUpToDate(VerNum);

    with Qry do begin
      FieldByName('VerInfo').AsString := CurVersionInfo;
      Post;
    end;

    Free;
  end;
end;

//------------------------------------------------------------------------------
class procedure TFormAbout.Run;
begin
  with TFormAbout.Create(nil) do begin
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormAbout.FormCreate(Sender: TObject);
begin
  CurVersionInfo :=
    'Приостановочные надбавки (5009, 5010) не инвертируются, ' +
    'а удаляются. После чего производится пересчёт.';
end;

//------------------------------------------------------------------------------
procedure TFormAbout.FormShow(Sender: TObject);
const
  OFFSET = 28;
begin
  LoadInfo('');

  Version.Caption := Version.Caption + GetAppVersion;

  ReadOnly := nAppKdUsr <> 101;

  if ReadOnly then begin
    DatePick.Enabled := false;
    DatePick.Color := clBtnFace;
    DatePick.Font.Color := clWindowText;
    DatePick.Font.Style := [fsBold];

    DbeVersion.ReadOnly := true;
    DbeVersion.Color := clBtnFace;
    DbeVersion.Font.Color := clWindowText;
    DbeVersion.Font.Style := [fsBold];

    RichVersionInfo.ReadOnly := true;
    RichVersionInfo.Color := clBtnFace;
    RichVersionInfo.Font.Color := clWindowText;
    RichVersionInfo.Font.Style := [fsBold];

    BtnAppend.Visible := false;
    BtnDelete.Visible := false;

    Height := Height - OFFSET;
  end else
    CheckUpToDate(VersionWithoutBuild(GetAppVersion));
end;

//------------------------------------------------------------------------------
procedure TFormAbout.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ReadOnly then
    exit;

  with Qry do
    if ModalResult = mrOk then
      if DataAreCorrect then
        Complete
      else begin
        ShowMessage('Заполнены не все поля.');
        CanClose := false;
      end
    else
      Cancel;
end;

//------------------------------------------------------------------------------
// Странный пипец не хочет работать ни вариант "first 1" ни "rows 1'.
//------------------------------------------------------------------------------
procedure TFormAbout.LoadInfo(VerNum: ShortString);
var
  Stmt: String;
begin
  Stmt :=
    'select VerDate, VerNum, VerInfo ' +
    'from Update_History ';
  if VerNum <> '' then
    Stmt := Stmt +
    'where VerNum = :Version ';
  Stmt := Stmt +
    'order by VerDate desc';
  TQryUtils.InitQuery(Qry);

  with Qry do begin
    SQL.Add(Stmt);
    if VerNum <> '' then
      ParamByName('Version').AsString := VerNum;
    Open;
    First;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormAbout.CheckUpToDate(VerNum: ShortString);
begin
  if ReadOnly then
    exit;

  with Qry do begin
    if VerNum <> FieldByName('VerNum').AsString then
      Append
    else
      Edit;
  end;
end;

//------------------------------------------------------------------------------
function TFormAbout.DataAreCorrect: boolean;
begin
  with Qry do
    Result := not Modified or (FieldByName('VerDate').AsDateTime <> 0)
      and (Trim(FieldByName('VerNum').AsString) <> '')
      and (Trim(FieldByName('VerInfo').AsString) <> '');
end;

//------------------------------------------------------------------------------
procedure TFormAbout.Complete;
begin
  {
  with Qry do
    if Modified then
      Post
    else
      Cancel;
  }
end;

//------------------------------------------------------------------------------
{
function TFormAbout.DataAreEmpty: boolean;
begin
  with Qry do
    Result :=(FieldByName('VerDate').AsDateTime = 0)
      and (Trim(FieldByName('VerNum').AsString) = '')
      and (Trim(FieldByName('VerInfo').AsString) = '');
end;
}

//------------------------------------------------------------------------------
// Сортировано по убыванию.
//------------------------------------------------------------------------------
procedure TFormAbout.BtnPrevClick(Sender: TObject);
begin
  Qry.Next;
  {
  if DataAreCorrect then begin
    Complete;

    with Qry do begin
      Next;
      Edit;
    end;
  end else
    ShowMessage('Заполнены не все поля.');
  }
end;

//------------------------------------------------------------------------------
// Сортировано по убыванию.
//------------------------------------------------------------------------------
procedure TFormAbout.BtnNextClick(Sender: TObject);
begin
  Qry.Prior;
  {
  if DataAreCorrect then begin
    Complete;

    with Qry do begin
      Prior;
      Edit;
    end;
  end else
    ShowMessage('Заполнены не все поля.');
  }
end;

//------------------------------------------------------------------------------
procedure TFormAbout.BtnAppendClick(Sender: TObject);
begin
  {
  if DataAreCorrect then begin
    Complete;
    Qry.Append;
  end else
    ShowMessage('Заполнены не все поля.');
  }
end;

//------------------------------------------------------------------------------
procedure TFormAbout.BtnDeleteClick(Sender: TObject);
begin
  {
  with Qry do begin
    Cancel;
    Delete;

    if RecordCount = 0 then
      Append
    else
      Edit;
  end;
  }
end;

//------------------------------------------------------------------------------
procedure TFormAbout.QryAfterInsert(DataSet: TDataSet);
begin
  with DataSet do begin
    FieldByName('VerNum').AsString := VersionWithoutBuild(GetAppVersion);
    FieldByName('VerDate').AsDateTime := Now;

    DatePick.DateTime := FieldByName('VerDate').AsDateTime;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormAbout.DatePickChange(Sender: TObject);
begin
  Qry.FieldByName('VerDate').AsDateTime := (Sender as TDateTimePicker).Date;
end;

//------------------------------------------------------------------------------
procedure TFormAbout.NFontClick(Sender: TObject);
begin
  if FontDialog.Execute then begin
    RichVersionInfo.SelAttributes.Name := FontDialog.Font.Name;
    RichVersionInfo.SelAttributes.Size := FontDialog.Font.Size;
    RichVersionInfo.SelAttributes.Style := FontDialog.Font.Style;
    RichVersionInfo.SelAttributes.Color := FontDialog.Font.Color;

    // После установки атрибутов он, похоже, уходит из режима редактирования.
    // Восстанавливаем.
    Qry.Edit;
  end;
end;

//------------------------------------------------------------------------------
class function TFormAbout.VersionWithoutBuild(
  FullVersion: ShortString): ShortString;
const
  DELIMIT_CHAR = '.';
var
  List: TStringList;
begin
  List := TStringList.Create;
  List.Delimiter := DELIMIT_CHAR;
  List.DelimitedText := FullVersion;
  List.Delete(3);

  Result := List.DelimitedText;
  List.Free;
end;

//------------------------------------------------------------------------------
procedure TFormAbout.DsrcDataChange(Sender: TObject; Field: TField);
begin
  DatePick.DateTime := Qry.FieldByName('VerDate').AsDateTime;
end;

end.

