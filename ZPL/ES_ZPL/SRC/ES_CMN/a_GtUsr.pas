unit a_GtUsr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, DBTables;

type
  TFormGetCmpUsr = class(TForm)
    qryUsr: TQuery;
    dsrcUsr: TDataSource;
    dbgrUsr: TDBGrid;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryUsrNMUSR: TStringField;
    qryUsrNOTES: TStringField;
    qryUsrKDSPS: TSmallintField;
    qryUsrNR: TIntegerField;
    qryUsrKDUSR: TSmallintField;
    qryUsrNMCMP: TStringField;
    qryUsrLVL: TSmallintField;
    qryUsrNOTES_1: TStringField;
    qryUsrVKL: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrUsrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrUsrDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryUsr(cNmCmp : ShortString);
  public
    { Public declarations }
  end;

function GetUsr(var cNmCmp : ShortString;
                                      var nKdUsr, nKdSps : SmallInt) : boolean;

const SECTION = 'a_GtUsr';

var
  FormGetCmpUsr: TFormGetCmpUsr;

implementation

uses a_Const{, z_Dm, z_Main};

{$R *.dfm}

//------------------------------------------------------------------------------
function GetUsr(var cNmCmp : ShortString;
                                      var nKdUsr, nKdSps : SmallInt) : boolean;
begin
  Result := false;
  FormGetCmpUsr := TFormGetCmpUsr.Create(Application);
  with FormGetCmpUsr do begin
    OpenQryUsr(cNmCmp);
    if nKdUsr > 0 then
      qryUsr.Locate('KdUsr', nKdUsr, []);
    if ShowModal = mrOk then begin
      nKdUsr := qryUsrKdUsr.AsInteger;
      nKdSps := qryUsrKdSps.AsInteger;
      cNmCmp := qryUsrNmCmp.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetCmpUsr.OpenQryUsr(cNmCmp : ShortString);
begin
  with qryUsr do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.NmUsr, u.Notes, u.KdSps, u.Vkl, c.* ' +
            ' from ZZ_UsrCmp c Left Outer Join Usrs u on u.KdUsr = c.KdUsr ');
    if cNmCmp > '' then begin
      SQL.Add('where c.nmCmp = :cNmCmp ' +
              ' order by KdUsr, NmCmp');
      ParamByName('cNmCmp').AsString := cNmCmp;
    end;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetCmpUsr.FormCreate(Sender: TObject);
begin
  Caption := 'Пользователи и компоненты';
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 50);
	  Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 295);
    Width  := ReadInteger(SECTION, 'wW', 340);
	  Free;
  end;
  if FileExists(cDirVids + 'GtUsrCmp.vid') then
    dbgrUsr.Columns.LoadFromFile(cDirVids + 'GtUsrCmp.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGetCmpUsr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryUsr.Active then
    dbgrUsr.Columns.SaveToFile(cDirVids + 'GtUsrCmp.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetCmpUsr.dbgrUsrDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrUsr.Canvas do begin
    if not (gdFocused in State) then begin
      if qryUsrVkl.IsNull or (qryUsrVkl.AsString <> 'Y') then begin
        Font.Color := clFuchsia;
        Font.Style := []; end
      else begin
        Font.Color := clWindowText;
        Font.Style := [fsBold];
      end;
    end;
  end;
  dbgrUsr.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormGetCmpUsr.dbgrUsrDblClick(Sender: TObject);
begin
  if qryUsr.RecordCount > 0 then
    ModalResult := mrOk;
end;

end.
