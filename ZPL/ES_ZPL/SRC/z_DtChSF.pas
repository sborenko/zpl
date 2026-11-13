unit z_DtChSF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient;

type
  TFormDtChStFltr = class(TForm)
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    cdsTmpNR: TAutoIncField;
    Label1: TLabel;
    dbeFText: TDBEdit;
    cdsTmpFText: TStringField;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    cSvFText : ShortString;
  public
    { Public declarations }
  end;

function GetDtChFilter(var cFText : ShortString) : boolean;

const SECTION = 'z_DtChSF';

var
  FormDtChStFltr: TFormDtChStFltr;

implementation

uses A_Const, A_Lib, A_DM, Z_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetDtChFilter(var cFText : ShortString) : boolean;
begin
  Result := false;
  FormDtChStFltr := TFormDtChStFltr.Create(Application);
  with FormDtChStFltr do begin
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      if cSvFText > '' then
        cdsTmpFText.AsString := cSvFText;
    end;
    if ShowModal = mrOk then begin
      cFText := cdsTmpFText.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDtChStFltr.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 400);
    cSvFText := ReadString(SECTION, 'cFText', '');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDtChStFltr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if cSvFText > '' then
      WriteString(SECTION, 'cFText', cSvFText);
    Free;
  end;
end;

procedure TFormDtChStFltr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    bBtnOk.SetFocus;
    if cdsTmp.State = dsInsert then begin
      cdsTmp.Post;
      if cdsTmpFText.AsString > '' then
        cSvFText := cdsTmpFText.AsString;
    end;
  end;
end;

end.
