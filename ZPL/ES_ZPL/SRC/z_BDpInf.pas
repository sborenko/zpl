unit z_BDpInf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Mask, DBCtrls, DBClient, Buttons;

type
  TFormBnkDopInf = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cdsTmp: TClientDataSet;
    cdsTmpKdBnk: TSmallintField;
    cdsTmpNmBnk: TStringField;
    cdsTmpDtPrdFile: TDateField;
    cdsTmpNrPrdFile: TSmallintField;
    cdsTmpNmPrdDoc: TStringField;
    cdsTmpNotes: TStringField;
    Label5: TLabel;
    dbeKdBnk: TDBEdit;
    dsrcTmp: TDataSource;
    Label6: TLabel;
    dbeNmBnk: TDBEdit;
    dbeDtPrdFile: TDBEdit;
    dbeNrPrdFile: TDBEdit;
    dbeNmPrdDoc: TDBEdit;
    procedure dbeDtPrdFileEnter(Sender: TObject);
    procedure dbeDtPrdFileExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    cSvNmPrdDoc : ShortString;
  public
    { Public declarations }
  end;

function GetDopBnkInf(nKdBnk : SmallInt; var dDtPrdFile : TDateTime;
                                         var nNrPrdFile : SmallInt;
                                         var cNmPrdDoc : ShortString) : boolean;

const SECTION = 'z_BDpInf';

var
  FormBnkDopInf: TFormBnkDopInf;

implementation

{$R *.dfm}

uses a_Const, z_Main, z_Dm;

function GetDopBnkInf(nKdBnk : SmallInt; var dDtPrdFile : TDateTime;
                                         var nNrPrdFile : SmallInt;
                                         var cNmPrdDoc : ShortString) : boolean;
var cDummy : ShortString;
begin
  Result := false;
  FormBnkDopInf := TFormBnkDopInf.Create(Application);
  with FormBnkDopInf do begin
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      cdsTmpKdBnk.AsInteger := nKdBnk;
      cdsTmpNmBnk.AsString := DmMain.KdBnk2NmBnk(nKdBnk, cDummy);
      cdsTmpNrPrdFile.AsInteger := nNrPrdFile;
      cdsTmpDtPrdFile.AsDateTime := dDtPrdFile;
      cdsTmpNmPrdDoc.AsString := cNmPrdDoc;
    end;
    if ShowModal = mrOk then begin
      dDtPrdFile := cdsTmpDtPrdFile.AsDateTime;
      nNrPrdFile := cdsTmpNrPrdFile.AsInteger;
      cNmPrdDoc  := cdsTmpNmPrdDoc.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkDopInf.dbeDtPrdFileEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormBnkDopInf.dbeDtPrdFileExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormBnkDopInf.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    cSvNmPrdDoc := ReadString(SECTION, 'cSvTxt', '');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkDopInf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteString(SECTION, 'cSvTxt', cdsTmpNmPrdDoc.AsString);
    Free;
  end;
end;

end.
