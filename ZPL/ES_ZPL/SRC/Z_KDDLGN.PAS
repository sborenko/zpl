unit z_KdDlgn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, IniFiles, StdCtrls, Buttons, Menus,
  DB, DBTables;

type
  TFormGtDolgn = class(TForm)
    dbgrDolgn: TDBGrid;
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    popMnu: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    sBtnPodklZpZ: TSpeedButton;
    popAddFromZpZ: TMenuItem;
    qryTmp: TQuery;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    sBtnPrt: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrDolgnDblClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure popAddFromZpZClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    b_VuborMode : boolean;
    procedure AddZpzDolgn(cDirNm, cFileNm : string;
                                                       var nCntPodkl : integer);
    procedure AddRecToDolgn(nPost : integer; cDolgn, cNotes : string);
    function MyExistsDolgn(nKdDolgn : integer) : boolean;
  public
    { Public declarations }
  end;

const SECTION = 'zKdDlgn';

procedure ShowDolgn;
function GetDolgn(var nKdDolgn : integer;
                                 var cShDolgn, cNmDolgn : string) : boolean;

var
  FormGtDolgn: TFormGtDolgn;

implementation

uses A_Const, a_Dm, Z_Main, Z_DM, z_EDolgn, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetDolgn(var nKdDolgn : integer;
                                 var cShDolgn, cNmDolgn : string) : boolean;
begin
  Result := false;
  FormGtDolgn := TFormGtDolgn.Create(Application);
  with FormGtDolgn do begin
    b_VuborMode := true;
    with dbgrDolgn.DataSource.DataSet as TQuery do begin
      if not Active then Open;
      if nKdDolgn <> 0 then
        Locate('KdDolgn', nKdDolgn, [])
      else if cNmDolgn <> '' then
        Locate('NmDolgn', cNmDolgn, []);
      if ShowModal = mrOk then begin
        nKdDolgn := FieldByName('KdDolgn').AsInteger;
        cShDolgn := FieldByName('ShDolgn').AsString;
        cNmDolgn := FieldByName('NmDolgn').AsString;
        Result := true;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShowDolgn;
begin
  FormGtDolgn := TFormGtDolgn.Create(Application);
  with FormGtDolgn do begin
    b_VuborMode := false;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    Caption := 'Справочник "Должности"';
    if not DmMain.qryDolgn.Active then
      DmMain.qryDolgn.Open;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDolgn.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 405);
    Free;
  end;
  if FileExists(cDirVids + 'zDolgn.vid') then
    dbgrDolgn.Columns.LoadFromFile(cDirVids + 'zDolgn.vid');
  popAddFromZpZ.Enabled := bFlagDbg;
  sBtnPodklZpZ.Enabled := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormGtDolgn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrDolgn.Columns.SaveToFile(cDirVids + 'zDolgn.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDolgn.dbgrDolgnDblClick(Sender: TObject);
begin
  if b_VuborMode and (dbgrDolgn.DataSource.DataSet.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGtDolgn.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  with DmMain.qryDolgn do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    if AddEdtDolgn {z_EDolgn} then
      Post
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDolgn.popEdtClick(Sender: TObject);
begin
  with DmMain.qryDolgn do begin
    Edit;
    if AddEdtDolgn {z_EDolgn} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDolgn.popMnuPopup(Sender: TObject);
begin
  popEdt.Enabled := DmMain.qryDolgn.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;

procedure TFormGtDolgn.popDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                                             [mbYes, mbNo], 0) = mrYes then
    DmMain.qryDolgn.Delete;
end;

procedure TFormGtDolgn.popAddFromZpZClick(Sender: TObject);
var nCntPodkl : integer;
    cAlias, cDirNm, cFileNm, cMsg : string;
begin
  if MessageDlg('Подключить данные из спр-ка долностей старой зарплаты?:',
                    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    nCntPodkl := 0;
    cAlias := 'D_01';
    cDirNm := GetPhNameByAlias(cAlias);
    cFileNm := UpperCase('dolgnost.dbf');
    if not FormZpMain.MyFileExists(cDirNm, cFileNm) then
      ShowMessage('Не найден файл ' + cDirNm + cFileNm)
    else
      AddZpzDolgn(cDirNm, cFileNm, nCntPodkl);
    cMsg := 'Подключено записей: ' + #13#10 +
            '  из спр-ка должностей ' + IntToStr(nCntPodkl) + '.';
    ShowMessage(cMsg);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDolgn.AddZpzDolgn(cDirNm, cFileNm : string;
                                                       var nCntPodkl : integer);
var nPost : integer;
    cDolgn, cNotes : string;
begin
  nCntPodkl := 0;
  DmMain.qryDolgn.DisableControls;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDirNm;
    SQL.Add('Select * from "DOLGNOST.DBF" ' +
            ' order by Post');
    Open;
    while not Eof do begin
      nPost := FieldByName('Post').AsInteger;
      if not MyExistsDolgn(nPost) then begin
        cDolgn := FieldByName('Dolgnost').AsString;
        cNotes := FieldByName('Primech').AsString;
        AddRecToDolgn(nPost, cDolgn, cNotes);
        Inc(nCntPodkl);
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  DmMain.qryDolgn.EnableControls;
  if DmMain.qryDolgn.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([DmMain.qryDolgn]);
end;
//------------------------------------------------------------------------------
function TFormGtDolgn.MyExistsDolgn(nKdDolgn : integer) : boolean;
begin
  Result := DmMain.qryDolgn.Locate('KdDolgn', nKdDolgn, []);
end;
//------------------------------------------------------------------------------
procedure TFormGtDolgn.AddRecToDolgn(nPost : integer; cDolgn, cNotes : string);
begin
  with DmMain.qryDolgn do begin
    Append;
    FieldByName('KdDolgn').AsInteger := nPost;
    FieldByName('NmDolgn').AsString := cDolgn;
    FieldByName('Notes').AsString := cNotes;
    Post;
  end;
end;

procedure TFormGtDolgn.sBtnPrtClick(Sender: TObject);
begin
  F6PrtDolgnosti(dbgrDolgn.DataSource.DataSet as TQuery); {z_CmnPrt}
end;

end.
