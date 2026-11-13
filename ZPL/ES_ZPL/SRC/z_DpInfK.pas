unit z_DpInfK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Mask, DBCtrls, DBClient, Buttons;

type
  TFormDopKssInf = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    LabelKssVedNr: TLabel;
    Label4: TLabel;
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    dbeVedDt: TDBEdit;
    dbeVedNr: TDBEdit;
    dbeVedNm: TDBEdit;
    cdsTmpVedNr: TSmallintField;
    cdsTmpVedDt: TDateField;
    cdsTmpVedNm: TStringField;
    procedure dbeVedDtEnter(Sender: TObject);
    procedure dbeVedDtExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetDopKssInf(nCase : SmallInt; var nKssVedNr : SmallInt;
                                        var dKssVedDt : TDateTime;
                                        var cKssVedNm : ShortString) : boolean;

const SECTION = 'z_DpInfK';

var
  FormDopKssInf: TFormDopKssInf;

implementation

{$R *.dfm}

uses a_Const, z_Main, z_Dm;

function GetDopKssInf(nCase : SmallInt; var nKssVedNr : SmallInt;
                                        var dKssVedDt : TDateTime;
                                        var cKssVedNm : ShortString) : boolean;
begin
  Result := false;
  FormDopKssInf := TFormDopKssInf.Create(Application);
  with FormDopKssInf do begin
    Caption := 'Введите дополнительно';
    if nCase = 1 then
      LabelKssVedNr.Caption := 'Номер ведомости'
    else
      LabelKssVedNr.Caption := 'Номер первой ведомости';
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      cdsTmpVedDt.AsDateTime := dKssVedDt;
      cdsTmpVedNr.AsInteger := nKssVedNr;
      cdsTmpVedNm.AsString := cKssVedNm;
    end;
    if ShowModal = mrOk then begin
      dKssVedDt := cdsTmpVedDt.AsDateTime;
      nKssVedNr := cdsTmpVedNr.AsInteger;
      cKssVedNm := cdsTmpVedNm.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDopKssInf.dbeVedDtEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDopKssInf.dbeVedDtExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormDopKssInf.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 50);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDopKssInf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
