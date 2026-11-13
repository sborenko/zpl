unit z_VvDats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient;

type
  TFormVvDates = class(TForm)
    cdsTmp: TClientDataSet;
    dbeDtBeg: TDBEdit;
    dsrcTmp: TDataSource;
    LabelPrompt: TLabel;
    dbeDtEnd: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    cdsTmpDtBeg: TDateField;
    cdsTmpDtEnd: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
  private
    { Private declarations }
    nSvDtBeg, nSvDtEnd : TDateTime;
    procedure CreOpenCdsTmp;
  public
    { Public declarations }
  end;

function VvodDates(cPrompt : ShortString;
                                      var dDtBeg, dDtEnd : TDateTime) : boolean;

const SECTION = 'z_VvDats';

var
  FormVvDates: TFormVvDates;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function VvodDates(cPrompt : ShortString;
                                      var dDtBeg, dDtEnd : TDateTime) : boolean;
begin
  Result := false;
  FormVvDates := TFormVvDates.Create(Application);
  with FormVvDates do begin
    Caption := '¬ведите даты';
    if cPrompt > '' then
      LabelPrompt.Caption := cPrompt;
    CreOpenCdsTmp;
    if nSvDtBeg <> 0 then
      cdsTmpDtBeg.AsDateTime := nSvDtBeg;
    if nSvDtEnd <> 0 then
      cdsTmpDtEnd.AsDateTime := nSvDtEnd;
    if ShowModal = mrOk then begin
      dDtBeg := cdsTmpDtBeg.AsDateTime;
      dDtEnd := cdsTmpDtEnd.AsDateTime;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvDates.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 400);
    nSvDtBeg := ReadInteger(SECTION, 'nSvDt1', 0);
    nSvDtEnd := ReadInteger(SECTION, 'nSvDt2', 0);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvDates.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nSvDt1', Round(cdsTmpDtBeg.AsDateTime));
    WriteInteger(SECTION, 'nSvDt2', Round(cdsTmpDtEnd.AsDateTime));
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvDates.CreOpenCdsTmp;
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvDates.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVvDates.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
