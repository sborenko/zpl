unit z_EVedVp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DBCtrls, Mask, DB, DBTables,
  ExtCtrls;

type
  TFormEAMegVed = class(TForm)
    Label4: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    PanelBnk: TPanel;
    Label1: TLabel;
    dbeBnkNrPrdF: TDBEdit;
    dbeBnkDtPrdF: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbmBnkNmPrdF: TDBMemo;
    Label5: TLabel;
    PanelKss: TPanel;
    Label6: TLabel;
    dbeKssVedNr: TDBEdit;
    Label7: TLabel;
    dbeKssVedDt: TDBEdit;
    Label8: TLabel;
    dbmKssVedNm: TDBMemo;
    Label9: TLabel;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure dbMemoEnter(Sender: TObject);
    procedure dbMemoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddEdtMegVed(dsrcVed : TDataSource; bSpec : boolean) : boolean;

const SECTION = 'z_EVedVp';

var
  FormEAMegVed: TFormEAMegVed;

implementation

uses a_Const, a_DM, z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtMegVed(dsrcVed : TDataSource; bSpec : boolean) : boolean;
begin
  Result := false;
  FormEAMegVed := TFormEAMegVed.Create(Application);
  with FormEAMegVed do begin
    dbeNotes.DataSource     := dsrcVed;
    dbeBnkNrPrdF.DataSource := dsrcVed;
    dbeBnkDtPrdF.DataSource := dsrcVed;
    dbmBnkNmPrdF.DataSource := dsrcVed;
    dbeKssVedNr.DataSource  := dsrcVed;
    dbeKssVedDt.DataSource  := dsrcVed;
    dbmKssVedNm.DataSource  := dsrcVed;
    if dbeBnkNrPrdF.Field.DataSet.State = dsInsert then begin
      if bSpec then
        Caption := 'Заголовок новой "СпецВедомости"'
      else
        Caption := 'Заголовок новой ведомости'; end
    else
      Caption := 'Редактирование заголовка ведомости';
    if bSpec then begin
      Color := clFuchsia;
      PanelBnk.Color := clFuchsia;
      PanelKss.Color := clFuchsia; end
    else begin
      Color := clBtnFace;
      PanelBnk.Color := clBtnFace;
      PanelKss.Color := clBtnFace;
    end;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.dbMemoEnter(Sender: TObject);
begin
  (Sender as TDBMemo).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.dbMemoExit(Sender: TObject);
begin
  (Sender as TDBMemo).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 750);
    Top  := ReadInteger(SECTION, 'wT', 750);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
