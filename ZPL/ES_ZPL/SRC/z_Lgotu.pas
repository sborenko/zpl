unit z_Lgotu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBTables,
  Menus;

type
  TFormLgotu = class(TForm)
    qryLgt: TQuery;
    dsrcLgt: TDataSource;
    dbgrLgt: TDBGrid;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qryLgtNR: TIntegerField;
    qryLgtTABN: TIntegerField;
    qryLgtKDLGT: TSmallintField;
    qryLgtDTBEG: TDateTimeField;
    qryLgtDTEND: TDateTimeField;
    qryLgtPRCLGT: TFloatField;
    qryLgtNOTES: TStringField;
    qryLgtSHLGT: TStringField;
    qryLgtNRDOC: TStringField;
    qryLgtDTDOC: TDateTimeField;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    updLgt: TUpdateSQL;
    popSets: TMenuItem;
    popSetFont: TMenuItem;
    popSetFon: TMenuItem;
    popSep: TMenuItem;
    qryLgtOZN_PILG: TSmallintField;
    procedure qryLgtDTBEGSetText(Sender: TField; const Text: String);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure dbgrLgtDblClick(Sender: TObject);
    procedure dbgrLgtEnter(Sender: TObject);
    procedure dbgrLgtExit(Sender: TObject);
    procedure popSetFontClick(Sender: TObject);
    procedure popSetFonClick(Sender: TObject);
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
    procedure OpenGryLgt(nTabN : integer);
  public
    { Public declarations }
  end;

//procedure ShwLgotu(nTabN : integer; cFamIO : ShortString; dDtPrc : TDateTime;
//                                                    var nSmPrcLgt : double);
procedure ShwLgotu(nTabN : integer; cFamIO : ShortString);

const SECTION = 'z_Lgotu';

var
  FormLgotu: TFormLgotu;

implementation

uses A_DM, a_Const, z_Dm, z_Main, a_Lib, z_EAlgt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwLgotu(nTabN : integer; cFamIO : ShortString);
begin
  FormLgotu := TFormLgotu.Create(Application);
  with FormLgotu do begin
    n_TabN := nTabN;
    c_FamIO := cFamIO;
    Caption := 'Льготы Таб.н-р ' + IntToStr(nTabN) + ' [ ' + cFamIO + ' ]';
    OpenGryLgt(nTabN);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.OpenGryLgt(nTabN : integer);
begin
  with qryLgt do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select KL.ShLgt, KL.Ozn_Pilg, LG.* from Z_Lgotu LG ' +
            ' Left Outer Join Z_KdLgt KL on KL.KdLgt = LG.KdLgt ' +
            ' where LG.TabN = :nTabN order by DtBeg, KdLgt');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 225);
    Width  := ReadInteger(SECTION, 'wW', 500);
    cFontName   := ReadString(SECTION, 'cFN', 'Arial');
    nFontSize   := ReadInteger(SECTION, 'cFS', 10);
    bFontBold   := ReadBool(SECTION, 'bFB', true);
    bFontItalic := ReadBool(SECTION, 'bFI', false);
    mDbgrColor  := ReadInteger(SECTION, 'DbgrClr', clInfoBk);
    Free;
  end;
  if FileExists(cDirVids + 'z_Lgt1.vid') then
    dbgrLgt.Columns.LoadFromFile(cDirVids + 'z_Lgt1.vid');
  SetTabsFont;
  SetTabsFon;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrLgt.Columns.SaveToFile(cDirVids + 'z_Lgt1.vid');
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
procedure TFormLgotu.qryLgtDTBEGSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) {a_Lib} then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.popPopup(Sender: TObject);
begin
  popEdt.Enabled := qryLgt.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.popEdtClick(Sender: TObject);
begin
  with qryLgt do begin
    Edit;
    if EALgt {z_EAlgt} then begin
      Post;
      if UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryLgt]); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.dbgrLgtDblClick(Sender: TObject);
begin
  if qryLgt.RecordCount > 0 then
    popEdt.Click;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryLgt do begin
    if RecordCount > 0 then
      nSvNR := qryLgtNR.AsInteger;
    Append;
    qryLgtTabN.AsInteger := n_TabN;
    if EALgt {z_EAlgt} then begin
      Post;
      if UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryLgt]);
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
procedure TFormLgotu.popDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                      [mbYes, mbNo], 0) = mrYes then with qryLgt do begin
    Delete;
    Form_Dm.DbMain.ApplyUpdates([qryLgt]);
  end;                     ;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.dbgrLgtEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.dbgrLgtExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.popSetFontClick(Sender: TObject);
begin
  with FormZpMain.FontDialog1 do begin
    Font := dbgrLgt.Font;
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
procedure TFormLgotu.SetTabsFont;
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
  dbgrLgt.Font.Name      := cFontName;
  dbgrLgt.TitleFont.Name := cFontName;
  dbgrLgt.Font.Size      := nFontSize;
  dbgrLgt.TitleFont.Size := nFontSize;
  dbgrLgt.Font.Style     := mFontStyle;
end;
//------------------------------------------------------------------------------
procedure TFormLgotu.popSetFonClick(Sender: TObject);
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
procedure TFormLgotu.SetTabsFon;
begin
  dbgrLgt.Color := mDbgrColor;
end;

end.
