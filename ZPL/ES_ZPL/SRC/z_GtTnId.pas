unit z_GtTnId;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBTables;

type
  TFormGtTnId = class(TForm)
    dbgrId: TDBGrid;
    qryId: TQuery;
    Splitter1: TSplitter;
    dbgrPrmUv: TDBGrid;
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryPrmUv: TQuery;
    dsrcPrmUv: TDataSource;
    dsrcId: TDataSource;
    LabelMsg: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrIdEnter(Sender: TObject);
    procedure dbgrIdExit(Sender: TObject);
    procedure dbgrIdDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryID(cID : ShortString);
    procedure OpenQryPrmUv;
  public
    { Public declarations }
  end;

function GetNeedTabNByID(cId : ShortString; var nTabN : integer) : boolean;

const SECTION = 'z_GtTnId';

var
  FormGtTnId: TFormGtTnId;

implementation

uses a_Const, a_DM, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetNeedTabNByID(cId : ShortString; var nTabN : integer) : boolean;
begin
  Result := false;
  FormGtTnId := TFormGtTnId.Create(Application);
  with FormGtTnId do begin
    Caption := 'Результат поиска ИД';
    LabelMsg.Caption := '';
    OpenQryID(cID);
    OpenQryPrmUv;
    if ShowModal = mrOk then begin
      nTabN := qryId.FieldByName('TabN').AsInteger;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtTnId.dbgrIdDblClick(Sender: TObject);
begin
  if qryId.Active and (qryId.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGtTnId.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 535);
    dbgrID.Height := ReadInteger(SECTION, 'GrIdH', 150);
    Free;
  end;
  if FileExists(cDirVids + 'TnId01.vid') then
    dbgrId.Columns.LoadFromFile(cDirVids + 'TnId01.vid');
  if FileExists(cDirVids + 'TnId02.vid') then
    dbgrPrmUv.Columns.LoadFromFile(cDirVids + 'TnId02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGtTnId.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrId.Columns.SaveToFile(cDirVids + 'TnId01.vid');
  dbgrPrmUv.Columns.SaveToFile(cDirVids + 'TnId02.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'GrIdH', dbgrId.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtTnId.OpenQryID(cID: ShortString);
begin
  with qryId do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.TabN, u.Id, u.Fam, u.Ima, u.Otch, u.Pol, ' +
            ' count(n.NR) as CNT from Z_Upi u ' +
            ' Left outer join z_NU n on n.TabN = u.TabN ' +
            ' where u.ID = :cID ' +
            ' group by u.TabN, u.Id, u.Fam, u.Ima, u.Otch, u.Pol');
    ParamByName('cId').AsString := cId;
    Open;
    LabelMsg.Caption := 'Найдено записей: ' +
                                  IntToStr(RecordCount) + '. Выберите одну.';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtTnId.OpenQryPrmUv;
begin
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcId;
    SQL.Add('Select * from z_prmUv where TabN = :TabN order by Dt_Priem');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtTnId.dbgrIdEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormGtTnId.dbgrIdExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
