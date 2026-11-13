unit a_Signs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, DBTables, DB, DBCtrls,
  Grids, DBGrids, Menus;

type
  TFormSign = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dbgrSign: TDBGrid;
    DBNavigator1: TDBNavigator;
    qrySign: TQuery;
    qrySignNR: TIntegerField;
    qrySignFOR_APP: TStringField;
    qrySignDTBEG: TDateTimeField;
    qrySignNMRUK: TStringField;
    qrySignFIORUK: TStringField;
    qrySignNMBUH: TStringField;
    qrySignFIOBUH: TStringField;
    qrySignNOTES: TStringField;
    dsrcSign: TDataSource;
    updSign: TUpdateSQL;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    LabelCntRec: TLabel;
    qrySignNMZAMRUK: TStringField;
    qrySignFIOZAMRUK: TStringField;
    qrySignNMZAMBUH: TStringField;
    qrySignFIOZAMBUH: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popAddClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure qrySignBeforePost(DataSet: TDataSet);
    procedure qrySignAfterPost(DataSet: TDataSet);
    procedure qrySignAfterDelete(DataSet: TDataSet);
    procedure dbgrSignEnter(Sender: TObject);
    procedure dbgrSignExit(Sender: TObject);
    procedure qrySignDTBEGSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    c_App : ShortString;
    procedure OpenQrySign;
  public
    { Public declarations }
  end;

procedure ShwSign(cApp : ShortString);

const SECTION = 'a_Sign';

var
  FormSign: TFormSign;

implementation

uses a_Const, s_Main, a_Dm, a_Lib, a_ESign;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwSign(cApp : ShortString);
begin
  FormSign := TFormSign.Create(Application);
  with FormSign do begin
    c_App := cApp;
    Caption := 'Лица, имеющие право подписи документов';
    OpenQrySign;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSign.OpenQrySign;
var nSvNR : integer;
begin
  nSvNR := 0;
  with qrySign do begin
    if Active then begin
      nSvNR := qrySignNR.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from All_Sign where For_App = :cApp order by DtBeg, NR');
    ParamByName('cApp').AsString := c_App;
    Open;
    if nSvNR > 0 then
      Locate('NR', nSvNR, []);
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSign.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 325);
    Width  := ReadInteger(SECTION, 'wW', 700);
    Free;
  end;
  if FileExists(cDirVids + 'Sign02.vid') then
    dbgrSign.Columns.LoadFromFile(cDirVids + 'Sign02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSign.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSign.Columns.SaveToFile(cDirVids + 'Sign02.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSign.popPopup(Sender: TObject);
begin
  popEdt.Enabled := qrySign.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormSign.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  with qrySign do begin
    nSvNR := qrySignNR.AsInteger;
    Append;
    qrySignFor_App.AsString := c_App;
    qrySignDtBeg.AsDateTime := Date;
    if EASign {a_ESign} then begin
      Post;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);  end
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSign.popEdtClick(Sender: TObject);
begin
  with qrySign do begin
    Edit;
    if EASign {a_ESign} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSign.popDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes then
                                                          with qrySign do begin
    Delete;
    OpenQrySign;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSign.qrySignBeforePost(DataSet: TDataSet);
begin
  if qrySignNR.IsNull then
    qrySignNR.AsInteger := Form_Dm.GetNewSignNR;
end;
//------------------------------------------------------------------------------
procedure TFormSign.qrySignAfterPost(DataSet: TDataSet);
begin
  if qrySign.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qrySign]);
end;
//------------------------------------------------------------------------------
procedure TFormSign.qrySignAfterDelete(DataSet: TDataSet);
begin
  if qrySign.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qrySign]);
end;
//------------------------------------------------------------------------------
procedure TFormSign.dbgrSignEnter(Sender: TObject);
begin
  dbgrSign.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormSign.dbgrSignExit(Sender: TObject);
begin
  dbgrSign.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormSign.qrySignDTBEGSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;

end.
