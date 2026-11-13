unit z_PstPsb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ExtCtrls, Grids, DBGrids, DB, StdCtrls, Buttons,
  DBTables, Menus;

type
  TFormPstPsb = class(TForm)
    Panel1: TPanel;
    dbgrPst: TDBGrid;
    Splitter1: TSplitter;
    dbgrPsb: TDBGrid;
    bBtnCancel: TBitBtn;
    bBtnOk: TBitBtn;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popPopup(Sender: TObject);
    procedure popAddClick(Sender: TObject);
(*
    procedure qryPstBeforePost(DataSet: TDataSet);
    procedure qryPstAfterPost(DataSet: TDataSet);
    procedure qryPsbAfterPost(DataSet: TDataSet);
*)
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure dbgrPstDblClick(Sender: TObject);
    procedure dbgrPsbDblClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
  private
    nSvKdPst : integer;
    bVuborMode : boolean;

    function PstIsInUse: Boolean;
    procedure DeleteScales;
    function DeleteConfirmed: Boolean;
  end;

procedure ShowPstPsb;
function GetKdPst(var nKdPst : integer; var cShPst, cNmPst : string) : boolean;

const SECTION = 'z_PstPsb';

var
  FormPstPsb: TFormPstPsb;

implementation

uses
  a_Const, a_Dm, z_Dm, z_Main, z_EAPst, z_EAPsb,
  QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetKdPst(var nKdPst : integer; var cShPst, cNmPst : string) : boolean;
begin
  Result := false;
  FormPstPsb := TFormPstPsb.Create(Application);
  with FormPstPsb do begin
    bVuborMode := true;
    Caption := 'Выбор вида почты';
    bBtnOk.Visible := true;
    DmMain.OpenQryPst;
    if nKdPst <> 0 then
      DmMain.qryPst.Locate('KdPst', nKdPst, [])
    else if nSvKdPst <> 0 then
      DmMain.qryPst.Locate('KdPst', nSvKdPst, []);
    DmMain.OpenQryPsb;
    DmMain.OpenQryPstShk;
    if ShowModal = mrOk then begin
      nKdPst := DmMain.qryPstKdPst.AsInteger;
      cShPst := DmMain.qryPstShPst.AsString;
      cNmPst := DmMain.qryPstNmPst.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShowPstPsb;
begin
  FormPstPsb := TFormPstPsb.Create(Application);
  with FormPstPsb do begin
    bVuborMode := false;
    Caption := 'Виды почт и почтовые сборы';
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    DmMain.OpenQryPst;
    if nSvKdPst <> 0 then
      DmMain.qryPst.Locate('KdPst', nSvKdPst, []);
    DmMain.OpenQryPsb;
    DmMain.OpenQryPstShk;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 385);
    Width  := ReadInteger(SECTION, 'wW', 440);
    nSvKdPst := ReadInteger(SECTION, 'nSvKdPst', 0);
    dbgrPst.Height := ReadInteger(SECTION, 'GrPstH', 150);
    Free;
  end;
  if FileExists(cDirVids + 'PstPsb01.vid') then
    dbgrPst.Columns.LoadFromFile(cDirVids + 'PstPsb01.vid');
  if FileExists(cDirVids + 'PstPsb_2.vid') then
    dbgrPsb.Columns.LoadFromFile(cDirVids + 'PstPsb_2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPst.Columns.SaveToFile(cDirVids + 'PstPsb01.vid');
  dbgrPsb.Columns.SaveToFile(cDirVids + 'PstPsb_2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvKdPst',
                            DmMain.qryPst.FieldByName('KdPst').AsInteger);
    WriteInteger(SECTION, 'GrPstH', dbgrPst.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.popPopup(Sender: TObject);
begin
  if pop.PopupComponent = dbgrPst then begin
    popHead.Caption := '= =   П о ч т ы   = =';
    popEdt.Enabled := (DmMain.qryPst.RecordCount > 0) and
                       (DmMain.qryPst.FieldByName('KdPst').AsInteger > 0);
    popDel.Enabled := popEdt.Enabled; end
  else begin
    popHead.Caption := '==  Почтовые сборы  ==';
    popEdt.Enabled := DmMain.qryPsb.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled;
    popAdd.Enabled := (DmMain.qryPst.RecordCount > 0) and
                         (DmMain.qryPst.FieldByName('KdPst').AsInteger > 0);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.popEdtClick(Sender: TObject);
begin
  if pop.PopupComponent = dbgrPst then with DmMain.qryPst do begin
    Edit;
    if EAPst {z_EAPst} then
      Post
    else
      Cancel; end
  else with DmMain.qryPsb do begin
    Edit;
    if EAPsb {z_EAPsb} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  if pop.PopupComponent = dbgrPst then with DmMain.qryPst do begin
    nSvNR := DmMain.qryPstNR.AsInteger;
    Append;
    if EAPst {z_EAPst} then
      Post
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end; end
  else with DmMain.qryPsb do begin
    nSvNR := DmMain.qryPsbNR.AsInteger;
    Append;
    DmMain.qryPsbKdPst.AsInteger := DmMain.qryPstKdPst.AsInteger;
    DmMain.qryPsbDtBeg.AsDateTime := Date;
    if EAPsb {z_EAPsb} then
      Post
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormPstPsb.popDelClick(Sender: TObject);
begin
  if pop.PopupComponent = dbgrPst then begin
    if PstIsInUse then
      ShowMessage('Имеются ссылки на эту запись. Запись не может быть удалена.')
    else
      if DeleteConfirmed then begin
        DeleteScales;

        with DmMain.qryPsb do begin
          First;
          while not Eof do
            Delete;
          CommitUpdates;
        end;

        with DmMain.qryPst do begin
          Delete;
          CommitUpdates;
        end;

        DmMain.qryPst.Database.ApplyUpdates([DmMain.qryPst, DmMain.qryPsb]);
      end
  end else begin
    if DeleteConfirmed then begin
      DeleteScales;

      with DmMain.qryPsb do
        if RecordCount > 0 then begin
          Delete;
          CommitUpdates;
          Database.ApplyUpdates([DmMain.qryPsb]);
        end;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TFormPstPsb.DeleteConfirmed: Boolean;
begin
  Result :=
    MessageDlg('Удалить запись?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

//------------------------------------------------------------------------------
procedure TFormPstPsb.DeleteScales;
begin
  with QryUtils.CreateQuery do begin
    SQL.Add(
      'delete from z_Pst_Shk ' +
      'where KdPst = :KdPst'
    );
    ParamByName('KdPst').AsInteger :=
      dbgrPst.DataSource.DataSet.FieldByName('KdPst').AsInteger;
    ExecSql;
    Free;
  end;
end;

//------------------------------------------------------------------------------
function TFormPstPsb.PstIsInUse: Boolean;
begin
  with QryUtils.CreateQuery do begin
    SQL.Add(
      'select "x" ' +
      'from z_Uderg ' +
      'where KdPst = :KdPst'
    );
    ParamByName('KdPst').AsInteger :=
      dbgrPst.DataSource.DataSet.FieldByName('KdPst').AsInteger;

    Open;
    Result := RecordCount > 0;

    Free;
  end;
end;

(*
//------------------------------------------------------------------------------
procedure TFormPstPsb.qryPstBeforePost(DataSet: TDataSet);
begin
  if DmMain.qryPstKdPst.IsNull or (DmMain.qryPstKdPst.AsInteger = 0) then
    DmMain.qryPstKdPst.AsInteger := DmMain.NewKdPst;
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.qryPstAfterPost(DataSet: TDataSet);
var nSvKdPst : integer;
begin
  with DmMain.qryPst do begin
    nSvKdPst := DmMain.qryPstKdPst.AsInteger;
    ApplyUpdates;
    Close;
    Open;
    if nSvKdPst <> 0 then
      Locate('KdPst', nSvKdPst, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.qryPsbAfterPost(DataSet: TDataSet);
var dSvDtBeg : TDateTime;
begin
  with DmMain.qryPsb do begin
    dSvDtBeg := DmMain.qryPsbDtBeg.AsDateTime;
    ApplyUpdates;
    Close;
    Open;
    if dSvDtBeg <> 0 then
      Locate('DtBeg', dSvDtBeg, []);
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormPstPsb.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.dbgrPstDblClick(Sender: TObject);
begin
  if bVuborMode and (DmMain.qryPst.RecordCount <> 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormPstPsb.dbgrPsbDblClick(Sender: TObject);
begin
  if not bVuborMode and (dbgrPsb.DataSource.DataSet.RecordCount >= 0) then
                                    with DmMain.qryPsb do begin
    Edit;
    if EAPsb {z_EAPsb} then
      Post
    else
      Cancel;
  end;
end;

end.
