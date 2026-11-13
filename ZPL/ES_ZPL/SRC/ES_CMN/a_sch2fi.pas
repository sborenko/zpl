unit a_Sch2Fi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBClient, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFormSchToFind = class(TForm)
    cdsTmp: TClientDataSet;
    Label1: TLabel;
    dbeSch_17: TDBEdit;
    dsrcTmp: TDataSource;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label2: TLabel;
    dbeNmSch: TDBEdit;
    GroupBox1: TGroupBox;
    rBtnAny: TRadioButton;
    rBtnStart: TRadioButton;
    cdsTmpsch_17: TStringField;
    cdsTmprbtnStart: TBooleanField;
    cdsTmprbtnAny: TBooleanField;
    cdsTmpnmSch: TStringField;
    procedure dbeSch_17Enter(Sender: TObject);
    procedure dbeSch_17Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RBtnNewClick(Sender: TObject);
    procedure RBtnOldClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    cSvSch2Find, cNmSchFind : ShortString;
    b_NewSch, bOldSch       : boolean;
//    b_NewSch : boolean;
    procedure CreOpenCdsTmp;
  public
    { Public declarations }
  end;

function GetSchToPoisk(var bNewSch,bNm : boolean) : ShortString;

const SECTION = 'a_Sch2Fi';

var
  FormSchToFind  : TFormSchToFind;
//      b_NewSch : boolean;

implementation

uses A_Const, A_DM, A_Lib, a_SBU, a_EGoNum;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetSchToPoisk(var bNewSch,bNm : boolean) : ShortString;
begin
  Result        := '';
  FormSchToFind := TFormSchToFind.Create(Application);
  with   FormSchToFind do begin
    Caption  := '¬ведите параметры поиска';
    CreOpenCdsTmp;
    b_NewSch := false;
    if cSvSch2Find > '' then begin
      cdsTmpSch_17.AsString := cSvSch2Find;
      bNm   := false; end
    else begin
      cdsTmpNmSch.AsString  := cNmSchFind;
      bNm   := true;
    end;
    if ShowModal = mrOk then begin
//    b_NewSch := RBtnNew.Checked;
      bNewSch := b_NewSch;
      if not bNm then
        Result := cdsTmpSch_17.AsString
      else
        Result := cdsTmpNmSch.AsString;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSchToFind.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var bDbg : boolean;
begin
  b_NewSch := bDbg; // rBtnNew.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormSchToFind.CreOpenCdsTmp;
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Edit;
    cdsTmpRBtnAny.AsBoolean   := b_NewSch;
    cdsTmpRBtnStart.AsBoolean := bOldSch;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSchToFind.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left  := ReadInteger(SECTION, 'wL', 350);
    Top   := ReadInteger(SECTION, 'wT', 350);
    cSvSch2Find := ReadString(SECTION, 'cSvSch', '');
    cNmSchFind  := ReadString(SECTION, 'cNmSch', '');
    Free;
  end;
//  bOldSch := not bNewSch;

end;
//------------------------------------------------------------------------------
procedure TFormSchToFind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bBtnOk.SetFocus;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteString(SECTION,  'cSvSch', cdsTmpSch_17.AsString);
    WriteString(SECTION,  'cNmSch', cdsTmpNmSch.AsString);
    WriteBool(SECTION,    'AnyF', RBtnAny.Checked);
    WriteBool(SECTION,    'StF',  RBtnStart.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSchToFind.dbeSch_17Enter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormSchToFind.dbeSch_17Exit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormSchToFind.RBtnNewClick(Sender: TObject);
begin
  b_NewSch := true;
end;
//------------------------------------------------------------------------------
procedure TFormSchToFind.RBtnOldClick(Sender: TObject);
begin
  b_NewSch := false;
end;

end.
