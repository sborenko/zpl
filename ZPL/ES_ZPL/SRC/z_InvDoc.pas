unit z_InvDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBTables, DB,
  Menus;

type
  TFormInvDocs = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qryDocs: TQuery;
    dsrcDocs: TDataSource;
    updDocs: TUpdateSQL;
    dbgrDocs: TDBGrid;
    qryDocsNR: TIntegerField;
    qryDocsTABN: TIntegerField;
    qryDocsNMDOC: TStringField;
    qryDocsNRDOC: TStringField;
    qryDocsDTBEG: TDateTimeField;
    qryDocsDTEND: TDateTimeField;
    qryDocsNOTES: TStringField;
    pop: TPopupMenu;
    popSets: TMenuItem;
    popSetFont: TMenuItem;
    popSetFon: TMenuItem;
    popSep: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    procedure qryDocsDTBEGSetText(Sender: TField; const Text: String);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popSetFontClick(Sender: TObject);
    procedure popSetFonClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure dbgrDocsEnter(Sender: TObject);
    procedure dbgrDocsExit(Sender: TObject);
    procedure DateFieldSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    n_TabN : integer;
    c_FamIO : ShortString;
    cFontName : ShortString;
    nFontSize : word;
    bFontBold, bFontItalic : boolean;
    mDbgrColor : TColor;
    procedure SetTabsFont;
    procedure SetTabsFon;
    procedure OpenQryDocs(nTabN : integer);
  public
    { Public declarations }
  end;

procedure ShwInvDocs(nTabN : integer; cFamIO : ShortString);

const SECTION = 'z_InvDoc';

var
  FormInvDocs: TFormInvDocs;

implementation

uses A_Const, a_Dm, Z_DM, Z_Main, z_EInvDc, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwInvDocs(nTabN : integer; cFamIO : ShortString);
begin
  FormInvDocs := TFormInvDocs.Create(Application);
  with FormInvDocs do begin
    n_TabN := nTabN;
    c_FamIO := cFamIO;
    Caption := 'Документы по инвалидности. ТабНр ' + IntToStr(nTabN) +
                                                 '  [' + cFamIO + ']';
    OpenQryDocs(nTabN);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.OpenQryDocs(nTabN: integer);
begin
  with qryDocs do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_InvDocs where TabN = :nTabN ' +
            ' order by DtBeg, NR');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 225);
    Width  := ReadInteger(SECTION, 'wW', 485);
    cFontName   := ReadString(SECTION, 'cFN', 'Arial');
    nFontSize   := ReadInteger(SECTION, 'cFS', 8);
    bFontBold   := ReadBool(SECTION, 'bFB', true);
    bFontItalic := ReadBool(SECTION, 'bFI', false);
    mDbgrColor  := ReadInteger(SECTION, 'DbgrClr', clInfoBk);
    Free;
  end;
  if FileExists(cDirVids + 'z_InvDoc.vid') then
    dbgrDocs.Columns.LoadFromFile(cDirVids + 'z_InvDoc.vid');
  SetTabsFont;
  SetTabsFon;  
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrDocs.Columns.SaveToFile(cDirVids + 'z_InvDoc.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteString(SECTION, 'cFN', cFontName);
    WriteInteger(SECTION, 'cFS', nFontSize);
    WriteBool(SECTION, 'bFB', bFontBold);
    WriteBool(SECTION, 'bFI', bFontItalic);
    WriteInteger(SECTION, 'DbgrClr', mDbgrColor);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.qryDocsDTBEGSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.popSetFontClick(Sender: TObject);
begin
  with FormZpMain.FontDialog1 do begin
    Font := dbgrDocs.Font;
    if Execute then begin
      cFontName   := Font.Name;
      nFontSize   := Font.Size;
      bFontItalic := (fsItalic in Font.Style);
      bFontBold   := (fsBold in Font.Style);
      SetTabsFont;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.SetTabsFont;
var mFontStyle : TFontStyles;
begin
  if bFontItalic and bFontBold then
    mFontStyle := [fsBold, fsItalic]
  else if bFontBold then
    mFontStyle := [fsBold]
  else if bFontItalic then
    mFontStyle := [fsItalic]
  else
    mFontStyle := [];
  dbgrDocs.Font.Name      := cFontName;
  dbgrDocs.TitleFont.Name := cFontName;
  dbgrDocs.Font.Size      := nFontSize;
  dbgrDocs.TitleFont.Size := nFontSize;
  dbgrDocs.Font.Style     := mFontStyle;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.popSetFonClick(Sender: TObject);
begin
  with FormZpMain.ColorDialog1 do begin
    Color := mDbgrColor;
    if Execute then begin
      mDbgrColor := Color;
      SetTabsFon;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.SetTabsFon;
begin
  dbgrDocs.Color := mDbgrColor;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.popPopup(Sender: TObject);
begin
  popEdt.Enabled := qryDocs.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.popEdtClick(Sender: TObject);
begin
  if (qryDocs.RecordCount > 0) then  with qryDocs do begin
    Edit;
    if EAInvDoc(n_TabN, c_FamIO) {z_EInvDc} then begin
      Post;
      if UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryDocs]); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryDocs do begin
    if RecordCount > 0 then
      nSvNR := qryDocsNR.AsInteger;
    Append;
    qryDocsTabN.AsInteger := n_TabN;
    if EAInvDoc(n_TabN, c_FamIO) {z_EInvDc} then begin
      Post;
      if UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryDocs]);
      Close;
      Open;
      Last; end
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.popDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                      [mbYes, mbNo], 0) = mrYes then with qryDocs do begin
    Delete;
    Form_Dm.DbMain.ApplyUpdates([qryDocs]);
  end;                     ;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.dbgrDocsEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.dbgrDocsExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormInvDocs.DateFieldSetText(Sender: TField; const Text: String);
var cText : ShortString;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;

end.
