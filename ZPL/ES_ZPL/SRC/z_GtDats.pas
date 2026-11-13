unit z_GtDats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient,
  ExtCtrls;

type
  TFormGtDates = class(TForm)
    cdsTmp: TClientDataSet;
    cdsTmpDtPrm: TDateField;
    cdsTmpDtUvln: TDateField;
    dsrcTmp: TDataSource;
    cdsTmpStartDtPere: TDateField;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    panelMain: TPanel;
    Label3: TLabel;
    dbeDtPrm: TDBEdit;
    Label2: TLabel;
    dbeDtUvln: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure cdsTmpDtSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    nSvDtPrm, nSvDtUvln, nSvStartDtPere : TDateTime;
    procedure CreOpenCdsTmp;
  public
    { Public declarations }
  end;

function Get_Dates(var dDtPrm, dDtUvln, dStartDtPere : TDateTime) : boolean;

const SECTION = 'z_GtDats';

var
  FormGtDates: TFormGtDates;

implementation

uses a_Const, a_lib, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function Get_Dates(var dDtPrm, dDtUvln, dStartDtPere : TDateTime) : boolean;
begin
  Result := false;
  FormGtDates := TFormGtDates.Create(Application);
  with FormGtDates do begin
    Caption := '¬ведите даты';
    CreOpenCdsTmp;
    if nSvDtPrm <> 0 then
      cdsTmpDtPrm.AsDateTime := nSvDtPrm;
    if nSvDtUvln <> 0 then
      cdsTmpDtUvln.AsDateTime := nSvDtUvln;
    if nSvStartDtPere <> 0 then
      cdsTmpStartDtPere.AsDateTime := nSvStartDtPere;


    if ShowModal = mrOk then begin
      dDtPrm  := cdsTmpDtPrm.AsDateTime;
      dDtUvln := cdsTmpDtUvln.AsDateTime;
      dStartDtPere := cdsTmpStartDtPere.AsDateTime;
      Result  := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDates.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    nSvDtPrm  := ReadInteger(SECTION, 'nSvDt1', 0);
    nSvDtUvln := ReadInteger(SECTION, 'nSvDt2', 0);
    nSvStartDtPere := ReadInteger(SECTION, 'nSvDt3', 0);

    Free;
  end;
  AutoSize := true;
end;
//------------------------------------------------------------------------------
procedure TFormGtDates.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nSvDt1', Round(cdsTmpDtPrm.AsDateTime));
    WriteInteger(SECTION, 'nSvDt2', Round(cdsTmpDtUvln.AsDateTime));
    WriteInteger(SECTION, 'nSvDt3', Round(cdsTmpStartDtPere.AsDateTime));
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDates.CreOpenCdsTmp;
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDates.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGtDates.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

procedure TFormGtDates.cdsTmpDtSetText(Sender: TField;
  const Text: String);
begin
  if myEmptyDate(Text) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;

end.
