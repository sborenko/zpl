unit z_EPstSh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TFormEaPstShk = class(TForm)
    Label1: TLabel;
    dbeDtBeg: TDBEdit;
    Label2: TLabel;
    dbeKdPst: TDBEdit;
    Label3: TLabel;
    dbeSmFrom: TDBEdit;
    Label4: TLabel;
    dbeSmToInc: TDBEdit;
    Label5: TLabel;
    dbeSmConst: TDBEdit;
    Label6: TLabel;
    dbePrc: TDBEdit;
    Label7: TLabel;
    dbeSmBolee: TDBEdit;
    Label8: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    LabelShPst: TLabel;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    mPstShkDataset : TDataSet;
  public
    { Public declarations }
  end;

function EAPstShkala(cShPst : string) : boolean;

const SECTION = 'z_PstSh';

var
  FormEaPstShk: TFormEaPstShk;

implementation

uses a_Const, z_Dm, z_Main, z_PstPsb;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAPstShkala(cShPst : string) : boolean;
begin
  Result := false;
  FormEaPstShk := TFormEaPstShk.Create(Application);
  with FormEaPstShk do begin
    mPstShkDataset := dbeDtBeg.DataSource.DataSet;
    if mPstShkDataSet.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';  
    LabelShPst.Caption := cShPst;
    if ShowModal = mrOk then begin

      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEaPstShk.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEaPstShk.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEaPstShk.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEaPstShk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
