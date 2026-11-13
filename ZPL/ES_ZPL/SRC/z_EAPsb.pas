unit z_EAPsb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, Grids,
  DBGrids, Menus;

type
  TFormEAPsb = class(TForm)
    Label1: TLabel;
    dbeKdPst: TDBEdit;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label2: TLabel;
    dbeDtBeg: TDBEdit;
    dbtShPst: TDBText;
    LabelPrcPsb: TLabel;
    dbePrcPsb: TDBEdit;
    dbgrPstShk: TDBGrid;
    GroupBox1: TGroupBox;
    rBtnPrc: TRadioButton;
    rBtnShkala: TRadioButton;
    dbtShkala: TDBText;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure rBtnPrcClick(Sender: TObject);
    procedure rBtnShkalaClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrPstShkDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetFormVid;
  public
    { Public declarations }
  end;

function EAPsb : boolean;

const SECTION = 'z_EAPsb';

var
  FormEAPsb: TFormEAPsb;

implementation

uses a_Const, z_Dm, z_Main, z_PstPsb, z_EPstSh;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAPsb : boolean;
begin
  Result := false;
  FormEAPsb := TFormEAPsb.Create(Application);
  with FormEAPsb do begin
    if dbeDtBeg.DataSource.State = dsInsert then begin
      Caption := 'Новая запись';
      rBtnPrc.Checked := true;
      SetFormVid; end
    else begin
      Caption := 'Редактирование записи';
      if dbtShkala.Field.AsInteger = 0 then
        rBtnPrc.Checked := true
      else
        rBtnShkala.Checked := true;
      SetFormVid;
    end;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.SetFormVid;
begin
  if rBtnPrc.Checked then begin
    dbgrPstShk.Visible := false;
    dbePrcPsb.Enabled := true;
    LabelPrcPsb.Enabled := true;
    Width := 210;
    dbeNotes.DataSource.DataSet.FieldByName('Shkala').AsInteger := 0; end
  else begin
    dbgrPstShk.Visible := true;
    dbePrcPsb.Enabled := false;
    LabelPrcPsb.Enabled := false;
    Width := 490; //585;
    dbeNotes.DataSource.DataSet.FieldByName('Shkala').AsInteger := 1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.rBtnPrcClick(Sender: TObject);
begin
  SetFormVid;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.rBtnShkalaClick(Sender: TObject);
begin
  SetFormVid;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.popPopup(Sender: TObject);
begin
  popEdt.Enabled := dbgrPstShk.DataSource.DataSet.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.popEdtClick(Sender: TObject);
var cShPst : string;
begin
  cShPst := dbtShPst.Field.AsString;
  with dbgrPstShk.DataSource.DataSet do begin
    Edit;
    if EAPstShkala(cShPst) {z_EPstSh} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.popAddClick(Sender: TObject);
var cShPst : string; nSvNR : integer;
begin
  cShPst := dbtShPst.Field.AsString;
  with dbgrPstShk.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('DtBeg').AsString := dbeDtBeg.Field.AsString;
    FieldByName('KdPst').AsString := dbeKdPst.Field.AsString;
    if EAPstShkala(cShPst) {z_EPstSh} then
      Post
    else begin
      Cancel;
      if nSvNr <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
  if FileExists(cDirVids + 'PstShk01.vid') then
    dbgrPstShk.Columns.LoadFromFile(cDirVids + 'PstShk01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dbgrPstShk.Visible then
    dbgrPstShk.Columns.SaveToFile(cDirVids + 'PstShk01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPsb.dbgrPstShkDblClick(Sender: TObject);
begin
  if dbgrPstShk.DataSource.DataSet.RecordCount > 0 then
    popEdtClick(Self);
end;

end.
