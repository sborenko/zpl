unit z_VbObKt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBTables, DB,
  DBClient;

type
  TFormVbObjKatP = class(TForm)
    panelMain: TPanel;
    cdsObj: TClientDataSet;
    cdsObjNR: TAutoIncField;
    cdsObjKdObj: TIntegerField;
    cdsObjShObj: TStringField;
    cdsObjNmObj: TStringField;
    cdsObjAIndx: TIntegerField;
    cdsObjPIndx: TIntegerField;
    cdsObjLvl: TIntegerField;
    dsrcObj: TDataSource;
    cdsKatP: TClientDataSet;
    cdsKatPNR: TAutoIncField;
    cdsKatPKdKatP: TSmallintField;
    cdsKatPShKatP: TStringField;
    cdsKatPNmKatP: TStringField;
    dsrcKatP: TDataSource;
    qryTmp: TQuery;
    panelFilter: TPanel;
    Label1: TLabel;
    Label18: TLabel;
    sBtnObj: TSpeedButton;
    sBtnObjClear: TSpeedButton;
    Label2: TLabel;
    Label19: TLabel;
    sBtnKatP: TSpeedButton;
    sBtnKatPClear: TSpeedButton;
    dbgrObj: TDBGrid;
    SplitterObjKatP: TSplitter;
    dbgrKatP: TDBGrid;
    panelButtons: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel1: TBitBtn;
    procedure sBtnObjClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnKatPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function VbObjKat(cCaption : ShortString;
                                  nKdSps : integer;
                                    mLstObj, mLstKatP : TStrings) : boolean;

const SECTION = 'z_VbObKt';

var
  FormVbObjKatP: TFormVbObjKatP;

implementation

uses a_Const, a_Lib, z_Main, z_DM, z_TObj, z_GtPers;

{$R *.dfm}

//------------------------------------------------------------------------------
function VbObjKat(cCaption : ShortString;
                                  nKdSps : integer;
                                    mLstObj, mLstKatP : TStrings) : boolean;
begin
  Result := false;
  FormVbObjKatP := TFormVbObjKatP.Create(Application);
  with FormVbObjKatP do begin
    Caption := cCaption;
    if ShowModal = mrOk then begin
      if cdsObj.Active and (cdsObj.RecordCount > 0) then begin
        mLstObj.Clear;
        cdsObj.First;
        while not cdsObj.Eof do begin
          mLstObj.Add(cdsObj.FieldByName('KdObj').AsString);
          cdsObj.Next;
        end;
      end;
      if cdsKatP.Active and (cdsKatP.RecordCount > 0) then begin
        mLstKatP.Clear;
        cdsKatP.First;
        while not cdsKatP.Eof do begin
          mLstKatP.Add(cdsKatP.FieldByName('KdKatP').AsString);
          cdsKatP.Next;
        end;
      end;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbObjKatP.sBtnObjClick(Sender: TObject);
var nKdObj : integer; bWasUpdated : boolean;
begin
  nKdObj := 0;
  with cdsObj do begin
    if not Active then begin
      CreateDataSet;
      Open;
      IndexName := 'cdsObjOnKdObj';
    end;
  end;
  if VuborObj(nKdObj, cdsObj, bWasUpdated) {z_TObj} then begin
  end;
  if cdsObj.Active and (cdsObj.RecordCount > 0) then
    sBtnObj.Font.Style := [fsBold]
  else
    sBtnObj.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVbObjKatP.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer;
begin
  nKdKatP := 0;
  with cdsKatP do begin
    if not Active then begin
      CreateDataSet;
      IndexName := 'cdsKatPOnKdKatP';
      Open;
    end;
  end;
  if Nabor2KatPers(nKdKatP, cdsKatP) {z_GtPers} then begin
  end;
  if cdsKatP.Active and (cdsKatP.RecordCount > 0) then
    sBtnKatP.Font.Style := [fsBold]
  else
    sBtnKatP.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVbObjKatP.FormCreate(Sender: TObject);
begin
  AutoSize := true;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    dbgrKatP.Height  := ReadInteger(SECTION, 'grKatPH', 125);
    Height   := ReadInteger(SECTION, 'wH', 580);
    Free;
  end;
  if FileExists(cDirVids + 'VbObKt_1.vid') then
    dbgrObj.Columns.LoadFromFile(cDirVids + 'VbObKt_1.vid');
  if FileExists(cDirVids + 'VbObKt_2.vid') then
    dbgrKatP.Columns.LoadFromFile(cDirVids + 'VbObKt_2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormVbObjKatP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrObj.Columns.SaveToFile(cDirVids + 'VbObKt_1.vid');
  dbgrKatP.Columns.SaveToFile(cDirVids + 'VbObKt_2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if panelMain.Visible then begin
      WriteInteger(SECTION, 'wHBott', panelMain.Height);
      WriteInteger(SECTION, 'grKatPH', dbgrKatP.Height);
    end;
  end;
end;

end.
