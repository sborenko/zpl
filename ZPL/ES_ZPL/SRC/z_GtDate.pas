unit z_GtDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient;

type
  TFormGtDate = class(TForm)
    cdsTmp: TClientDataSet;
    cdsTmpTDate: TDateField;
    dbeTDate: TDBEdit;
    dsrcTmp: TDataSource;
    LabelPrompt: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
  private
    { Private declarations }
    nSvTDate : TDateTime;
    procedure CreOpenCdsTmp;
  public
    { Public declarations }
  end;

function MyGetDate(cPrompt : ShortString; var dTDate : TDateTime) : boolean;

const SECTION = 'z_GtDate';

var
  FormGtDate: TFormGtDate;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function MyGetDate(cPrompt : ShortString; var dTDate : TDateTime) : boolean;
begin
  Result := false;
  FormGtDate := TFormGtDate.Create(Application);
  with FormGtDate do begin
    Caption := '¬вод даты';
    if cPrompt > '' then
      LabelPrompt.Caption := cPrompt
    else
      LabelPrompt.Caption := '¬ведите необходимую дату:';
    CreOpenCdsTmp;
    if dTDate > 0 then
      cdsTmpTDate.AsDateTime := dTDate
    else if nSvTDate <> 0 then
      cdsTmpTDate.AsDateTime := nSvTDate;
    if ShowModal = mrOk then begin
      dTDate  := cdsTmpTDate.AsDateTime;
      Result  := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDate.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 300);
    nSvTDate := ReadInteger(SECTION, 'nSvTDate', 0);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nSvTDate', Round(cdsTmpTDate.AsDateTime));
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDate.CreOpenCdsTmp;
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtDate.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGtDate.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
