unit A_SelectSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, StdCtrls, Buttons, DB, DBTables, Menus,
  ExtCtrls;

type
  TFormShowManySch = class(TForm)
    dbgrTmp: TDBGrid;
    dsrcTmp: TDataSource;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popSetFont: TMenuItem;
    popSetFon: TMenuItem;
    Panel1: TPanel;
    LabelCntRec: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelMsg: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrTmpDblClick(Sender: TObject);
    procedure dbgrTmpDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popSetFontClick(Sender: TObject);
    procedure popSetFonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    cFontName : ShortString;
    nFontSize : word;
    bFontBold, bFontItalic : boolean;
    mDbgrColor : TColor;
    procedure SetTabsFont;
    procedure SetTabsColor;
  public
    { Public declarations }
  end;

function ShowVubSch(var nKodSch : integer; qryListSch: TQuery) : boolean;

const SECTION = 's_ShFms';

var
  FormShowManySch: TFormShowManySch;

implementation

uses a_Const;

{$R *.dfm}

//------------------------------------------------------------------------------
function ShowVubSch(var nKodSch : integer; qryListSch: TQuery) : boolean;
begin
  Result := false;
  FormShowManySch := TFormShowManySch.Create(Application);
  with FormShowManySch do begin
    Caption := 'Результат поиска';
    dsrcTmp.DataSet := qryListSch;
//    LabelCntRec.Caption := 'Найдено записей ' + IntToStr(dtsTmp.RecordCount) +
//                           '. Выберите одну';
    LabelMsg.Caption := '';
//    (dtsTmp.FieldByName('SUMSTP') as TFloatField).DisplayFormat := '#,###.00';
(*
    with dtsTmp do begin
      First;
      nCntBezGrp  := 0;
      nCntWithGrp := 0;
      while not Eof do begin
        if FieldByName('KodGr').IsNull then
          Inc(nCntBezGrp)
        else
          Inc(nCntWithGrp);
        Next;
      end;
      First;
    end;
    if (nCntBezGrp > 0) and (nCntWithGrp > 0) then
      LabelMsg.Caption := '"Жирным" шрифтом выделены присутствующие ' +
                                                  'в списке текущего месяца.'
    else if (nCntBezGrp > 0) then
      LabelMsg.Caption := 'Нет студентов, присутствующих ' +
                                                  'в списке текущего месяца.'
    else
      LabelMsg.Caption := '';
*)
    if ShowModal = mrOk then begin
//      nRegNr := dtsTmp.FieldByName('RegNr').AsInteger;
//      nKdFak := dtsTmp.FieldByName('KodFak').AsInteger;
//      nKatSt := dtsTmp.FieldByName('KatSt').AsInteger;
//      cKodGr := dtsTmp.FieldByName('KodGr').AsString;
      Result := true;
    end;

    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowManySch.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 500);
    cFontName   := ReadString(SECTION, 'cFN', 'Arial');
    nFontSize   := ReadInteger(SECTION, 'cFS', 10);
    bFontBold   := ReadBool(SECTION, 'bFB', false);
    bFontItalic := ReadBool(SECTION, 'bFI', false);
    mDbgrColor  := ReadInteger(SECTION, 'DbgrClr', clInfoBk);
    Free;
  end;
  if FileExists(cDirVids + 'Sh_VbFms.vid') then
    dbgrTmp.Columns.LoadFromFile(cDirVids + 'Sh_VbFms.vid');
  SetTabsFont;
  SetTabsColor;
end;
//------------------------------------------------------------------------------
procedure TFormShowManySch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsrcTmp.DataSet.Active then
    dbgrTmp.Columns.SaveToFile(cDirVids + 'Sh_VbFms.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowManySch.dbgrTmpDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormShowManySch.dbgrTmpDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
{
  with dbgrTmp.Canvas do begin
    if not (gdFocused in State) then begin

      if not dsrcTmp.DataSet.FieldByName('DtPriem').IsNull and
             (dsrcTmp.DataSet.FieldByName('DtOtch').IsNull or
            (dsrcTmp.DataSet.FieldByName('DtOtch').AsDateTime >= d_DtPrc)) then
        Font.Style := [fsBold]
      else
        Font.Style := [];

      if not dsrcTmp.DataSet.FieldByName('KodGr').IsNull then
        Font.Style := [fsBold]
      else
        Font.Style := [];
      if not dsrcTmp.DataSet.FieldByName('DtOtch').IsNull and
            (dsrcTmp.DataSet.FieldByName('DtOtch').AsDateTime < d_DtPrc) then
        Font.Color := clTeal;
    end;
  end;
  dbgrTmp.DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
end;
//------------------------------------------------------------------------------
procedure TFormShowManySch.popSetFontClick(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
procedure TFormShowManySch.popSetFonClick(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
procedure TFormShowManySch.SetTabsColor;
begin
  dbgrTmp.Color := mDbgrColor;
end;
//------------------------------------------------------------------------------
procedure TFormShowManySch.SetTabsFont;
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
  dbgrTmp.Font.Name      := cFontName;
  dbgrTmp.TitleFont.Name := cFontName;
  dbgrTmp.Font.Size      := nFontSize;
  dbgrTmp.TitleFont.Size := nFontSize;
  dbgrTmp.Font.Style     := mFontStyle;
end;

procedure TFormShowManySch.FormCloseQuery(Sender: TObject;
                                                      var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and
                    (dsrcTmp.DataSet.FieldByName('KodGr').IsNull) then begin
    ModalResult := mrNone;
    CanClose := false;
    ShowMessage('Выбирать можно только "жирные" записи.' + #13#10 +
                '"Бледные" отсутствуют в списке текущего месяца.');
  end;
end;

end.
