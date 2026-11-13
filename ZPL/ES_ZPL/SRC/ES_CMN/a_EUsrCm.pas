unit a_EUsrCm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB;

type
  TFormAEUsrCmp = class(TForm)
    Label1: TLabel;
    dbeNmCmp: TDBEdit;
    Label2: TLabel;
    dbeLvl: TDBEdit;
    Label3: TLabel;
    dbeNotes: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AEUsrCmp(dsrc_UsrCmp : TDataSource) : boolean;

const SECTION = 'a_EUsrCm';

var
  FormAEUsrCmp: TFormAEUsrCmp;

implementation

uses a_Const, a_Dm, a_Usrs2;

{$R *.dfm}

//------------------------------------------------------------------------------
function AEUsrCmp(dsrc_UsrCmp : TDataSource) : boolean;
begin
  Result := false;
  FormAEUsrCmp := TFormAEUsrCmp.Create(Application);
  with FormAEUsrCmp do begin
    dbeNmCmp.DataSource := dsrc_UsrCmp;
    dbeLvl.DataSource := dsrc_UsrCmp;
    dbeNotes.DataSource := dsrc_UsrCmp;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEUsrCmp.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 150);
	  Top    := ReadInteger(SECTION, 'wT', 250);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEUsrCmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEUsrCmp.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAEUsrCmp.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
