unit z_EAPst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TFormEAPst = class(TForm)
    Label1: TLabel;
    dbeKdPst: TDBEdit;
    Label2: TLabel;
    dbeShPst: TDBEdit;
    Label3: TLabel;
    dbeNmPst: TDBEdit;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    DBCheckBoxIsPost: TDBCheckBox;
    Label5: TLabel;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure DBCheckBoxIsPostEnter(Sender: TObject);
    procedure DBCheckBoxIsPostExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EAPst : boolean;

const SECTION = 'z_EAPst';

var
  FormEAPst: TFormEAPst;

implementation

uses a_Const, z_Dm, z_Main, z_PstPsb;

{$R *.dfm}


function EAPst : boolean;
begin
  Result := false;
  FormEAPst := TFormEAPst.Create(Application);
  with FormEAPst do begin
    if dbeKdPst.DataSource.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPst.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPst.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPst.DBCheckBoxIsPostEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPst.DBCheckBoxIsPostExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
end.
