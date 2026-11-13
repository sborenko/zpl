unit z_EPidZv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TformEAPidZV = class(TForm)
    Label1: TLabel;
    dbeNum: TDBEdit;
    Label2: TLabel;
    dbeCode: TDBEdit;
    Label3: TLabel;
    dbeREASONS: TDBEdit;
    Label4: TLabel;
    dbeName: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Table1: TTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNumEnter(Sender: TObject);
    procedure dbeNumExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AEPidZv: boolean;
const SECTION = 'z_EPidZv';


var
  formEAPidZV: TformEAPidZV;



implementation

uses A_Const, Z_DM, Z_Main, z_PidZv, A_ShwErr, a_Lib;

{$R *.dfm}


//------------------------------------------------------------------------------
function AEPidZv:boolean;
begin
  Result := false;
  formEAPidZV := TformEAPidZV.Create(Application);
  with formEAPidZV do begin
   if dbeNum.DataSource.State = dsInsert then
     Caption := 'Новая запись'
   else
     Caption := 'Редактированиеп записи';
   if ShowModal = mrOk then
     Result  := true;
   Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TformEAPidZV.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 450);
    Top  := ReadInteger(SECTION, 'wT', 450);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TformEAPidZV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TformEAPidZV.dbeNumEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TformEAPidZV.dbeNumExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
