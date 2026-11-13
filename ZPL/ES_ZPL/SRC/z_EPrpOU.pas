unit z_EPrpOU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, ExtCtrls;

type
  TFormEAPrp = class(TForm)
    Label1: TLabel;
    dbeDtBeg: TDBEdit;
    Label2: TLabel;
    dbePfCmn: TDBEdit;
    Label3: TLabel;
    dbePfInv: TDBEdit;
    Label4: TLabel;
    dbeSs1Bln: TDBEdit;
    Label5: TLabel;
    dbeSs2nsl: TDBEdit;
    Label6: TLabel;
    dbeFz: TDBEdit;
    Label7: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label8: TLabel;
    dbeFz1006: TDBEdit;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EdtAddPrp(dsrcPrp : TDataSource) : boolean;

const SECTION = 'z_EPrpOU';

var
  FormEAPrp: TFormEAPrp;

implementation

uses a_Const, a_DM, z_DM, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function EdtAddPrp(dsrcPrp : TDataSource) : boolean;
begin
  Result := false;
  FormEAPrp := TFormEAPrp.Create(Application);
  with FormEAPrp do begin
    dbeDtBeg.DataSource  := dsrcPrp;
    dbePfCmn.DataSource  := dsrcPrp;
    dbePfInv.DataSource  := dsrcPrp;
    dbeSs1Bln.DataSource := dsrcPrp;
    dbeSs2nsl.DataSource := dsrcPrp;
    dbeFz.DataSource     := dsrcPrp;
    dbeFz1006.DataSource := dsrcPrp;
    dbeNotes.DataSource  := dsrcPrp;
    if dbeDtBeg.DataSource.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrp.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrp.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrp.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
