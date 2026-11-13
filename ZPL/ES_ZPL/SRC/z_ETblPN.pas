unit z_ETblPN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DB, Mask, DBCtrls;

type
  TFormEATblPN = class(TForm)
    Label1: TLabel;
    dbeDtBeg: TDBEdit;
    dsrcTPdn: TDataSource;
    Label2: TLabel;
    dbePrcPdn: TDBEdit;
    Label3: TLabel;
    dbeMinZP: TDBEdit;
    Label4: TLabel;
    dbeMinZP2: TDBEdit;
    Label5: TLabel;
    dbeProgMin: TDBEdit;
    Label6: TLabel;
    dbeProgMin2: TDBEdit;
    Label7: TLabel;
    dbePorogLg: TDBEdit;
    Label8: TLabel;
    dbeProcLg: TDBEdit;
    Label9: TLabel;
    dbeSm2660: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label10: TLabel;
    dbeNotes: TDBEdit;
    Label11: TLabel;
    dbeSmLg100: TDBEdit;
    Label12: TLabel;
    dbePrcPdn2: TDBEdit;
    Label13: TLabel;
    dbePrcWSb: TDBEdit;
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EATPdn : boolean;

const SECTION = 'z_ETblPN';

var
  FormEATblPN: TFormEATblPN;

implementation

uses a_Const, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function EATPdn : boolean;
begin
  Result := false;
  FormEATblPN := TFormEATblPN.Create(Application);
  with FormEATblPN do begin
    if dsrcTPdn.State = dsInsert then
      Caption := 'Новая запись в таблицу "Разные цифры"'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATblPN.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEATblPN.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEATblPN.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATblPN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATblPN.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
;
end;

end.
