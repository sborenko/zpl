unit a_BnkPdr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Buttons, Grids, DBGrids, DBTables, ExtCtrls;

type
  TFormGtBnkPdr = class(TForm)
    Panel1: TPanel;
    qryBnkWho: TQuery;
    dsrcBnkWho: TDataSource;
    dbgrBnkWho: TDBGrid;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryBnkWhoKDWHO: TSmallintField;
    qryBnkWhoNMWHO: TStringField;
    qryBnkWhoKDSBU: TSmallintField;
    qryBnkWhoSCHBU: TStringField;
    qryBnkWhoKDVALPDR: TSmallintField;
    qryBnkWhoNMVALSOKR: TStringField;
    qryBnkWhoRSCH: TStringField;
    sBtnAdd: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnAddClick(Sender: TObject);
  private
    { Private declarations }
    c_CallForm : ShortString;
    procedure OpenQryBnkWho;
  public
    { Public declarations }
  end;

function GetBnkPdr(var nKdWho : SmallInt; cCallForm : ShortString) : boolean;

var
  FormGtBnkPdr: TFormGtBnkPdr;

implementation

uses a_Const, a_Dm, a_Usrs2;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetBnkPdr(var nKdWho : SmallInt; cCallForm : ShortString) : boolean;
begin
  Result := false;
  FormGtBnkPdr := TFormGtBnkPdr.Create(Application);
  with FormGtBnkPdr do begin
    Caption := 'Выбор банковского подразделения';
    c_CallForm := cCallForm;
    OpenQryBnkWho;
    if nKdWho <> 0 then
      qryBnkWho.Locate('KdWho', nKdWho, []);
    if ShowModal = mrOk then begin
      nKdWho := qryBnkWhoKdWho.AsInteger;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtBnkPdr.OpenQryBnkWho;
begin
  with qryBnkWho do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select w.KdWho, w.NmWho, w.KdSbu, s.SchBU, w.KdValPdr, ' +
            ' v.NmValSokr, rs.RSch from kd_Who w ' +
            ' Left outer join kd_RSCH rs on rs.KdWho = w.KdWho ' +
            ' Left outer join kd_SBU s on s.KdSch = w.KdSbu ' +
            ' Left outer join kd_Val v on v.KdVal = w.KdValPdr ' +
            ' where w.PrWho = 1 and (w.Shfr = "bnk" or w.Shfr = "bnr") ' +
            ' order by w.KdWho');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtBnkPdr.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 151);
	  Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 445);
    Width  := ReadInteger(SECTION, 'wW', 445);
	  Free;
  end;
  if FileExists(cDirVids + 'gtBPdr01.vid') then
    dbgrBnkWho.Columns.LoadFromFile(cDirVids + 'gtBPdr01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGtBnkPdr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrBnkWho.Columns.SaveToFile(cDirVids + 'gtBPdr01.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtBnkPdr.sBtnAddClick(Sender: TObject);
var nKdUsr, nKdWho : SmallInt;
begin
  if c_CallForm = 'a_Usrs2' then begin
    nKdUsr := Form_UsersNew.qryUsersKdUsr.AsInteger;
    nKdWho := qryBnkWhoKdWho.AsInteger;
    Form_UsersNew.UsrAddBnkPdrWithCheck(nKdUsr, nKdWho);
  end;
end;

end.
