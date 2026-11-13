unit z_dfETin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, IniFiles;

type
  TFormEAZpId = class(TForm)
    Label1: TLabel;
    dbeNP: TDBEdit;
    Label2: TLabel;
    dbeTIN: TDBEdit;
    Label3: TLabel;
    dbeFam: TDBEdit;
    Label4: TLabel;
    ddeIma: TDBEdit;
    Label5: TLabel;
    dbeOtch: TDBEdit;
    Label6: TLabel;
    dbeS_Nar: TDBEdit;
    Label7: TLabel;
    dbeS_Dox: TDBEdit;
    Label8: TLabel;
    dbeS_TaxN: TDBEdit;
    Label9: TLabel;
    dbeS_TaxP: TDBEdit;
    Label10: TLabel;
    dbeOzn_Dox: TDBEdit;
    Label11: TLabel;
    dbeD_Priyn: TDBEdit;
    Label12: TLabel;
    dbeD_Zviln: TDBEdit;
    Label13: TLabel;
    dbeOzn_Pilg: TDBEdit;
    Label14: TLabel;
    dbeOznaka: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dsrc_ID: TDataSource;
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EAZplID(tbl_ID : TTable) : boolean;

const SECTION = 'df_eZpId';

var
  FormEAZpId: TFormEAZpId;

implementation

uses a_Const, z_Main, z_dfZplR, z_dfMain;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAZplID(tbl_ID : TTable) : boolean;
begin
  Result := false;
  FormEAZpId := TFormEAZpId.Create(Application);
  with FormEAZpId do begin
    if tbl_ID.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';  
    dsrc_ID.DataSet := tbl_ID;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAZpId.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 150);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAZpId.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAZpId.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAZpId.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
