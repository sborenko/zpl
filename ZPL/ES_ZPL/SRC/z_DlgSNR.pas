unit z_DlgSNR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient;

type
  TFormDlgSNR = class(TForm)
    cdsTmp: TClientDataSet;
    cdsTmpDtBeg: TDateField;
    cdsTmpDtEnd: TDateField;
    Label1: TLabel;
    bdeDtBeg: TDBEdit;
    dsrcTmp: TDataSource;
    Label2: TLabel;
    dbeDtEnd: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bdeDtBegEnter(Sender: TObject);
    procedure bdeDtBegExit(Sender: TObject);
    procedure DatFldSetText(Sender: TField; const Text: String);
    procedure cdsTmpDtBegValidate(Sender: TField);
    procedure cdsTmpDtEndValidate(Sender: TField);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    dDtMin, dDtMax : TDateTime;
  public
    { Public declarations }
  end;

function DlgSpecNdbRec(nSvWYear : SmallInt;
                                      var dDtBeg, dDtEnd : TDateTime) : boolean;

const SECTION = 'z_DlgSNR';

var
  FormDlgSNR: TFormDlgSNR;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function DlgSpecNdbRec(nSvWYear : SmallInt;
                                      var dDtBeg, dDtEnd : TDateTime) : boolean;
//var nY, nM, nD : word;
begin
  Result := false;
  FormDlgSNR := TFormDlgSNR.Create(Application);
  with FormDlgSNR do begin
    dDtMin := EncodeDate(nSvWYear, 1, 1);
    dDtMax := EncodeDate(nSvWYear, 12, 31);
    Caption := 'Ввод дат начала и окончания для "СпецЗаписей"';
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      cdsTmpDtBeg.AsDateTime := dDtMin;
      cdsTmpDtEnd.AsDateTime := dDtMax;
    end;
    if ShowModal = mrOk then begin
      dDtBeg := cdsTmpDtBeg.AsDateTime;
      dDtEnd := cdsTmpDtEnd.AsDateTime;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSNR.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSNR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSNR.bdeDtBegEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSNR.bdeDtBegExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSNR.DatFldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSNR.cdsTmpDtBegValidate(Sender: TField);
var dDtTmp : TDateTime;
begin
  if (Sender.AsString = '') or (cdsTmpDtBeg.AsString = '') then
    Raise Exception.Create('Дата начала не может быть пустой')
  else with cdsTmp do begin
    dDtTmp := Sender.AsDateTime;
    if (dDtTmp < dDtMin) or (dDtTmp > dDtMax) then
      Raise Exception.
            Create('Дата должна быть в пределах ' + DateToStr(dDtMin) + ' - ' +
              DateToStr(dDtMax));
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSNR.cdsTmpDtEndValidate(Sender: TField);
var dDtB, dDtTmp : TDateTime;
begin
  if (Sender.AsString = '') or (cdsTmpDtBeg.AsString = '') then
    Raise Exception.Create('Дата начала не может быть пустой')
  else with cdsTmp do begin
    dDtB := cdsTmpDtBeg.AsDateTime;
    dDtTmp := Sender.AsDateTime;
    if (dDtTmp < dDtB) or (dDtTmp > dDtMax) then
      Raise Exception.
            Create('Дата должна быть в пределах ' + DateToStr(dDtB) + ' - ' +
              DateToStr(dDtMax));
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSNR.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
;
end;

end.
