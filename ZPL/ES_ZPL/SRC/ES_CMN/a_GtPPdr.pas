unit a_GtPPdr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Grids, DBGrids, DBTables, ExtCtrls, StdCtrls,
  Buttons;

type
  TFormGetPPdr = class(TForm)
    Panel1: TPanel;
    qryRSch: TQuery;
    dsrcRSch: TDataSource;
    dbgrRSch: TDBGrid;
    qryRSchKDSBU: TSmallintField;
    qryRSchSCHBU: TStringField;
    qryRSchSHPPDR: TStringField;
    qryRSchKDRSCH: TSmallintField;
    qryRSchNMSCH: TStringField;
    qryRSchNMBANK: TStringField;
    qryRSchRSCH: TStringField;
    qryRSchMFO: TStringField;
    qryRSchOKPO: TStringField;
    qryRSchNOTES: TStringField;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrRSchDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryRSch(nKdPdr : SmallInt);
  public
    { Public declarations }
  end;

function GetBnkPPdr(nKdPdr : SmallInt; var nKdRSch, nKdSbu : SmallInt;
                                       var cShPPdr, cNmPdr, cNmBnk, cOkpo, cMfo,
                                         cRSch, cSchBU : ShortString) : boolean;

const SECTION = 'a_GtPPdr';

var
  FormGetPPdr: TFormGetPPdr;

implementation

uses A_Const, A_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetBnkPPdr(nKdPdr : SmallInt; var nKdRSch, nKdSbu : SmallInt;
                                       var cShPPdr, cNmPdr, cNmBnk, cOkpo, cMfo,
                                         cRSch, cSchBU : ShortString) : boolean;
begin
  Result := false;
  FormGetPPdr := TFormGetPPdr.Create(Application);
  with FormGetPPdr do begin
    Caption := 'Выбор ПодСчета';
    OpenQryRSch(nKdPdr);
    nKdRSch := 0;
    nKdSbu  := 0;
    cShPPdr := '';
    cNmPdr  := '';
    cNmBnk  := '';
    cOkpo   := '';
    cMfo    := '';
    cRSch   := '';
    cSchBU  := '';
    if ShowModal = mrOk then begin
      nKdRSch := qryRSchKdRSch.AsInteger;
      nKdSbu  := qryRSchKdSbu.AsInteger;
      cShPPdr := qryRSchShPPdr.AsString;
      cNmPdr  := qryRSchNmSch.AsString;
      cNmBnk  := qryRSchNmBank.AsString;
      cOkpo   := qryRSchOkpo.AsString;
      cMfo    := qryRSchMfo.AsString;
      cRSch   := qryRSchRSch.AsString;
      cSchBU  := qryRSchSchBU.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetPPdr.OpenQryRSch(nKdPdr: SmallInt);
begin
  with qryRSch do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select r.KdSbu, s.SchBU, r.ShPPdr, r.KdRSch, r.NmSch, ' +
            ' r.NmBank, r.RSch, r.MFO, r.OKPO, r.Notes from Kd_RSch r ' +
            ' Left Outer Join Kd_Sbu s on s.KdSch = r.KdSbu ' +
            ' where r.KdWho = :nKdPdr');
    ParamByName('nKdPdr').AsInteger := nKdPdr;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetPPdr.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 150);
	  Top    := ReadInteger(SECTION, 'wT', 150);
    Height := ReadInteger(SECTION, 'wH', 275);
    Width  := ReadInteger(SECTION, 'wW', 600);
	  Free;
  end;
  if FileExists(cDirVids + 'PPdr.vid') then
    dbgrRSch.Columns.LoadFromFile(cDirVids + 'PPdr.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGetPPdr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrRSch.Columns.SaveToFile(cDirVids + 'PPdr.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetPPdr.dbgrRSchDblClick(Sender: TObject);
begin
  if qryRSch.RecordCount > 0 then
    ModalResult := mrOk;
end;

end.
